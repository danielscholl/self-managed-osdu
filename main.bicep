targetScope = 'subscription'

// Set this bit if you want to lock resources.
var enableLock = false

@minLength(3)
@maxLength(5)
@description('Specify a Prefix.')
param prefix string = 'osdu'

@minLength(3)
@maxLength(5)
@description('Specify a Suffix.')
param suffix string

@description('Specify the Resource Tags.')
param tags object = {
  environment: 'development'
}

@description('Specifies the Resource Group Name.')
param groupName string = '${prefix}-builder-${suffix}'

@description('Specifies the Azure Region Location.')
param location string = 'centralus'

@description('Specifies the Azure Service Principal Id.')
param azurePrincipalOID string

// Create Resource Group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: groupName
  location: location
  tags: tags
}

// Apply Resource Group Lock
module applyLock 'modules/apply_lock.bicep' = if (enableLock) {
  scope: resourceGroup
  name: 'applyLock'
}

// Create Keyvault
module keyvault 'modules/azure_keyvault.bicep' = {
  name: 'azure_keyvault'
  scope: resourceGroup
  params: {
    principalId: azurePrincipalOID
    permissions: {
      keys: [
        'all'
      ]
      secrets: [
        'all'
      ]
      certificates: []
    }
  }
}

// Create Storage Account
module storage 'modules/azure_storage.bicep' = {
  name: 'azure_storage'
  scope: resourceGroup
  params: {
    principalId: azurePrincipalOID
    containers: [
      'remote-state-container'
    ]
    shares: [
      'configuration'
      'ssh-keys'
    ]
  }
}
