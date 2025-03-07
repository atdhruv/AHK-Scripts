global toggle := false  ; Track mining state
global timerRunning := false  ; Track if timer is active

F6::  ; Press F6 to start/stop mining
{
    global toggle, timerRunning  ; Declare global variables inside function
    toggle := !toggle  ; Toggle mining state

    if (toggle) {
        Send("{LButton Down}")  ; Hold down left mouse button (start mining)
        if (!timerRunning) {
            timerRunning := true
            SetTimer(StopMining, -300000)  ; Run StopMining() once after 5 minutes
        }
    } else {
        StopMining()
    }
}

StopMining() {
    global toggle, timerRunning  ; Declare global variables inside function
    toggle := false
    timerRunning := false
    Send("{LButton Up}")  ; Release left mouse button (stop mining)
}
