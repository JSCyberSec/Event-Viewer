# Event-Viewer
Windows Event Viewer tasks and scripts

This Repository relies on Windows event 4688 being generated.
This can be accomplished by enabling it using a group or local policy. 
  - Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Policy Configuration > Detailed Tracking
    - Audit Process Creation > Success
  - Computer Configuration > Policies > Windows Settings > Security Settings > Local Policies > Security Options
    - Audit: Force Audit policy subcategory settings (Windows Vista or Later) to override audit policy category settings > Enabled

## Scheduled Tasks
The scheduled task needs to be imported into the scheduled tasks repository on the Windows machine. This can either be manual or using powershell or the scheduled task command line.
I'll update as I grow this repository
## Scripts
These scripts are required to perform the actual actions when the events are generated. The scheduled task xml by default assumes it will be found in the %systemroot%\system32\EventScripts folder (needs to be created).
I recommend not granting anyone special access to that folder and by default only local admins have access to write to the system32 folder so how you provision that is up to you. There is nothing in the script that exposes credentials or such so a threat actor reading it shouldn't increase risk.
