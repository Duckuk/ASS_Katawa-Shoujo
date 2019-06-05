#include .\ASS_KS-resources\ASS_KS-core.ahk
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

ctrlClick:
	Click
	Send, {Ctrl}
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
	
	Send, {Down 2}{Enter}
	Sleep, 550
	Send, {Down}{Enter}
	Sleep, 525
	Click, 491, 392
	Click, 258, 426
	MouseMove, 40, 700
	Send, {Escape}
	Send, {Down}
	Sleep, 550
	Send, {Enter}
	
	;START OF ACT 1
	timerSplit()
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Would you like to introduce yourself to the class?"
	;Why?
	;Yeah, of course.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\0introduce\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Hmm, I wonder..."
	;I think I got everything I need to know
	;Ask about the library.
	;Ask about Shizune's deafness.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\1cafetalk\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"She says you have no chance if you keep playing like this, no you won't~!"
	;She has a point. Attack aggressively!
	;It's a trap, it's smarter to play defensively here.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\2risk\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"It takes too many seconds to collect myself and remember what I walked up to her for."
	;Hi! I'm new here. Hisao Nikai. We're in the same class.
	;I'm sorry, I didn't mean to startle you.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\3hanako-encounter\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"I guess it could go either way."
	;She was cute.
	;She wasn't cute.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\4cute\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"What to do..."
	;Read my book.   <<<
	;Wait for Shizune and Misha to come to a decision. (Not guaranteed to appear)
	;Talk to Hanako. (Not guaranteed to appear)
	;OR
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.
	;Yes.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\book.png 
			if (ErrorLevel = 0) {
				SetTimer, ctrlClick, Off
				done := false
				break
			} else {
				ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\6exercise\yes.png 
				if (ErrorLevel = 0) {
					SetTimer, ctrlClick, Off
					done := true
					break
				}
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 5
	
	if (!done) {
	;============================================================================
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.
	;Yes.   <<<
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\6exercise\yes.png 
			if (ErrorLevel = 0) {
				SetTimer, ctrlClick, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 5
	}
	
	;============================================================================
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!
	;Hey, come on. Cut me and Lilly some slack...
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\7shizune-lilly-split\dialogue.png 
			if (ErrorLevel = 0) {
				SetTimer, ctrlClick, Off
				break
			}
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Will I be able to do more?"
	;Go for it.   <<<
	;Take it easy.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\8pushself\go-for-it.png
			if (ErrorLevel = 0) {
				SetTimer, ctrlClick, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 5
	
	;START OF EMI ROUTE
	;============================================================================
	;"Still, I feel like I should at least offer to run with her..."
	;Keep quiet.
	;Offer to run with Emi.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\0run\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Why do I get the feeling that she's convincing herself as well as me?"
	;Press Emi.
	;Let it rest.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\1limp\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Got a minute?"
	;I suppose I can spare a few minutes.   <<<
	;No, I have other things to worry about.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\2mutou-talk\talk.png
			if (ErrorLevel = 0) {
				SetTimer, ctrlClick, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Look, mind if I give you some advice?"
	;Sure, why not?
	;No, this is my problem.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\3nurse-advice\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"How to go about it?"
	;Go after her.   <<<
	;Talk to her mum.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\4ran-off\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	saveGame()
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\4ran-off\chase.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"I purse my lips, uncertain about how to respond."
	;Downplay the issue.
	;Give in and let Misha know   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\5misha\spill-beans.png
			if (ErrorLevel = 0) {
				SetTimer, ctrlClick, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	Loop, 125 {
		Click
		Sleep, 30
	}
	
	loadGame(1)
	
	;============================================================================
	;"How to go about it?"
	;Go after her.
	;Talk to her mum.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\4ran-off\talk-to-mum.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 970, 725
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
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