# 1. HEADER BLOCK - Thông tin script
# Tên script: auto_report.ps1
# Tác giả: [Tên của bạn]
# Ngày tạo: 13/10/2026
# Mục đích: Tự động lọc lỗi 404 từ hệ thống và xuất báo cáo

# 2. BIẾN CẤU HÌNH - Khai báo đường dẫn
$log_file = "server.log"
$report_file = "report.txt"

# 3. THÔNG BÁO TIẾN TRÌNH & 4. LOGIC XỬ LÝ

# Bắt đầu chạy script
Write-Host "Dang khoi tao quy trinh xu ly log..." -ForegroundColor Cyan

# Tạo header cho file báo cáo (Dùng > để tạo mới hoặc ghi đè file cũ của ngày hôm trước)
Write-Host "Ghi tieu de bao cao..."
Write-Output "=== HE THONG TU DONG LOC LOG ===" > $report_file

# Đọc file log, lọc lỗi 404 và ghi nối tiếp vào báo cáo (Dùng >>)
Write-Host "Dang tien hanh loc loi 404 tu file log..." -ForegroundColor Yellow
Get-Content $log_file | Select-String "404" >> $report_file

# Thông báo hoàn thành
Write-Host "Hoan thanh! Da xu ly xong log." -ForegroundColor Green
Write-Host "Ket qua duoc luu tai tệp: $report_file"