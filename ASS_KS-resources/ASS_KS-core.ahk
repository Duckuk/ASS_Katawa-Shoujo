#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  	; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Pixel, Client
CoordMode, Mouse, Client

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
	Send, {Escape}
	Sleep, 700
	MouseMove, 499, 437
	Click
	Sleep, 30
	Send, {Down 10}
	Loop {
		PixelSearch, xColour, yColour, 219, 584, 219, 584, 0xD0EEFD, 5, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
	Send, {Enter}
	Send, {Escape}
	Sleep, 700
}

loadGame(slot) {
	global xColour
	global yColour
	if (slot > 5) {
		MsgBox, Slot '%slot%' is invalid.
		ExitApp
	}
	Send, {Escape}
	Sleep, 700
	MouseMove, 499, 478
	Click
	Sleep, 30
	Send, {Down %slot%}
	Loop {
		PixelSearch, xColour, yColour, 219, 584, 219, 584, 0xD0EEFD, 5, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
	Send, {Enter}
	Sleep, 525
	MouseMove, 439, 433
	Click
	MouseMove, 40, 700
	Sleep, 700
}
