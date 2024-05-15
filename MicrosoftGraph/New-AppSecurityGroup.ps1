function New-AppSecurityGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [PSCustomObject] $EntraApp,
        [Parameter(Mandatory=$true)]
        [string] $Name
    )    
    begin {
        
    }
    
    process {
        # Create an Azure AD security group.
        $group = New-MgGroup -DisplayName $Name -SecurityEnabled -MailEnabled:$False -MailNickName "notSet"
        Write-Host "Object ID of new security group: " $($group.Id)

        # Add the service principal to the group.
        New-MgGroupMember -GroupId $($group.Id) -DirectoryObjectId $($EntraApp.Id)        
    }
    
    end {
        return $group
    }
}