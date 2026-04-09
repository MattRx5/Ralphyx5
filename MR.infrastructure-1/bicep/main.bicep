targetScope = 'subscription'
param azureLocation string = 'uksouth'

resource deployRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: 'mr-uks-training-iac-rg'
  location: azureLocation
  tags: {
    application: 'Training IaC'
    Enviroment: 'Sandbox'
    Owner: 'Matt'
  }
}
// Create Resources
module createResources 'resources.bicep' = {
  name: 'CreateStorageRelatedResources'
  scope: deployRG
  params: {
    azureLocation: azureLocation
  }
}
