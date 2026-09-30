#Requires AutoHotkey v2.0
#SingleInstance Force

K(command) {
    RunWait("komorebic.exe " command, , "Hide")
}

!o::Reload()
!+o::K("reload-configuration")

!q::K("close")
!m::K("minimize")

!Left::K("stack left")
!Down::K("stack down")
!Up::K("stack up")
!Right::K("stack right")

!vkBA::K("unstack")
!vkDB::K("cycle-stack previous")
!vkDD::K("cycle-stack next")

!vkBB::K("resize-axis horizontal increase")
!vkBD::K("resize-axis horizontal decrease")

!+vkBB::K("resize-axis vertical increase")
!+vkBD::K("resize-axis vertical decrease")

!t::K("toggle-float")
!+f::K("toggle-monocle")

!+r::K("retile")
!p::K("toggle-pause")

!x::K("flip-layout horizontal")
!y::K("flip-layout vertical")

#1::K("focus-workspace 0")
#2::K("focus-workspace 1")
#3::K("focus-workspace 2")
#4::K("focus-workspace 3")

#Left::K("focus left")
#Right::K("focus right")
#Up::K("focus up")
#Down::K("focus down")

#+Left::K("move left")
#+Right::K("move right")
#+Up::K("move up")
#+Down::K("move down")

#+1::K("move-to-workspace 0")
#+2::K("move-to-workspace 1")
#+3::K("move-to-workspace 2")
#+4::K("move-to-workspace 3")

#!1::K("send-to-workspace 0")
#!2::K("send-to-workspace 1")
#!3::K("send-to-workspace 2")
#!4::K("send-to-workspace 3")
