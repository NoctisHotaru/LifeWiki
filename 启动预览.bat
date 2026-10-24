@echo off
chcp 65001 >nul
title Life Wiki 本地预览 - 关闭本窗口即停止
cd /d "%~dp0"

echo.
echo   正在启动 Life Wiki 本地预览，请等几秒...
echo   浏览器会自动打开；如果没有，请手动访问 http://127.0.0.1:8000
echo.
echo   【注意】这个窗口不要关，关掉就等于把网站关了。
echo.

start "" powershell -NoProfile -WindowStyle Hidden -Command "Start-Sleep -Seconds 7; Start-Process 'http://127.0.0.1:8000'"

".venv\Scripts\python.exe" -m mkdocs serve -a 0.0.0.0:8000

echo.
echo   预览已停止。按任意键关闭窗口。
pause >nul
