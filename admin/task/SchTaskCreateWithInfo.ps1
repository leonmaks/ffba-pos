[xml]$xmlinfo = {<?xml version="1.0" encoding="UTF-16"?>
<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">
  <RegistrationInfo>
    <Author></Author>
    <URI></URI>
  </RegistrationInfo>
  <Principals>
    <Principal id="Author">
      <UserId></UserId>
      <RunLevel>HighestAvailable</RunLevel>
    </Principal>
  </Principals>
  <Settings>
    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>
    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>
    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>
    <IdleSettings>
      <Duration>PT10M</Duration>
      <WaitTimeout>PT1H</WaitTimeout>
      <StopOnIdleEnd>false</StopOnIdleEnd>
      <RestartOnIdle>false</RestartOnIdle>
    </IdleSettings>
    <ExecutionTimeLimit>PT60M</ExecutionTimeLimit>
  </Settings>
  <Triggers>
    <TimeTrigger>
      <StartBoundary>2019-01-18T08:45:00</StartBoundary>
      <Repetition>
        <Interval>PT1M</Interval>
      </Repetition>
    </TimeTrigger>
  </Triggers>
  <Actions Context="Author">
    <Exec>
      <Command></Command>
    </Exec>
  </Actions>
</Task>}

$dirname = $env:POS_HOME
if (-not (Test-Path env:POS_HOME)) {
  $dirname = "C:\ffba-pos"
}

$taskname = "\FFBA-POS-Task"
$author = "ffba-pos"
$userid = "S-1-5-18"
$command = $dirname + "\" + "pos-tasks.bat"
$filepath = "ffba-pos-task.xml"

$xmlinfo.Task.RegistrationInfo.URI = $taskname
$xmlinfo.Task.RegistrationInfo.Author = $author
$xmlinfo.Task.Principals.Principal.UserId = $userid
$xmlinfo.Task.Actions.Exec.Command = $command

$xmlinfo.Save($filepath)

schtasks.exe /create /tn $taskname /xml $filepath /F |Out-Null

if (Test-Path $filepath){Remove-Item $filepath}
