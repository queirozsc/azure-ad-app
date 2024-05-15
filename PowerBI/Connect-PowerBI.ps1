<#
.SYNOPSIS
    Connect-PowerBI: Connects to the Power BI service.

.DESCRIPTION
    This function facilitates the connection to the Power BI service. It invokes the "Login-PowerBI" cmdlet, which handles the authentication process and returns a Power BI object representing the authenticated session.

.NOTES
    - This function assumes that the "Login-PowerBI" cmdlet is available and properly configured.
    - It is designed to simplify the process of establishing a connection to the Power BI service.
    - Ensure that appropriate authentication credentials are provided before executing this function.

.EXAMPLE
    Connect-PowerBI
    - Initiates a connection to the Power BI service and returns the Power BI object representing the authenticated session.

.INPUTS
    None.

.OUTPUTS
    Returns a Power BI object representing the authenticated session.

.FUNCTIONALITY
    - Establishes a connection to the Power BI service by invoking the "Login-PowerBI" cmdlet.
    - Returns the Power BI object representing the authenticated session for further interaction with the Power BI service.
#>
function Connect-PowerBI {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        $PowerBI = Login-PowerBI
    }
    
    end {
        return $PowerBI
    }
}