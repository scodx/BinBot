/*
    Credit: https://github.com/airbnb/binaryalert/edit/master/rules/public/malware/multi/malware_multi_pupy_rat.yara
    Renamed for file naming simplicity
*/

rule pupy_rat
{
    meta:
        description = "pupy - opensource cross platform rat and post-exploitation tool"
        reference = "https://github.com/n1nj4sec/pupy"
        author = "@mimeframe"
    strings:
        $a1 = "dumping lsa secrets" nocase wide ascii
        $a2 = "dumping cached domain passwords" nocase wide ascii
        $a3 = "the keylogger is already started" nocase wide ascii
        $a4 = "pupyutils.dns" wide ascii
        $a5 = "pupwinutils.security" wide ascii
        $a6 = "-PUPY_CONFIG_COMES_HERE-" wide ascii
    condition:
        3 of ($a*)
}
