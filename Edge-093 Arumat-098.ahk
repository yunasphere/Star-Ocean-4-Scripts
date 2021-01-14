DetectHiddenWindows, On
#Persistent

kills := 0
pos_from_bugs := 3 	;set this to team rank in colleseum + 2
toggle := false
Gui, Font, cFFFFFF s9 w550
Gui, Color, c282a36, c6272a4
Gui, Add, Button,  default, Start
Gui, Show,w300 h50,  30`,000 Kills
return


ButtonStart:
SetKeyDelay, 100
Gui, Submit, NoHide
gosub GrabRemotePlay 
gosub, PauseLoop
toggle := true
sleep 1000


loop{
  gosub, EnterBattle
  gosub, Battle
  gosub, ExitBattle
}
gosub, GuiClose

EnterBattle:
  ;Talk to Colleseum NPC
  Send {enter Down} {enter Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 1000

  ;Select 'Team'
  Send {down Down} {down Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 1000

  ;Select Bugs
  loop %pos_from_bugs%
  {
  Send {up Down} {up Up}
  Sleep 700
  }
  Send {enter Down} {enter Up}
  Sleep 700

  ;Select Set
  Send {enter Down} {enter Up}
  Sleep 700
  Send {enter Down} {enter Up}
  Sleep 700

  ;Confirm Match
  Send {left Down} {left up}
  Sleep 700
  Send {enter Down} {enter Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 6000

  ;Intro Text
  Send {enter Down} {enter Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 1000
  Send {enter Down} {enter Up}
  Sleep 1000
return


Battle:
;L2 Spam
loop {
  PixelSearch, x, y,  82,  216,  88, 220, 0x20FF21, 32, Fast RGB
  if ErrorLevel
     Send {u Down} {u Up}
  else 	
     break 
  Sleep 700
}
return

p::
gosub, PauseLoop
GuiControl,, Test, Paused
ControlFocus,, ahk_class %remotePlay_class%
WinActivate, PS4 Remote Play
Pause,, 1
return


ExitBattle:
;Battle Finish
kills +=6
Send {enter Down} {enter Up}
Sleep 700
Send {enter Down} {enter Up}
Sleep 700
Send {enter Down} {enter Up}
Sleep 700

;Outro Text
Send {enter Down} {enter Up}
Sleep 700
Send {enter Down} {enter Up}
Sleep 700
Send {enter Down} {enter Up}
Sleep 700
Send {enter Down} {enter Up}
Sleep 700

;Colleseum NPC text
Send {enter Down} {enter Up}
Sleep 700
Send {enter Down} {enter Up}
Sleep 5000		;wait longer as get coins
Send {enter Down} {enter Up}
Sleep 700
return

PauseLoop:
  Send, {up Up}
  Send, {left Up}
  Send, {down Up}
  Send, {right Up}
  Send, {u Up}
  Send, {o Up}
  Send, {q Up}
  Send, {e Up}
  Send, {l Up}
  Send, {a Up}
  Send, {d up}
  Send, {w Up}
  Send, {enter Up}
  Send, {esc Up}
return

GrabRemotePlay:
WinGet, remotePlay_id, List, ahk_exe RemotePlay.exe
if (remotePlay_id = 0)
{
	MsgBox, PS Remote Play not found
	return
}
Loop, %remotePlay_id%
{
  id := remotePlay_id%A_Index%
  WinGetTitle, title, % "ahk_id " id
  If InStr(title, "PS")
    break
}	
WinGetClass, remotePlay_class, ahk_id %id%
WinMove, ahk_id %id%,, 0, 0, 1440, 900
ControlFocus,, ahk_class %remotePlay_class%
WinActivate, ahk_id %id%
return

GuiClose:
gosub, PauseLoop
FileAppend, Kills: %kills% `n,%A_ScriptDir%\KillCount.txt
^k::ExitApp
