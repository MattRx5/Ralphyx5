targetScope = 'resourceGroup'

param azureLocation string = 'uksouth'

// Storage
resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'mrukssndtrainingiacsa'
  location: azureLocation
  tags: {
    Application: 'Training IaC'
    Environment: 'Sandbox'
    Owner: 'Matt Ralph'
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    publicNetworkAccess: 'Disabled'
    allowCrossTenantReplication: true 
    allowSharedKeyAccess: true
    isHnsEnabled: true
    networkAcls: {
      defaultAction: 'Deny'
      }
      encryption: {
        keySource: 'Microsoft.Storage'
        services: {
          file: {
            keyType: 'Account'
            enabled: true 
          }
        }
      } 
  } 
}
