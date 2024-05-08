<#
.SYNOPSIS
    New-EntraApp: Creates a new Azure AD web application for Entra.

.DESCRIPTION
    This function creates a new Azure Active Directory (AD) web application for Entra. It creates an Azure AD web application, a service principal, and generates a key (credential) for the service principal. The function returns the newly created Azure AD web application object.

.PARAMETER AppName
    Specifies the display name of the new Azure AD web application.

.NOTES
    - This function requires administrative privileges to create Azure AD resources.
    - It is designed to be used in the Entra application deployment process.
    - Use caution when executing this function as it creates new Azure AD resources.

.EXAMPLE
    New-EntraApp -AppName "EntraWebApp"
    - Creates a new Azure AD web application with the display name "EntraWebApp" and returns the application object.

.INPUTS
    AppName: Specifies the display name of the new Azure AD web application.

.OUTPUTS
    Returns the newly created Azure AD web application object.

.FUNCTIONALITY
    - Creates a new Azure AD web application in Azure Active Directory.
    - Creates a service principal associated with the web application.
    - Generates a key (credential) for the service principal.
#>
function New-EntraApp {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string] $AppName
    )    
    begin {
        
    }
    
    process {
        # Create a new Azure AD web application.
        $web = @{
            RedirectUris = "https://localhost:44322"
            HomePageUrl = "https://localhost:44322"
        }
        $params = @{
            DisplayName = $AppName
            Web = $($web)
        }

        $app = New-MgApplication @params
        Write-Host "Client ID of new app: " $($app.AppId)

        # Create a service principal.
        $ServicePrincipalID=@{
            "AppId" = $($app.AppId)
        }
        $sp = New-MgServicePrincipal -BodyParameter $($ServicePrincipalId)
        Write-Host "Object ID of new service principal: " $($sp.Id)

        # Create a key for the service principal.
        $credential = Add-MgServicePrincipalPassword -ServicePrincipalId $($sp.Id)
        Write-Host "Credential of new service principal: " $($credential.SecretText)        
    }
    
    end {
        return $app
    }
}