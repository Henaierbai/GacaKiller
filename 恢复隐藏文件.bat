@echo off
title 伽卡他卡U盘缓存恢复工具
color 0a
set root=%~d0
echo 正在扫描伽卡他卡缓存目录...
:: 1. 尝试去掉隐藏、系统属性
attrib -h -s -r "%root%\$Gacaka$" /d /s >nul 2>nul
attrib -h -s -r "%root%\._cache_" /d /s >nul 2>nul
:: 2. 把缓存里的内容搬回根目录
for /f "delims=" %%i in ('dir /b /a:d "%root%\$Gacaka$" 2^>nul') do (
   move /y "%root%\$Gacaka$\%%i" "%root%\"
)
for /f "delims=" %%i in ('dir /b /a:d "%root%\._cache_" 2^>nul') do (
   move /y "%root%\._cache_\%%i" "%root%\"
)
:: 3. 删除空壳占位文件
del /q "%root%\._cache_*" 2>nul
:: 4. 删除已搬空的缓存目录
rd /s /q "%root%\$Gacaka$" 2>nul
rd /s /q "%root%\._cache_" 2>nul
echo.
echo 恢复完成！请重新打开U盘查看。
pause