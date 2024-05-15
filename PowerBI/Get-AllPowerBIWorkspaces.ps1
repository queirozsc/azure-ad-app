<#
.SYNOPSIS
    Get-AllPowerBIWorkspaces: Retrieves all Power BI workspaces.

.DESCRIPTION
    This function retrieves all Power BI workspaces available in the Power BI service. It provides an option to filter the workspaces based on whether they are intended for production use only.

.PARAMETER ProductionOnly
    Specifies whether to retrieve only production Power BI workspaces. By default, all workspaces are retrieved. If this switch is specified, the function filters out workspaces containing "DEV" or "HML" in their names.

.NOTES
    - This function relies on the "Get-PowerBIWorkspace" cmdlet to retrieve Power BI workspaces.
    - It offers the flexibility to retrieve all workspaces or filter out non-production workspaces.
    - Ensure that the appropriate permissions are granted to the user executing this function to access Power BI workspaces.

.EXAMPLE
    Get-AllPowerBIWorkspaces
    - Retrieves all Power BI workspaces.

.EXAMPLE
    Get-AllPowerBIWorkspaces -ProductionOnly
    - Retrieves only production Power BI workspaces by filtering out workspaces with names containing "DEV" or "HML".

.INPUTS
    None.

.OUTPUTS
    Returns a collection of Power BI workspace objects.

.FUNCTIONALITY
    - Retrieves Power BI workspaces using the "Get-PowerBIWorkspace" cmdlet.
    - Filters the workspaces based on the "ProductionOnly" switch if specified.
    - Provides the retrieved workspaces for further processing or analysis.
#>
function Get-AllPowerBIWorkspaces {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$False)]
        [switch] $ProductionOnly
    ) 
    
    begin {
        
    }
    
    process {
        if ($ProductionOnly) {
            $Workspaces =  Get-PowerBIWorkspace | Where-Object {$_.Name -NotLike "*DEV" -And $_.Name -NotLike "*HML"}
        } else {
            $Workspaces =  Get-PowerBIWorkspace
        }
        
    }
    
    end {
        return $Workspaces
    }
}