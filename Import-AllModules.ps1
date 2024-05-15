#Setting variables
. .\Set-Variables.ps1

# Includes all Microsoft Graph functions
#Import-PSFiles -Path ".\MicrosoftGraph" -Verbose
. .\MicrosoftGraph\Connect-Microsoft365.ps1
. .\MicrosoftGraph\Get-EntraApp.ps1
. .\MicrosoftGraph\New-AppSecurityGroup.ps1
. .\MicrosoftGraph\New-EntraApp.ps1

# Includes all Power BI functions
. .\PowerBI\Connect-PowerBI.ps1
. .\PowerBI\Get-AllPowerBIWorkspaces.ps1