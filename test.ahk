ScriptVersionForUpd := "0"

    InternetStatus := DllCall("Wininet\InternetCheckConnection", Str, "https://www.google.com/", UInt, FLAG_ICC_FORCE_CONNECTION := 1, UInt, 0)
    if (InternetStatus = 1) {
        Http := ComObjCreate("WinHttp.WinHttpRequest.5.1"), Http.Option(6) := 0
        Http.Open("GET", "https://raw.githubusercontent.com/MECHA9IC/QUICK-EDITOR-for-AIMP/main/VERSION")
        Http.Send(), Text := Http.ResponseText
        RegExMatch(Text, "(\d*)\|(\d*?.\d*?.\d*?)\s", ServerVersion)
    }
	msgbox, \%ServerVersion1% %ServerVersion2%/
    if (ScriptVersionForUpd < ServerVersion1) {
        URLDownloadToFile, https://github.com/Mechanic612/Update/raw/master/Updater.exe?raw=true, %A_ScriptDir%\Updater.exe
        FormatTime, Date,, dd/MM/yy
        ExitApp
    }




SetWorkingDir %A_ScriptDir% 
msgbox, %A_ScriptDir%\%A_ScriptName%
FileDelete, %A_ScriptDir%\%A_ScriptName%
msgbox, +
ExitApp
return