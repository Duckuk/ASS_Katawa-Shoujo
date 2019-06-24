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

singleClickTimer:
	Click
return

ctrlTimer:
	Send, {Ctrl}
return

clickTimerEnd:
	Click
	MouseMove, 970, 705
	Click
	MouseMove, 970, 725
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
	;I think I got everything I need to know.   <<<
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
	;I'm sorry, I didn't mean to startle you.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\3hanako-encounter\apologize.png
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
	;"I guess it could go either way."
	;She was cute.   <<<
	;She wasn't cute.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\4cute\cute.png
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
	;(SAVE GAME)
	;"What to do..."
	;Read my book.
	;Wait for Shizune and Misha to come to a decision.   <<<
	;Talk to Hanako.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\5shizune-lilly-gate\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\shizune.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\shizune-2.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.
	;Yes.   <<<
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\6exercise\yes.png
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
	;(SAVE GAME)
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!
	;Hey, come on. Cut me and Lilly some slack...   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\7shizune-lilly-split\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\7shizune-lilly-split\lilly.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;(SAVE GAME)
	;"Will I be able to do more?"
	;Go for it.   <<<
	;Take it easy.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\8pushself\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\8pushself\go-for-it.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;START OF EMI ROUTE
	emiRoute()
	;END OF EMI ROUTE
	
	;============================================================================
	;"Will I be able to do more?"
	;Go for it.
	;Take it easy.   <<<
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\8pushself\take-it-easy.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Lilly noticed it all too quickly..."
	;I don't really want to talk about it.
	;Sorry, I'm not in very good condition.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\9condition\spill-beans.png
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
	;(SAVE GAME)
	;"I wish I knew..."
	;I'm interested in the art club.
	;I just kinda stuck with her, I think.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\10rin-gate\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10rin-gate\stuck-with-her.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10rin-gate\stuck-with-her-2.png
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
			MouseMove, 40, 700
			break
		}
	}
	;"bad" ending done
	loadGameMainMenu(3)
	deleteSave(3)
	
	;============================================================================
	;"I wish I knew..."
	;I'm interested in the art club.   <<<
	;I just kinda stuck with her, I think.
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10rin-gate\interested-in-art.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	
	SetTimer, singleClickTimer, 5
	
	;START OF RIN ROUTE
	rinRoute()
	;END OF RIN ROUTE
	
	;============================================================================
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!   <<<
	;Hey, come on. Cut me and Lilly some slack...
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\7shizune-lilly-split\shizune.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;(SAVE GAME)
	;"Will I be able to do more?"
	;Go for it.   <<<1
	;Take it easy.   <<<2
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\8pushself\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\8pushself\go-for-it.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\9mishi-why-skip\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	loadGame(2)
	deleteSave(2)
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\8pushself\take-it-easy.png
		if (ErrorLevel = 0) {
			break
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
	
	;START OF SHIZUNE ROUTE
	shizuneRoute()
	;END OF SHIZUNE ROUTE
	
	;============================================================================
	;"What to do..."
	;Read my book.
	;Wait for Shizune and Misha to come to a decision.
	;Talk to Hanako.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\lilly-hanako.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\lilly-hanako-2.png
		if (ErrorLevel = 0) {
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
	;Don't drag me into this! I've done my part!
	;Hey, come on. Cut me and Lilly some slack...   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\7shizune-lilly-split\lilly.png
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
	;"Lilly noticed it all too quickly..."
	;I don't really want to talk about it.
	;Sorry, I'm not in very good condition.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\9condition\spill-beans.png
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
	;(SAVE GAME)
	;"There's got to be something to do that can kill the time..."
	;Go to the library.   <<<
	;Go for a walk into town.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\10lilly-hanako-gate\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10lilly-hanako-gate\hanako.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;START OF HANAKO ROUTE
	hanakoRoute()
	;END OF HANAKO ROUTE
	
	;============================================================================
	;"There's got to be something to do that can kill the time..."
	;Go to the library.
	;Go for a walk into town.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10lilly-hanako-gate\lilly.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;START OF LILLY ROUTE
	lillyRoute()
	;END OF LILLY ROUTE
	
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			SetTimer, ctrlTimer, Off
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	ExitApp
return

emiRoute() {
	global
	;============================================================================
	;"Still, I feel like I should at least offer to run with her..."
	;Keep quiet.
	;Offer to run with Emi.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\0run\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Why do I get the feeling that she's convincing herself as well as me?"
	;Press Emi.
	;Let it rest.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\1limp\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Got a minute?"
	;I suppose I can spare a few minutes.   <<<
	;No, I have other things to worry about.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\2mutou-talk\talk.png
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
	;"Look, mind if I give you some advice?"
	;Sure, why not?
	;No, this is my problem.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\3nurse-advice\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"How to go about it?"
	;Go after her.   <<<
	;Talk to her mum.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\emi-route\4ran-off\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
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
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I purse my lips, uncertain about how to respond."
	;Downplay the issue.   <<<2
	;Give in and let Misha know   <<<1
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\5misha\spill-beans.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\5misha\spill-beans.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	Loop, 126 {
		Click
		Sleep, 5
	}
	loadGame(5)
	deleteSave(5)
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\emi-route\5misha\dont-talk.png
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
			MouseMove, 40, 700
			break
		}
	}
	;"emibad" ending done
	loadGameMainMenu(4)
	deleteSave(4)
	
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
	MouseMove, 40, 700
	
	SetTimer, clickTimerEnd, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	;"emi" ending done
	loadGameMainMenu(3)
	deleteSave(3)
}

rinRoute() {
	global
	;============================================================================
	;"Her sketch blows my mind."
	;You're amazing!   <<<
	;I wish I was as good as you.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\0drawing\amazing.png
			if (ErrorLevel = 0) {
				SetTimer, singleClickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, singleClickTimer, 5
	
	;============================================================================
	;"This school feels so alive."
	;It's refreshing.   <<<
	;It makes me feel like I'm stuck.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\1alive-school\refreshing.png
			if (ErrorLevel = 0) {
				SetTimer, singleClickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I have to change."
	;I want to be more like Rin.   <<<
	;I want to be more like Emi.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\2change\rin.png
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
	;"Anyway, I don't think I have much else to say, other than you should go for it."
	;I think you'd be a big hit.   <<<
	;Because it would be exiting.
	;It isn't like you at all to hesitate like this.
	
	Loop {
		PixelSearch, xColour, yColour, 825, 354, 825, 354, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\3art-mueseum\big-hit-1.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\3art-mueseum\big-hit-2.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\3art-mueseum\big-hit-3.png
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
	
	SetTimer, singleClickTimer, 5
	
	;============================================================================
	;"I've never really had friends."
	;What about me?
	;What about Emi?
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\rin-route\4friends\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, singleClickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I can't make sense of my own thoughts."
	;I want to be with her more.
	;I can't leave her alone either.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\rin-route\5distance1\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	loadGame(3)
	deleteSave(3)
	
	;============================================================================
	;"Anyway, I don't think I have much else to say, other than you should go for it."
	;I think you'd be a big hit.
	;Because it would be exciting.
	;It isn't like you at all to hesitate like this.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\3art-mueseum\hesitate-1.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\3art-mueseum\hesitate-2.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, singleClickTimer, 5
	
	;============================================================================
	;"I've never really had friends."
	;What about me?
	;What about Emi?
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\rin-route\4friends\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, singleClickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"What am I, for her?"
	;I want to understand her.   <<<
	;I want to support her.
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\5distance2\understand.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, singleClickTimer, 5
	
	;============================================================================
	;"I don't understand what he's trying to say."
	;Is that why you're being so supportive of Rin?
	;Why did you turn away from being an artist?
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\rin-route\6nomiya-talk\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, singleClickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I don't think you'd understand. I am not sure if I do."
	;I need to understand.
	;Then explain.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\rin-route\7understand\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\7understand\explain.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\7understand\explain-2.png
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
			MouseMove, 40, 700
			break
		}
	}
	;"rinbad" ending done
	loadGameMainMenu(3)
	deleteSave(3)
	
	;============================================================================
	;"I don't think you'd understand. I am not sure if I do."
	;I need to understand.   <<<
	;Then explain.
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\7understand\understand.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\7understand\understand-2.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click, 5
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"That someone wouldn't have to ask questions from me."
	;But if you found someone like that, then what?
	;But aren't you happy people are interested in your paintings?   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\rin-route\8questions\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\8questions\interested-in-paintings.png
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
			MouseMove, 40, 700
			break
		}
	}
	;"rin" ending done
	loadGameMainMenu(3)
	deleteSave(3)
	
	;============================================================================
	;"That someone wouldn't have to ask questions from me."
	;But if you found someone like that, then what?   <<<
	;But aren't you happy people are interested in your paintings?
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\8questions\then-what.png
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
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	;"rintrue" ending done
	loadGameMainMenu(2)
	deleteSave(2)
}

lillyRoute() {
	global
	;============================================================================
	;"Ah, now I've piqued her curiosity. It feels kind of overly personal to talk about though..."
	;Avoid the subject.
	;Tell the truth.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\lilly-route\0thinking\spill-beans.png
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
	;"I think he's hyperventilating. Passing out for a little while would probably make him more relaxed than he normally is."
	;Humour him.
	;Ignore his insane ramblings.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\lilly-route\1bet\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Uh... hi."
	;Keep it to myself.
	;Ask about Hanako.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\lilly-route\2girl\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"I sigh. This is exactly the kind of thing I wish others wouldn't do."
	;Address it.   <<<
	;Wave her off.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\lilly-route\3do\address.png
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
	;"It's a pity we have to return to school. She seemed to relax so much while we were all away."
	;Talk about Hanako.
	;Talk about school.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\lilly-route\4train\hanako.png
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;(SAVE GAME)
	;"Wrapped in my own little world, I shake my head before remembering the futility of the gesture."
	;Mention the letter.
	;Drop the subject.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\lilly-route\5dinner\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\lilly-route\5dinner\drop-subject.png
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
			MouseMove, 40, 700
			break
		}
	}
	;"lillybad" ending done
	loadGameMainMenu(1)
	deleteSave(1)
	
	;============================================================================
	;"Wrapped in my own little world, I shake my head before remembering the futility of the gesture."
	;Mention the letter.   <<<
	;Drop the subject.
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\lilly-route\5dinner\mention-letter.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	setTimer, clickTimerEnd, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	;"lilly" ending done
}

hanakoRoute() {
	global
	;============================================================================
	;"So, how about it, Hisao?"
	;I've done enough work for the council already.   <<<2
	;What do you think, Hanako?   <<<1
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\0mishi-abduction\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\0mishi-abduction\allow.png
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
	MouseMove, FoundX, FoundY
	Loop, 6 {
		Click
		Sleep, 5
	}
	MouseMove, 40, 700
	Sleep, 30
	loadGame(2)
	deleteSave(2)
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\0mishi-abduction\resist.png
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Miki certainly doesn't mince words."
	;Admit it.
	;Deny it.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\1miki-encounter\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;""
	;Do you want to go into the city?
	;How about we call it a day?   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 476, 686, 476, 686, 0xEFEFF7, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\2hanako-tired\call-a-day.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Loop, 6 {
		Click
		Sleep, 5
	}
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"The situation got effectively turned on its head. After everything that's happened, this is the first time I find myself doubting Lilly's judgement."
	;Agree with Lilly.
	;Trust my own judgement.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\3lilly-phone\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	setTimer, clickTimerEnd, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			MouseMove, 40, 700
			break
		}
	}
	;"hanakorage" ending done
	loadGameMainMenu(2)
	deleteSave(2)
	
	;============================================================================
	;""
	;Do you want to go into the city?   <<<
	;How about we call it a day?

	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\2hanako-tired\go-to-city.png
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"The situation got effectively turned on its head. After everything that's happened, this is the first time I find myself doubting Lilly's judgement."
	;Agree with Lilly.
	;Trust my own judgement.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\3lilly-phone\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	saveGame()
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\3lilly-phone\trust-self.png
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
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
			MouseMove, 40, 700
			break
		}
	}
	;"hanakosad" ending done
	loadGameMainMenu(2)
	deleteSave(2)
	
	;============================================================================
	;"The situation got effectively turned on its head. After everything that's happened, this is the first time I find myself doubting Lilly's judgement."
	;Agree with Lilly.   <<<
	;Trust my own judgement.
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\3lilly-phone\agree-lilly.png
		if (ErrorLevel = 0) {
			break
		}
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\3lilly-phone\agree-lilly-2.png
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
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
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	;"hanako" ending done
	loadGameMainMenu(1)
	deleteSave(1)
}

shizuneRoute() {
	global
	
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
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\shizune-route\0misha-comfort\comfort-2.png
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
	
	setTimer, clickTimerEnd, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			MouseMove, 40, 700
			break
		}
	}
	;"shizunebad" ending done
	loadGameMainMenu(2)
	deleteSave(2)
	
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
	
	setTimer, clickTimerEnd, 5
	
	;============================================================================
	;Check for main menu
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, clickTimerEnd, Off
			timerSplit()
			MouseMove, 40, 700
			break
		}
	}
	;"shizune" ending done
	loadGameMainMenu(1)
	deleteSave(1)
}

[::
	ExitApp
return

^[::
	Send, {Ctrl up}
	ExitApp
return