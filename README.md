# Event-Viewer
Windows Event Viewer tasks and scripts

This task uses a script to perform a kill process on created processes and their parents for when certain commands/executables are called on a system.
It's not a perfect system as my testing with "whoami.exe" still allows whoami to run but ultimately terminates the parent cmd window or explorer window (parent). Which if a malicious actor is using a process (word, notepad or other process) to execute their commands this will kill their current activity and force them to attempt regaining access to the system.

This is in no way a replacemnent for an AV or such but it does supplement active defense solutions for free.

This Repository relies on Windows event 4688 being generated.
This can be accomplished by enabling it using a group or local policy. 
  - Computer Configuration > Policies > Windows Settings > Security Settings > Advanced Audit Policy Configuration > Detailed Tracking
    - Audit Process Creation > Success
    ![image](https://user-images.githubusercontent.com/118463933/202510786-f88fc6c5-4b24-4dc3-8ec8-511ba5c89847.png)
  - Computer Configuration > Policies > Windows Settings > Security Settings > Local Policies > Security Options
    - Audit: Force Audit policy subcategory settings (Windows Vista or Later) to override audit policy category settings > Enabled
    ![image](https://user-images.githubusercontent.com/118463933/202510490-adcecb51-6a80-4220-8732-1e6d11c8846e.png)


## Scheduled Tasks
The scheduled task (Process Monitor.xml) needs to be imported into the scheduled tasks repository on the Windows machine. This can either be manual, using powershell, or the scheduled task command line.
I'll update the procedure as I grow this repository.
## Scripts
These scripts are required to perform the actual actions when the events are generated. The scheduled task xml by default assumes it will be found in the %systemroot%\system32\EventScripts folder (needs to be created).
I recommend not granting anyone special access to that folder and by default only local admins have access to write to the system32 folder so how you provision that is up to you. There is nothing in the script that exposes credentials or such so a threat actor reading it shouldn't increase risk.
