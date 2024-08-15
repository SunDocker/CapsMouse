; CapsLock
SetCapsLockState, AlwaysOff
CapsLock & F12::CapsLock

; Alt F4
!q::Send !{F4}
return	

; Debug
CapsLock & F11::
MouseGetPos, X, Y
MsgBox, %X%
MsgBox, %Y%

; Switch primary monitor
Capslock & 1::
Run nircmd.exe setprimarydisplay 1
return

Capslock & 2::
Run nircmd.exe setprimarydisplay 2
return

Capslock & 3::
Run nircmd.exe setprimarydisplay 3
return

Capslock & 4::
Run nircmd.exe setprimarydisplay 4
return

; Movement
Capslock & I::
Capslock & J::
Capslock & K::
Capslock & L::
Capslock & F::	
upKey = I
leftKey = J
downKey = K
rightKey = L
Move(Xdirection, Ydirection) {
	moveSpeed := 54
	slowKey = F
	slowSpeed := 4
	if GetKeyState(slowKey, "P") {
		MouseMove, Xdirection * slowSpeed, Ydirection * slowSpeed, 0, R
	} else {
		MouseMove, Xdirection * moveSpeed, Ydirection * moveSpeed, 0, R
	}
}
While, GetKeyState(leftKey, "P") & GetKeyState(downKey, "P") {
	Move(-1, 1)
}
While, GetKeyState(downKey, "P") & GetKeyState(rightKey, "P") {
	Move(1, 1)
}
While, GetKeyState(upKey, "P") {
	if GetKeyState(leftKey, "P") {
		Move(-1, -1)
	} else if GetKeyState(rightKey, "P") {
		Move(1, -1)	
	} else {
		Move(0, -1)
	}
}
While, GetKeyState(leftKey, "P") {
	if GetKeyState(upKey, "P") {
		Move(-1, -1)
	} else if GetKeyState(downKey, "P") {
		Move(-1, 1)	
	} else {
		Move(-1, 0)
	}
}
While, GetKeyState(downKey, "P") {
	if GetKeyState(leftKey, "P") {
		Move(-1, 1)
	} else if GetKeyState(rightKey, "P") {
		Move(1, 1)	
	} else {
		Move(0, 1)
	}
}
While, GetKeyState(rightKey, "P") {
	if GetKeyState(upKey, "P") {
		Move(1, -1)
	} else if GetKeyState(downKey, "P") {
		Move(1, 1)	
	} else {
		Move(1, 0)
	}
}
return

;Capslock & 7::
;MouseMove, (A_ScreenWidth // 4), (A_ScreenHeight // 4), 0
;return

;Capslock & 8::
;MouseMove, (A_ScreenWidth * 3 // 4), (A_ScreenHeight // 4), 0
;return

;Capslock & 9::
;MouseMove, (A_ScreenWidth * 3 // 4), (A_ScreenHeight * 3 // 4), 0
;return

;Capslock & 0::
;MouseMove, (A_ScreenWidth // 4), (A_ScreenHeight * 3 // 4), 0
;return

;Capslock & C::
;MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2), 0
;return

; Click and Drag
Capslock & u::
MouseClick
return

Capslock & o::
MouseClick, Right
return

;Capslock & h::
;MouseClick, Left, , ,2
;return

Capslock & m::
MouseClick, Left, , , , , D
return

Capslock & n::
MouseClick, Left, , , , , U
return

; Scroll
Capslock & p::
While, GetKeyState("P", "P") {
	MouseClick, WU
	if GetKeyState("F", "P") {
		Sleep 120
	} else {
		Sleep 20
	}
}
return

Capslock & `;::
While, GetKeyState("`;", "P") {
	MouseClick, WD
	if GetKeyState("F", "P") {
		Sleep 120
	} else {
		Sleep 20
	}
}
return


; Up Down Left Right Arrow
Capslock & w::
if GetKeyState("Control") && if GetKeyState("Shift") {
	Send ^+{Up}		
} else if GetKeyState("Control") {
	Send ^{Up}
} else if GetKeyState("Shift") {
	Send +{Up}
} else if GetKeyState("Alt") {
	Send !{Up}
} else if GetKeyState("LWin", "P") | GetKeyState("RWin", "P") {
	Send #{Up}
} else {
	Send, {Up}	
}
return

Capslock & a::
if GetKeyState("Control") && if GetKeyState("Shift") {
	Send ^+{Left}	
} else if GetKeyState("Control") && GetKeyState("Alt", "P") {
	Send ^!{Left}
} else if GetKeyState("Control") {
	Send ^{Left}
} else if GetKeyState("Shift") {
	Send +{Left}
} else if GetKeyState("Alt", "P") {
	Send !{Left}
} else if GetKeyState("LWin", "P") | GetKeyState("RWin", "P") {
	Send #{Left}
} else {
	Send, {Left}	
}
return

Capslock & s::
if GetKeyState("Control") && if GetKeyState("Shift") {
	Send ^+{Down}		
} else if GetKeyState("Control") {
	Send ^{Down}
} else if GetKeyState("Shift") {
	Send +{Down}
} else if GetKeyState("Alt", "P") {
	Send !{Down}
} else if GetKeyState("LWin", "P") | GetKeyState("RWin", "P") {
	Send #{Down}
} else {
	Send, {Down}	
}
return

Capslock & d::
if GetKeyState("Control") && if GetKeyState("Shift") {
	Send ^+{Right}		
} else if GetKeyState("Control") && GetKeyState("Alt", "P") {
	Send ^!{Right}
} else if GetKeyState("Control") {
	Send ^{Right}
} else if GetKeyState("Shift") {
	Send +{Right}
} else if GetKeyState("Alt", "P") {
	Send !{Right}
} else if GetKeyState("LWin", "P") | GetKeyState("RWin", "P") {
	Send #{Right}
} else {
	Send, {Right}	
}
return

; Home End
Capslock & q::
if GetKeyState("Control") && if GetKeyState("Shift") {
	Send ^+{Home}		
} else if GetKeyState("Control") {
	Send ^{Home}
} else if GetKeyState("Shift") {
	Send +{Home}
} else {
	Send, {Home}	
}
return

Capslock & e::
if GetKeyState("Control") && if GetKeyState("Shift") {
	Send ^+{End}		
} else if GetKeyState("Control") {
	Send ^{End}
} else if GetKeyState("Shift") {
	Send +{End}
} else {
	Send, {End}	
}
return

;Del Ins
Capslock & Backspace::
if GetKeyState("Control") {
	Send ^{Delete}
} else if GetKeyState("Shift") {
	Send +{Delete}
} else if GetKeyState("Alt") {
	Send !{Delete}
} else {
	Send, {Delete}	
}
return

Capslock & x::
if GetKeyState("Control") {
	Send ^{Ins}
} else if GetKeyState("Shift") {
	Send +{Ins}
} else if GetKeyState("Alt") {
	Send !{Insert}
} else {
	Send {Ins}	
}
return

; PgUp PgDn
Capslock & r::
Send, {PgUp}
return

Capslock & v::
Send, {PgDn}
return

;Esc
Capslock & c::
Send {Esc}
return