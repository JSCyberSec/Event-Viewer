# Parameters pulled from the "Values" exported from the Scheduled task
param([String] $eventRecordID, [String] $Seconds, [String] $ParentProcessID, [String] $ChildProcessID, [String] $UserName)
#Kill the offending process, depending on the speed it isn't always caught, but if we kill the parent then we're helping to terminate the originator
Stop-Process -Id $ChildProcessID -Force -confirm:$false -ErrorAction SilentlyContinue
Stop-Process -Id $ParentProcessID -Force -Confirm:$false -ErrorAction SilentlyContinue
<#Can potentially expand this to include an email script or notification to the user as to why the system killed something. 
I decideed against email myself because then I'd need the email syste to accept email "unauthenticated" from client systems,
and that was something I wasn't prepared to do, nor was I going to add any credentials in.#>

<# Used to call this by getting the eventdata and reading it from there, figured out how to just push the variables direct from the Event triggering in the scheduled task

$event = get-winevent -LogName Security -FilterXPath "<QueryList><Query Id='0' Path='Security'><Select Path='Security'>*[System[(EventRecordID=$eventRecordID)]]</Select></Query></QueryList>"
$eventxml = [xml]$event.ToXML()
Start-Sleep -Seconds $seconds
$ParentProcess = $eventxml.Event.EventData.Data[13].'#text'
    $ParentProcesshID = $eventxml.Event.EventData.Data[7].'#text'
    $ParentProcessID = ([Int32]$ParentProcesshID).ToString()
    $ChildProcesshID = $eventxml.event.eventdata.Data[4].'#text'
    $ChildProcessID = ([Int32]$ChildProcesshID).ToString() #>
