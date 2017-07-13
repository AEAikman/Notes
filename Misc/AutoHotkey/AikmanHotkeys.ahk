; HOTKEYS DEFINED BY AARON AIKMAN


; VARIABLES
waitTime := 300
longWaitTime := 800


; VOLUME CONTROL
#3::Volume_Down
#4::Volume_Up
#5::Volume_Mute

; DESKTOP CONTROL
#1::send("^#{left}")
#2::send("^#{right}")
#A::send("#{left}")
#D::send("#{right}")
#W::send("#{up}")
#S::send("#{down}")

send(toSend)
{
	oldDelay := A_KeyDelay
	SetKeyDelay, 30
	
	send, % toSend
	
	SetKeyDelay, % oldDelay
	return 
}


checkForClover(toSend)
{
if WinExist("ahk_class CabinetWClass")
{
	WinMinimize
}
send(toSend)
return
}

; OPENING COMMAND PROMPT TO OPEN FOLDER IF FOLDER OPEN
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


; CHROME STUFF
;#Q:: 
;Run, chrome.exe
;WinWaitActive, ahk_class Chrome_WidgetWin_0,, 2
;return


#T::
if WinExist("ahk_class Chrome_WidgetWin_1")
{
	WinActivate
	WinMaximize
}
else
    Run Chrome.exe
return

; SetTitleMatchMode 2
; IfWinExist Google Chrome
;     WinActivate, Google Chrome
; else
;     Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

; WinWaitActive Google Chrome


; SURROUNDING SELECTED TEXT WITH QUOTES
#Q:: ; Attention:  Strips formatting from the clipboard too!
Send ^c
clipboard = "%clipboard%"
; Remove space introduced by WORD
StringReplace, clipboard, clipboard,%A_SPACE%",", All
Send ^v
return


; CLICKING PANDORA
#P::
loop, 2
{
send("^#{left}")
sleep 10
}


sleep %waitTime%
send("{Ctrl down}1{ctrl up}")

CoordMode, Mouse, Screen

sleep %waitTime%
; Click 1106,2048
Click -1060,929
sleep %waitTime%
; Click 3440,1995
; Click 1273,876
sleep %waitTime%

send("^#{right}")
return




; Downvoting PANDORA
#I::
loop, 2
{
send("^#{left}")
sleep 10
}

sleep %waitTime%
send("{Ctrl down}1{ctrl up}")

CoordMode, Mouse, Screen

sleep %waitTime%
; Click 1106,2048
; Click -1060,929
; Click 942,3784
Click -1226,2684
sleep %waitTime%
; Click 3440,1995
; Click 1273,876
sleep %waitTime%

send("^#{right}")
return



; Pausing or Playing PANDORA
#O::
loop, 2
{
send("^#{left}")
sleep 10
}

sleep %waitTime%
send("{Ctrl down}1{ctrl up}")

CoordMode, Mouse, Screen

sleep %waitTime%
; Click 1076, 3770
Click -1084, 2678
sleep %waitTime%
sleep %waitTime%

send("^#{right}")
return


; COPY TEXT TO CLIPBOARD AND GOOGLE IT
#F:: 
send("^c")
Run http://www.google.com/search?q=%clipboard%
return

; DEFAULT AUDIO DEVICE
;device := "Speakers" ; alternative: device = Speakers
;F2::
;if (device = "Speakers") 
;    device := "TV" ; had to be on the next line
;else if (device = "TV") 
;    device := "Headphones" ; had to be on the next line
;else if (device = "Headphones") 
;    device := "Speakers" ; had to be on the next line
;run, nircmd.exe setdefaultsounddevice %device%
;return


; TYPE NAME
#F2::
send Aaron Aikman
return


; PRINT SCREEN TO CLIPBOARD, OPEN IRFANVIEW AND PASTE CLIPBOARD
#Y::
send {PrintScreen}
Run C:\Users\aaikman\AppData\Roaming\IrfanView\i_view32.exe
sleep %waitTime%
send("^v")
return



; Creating Flags
#0::
CoordMode, Mouse, Screen
; Absolute:	2439, 209 (less often used)
Click 2439,209
sleep %longWaitTime%
Click 2508,440
sleep %longWaitTime%
Click 1074,666
sleep %longWaitTime%
Click 2504,484


; Creating FlagsMounted
#9::
CoordMode, Mouse, Screen
; Absolute:	2439, 209 (less often used)
Click 2319,210
sleep %longWaitTime%
Click 2508,440
sleep %longWaitTime%
Click 1074,666
sleep %longWaitTime%
Click 2504,484

