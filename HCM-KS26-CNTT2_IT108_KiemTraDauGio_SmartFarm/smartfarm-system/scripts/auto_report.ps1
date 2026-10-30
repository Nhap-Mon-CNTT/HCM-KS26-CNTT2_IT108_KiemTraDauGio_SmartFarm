# Lọc Các dòng Critical và Error trong file log
Write-Output "=================================" >> ..\backup\bao-cao-su-co.txt
Write-Output "BAO CAO SU CO - SMARTFARM" >> ..\backup\bao-cao-su-co.txt
Write-Output "Ngay gio: $(Get-Date -Format "dd/MM/yyyy HH:mm:ss")" >> ..\backup\bao-cao-su-co.txt
Write-Output "=================================" >> ..\backup\bao-cao-su-co.txt
Get-Content ..\data\log-he-thong.log | Select-String -Pattern "Critical", "Error" >> ..\backup\bao-cao-su-co.txt
Write-Output "-----------------------------------">> ..\backup\bao-cao-su-co.txt
Write-Output "TONG SO SU CO:">> ..\backup\bao-cao-su-co.txt
(Get-Content ..\data\log-he-thong.log | Select-String -Pattern "Critical", "Error"|Select-object linenumber, line).Count>> ..\backup\bao-cao-su-co.txt