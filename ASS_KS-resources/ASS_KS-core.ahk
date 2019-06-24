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

loadGameMainMenu(slot)
{
	slot := slot-1
	setTimer, pressCtrl, 5
	Sleep, 500
	MouseMove, 133, 532
	Click
	Sleep, 10
	Send, {Left}
	Sleep, 10
	Send, {Down %slot%}{Enter}
	Sleep, 10
	setTimer, pressCtrl, Off
	MouseMove, 40, 700
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

loadGame(slot, scrollNum:=0) {
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
	if (scrollNum) {
		Loop, 20 {
			Send, {WheelDown}
			Sleep, 1
		}
		Sleep, 50
		Loop, %scrollNum% {
			Send, {WheelUp}
			Sleep, 1
		}
		Sleep, 10
	}
	Sleep, 10
	Send, {Down %slot%}
	Sleep, 10
	Send, {Enter}
	Sleep, 10
	Send, {Left}{Enter}
	Sleep, 10
	MouseMove, 40, 700
	setTimer, pressCtrl, Off
}

deleteSave(slot, scrollNum:=0) {
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
	if (scrollNum) {
		Loop, 20 {
			Send, {WheelDown}
			Sleep, 1
		}
		Loop, %scrollNum% {
			Send, {WheelUp}
			Sleep, 1
		}
		Sleep, 10
	}
	Send, {Down %slot%}
	Sleep, 10
	Send, {Right}{Enter}
	Sleep, 10
	Send, {Left}{Enter}
	Sleep, 10
	MouseMove, 40, 700
	Send, {Escape 2}
	Sleep, 10
	setTimer, pressCtrl, Off
}