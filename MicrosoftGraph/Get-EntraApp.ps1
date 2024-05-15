function Get-EntraApp {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string] $AppName
    )    
    begin {
        
    }
    
    process {
        # Get the service principal that you created earlier.
        $servicePrincipal = Get-MgServicePrincipal -Filter "DisplayName eq '$($AppName)'"
    }
    
    end {
        return $servicePrincipal    
    }
}