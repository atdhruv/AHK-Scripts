global toggle := false  ; Global variable to track AFK mode

F8:: {
    global toggle  ; Ensure toggle is global
    toggle := !toggle  ; Toggle ON/OFF

    ToolTip(toggle ? "Anti-AFK: ON" : "Anti-AFK: OFF")
    SetTimer(RemoveToolTip, 2000)

    if toggle {
        SetTimer(AntiAFK, 100)  ; Start the Anti-AFK function
    } else {
        SetTimer(AntiAFK, 0)  ; Stop the Anti-AFK function
    }
}

RemoveToolTip() {
    ToolTip()  ; Clears the tooltip
}

AntiAFK() {
    global toggle  ; Ensure toggle is global
    if !toggle  ; Exit if toggled off
        return

    delay := Random(15000, 30000)  ; Wait 15-30 sec between actions
    Sleep(delay)

    if !toggle  ; Check again in case the user disabled it
        return  

    move := Random(1, 5)
    switch move {
        case 1:
            Send("{w down}"), Sleep(500), Send("{w up}")
        case 2:
            Send("{a down}"), Sleep(500), Send("{a up}")
        case 3:
            Send("{s down}"), Sleep(500), Send("{s up}")
        case 4:
            Send("{d down}"), Sleep(500), Send("{d up}")
        case 5:
            Send("{Space}")  ; Jump
    }

    if Random(1, 4) = 1  ; 25% chance of sneaking
        Send("{LShift down}"), Sleep(1000), Send("{LShift up}")

    lookX := Random(-500, 500)
    lookY := Random(-500, 500)
    MouseMove(lookX, lookY, 2, "R")  ; Slight camera movement
}
