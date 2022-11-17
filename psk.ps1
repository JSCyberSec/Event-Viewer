param([String] $eventRecordID, [String] $Seconds, [String] $ParentProcessID, [String] $ChildProcessID, [String] $UserName)
Stop-Process -Id $ChildProcessID -Force -confirm:$false -ErrorAction SilentlyContinue
Stop-Process -Id $ParentProcessID -Force -Confirm:$false -ErrorAction SilentlyContinue
Start-Sleep -Seconds $seconds

<# Used to call this by getting the eventdata and reading it from there, figured out how to just push the variables direct from the Event triggering in the scheduled task

$event = get-winevent -LogName Security -FilterXPath "<QueryList><Query Id='0' Path='Security'><Select Path='Security'>*[System[(EventRecordID=$eventRecordID)]]</Select></Query></QueryList>"
$eventxml = [xml]$event.ToXML()
    $ParentProcess = $eventxml.Event.EventData.Data[13].'#text'
    $ParentProcesshID = $eventxml.Event.EventData.Data[7].'#text'
    $ParentProcessID = ([Int32]$ParentProcesshID).ToString()
    $ChildProcesshID = $eventxml.event.eventdata.Data[4].'#text'
    $ChildProcessID = ([Int32]$ChildProcesshID).ToString() #>
