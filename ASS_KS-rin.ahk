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
	;Yeah, of course.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\0introduce\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, clickTimer, 5
	
	;============================================================================
	;"Hmm, I wonder..."
	;I think I got everything I need to know
	;Ask about the library.
	;Ask about Shizune's deafness.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\1cafetalk\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
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
	;Read my book.   <<<
	;Wait for Shizune and Misha to come to a decision. (Not guaranteed to appear)
	;Talk to Hanako. (Not guaranteed to appear)
	;OR
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.   <<<
	;Yes.
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\book.png 
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			done := false
			break
		} else {
			PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
			if (ErrorLevel = 0) {
				ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\6exercise\no.png 
				if (ErrorLevel = 0) {
					SetTimer, clickTimer, Off
					done := true
					break
				}
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, clickTimer, 5
	
	if (!done) {
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
	}
	
	;============================================================================
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!
	;Hey, come on. Cut me and Lilly some slack...
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\act1\7shizune-lilly-split\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, clickTimer, Off
			break
		}
	}
	Send, {Down}{Enter}
	
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
	;"I wish I knew..."
	;I'm interested in the art club.   <<<
	;I just kinda stuck with her, I think.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10rin-gate\interested-in-art.png 
			if (ErrorLevel = 0) {
				SetTimer, clickTimer, Off
				break
			}
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, singleClickTimer, 5
	
	;START OF RIN ROUTE
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
	loadGame(1)
	
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
	;I need to understand.   <<<2
	;Then explain.   <<<1
	
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
	Click, 5
	MouseMove, 40, 700
	
	Sleep, 30
	
	loadGame(2)
	
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
	;But if you found someone like that, then what?   <<<2
	;But aren't you happy people are interested in your paintings?   <<<1
	
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
	Click, 5
	MouseMove, 40, 700
	
	Loop, 550 {
		Click
		Sleep, 20
	}
	
	Loop {
		PixelSearch, xColour, yColour, 302, 481, 302, 481, 0xB0949A, 0, Fast
		if (ErrorLevel = 0) {
			PixelSearch, xColour, yColour, 501, 501, 521, 501, 0xF4F2F2, 10, Fast
			if (ErrorLevel = 1) {
				break
			}
		}
		Click
	}
	loadGame(3)
	
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\rin-route\8questions\then-what.png 
		if (ErrorLevel = 0) {
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click, 5
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