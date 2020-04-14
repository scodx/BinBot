/*
    Credit: https://github.com/airbnb/binaryalert/edit/master/rules/public/malware/windows/malware_windows_xrat_quasarrat.yara
    Renamed for file naming simplicity
*/
rule windows_quasar
{
    meta:
        description = "xRAT is a derivative of QuasarRAT; this catches both RATs."
        reference = "https://github.com/quasar/QuasarRAT"
        author = "@mimeframe"
    strings:
        // RemoteShell
        $a1 = ">> New Session created" wide ascii
        $a2 = ">> Session unexpectedly closed" wide ascii
        $a3 = ">> Session closed" wide ascii
        $a4 = "session unexpectedly closed" wide ascii
        $a5 = "cmd" fullword wide ascii
        $a6 = "/K" fullword wide ascii
        // Commands
        $b1 = "echo DONT CLOSE THIS WINDOW!" wide ascii
        $b2 = "ping -n 20 localhost > nul" wide ascii
        $b3 = "Downloading file..." wide ascii
        $b4 = "Visited Website" wide ascii
        $b5 = "Adding Autostart Item failed!" wide ascii
        $b6 = ":Zone.Identifier" wide ascii
        // System Handler
        $c1 = "GetDrives I/O error" wide ascii
        $c2 = "/r /t 0" wide ascii
        $c3 = "desktop.ini" wide ascii
        $c4 = "WAN IP Address" wide ascii
        $c5 = "User refused the elevation request." wide ascii
        $c6 = "Process already elevated." wide ascii
    condition:
        5 of ($a*) or 5 of ($b*) or 5 of ($c*)
}
