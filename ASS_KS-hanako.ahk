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
	;I'm sorry, I didn't mean to startle you.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\3hanako-encounter\apologize.png 
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
	;"I guess it could go either way."
	;She was cute.   <<<
	;She wasn't cute.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\4cute\cute.png 
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
	;"What to do..."
	;Read my book.
	;Wait for Shizune and Misha to come to a decision. (Not guaranteed to appear)
	;Talk to Hanako.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\5shizune-lilly-gate\lilly-hanako.png 
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
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.   <<<
	;Yes.
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\6exercise\no.png 
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
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!
	;Hey, come on. Cut me and Lilly some slack...   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\7shizune-lilly-split\lilly.png 
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
	;"Lilly noticed it all too quickly..."
	;I don't really want to talk about it.
	;Sorry, I'm not in very good condition.   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\9condition\spill-beans.png 
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
	;"There's got to be something to do that can kill the time..."
	;Go to the library.   <<<
	;Go for a walk into town.
	
	Loop {
		PixelSearch, xColour, yColour, 785, 377, 785, 377, 0xD1F0FE, 25, Fast
		if (ErrorLevel = 0) {
			ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\act1\10lilly-hanako-gate\hanako.png 
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
	
	;START OF HANAKO ROUTE
	;============================================================================
	;"So, how about it, Hisao?"
	;I've done enough work for the council already.   <<<2
	;What do you think, Hanako?   <<<1
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\0mishi-abduction\dialogue.png
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
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
	loadGame(1)
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
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"Miki certainly doesn't mince words."
	;Admit it.
	;Deny it.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\1miki-encounter\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;""
	;Do you want to go into the city?
	;How about we call it a day?   <<<
	
	Loop {
		PixelSearch, xColour, yColour, 476, 686, 476, 686, 0xEFEFF7, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
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
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"The situation got effectively turned on its head. After everything that's happened, this is the first time I find myself doubting Lilly's judgement."
	;Agree with Lilly.
	;Trust my own judgement.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\3lilly-phone\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	Loop, 119 {
		Click
		Sleep, 5
	}
	loadGame(2)
	
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
	
	SetTimer, ctrlClick, 5
	
	;============================================================================
	;"The situation got effectively turned on its head. After everything that's happened, this is the first time I find myself doubting Lilly's judgement."
	;Agree with Lilly.   <<<2
	;Trust my own judgement.   <<<1
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 600, winWidth, winHeight, .\ASS_KS-resources\hanako-route\3lilly-phone\dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
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
	
	Loop, 10 {
		Click
		Sleep, 5
	}
	
	loadGame(3)
	Loop {
		ImageSearch, FoundX, FoundY, 85, 265, 860, 500, *25 .\ASS_KS-resources\hanako-route\3lilly-phone\agree-lilly.png 
		if (ErrorLevel = 0) {
			break
		}
	}
	Sleep, 30
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