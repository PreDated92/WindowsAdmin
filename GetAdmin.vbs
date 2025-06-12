'This is the vbscript snippet created by the batch file
'Could use this directly if you don't need the admin check
Set UAC = CreateObject("Shell.Application")
UAC.ShellExecute "cmd.exe", "/k Insert Batch Here", "", "runas", 1
