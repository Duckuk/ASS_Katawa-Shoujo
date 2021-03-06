﻿#include .\ASS_KS-resources\ASS_KS-core.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  	; Enable warnings to assist with detecting common errors.
#SingleInstance, Force

SendMode Input
SetWorkingDir %A_ScriptDir%
CoordMode, Pixel, Client
CoordMode, Mouse, Client

IniRead, exePath, ASS_KS-config.ini, Settings, exePath, ".\Katawa Shoujo.exe"

if !(FileExist(exePath)) {
	MsgBox, Unable to find 'Katawa Shoujo.exe'
	MsgBox, Make sure 'exePath' in the configuration file points to the correct file
	ExitApp
}

IniRead, timer, ASS_KS-config.ini, Settings, timer, 0
IniRead, timerKey, ASS_KS-config.ini, Settings, timerKey, Numpad1

clickTimer:
	Click, 2
return

ctrlTimer:
	Send, {Ctrl}
return

clickTimerEnd:
	Click
	MouseMove, 970, 705
	Click
	MouseMove, 970, 725
return

]::
	;Run 'Katawa Shoujo.exe'
	Run, %exePath%
	
	;Wait for window to exist
	Loop {
		if WinExist("ahk_exe Katawa Shoujo.exe") {
			break
		}
	}
	
	;Wait until main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			WinGetPos, , , winWidth, winHeight, A
			break
		}
		MouseMove, 40, 700
		WinActivate, ahk_exe Katawa Shoujo.exe
	}
	
	Send, {Ctrl down}
	Send, {Down 2}{Enter}
	Send, {Down}{Enter}
	Click, 491, 392
	Click, 258, 426
	MouseMove, 40, 700
	Send, {Ctrl up}
	Send, {Escape}
	Send, {Ctrl}
	Send, {Down}
	Send, {Enter}
	
	;START OF ACT 1
	timerSplit()
	
	SetTimer, clickTimer, 5
	SetTimer, ctrlTimer, 100
	
	;============================================================================
	;"Would you like to introduce yourself to the class?"
	;Why?
	;Yeah, of course.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\0introduce\yeah.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Hmm, I wonder..."
	;I think I got everything I need to know   <<<
	;Ask about the library.
	;Ask about Shizune's deafness.
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\1cafetalk\nothing.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"She says you have no chance if you keep playing like this, no you won't~!"
	;She has a point. Attack aggressively!
	;It's a trap, it's smarter to play defensively here.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\2risk\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"It takes too many seconds to collect myself and remember what I walked up to her for."
	;Hi! I'm new here. Hisao Nikai. We're in the same class.
	;I'm sorry, I didn't mean to startle you.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\3hanako-encounter\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I guess it could go either way."
	;She was cute.
	;She wasn't cute.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\4cute\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"What to do..."
	;Read my book.
	;Wait for Shizune and Misha to come to a decision.   <<<
	;Talk to Hanako. (Not guaranteed to appear)
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\shizune.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.   <<<
	;Yes.
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\6exercise\no.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!   <<<
	;Hey, come on. Cut me and Lilly some slack...
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\7shizune-lilly-split\shizune.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I don't really want to talk about it with these two."
	;Kick them out of my room.
	;Try to dodge the subject.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\9mishi-medication\dodge-the-subject.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Please comfort me, Hicchan. Just for today."
	;Comfort Misha.   <<<
	;Refuse.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\shizune-route\0misha-comfort\comfort.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	saveGame()
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimerEnd, 5
	
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			SetTimer, ctrlTimer, Off
			break
		}
	}
	
	Send, {Ctrl down}
	Send, {Down 2}{Enter}
	Send, {Ctrl up}
	Send, {Left}{Enter}
	Send, {Ctrl}
	SetTimer, ctrlTimer, 100
	
	;============================================================================
	;"Please comfort me, Hicchan. Just for today."
	;Comfort Misha.
	;Refuse.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\shizune-route\0misha-comfort\refuse.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimerEnd, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			SetTimer, ctrlTimer, Off
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	ExitApp
return

[::
	ExitApp
return

^[::
	Send, {Ctrl up}
	ExitApp
return