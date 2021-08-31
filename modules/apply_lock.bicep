targetScope = 'resourceGroup'

// Lock a Resources
resource dontDeleteLock 'Microsoft.Authorization/locks@2016-09-01' = {
  name: 'DontDelete'
  properties: {
    level: 'CanNotDelete'
    notes: 'Prevent accidental deletion of the resource.'
  }
}
