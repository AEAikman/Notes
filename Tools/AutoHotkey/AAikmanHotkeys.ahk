; HOTKEYS DEFINED BY AARON AIKMAN


; VARIABLES
waitTime := 50


; VOLUME CONTROL
#F1::Volume_Down
#F2::Volume_Up
#F3::Volume_Mute

; Extra App calls
#^1::send #6
#^2::send #7
#^3::send #8
#^4::send #9


; Get Latest P4V
#F4::
send {Home}
send ^+g
; send {Ctrl down} {Shift down} {G} {Ctrl up} {Shift up}
return


;Requires quotes for arg
send(toSend)
{
	oldDelay := A_KeyDelay
	SetKeyDelay, 30

	send, % toSend

	SetKeyDelay, % oldDelay
	return
}

; Must be fixed
keepClipAndSend(toSend)
{
	tempClip := ClipboardAll
	; tempToSend := %toSend%
	clipboard = % toSend
	; sleep %waitTime%
	send ^v
	Clipboard = %tempClip%
	return
}

;--------- DOS COMMAND HERE DOSCMDHERE -------------
#C::
 {
 ID := WinExist("A")
 WinGetClass, Class, ahk_id %ID%
 ControlGetText,ePath, Edit1, ahk_id %ID%
 Run, %comspec%, %epath%
 return
 }
;-----------------------------------------


#T::
if WinExist("ahk_class Chrome_WidgetWin_1")
{
	WinActivate
	WinMaximize
}
else
    Run Chrome.exe
return




; SURROUNDING SELECTED TEXT WITH QUOTES
#Q:: ; Attention:  Strips formatting from the clipboard too!
Send ^c
clipboard = "%clipboard%"
; Remove space introduced by WORD
StringReplace, clipboard, clipboard,%A_SPACE%",", All
Send ^v
return


; Reactivating PANDORA
#P::

; if WinExist("ahk_class Chrome_WidgetWin_1")
; {
; 	WinActivate
; }
; else
Send {LWin down} 4
; Send {LWin down} 4 4
Send {LWin up}

; sleep 100
send ^1

CoordMode, Mouse, Screen

; Click -1060,929
; Click -2869,704
Click -932,1153

return




; Downvoting PANDORA
#I::

; if WinExist("ahk_class Chrome_WidgetWin_1")
; {
; 	WinActivate
; }
; else

; send #4

Send {LWin down} 4
; Send {LWin down} 4 4
Send {LWin up}

send ^1

CoordMode, Mouse, Screen

; Click -1106,1121
; Click -3033,1129
Click -1106,1576

return


; Pause/Play PANDORA
#O::
; if WinExist("ahk_class Chrome_WidgetWin_1")
; {
; 	WinActivate
; }
; else
; {
; send #4
; }

Send {LWin down} 4
; Send {LWin down} 4 4
Send {LWin up}

send ^1

CoordMode, Mouse, Screen

; Click -971, 1132
; Click -2883,1131
Click -971,1586

return


; COPY TEXT TO CLIPBOARD AND GOOGLE IT
#F::
send ^c
; sleep %waitTime%

if WinExist("ahk_class Chrome_WidgetWin_1")
{
	WinActivate
}
else
{
send #4
}
; sleep %waitTime%
send ^t
; sleep %waitTime%
send ^v

; send http://www.google.com/search?q=%clipboard%
; sleep %waitTime%
send {Enter}
return


; TYPE p4_pass
; #F1::
; send p4_blind
; ; keepClipAndSend("p4_blind")
; return

; TYPE NAME
; #F2::
; send Aaron Aikman
; ; keepClipAndSend("Aaron Aikman")
; return

; TYPE NAME
#`::
send Leaving
return

;windows key + Ctrl
#^`::send sounds good
;windows key + Alt
#!`::send ?piecharacter=Sumo
;windows key + Shift
#+`::send ?piecharacter=Zola


; PRINT SCREEN TO CLIPBOARD, OPEN IRFANVIEW AND PASTE CLIPBOARD
#Y::
send {PrintScreen}
Run C:\Program Files (x86)\IrfanView\i_view32.exe
sleep 1000
; ClipWait
send "^v"
return

