@echo off
setlocal
python "%~dp0download-gsap.py"
exit /b %ERRORLEVEL%
