@echo off
chcp 65001 >nul
title Life Wiki 一键发布
cd /d "%~dp0"

echo.
echo   ===== Life Wiki 一键发布 =====
echo.

rem ---------- 第 1 步：检查代理端口 ----------
netstat -ano | findstr ":10808" | findstr "LISTENING" >nul
if errorlevel 1 (
    echo   [失败] 没有检测到代理端口 10808。
    echo          请先打开 v2rayN，选好节点并开启，再双击本文件。
    echo.
    pause
    exit /b 1
)
echo   [1/3] 代理正常

rem ---------- 第 2 步：提交改动 ----------
git add -A
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "发布更新" >nul
    echo   [2/3] 已提交本地改动
) else (
    echo   [2/3] 没有新改动，跳过提交
)

rem ---------- 第 3 步：推送到 GitHub ----------
echo   [3/3] 正在推送到 GitHub，请稍候...
git push origin main
if errorlevel 1 (
    echo.
    echo   [失败] 推送没有成功。
    echo          常见原因：代理节点不可用、网络中断、或 GitHub 暂时连不上。
    echo          换一个节点后再试一次即可，内容不会丢失。
) else (
    echo.
    echo   [成功] 已推送。约 1~2 分钟后网站自动更新：
    echo          https://noctishotaru.github.io/LifeWiki/
)

echo.
pause
