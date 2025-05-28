;props to the EasyAutoGUI-AHKv2 project for the GUI framework
;AutoGUI creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;EasyAutoGUI-AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

#Requires Autohotkey v2
#SingleInstance Force

MsgBox "Quick Disclaimer: For the Keybinds to work it will first be set to deafult UNTIL you press the start button THEN it will set to your keybinds."

	myGui := Gui()
	myGui.Show("w400 h230")
    myGui.Title := "Autoclicker V1.1"
	

	myGui.SetFont("s9", "Segoe UI")
	myGui.Add("GroupBox", "x16 y40 w164 h147", "Hotkeys")
	myGui.SetFont("s15 Bold", "Microsoft Sans Serif")
	myGui.Add("Text", "x16 y10 w177 h23 +0x200", "Autoclicker V1.1")
	myGui.SetFont("s9 Norm q5", "Segoe UI")
	myGui.Add("GroupBox", "x200 y40 w164 h55", "Delay (1000 = 1 s)")
	myGui.SetFont("s8 Norm", "Segoe UI")
	myGui.Add("Text", "x16 y208 w374 h2 +0x10")
	myGui.Add("Text", "x24 y120 w146 h2 +0x10")
    myGui.Add("Text", "x64 y64 w68 h23 +0x200", "Start Hotkey")
	myGui.Add("Text", "x64 y136 w66 h23 +0x200", "Stop Hotkey")

    delayset := myGui.Add("Edit", "x216 y64 w135 h21 Number", "1000")
    delay0 := myGui.Add("CheckBox", "x208 y176 w166 h23", "Enable 0 Delay (UNSTABLE)")
    
    starthotkey :=myGui.Add("Hotkey", "x40 y88 w120 h21", "F1")
	stophotkey := myGui.Add("Hotkey", "x40 y160 w120 h21", "F2")

    start := myGui.Add("Button", "x200 y112 w169 h23", "&Start (" starthotkey.Value ")")
    stop := myGui.Add("Button", "x200 y144 w168 h23", "&Stop (" stophotkey.Value ")")

    start.OnEvent("Click", OnStartHandler)
    stop.OnEvent("Click", OnStopHandler)

 Enter::
    {
    start := myGui.Add("Button", "x200 y112 w169 h23", "&Start (" starthotkey.Value ")")
    stop := myGui.Add("Button", "x200 y144 w168 h23", "&Stop (" stophotkey.Value ")")
    }    

    OnStartHandler(*) 
    {
    Hotkey(starthotkey.Value, (*) => Autoclicker(), "On")
    Hotkey(stophotkey.Value, (*) => Run(A_ScriptFullPath), "On")
    Autoclicker()
    }

    OnStopHandler(*) 
    {
    Hotkey(starthotkey.Value, (*) => Autoclicker(), "On")
    Hotkey(stophotkey.Value, (*) => Run(A_ScriptFullPath), "On")
    Run(A_ScriptFullPath)
    }


Autoclicker() {
    if (delay0.Value = false) {
        if (delayset.Value = 0) {
            MsgBox "You Have Set the Delay to 0, you have disabled this feature, please enable it if you want to use it"
            Run(A_ScriptFullPath)
        }
    } else if (delay0.Value = true) {
        loop {
            Sleep(delayset.Value)
            MouseClick "Left"
        }
    }
}
