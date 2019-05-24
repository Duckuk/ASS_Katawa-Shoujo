#include ASS_KS-core.ahk
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
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"Would you like to introduce yourself to the class?"
	;Why?
	;Yeah, of course.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, .\ASS_KS-resources\act1_introduce_dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"Hmm, I wonder..."
	;I think I got everything I need to know
	;Ask about the library.
	;Ask about Shizune's deafness.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, .\ASS_KS-resources\act1_cafetalk_dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"She says you have no chance if you keep playing like this, no you won't~!"
	;She has a point. Attack aggressively!
	;It's a trap, it's smarter to play defensively here.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, .\ASS_KS-resources\act1_risk_dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"It takes too many seconds to collect myself and remember what I walked up to her for."
	;Hi! I'm new here. Hisao Nikai. We're in the same class.
	;I'm sorry, I didn't mean to startle you.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, .\ASS_KS-resources\act1_hanako-encounter_dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"I guess it could go either way."
	;She was cute.
	;She wasn't cute.   <<<
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, *21 .\ASS_KS-resources\act1_cute.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"Can you promise me to be more serious about this from now on?"
	;Maybe.   <<<
	;Yes.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, *21 .\ASS_KS-resources\act1_exercise.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 40, 700
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"I don't understand why Shizune is suddenly getting mad at me."
	;Don't drag me into this! I've done my part!
	;Hey, come on. Cut me and Lilly some slack...
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, .\ASS_KS-resources\act1_lilly-shizune-fight_dialogue.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	Send, {Down}{Enter}
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;"Lilly noticed it all too quickly..."
	;I don't really want to talk about it. <<<
	;Sorry, I'm not in very good condition.
	
	Loop {
		ImageSearch, FoundX, FoundY, 0, 0, winWidth, winHeight, *21 .\ASS_KS-resources\act1_condition.png 
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	MouseMove, FoundX, FoundY
	Click
	MouseMove, 970, 725
	
	SetTimer, ctrlClick, 30
	
	;============================================================================
	;Check for credits
	Loop {
		PixelSearch, xColour, yColour, 183, 697, 183, 697, 0x77858F, 0, Fast
		if (ErrorLevel = 0) {
			SetTimer, ctrlClick, Off
			break
		}
	}
	
	;You are dead, not big surprise
	timerSplit()

	ExitApp
return

[::
	ExitApp
return

^[::
	Send, {Ctrl down}
	ExitApp
return



