function New-AppSecurityGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [PSCustomObject] $EntraApp,
        [Parameter(Mandatory=$true)]
        [string] $SecurityGroup
    )    
    begin {
        
    }
    
    process {
        # Create an Azure AD security group.
        $group = New-MgGroup -DisplayName $SecurityGroup -SecurityEnabled -MailEnabled:$False -MailNickName "notSet"
        Write-Host "Object ID of new security group: " $($group.Id)

        # Add the service principal to the group.
        New-MgGroupMember -GroupId $($group.Id) -DirectoryObjectId $($EntraApp.Id)        
    }
    
    end {
        return $group
    }
}