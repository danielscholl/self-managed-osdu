targetScope = 'resourceGroup'

@description('Resource Name.')
param name string = '${resourceGroup().name}-${uniqueString(resourceGroup().id)}'

@description('Resource Location.')
param location string = resourceGroup().location

@description('Enable lock to prevent accidental deletion')
param enableDeleteLock bool = false

@description('Tags.')
param tags object = {}

@description('Key Vault SKU.')
param sku string = 'Standard'

@description('Specify Identity to provide Network Contributor Role Access (Optional).')
param principalId string = 'null'

@description('Key Vault Defined Access Policies.')
param permissions object = {
  keys: []
  secrets: [
    'get'
    'list'
  ]
  certificates: []
}

@description('Key Vault Retention Days.')
@minValue(7)
param softDeleteRetentionInDays int = 7

var enablePrivateLink = privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null

// Create Azure Key Vault
resource keyvault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: take(replace('${name}', '-', ''), 23)
  location: location
  tags: tags
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: sku
    }
    accessPolicies: principalId == 'null' ? [] : [
      {
        objectId: principalId
        tenantId: subscription().tenantId
        permissions: permissions
      }
    ]
    softDeleteRetentionInDays: softDeleteRetentionInDays
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false

    enableRbacAuthorization: false
    networkAcls: enablePrivateLink ? {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    } : {}
    publicNetworkAccess: enablePrivateLink ? 'Disabled' : 'Enabled'
  }
}

resource lock 'Microsoft.Authorization/locks@2016-09-01' = if (enableDeleteLock) {
  scope: keyvault

  name: '${keyvault.name}-lock'
  properties: {
    level: 'CanNotDelete'
  }
}

////////////////
// Private Link
////////////////

@description('Settings Required to Enable Private Link')
param privateLinkSettings object = {
  subnetId: null // Specify the Subnet for the Private Endpoint
  vnetId: null // Specify the Virtual Network for Virtual Network Link
}

@description('Specifies the name of the private link to the Azure Container Registry.')
param privateEndpointName string = 'kvPrivateEndpoint'

var privateDNSZoneName = 'privatelink.vaultcore.azure.net'

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2021-02-01' = if (privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null) {
  name: privateEndpointName
  location: location
  properties: {
    subnet: {
      id: privateLinkSettings.subnetId
    }
    privateLinkServiceConnections: [
      {
        name: privateEndpointName
        properties: {
          privateLinkServiceId: keyvault.id
          groupIds: [
            'vault'
          ]
        }
      }
    ]
    customDnsConfigs: [
      {
        fqdn: privateDNSZoneName
      }
    ]
  }
  dependsOn: [
    keyvault
  ]
}

resource virtualNetworkLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null) {
  name: '${privateDNSZone.name}/${privateDNSZone.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: privateLinkSettings.vnetId
    }
  }
}

resource privateDNSZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null) {
  name: privateDNSZoneName
  location: 'global'
}

resource privateDNSZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2020-06-01' = if (privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null) {
  name: '${privateEndpoint.name}/dnsgroupname'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDNSZone.id
        }
      }
    ]
  }
}
