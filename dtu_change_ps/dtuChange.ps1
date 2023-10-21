#requires -PSEdition Core

param (
    [string] $resourceGroupName,
    [string] $serverName,
    [string] $databaseName,
    [string] $edition,
    [string] $dtu
)

# Sign-in to Azure
# This is interactive sign-in, can be improved to suite the client needs based on how they execute the script.
Connect-AzAccount

# Update the SQL database with the new DTU settings
Set-AzSqlDatabase -ResourceGroupName $resourceGroupName -DatabaseName $databaseName -ServerName $serverName -Edition $edition -RequestedServiceObjectiveName $dtu