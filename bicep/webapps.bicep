// param webAppProject string = 'bicep-test'
param location string
param timeZone string = 'E. Australia Standard Time'
// param sku string
param appServicePlanName string

// var appServicePlanName = toLower('AppServicePlan-${webAppProject}')

// // New windows app service plan for the webApps
// resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
//   name: appServicePlanName
//   location: location
//   properties: {
//     reserved: false
//   }
//   sku: {
//     name: sku
//   }
//   kind: 'windows'
// }


// Existing hosting plan
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' existing = {
  name: appServicePlanName
}


// WebApp Creation
resource webApp1 'Microsoft.Web/sites@2021-02-01' = {
  name: 'webapp1'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource webApp2 'Microsoft.Web/sites@2021-02-01' = {
  name: 'webapp2'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource webApp3 'Microsoft.Web/sites@2021-02-01' = {
  name: 'webapp3'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

// Adding custom time zone for one web app
resource webAppTimeZone 'Microsoft.Web/sites/config@2021-02-01' = {
  name: '${webApp3.name}/web'
  properties: {
    websiteTimeZone: timeZone
  }
}

