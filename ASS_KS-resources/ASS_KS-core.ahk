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
	Sleep, 550
	Send, {Down 7}{Enter}
	Send, {Down 6}
	Loop {
		PixelSearch, xColour, yColour, 219, 584, 219, 584, 0xD0EEFD, 5, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	Send, {Enter}
	Send, {Escape}
}

loadGame(slot) {
	global xColour
	global yColour
	if (slot > 5) {
		MsgBox, Slot '%slot%' is invalid.
		ExitApp
	}
	Send, {Escape}
	Sleep, 550
	Send, {Down 8}{Enter}
	Send, {Down %slot%}
	Loop {
		PixelSearch, xColour, yColour, 219, 584, 219, 584, 0xD0EEFD, 5, Fast
		if (ErrorLevel = 0) {
			break
		}
	}
	Send, {Enter}
	Send, {Right}
	Sleep, 525
	Send, {Enter}
}
