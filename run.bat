@echo off
chcp 65001 > nul
title 미국 급등주 추적 레이더 (US Surge Radar)

echo ========================================================
echo   🚀 미국 급등주 추적 레이더 (US Surge Radar MVP)
echo ========================================================
echo.
echo [1/2] 서버 시작 준비 중...

if not exist ".venv\Scripts\python.exe" (
    echo [경고] .venv 가상환경을 찾을 수 없습니다.
    pause
    exit /b
)

echo [2/2] 브라우저 자동 실행 및 로컬 웹 서버 구동 중...
echo       접속 주소: http://127.0.0.1:8000
echo.
echo * 창을 닫으면 프로그램이 종료됩니다.
echo.

start http://127.0.0.1:8000
.\.venv\Scripts\python.exe -m uvicorn app.main:app --host 127.0.0.1 --port 8000

pause
