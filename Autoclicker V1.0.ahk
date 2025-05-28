#Requires AutoHotkey v2.0
#SingleInstance Force

myGui := Gui(, "AutoClicker V1.0")
editBox := myGui.Add("Edit", "w200 Number vInputBox", "Enter Delay (1000 = 1s):")
myGui.Add("Button", "w200 h50", "Finish").OnEvent("Click", EnterPressed)

myGui.Show("w220 h100")

EnterPressed(*) {
    if editBox.Value = 0
        {
        Msgbox "IMPORTANT: 0 Delay may Cause system instability. USE AT YOUR OWN RISK."
        }
    Msgbox "Ready to roll. Press F1 to Start and F2 to Stop. Set Delay: " editBox.Value / 1000 " seconds."
    myGui.hide()
    }

    F1::
    {
     loop
        {
        Sleep(editBox.Value)
        MouseClick "left"
        }
    }

F2::
{
    Msgbox "Autoclicker Stopped, Closing on Exit."
    ExitApp()
}
