# Chức năng 1: Khởi tạo “căn cứ số” (Terminal):
- Dòng lệnh là: `New-Item -ItemType Directory "smartfarm-system"; cd smartfarm-system; New-Item -ItemType Directory "docs", "scripts", "data", "backup"`
- Đứng trong thư mục data/, dùng **đường dẫn tương đối** (..) để tạo file cấu hình .env ở thư mục gốc với nội dung giả định DB_PASSWORD=demo_123456 và đặt thuộc tính Hidden cho file .env:  `cd ..; (New-Item -ItemType file .env).Attributes = "hidden"; Set-Content -Path "..\.env -Value "DB_PASSWORD=demo_123456"`
# Chức năng 2: Robot lọc log tự động (auto_report.ps1):
File script:
```powershell
# Lọc Các dòng Critical và Error trong file log
Write-Output "=================================" >> ..\backup\bao-cao-su-co.txt
Write-Output "BAO CAO SU CO - SMARTFARM" >> ..\backup\bao-cao-su-co.txt
Write-Output "Ngay gio: $(Get-Date -Format "dd/MM/yyyy HH:mm:ss")" >> ..\backup\bao-cao-su-co.txt
Write-Output "=================================" >> ..\backup\bao-cao-su-co.txt
Get-Content ..\data\log-he-thong.log | Select-String -Pattern "Critical", "Error" >> ..\backup\bao-cao-su-co.txt
Write-Output "-----------------------------------">> ..\backup\bao-cao-su-co.txt
Write-Output "TONG SO SU CO:">> ..\backup\bao-cao-su-co.txt
(Get-Content ..\data\log-he-thong.log | Select-String -Pattern "Critical", "Error"|Select-object linenumber, line).Count>> ..\backup\bao-cao-su-co.txt
# AUDIT
```
# Chức năng 3: Đối soát tài nguyên (Excel):
Câu trả lời nằm trong file: [quan-ly-thiet-bi.xlsx](.\smartfarm-system\data\quan-ly-thiet-bi.xlsx)

# Chức năng 4: Tài liệu [README.md](http://README.md) (đặt trong docs/):
Câu trả lời nằm trong file: [README.md (của bài)](.\smartfarm-system\docs\README.md)
