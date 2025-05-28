#Requires AutoHotkey v2.0
#SingleInstance Force

myGui := Gui(, "AutoClicker V1.0")
editBox := myGui.Add("Edit", "w200 Number vInputBox", "Enter Delay (1000 = 1s):")
myGui.Add("Button", "w200 h50", "Finish").OnEvent("Click", EnterPressed)

myGui.Show("w220 h100")

EnterPressed(*) {
    Msgbox "Ready to roll. Press F1 to Stop F2 to Start. Set Delay: " editBox.Value / 1000 " seconds."
    myGui.hide()
    }

    F2::
    {
     loop
        {
        Sleep(editBox.Value)
        MouseClick "left"
        }
    }

F1::
{
    Msgbox "Autoclicker Stopped, Closing on Exit."
    ExitApp()
}