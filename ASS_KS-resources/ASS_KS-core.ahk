#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  	; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Pixel, Client
CoordMode, Mouse, Client

pressCtrl() {
	Send, {Ctrl}
}

timerSplit() {
	global
	if (timer) {
		Send, {%timerKey%}
	}
}

saveGame()
{
	global xColour
	global yColour
	setTimer, pressCtrl, 5
	Send, {Escape}
	Sleep, 10
	MouseMove, 499, 437
	Click
	Sleep, 10
	Send, {Down 10}
	Sleep, 10
	Send, {Enter}
	Send, {Escape}
	Sleep, 10
	MouseMove, 40, 700
	setTimer, pressCtrl, Off
}

loadGame(slot) {
	global xColour
	global yColour
	if (slot > 5) {
		MsgBox, Slot '%slot%' is invalid.
		ExitApp
	}
	setTimer, pressCtrl, 5
	Send, {Escape}
	Sleep, 10
	MouseMove, 499, 478
	Click
	Sleep, 10
	Send, {Down %slot%}
	Sleep, 10
	Send, {Enter}
	Sleep, 10
	MouseMove, 439, 433
	Click
	Sleep, 10
	MouseMove, 40, 700
	setTimer, pressCtrl, Off
}