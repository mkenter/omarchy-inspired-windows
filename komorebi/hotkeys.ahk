#Requires AutoHotkey v2.0
#SingleInstance Force

; Run a komorebi command without flashing a console window.
K(command) {
    RunWait("komorebic.exe " command, , "Hide")
}

; ---------------------------------------------------------------------------
; Configuration
; ---------------------------------------------------------------------------

; Reload this AHK file
!o::Reload()

; Reload komorebi.json
!+o::K("reload-configuration")

; ---------------------------------------------------------------------------
; Window actions
; ---------------------------------------------------------------------------

!q::K("close")
!m::K("minimize")

; ---------------------------------------------------------------------------
; Stack windows
; ---------------------------------------------------------------------------

!Left::K("stack left")
!Down::K("stack down")
!Up::K("stack up")
!Right::K("stack right")

; ; [ ]
!vkBA::K("unstack")
!vkDB::K("cycle-stack previous")
!vkDD::K("cycle-stack next")

; ---------------------------------------------------------------------------
; Resize
; ---------------------------------------------------------------------------

; = / - keys
!vkBB::K("resize-axis horizontal increase")
!vkBD::K("resize-axis horizontal decrease")

; Shift + = / -
!+vkBB::K("resize-axis vertical increase")
!+vkBD::K("resize-axis vertical decrease")

; ---------------------------------------------------------------------------
; Manipulate windows
; ---------------------------------------------------------------------------

!t::K("toggle-float")
!+f::K("toggle-monocle")

; ---------------------------------------------------------------------------
; Window manager
; ---------------------------------------------------------------------------

!+r::K("retile")
!p::K("toggle-pause")

; ---------------------------------------------------------------------------
; Layouts
; ---------------------------------------------------------------------------

!x::K("flip-layout horizontal")
!y::K("flip-layout vertical")

; ---------------------------------------------------------------------------
; Workspaces
; Win + number = focus workspace
; ---------------------------------------------------------------------------

#1::K("focus-workspace 0")
#2::K("focus-workspace 1")
#3::K("focus-workspace 2")
#4::K("focus-workspace 3")

; ---------------------------------------------------------------------------
; Omarchy-style focus
; Win + arrow
; ---------------------------------------------------------------------------

#Left::K("focus left")
#Right::K("focus right")
#Up::K("focus up")
#Down::K("focus down")

; ---------------------------------------------------------------------------
; Omarchy-style movement within current layout
; Win + Shift + arrow
; ---------------------------------------------------------------------------

#+Left::K("move left")
#+Right::K("move right")
#+Up::K("move up")
#+Down::K("move down")

; ---------------------------------------------------------------------------
; Move to workspace AND follow
; Win + Shift + number
; ---------------------------------------------------------------------------

#+1::K("move-to-workspace 0")
#+2::K("move-to-workspace 1")
#+3::K("move-to-workspace 2")
#+4::K("move-to-workspace 3")

; ---------------------------------------------------------------------------
; Send to workspace WITHOUT following
; Win + Alt + number
; ---------------------------------------------------------------------------

#!1::K("send-to-workspace 0")
#!2::K("send-to-workspace 1")
#!3::K("send-to-workspace 2")
#!4::K("send-to-workspace 3")
