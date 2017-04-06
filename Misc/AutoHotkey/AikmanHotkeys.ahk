;Hotkey Defined by Aaron Aikman

;Volume Control
#1::Volume_Down
#2::Volume_Up
#3::Volume_Mute


;Moving to Desktops
;#IfWinActive ahk_class CabinetWClass ; for use in explorer.
#Q::send("^#{left}")
#W::send("^#{right}")
;#IfWinActive

send(toSend)
{
	oldDelay := A_KeyDelay
	SetKeyDelay, 30
	
	send, % toSend
	
	SetKeyDelay, % oldDelay
	return 
}

;Opening Command prompt to open folder if folder open
#IfWinActive ahk_class CabinetWClass ; for use in explorer.
#C::
ClipSaved := ClipboardAll
Send !d
Sleep 10
Send ^c
Run, cmd /K "cd `"%clipboard%`""
Clipboard := ClipSaved
ClipSaved =
return
#IfWinActive

;#F::
;WinActivate, Calculator