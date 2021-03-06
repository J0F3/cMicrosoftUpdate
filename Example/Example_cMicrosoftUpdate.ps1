﻿#Enables Mircosoft Update on Server1, Server2 and Server3

Configuration MSUpdate
{
    Import-DscResource -Module cMicrosoftUpdate

    Node $AllNodes.NodeName
    {
        cMicrosoftUpdate "EnableMSUpdate"
        {
            Ensure = "Present"
        }
    }
}


$ConfigurationData = @{
    AllNodes = @(
        @{NodeName = "Server1"}
        @{NodeName = "Server2"}
        @{NodeName = "Server3"}
    )
}

#Copy the module to the target computer first
foreach($Node in $ConfigurationData.AllNodes)
{
    if($Node.NodeName -ne "*")
    {
        Start-Process -FilePath "robocopy.exe" -ArgumentList ("`"C:\Program Files\WindowsPowerShell\Modules\cMicrosoftUpdate`" `"\\" + $Node.NodeName + "\c$\Program Files\WindowsPowerShell\Modules\cMicrosoftUpdate`" /e /purge /xf") -NoNewWindow -Wait
    }
}

MSUpdate -ConfigurationData $ConfigurationData
Start-DscConfiguration -Path .\MSUpdate -Verbose -Wait -Force
