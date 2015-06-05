# cMicrosoftUpdate
**cMicrosoftUpdate** is a DSC Module and contains the contains the cMicrosoftUpdate resource. This resource can be used to enable/disable Microsoft Update in the Windows Update Settings. ("Give me update for other Microsoft products when I update Windows" checkbox)

# Installation
To install **cMicrosoftUpdate** module unzip the content under $env:ProgramFilesWindowsPowerShellModules folder.

# Requirements
This module requires the latest version of PowerShell (v4.0, which ships in Windows 8.1 or Windows Server 2012R2). To easily use PowerShell 4.0 on older operating systems, install WMF 4.0. Please read the installation instructions that are present on both the download page and the release notes for WMF 4.0.

# Details
**cMicrosoftUpdate** resource has following properties

* **Ensure**: Determines whether the MS Update should be enabled (ensure) or disabled (absent)

# Versions
0.1.0.0

* Initial release with the following resources
  * cMicrosoftUpdate

# Examples
**Example 1:** Enable Microsoft Update

```
Configuration MSUpdate
{
    Import-DscResource -Module cMicrosoftUpdate
        cMicrosoftUpdate "EnableMSUpdate"
        {
            Ensure = "Present"
        }
}

MSUpdate -out C:\DSC
Start-DscConfiguration -Path C:\DSC -Verbose -Wait -Force
```
