# 🚀 미국 급등주 추적 레이더 (US Surge Radar MVP)

미국 주식 시장(나스닥, S&P 500, NYSE)에서 실시간으로 상승 탄력이 붙은 **급등주**와 **거래량 폭증 종목**을 실시간으로 스캔하고 추적하는 모던 웹 대시보드 어플리케이션입니다.

---

## 🌟 주요 기능 (MVP 핵심 스펙)

1. **실시간 급등주 순위 (Day Gainers)**
   - 당일 기준 미국 시장 상위 급등 종목 실시간 조회
   - 현재가, 등락률(%), 거래량, 시가총액 표시
   - 폭등(+15% 이상) 및 급등(+7% 이상) 자동 배지 부여

2. **거래량 폭증주 추적 (Volume Surge & Most Active)**
   - 3개월 평균 거래량 대비 당일 거래량 배수(Volume Ratio) 자동 계산
   - 거래량이 평소 대비 1.5배~3.0배 이상 터진 종목 집중 하이라이트

3. **실시간 급등 감지 및 알림 (Surge Detection Engine)**
   - 상승률 5% 이상 + 거래량 폭증 감지 시 상단 실시간 배너 알림
   - **사운드 알림 (Web Audio)**: 급등주 포착 시 '띵동' 효과음 자동 재생 (ON/OFF 토글 가능)
   - 급등 감지 이력 로그(Alerts Log) 제공

4. **인터랙티브 캔들스틱 차트 (TradingView Lightweight Charts)**
   - 종목 클릭 시 TradingView 기반 캔들스틱 & 거래량 차트 모달 제공
   - 분봉/일봉 기간 변경 지원: `1일 (5분봉)`, `5일 (15분봉)`, `1개월 (일봉)`, `6개월 (일봉)`
   - 52주 최고/최저가 대비 현재가 위치 및 기업 개요 확인

5. **검색 & 정밀 필터링**
   - 티커 및 회사명 실시간 검색
   - 최소 상승률 필터 (+3%, +5%, +10%, +20%)
   - 최소 거래량 필터 (전체, 10만, 50만, 100만 주)
   - 정렬 옵션 (상승률순, 거래량 배수순, 거래량순, 주가순)

6. **관심종목 (Watchlist)**
   - 별표(★) 클릭으로 관심종목 등록/해제 (브라우저 로컬 저장소 유지)

7. **미국 3대 지수 및 시장 시계**
   - S&P500(SPY), 나스닥(QQQ), 다우존스(DIA) 실시간 시세
   - 한국 시각(KST) 및 뉴욕 현지 시각(EST) 표시

---

## 🌐 넷틀리파이(Netlify) 배포 방법

이 프로젝트는 넷틀리파이의 **정적 사이트 호스팅(Static Hosting)** 및 **서버리스 함수(Netlify Functions)** 아키텍처에 맞추어 완벽하게 구성되어 있습니다 (`netlify.toml` 및 `netlify/functions/api.js` 포함).

### 📌 방법 1: 깃허브(GitHub) 연동 배포 (가장 추천)
1. 깃허브(GitHub)에 새 리포지토리(Repository)를 생성합니다.
2. 현재 로컬 폴더에서 Git 커밋 후 푸시합니다:
   ```bash
   git init
   git add .
   git commit -m "feat: US Surge Radar MVP for Netlify"
   git branch -M main
   git remote add origin https://github.com/<사용자ID>/<리포지토리명>.git
   git push -u origin main
   ```
3. [Netlify 대시보드](https://app.netlify.com/)에 접속하여 로그인합니다.
4. **`Add new site`** > **`Import an existing project`** 클릭 후 GitHub를 선택합니다.
5. 방금 푸시한 저장소를 선택하면, `netlify.toml` 설정이 자동으로 감지됩니다:
   - **Publish directory**: `static`
   - **Functions directory**: `netlify/functions`
   - *(별도의 Build Command 입력 불필요)*
6. **`Deploy site`** 버튼을 누르면 10초 이내에 글로벌 라이브 URL이 생성되어 즉시 접속 가능합니다!

---

## 🚀 로컬 환경 실행 방법 (원클릭)


### 방법 1: `run.bat` 더블 클릭 (추천)
폴더 내의 **`run.bat`** 파일을 더블 클릭하면 자동으로 서버가 실행되고 브라우저(`http://127.0.0.1:8000`)가 열립니다.

### 방법 2: 터미널에서 직접 실행
```powershell
# 가상환경 활성화 후 실행
.\.venv\Scripts\python.exe -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```
실행 후 웹 브라우저에서 [http://127.0.0.1:8000](http://127.0.0.1:8000)으로 접속하시면 됩니다.

---

## 📁 프로젝트 폴더 구조

```text
├── app/
│   ├── __init__.py
│   ├── main.py            # FastAPI 웹 서버 및 REST API 라우터
│   └── services.py        # Yahoo Finance 데이터 수집 및 급등 감지 엔진
├── static/
│   ├── index.html         # 모던 다크 테마 대시보드 UI
│   ├── css/
│   │   └── style.css      # 스타일 및 애니메이션
│   └── js/
│       └── app.js         # 실시간 차트, 오디오 알림, 필터링 로직
├── run.bat                # 윈도우 원클릭 실행 배치 파일
├── requirements.txt       # 의존 패키지 목록
└── README.md              # 프로젝트 안내서
```
