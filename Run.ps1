# Import all functions
. .\Import-AllModules.ps1

$Scopes = @( 
    "Dashboard.Read.All" 
    "Dataset.Read.All"
    "Application.ReadWrite.All" 
)

Connect-Microsoft365 -Scopes $Scopes

# Create a Microsoft Entra App in the Azure Portal
# https://learn.microsoft.com/en-us/power-bi/developer/embedded/embed-service-principal
$EntraApp = New-EntraApp -AppName "OpenMetadata Connector"

# Create a security group
$SecurityGroup = New-AppSecurityGroup -EntraApp $EntraApp -Name "OpenMetadata Security Group"

