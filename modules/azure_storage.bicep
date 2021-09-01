targetScope = 'resourceGroup'

@description('Resource Name.')
param name string = '${resourceGroup().name}-${uniqueString(resourceGroup().id)}'

@description('Resource Location.')
param location string = resourceGroup().location

@description('Enable lock to prevent accidental deletion')
param enableDeleteLock bool = false

@description('Tags.')
param tags object = {}

@description('Specifies the storage account type.')
@allowed([
  'Premium_LRS'
  'Standard_LRS'
])
param type string = 'Standard_LRS'

@description('Principal Id to Assign ACR Pull Role.')
param principalId string = 'null'

@allowed([
  'BlobOwner'
  'ShareOwner'
])
@description('Built-in role to assign')
param builtInRoleType string = 'ShareOwner'

@description('Blob Containers to Add to Storage Account')
param containers array = []

@description('File Shares to Add to Storage Account')
param shares array = []

var role = {
  Owner: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
  Contributor: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
  Reader: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7'
  ShareOwner: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/a7264617-510b-434b-a828-9731dc254ea7'
  BlobOwner: '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/b7e6dc6d-f1e8-4753-8033-0f276bb0955b'
}

var storageName = take(replace('${name}', '-', ''), 23)

// Create Storage Account
resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageName
  location: location
  tags: tags
  sku: {
    name: type
  }
  kind: 'StorageV2'

  properties: {
    accessTier: 'Hot'

    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: empty(containers) ? false : true
        }
        file: {
          enabled: empty(shares) ? false : true
        }
      }
    }

    networkAcls: enablePrivateLink ? {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    } : {}
  }
}

// Create Storage Blob Containers
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = [for container in containers: {
  name: '${storageName}/default/${container}'
  dependsOn: [
    storage
  ]
}]

// Create Storage File Shares
resource share 'Microsoft.Storage/storageAccounts/fileServices/shares@2021-04-01' = [for share in shares: {
  name: '${storageName}/default/${share}'
  properties: {
    accessTier: 'TransactionOptimized'
    shareQuota: 5120
    enabledProtocols: 'SMB'
  }
  dependsOn: [
    storage
  ]
}]

// Lock Resource
resource lock 'Microsoft.Authorization/locks@2016-09-01' = if (enableDeleteLock) {
  scope: storage

  name: '${storageName}-lock'
  properties: {
    level: 'CanNotDelete'
  }
}

// Assign Role
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(storage.id, name, 'data')
  properties: {
    roleDefinitionId: role[builtInRoleType]
    principalId: principalId
  }
  scope: storage
}

////////////////
// Private Link
////////////////

@description('Settings Required to Enable Private Link')
param privateLinkSettings object = {
  subnetId: null // Specify the Subnet for Private Endpoint
  vnetId: null // Specify the Virtual Network for Virtual Network Link
}

var enablePrivateLink = privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null

@description('Specifies the name of the private link to the Azure Container Registry.')
param privateEndpointName string = 'storagePrivateEndpoint'

var publicDNSZoneForwarder = 'blob.${environment().suffixes.storage}'
var privateDnsZoneName = 'privatelink.${publicDNSZoneForwarder}'

resource privateDNSZone 'Microsoft.Network/privateDnsZones@2020-06-01' = if (privateLinkSettings.subnetId != null && privateLinkSettings.vnetId != null) {
  name: privateDnsZoneName
  location: 'global'
  properties: {}
}

resource privateEndpoint 'Microsoft.Network/privateEndpoints@2020-07-01' = if (privateLinkSettings.subnetId != null && privateLinkSettings.vnetId != null) {
  name: privateEndpointName
  location: location
  properties: {
    privateLinkServiceConnections: [
      {
        name: privateEndpointName
        properties: {
          privateLinkServiceId: storage.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
    subnet: {
      id: privateLinkSettings.subnetId
    }
  }
  dependsOn: [
    storage
  ]
}

resource privateDNSZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2020-06-01' = if (privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null) {
  name: '${privateEndpoint.name}/dnsgroupname'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'dnsConfig'
        properties: {
          privateDnsZoneId: privateDNSZone.id
        }
      }
    ]
  }
  dependsOn: [
    privateDNSZone
  ]
}

resource virtualNetworkLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = if (privateLinkSettings.vnetId != null && privateLinkSettings.subnetId != null) {
  parent: privateDNSZone
  name: 'link_to_vnet'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: privateLinkSettings.vnetId
    }
  }
  dependsOn: [
    privateDNSZone
  ]
}
