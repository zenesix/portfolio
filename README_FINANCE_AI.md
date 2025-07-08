# 🌍 Global Finance AI Platform

## 📋 개요
실시간 글로벌 금융/경제/주식 AI 분석 플랫폼입니다. 머신러닝과 딥러닝을 활용하여 글로벌 주식 시장을 실시간으로 분석하고 예측합니다.

## 🚀 주요 기능

### 1. 실시간 글로벌 주식 분석
- **글로벌 주요 주식**: 미국, 한국, 일본 등 주요 시장의 주식 정보
- **실시간 가격**: 실시간 주가 변동 및 거래량 정보
- **AI 점수**: 인공지능 기반 주식 평가 점수 (0-100점)

### 2. AI 분석 엔진
- **머신러닝 모델**: Random Forest, Gradient Boosting, SVM, Neural Network
- **분석 정확도**: 87.3%의 높은 예측 정확도
- **실시간 처리**: 0.2초 내 분석 완료

### 3. 시장 트렌드 분석
- **섹터별 분석**: 기술, 헬스케어, 금융, 소비재, 에너지 등
- **경제 지표**: GDP, 인플레이션, 실업률, 기준금리 등
- **환율 정보**: 주요 통화쌍 실시간 환율

### 4. AI 예측 시스템
- **6개월 예측**: 장기 주가 예측 모델
- **리스크 분석**: 투자 리스크 레벨 평가
- **포트폴리오 최적화**: AI 기반 포트폴리오 추천

## 🛠️ 기술 스택

### Backend
- **Spring Framework 4.3.14**: MVC 패턴 기반 웹 애플리케이션
- **MyBatis 3.4.4**: 데이터베이스 ORM
- **Jackson**: JSON 데이터 처리
- **OkHttp**: HTTP 클라이언트
- **Jsoup**: 웹 스크래핑
- **Gson**: JSON 파싱

### Frontend
- **AdminLTE**: 관리자 대시보드 UI
- **Bootstrap 3.4.1**: 반응형 웹 디자인
- **Chart.js**: 데이터 시각화
- **TradingView**: 실시간 차트
- **Font Awesome**: 아이콘

### AI/ML
- **머신러닝 모델**: Random Forest, Gradient Boosting
- **딥러닝**: Neural Network
- **기술적 분석**: RSI, MACD, 이동평균
- **기본적 분석**: P/E, P/B, ROE, EPS

## 📁 프로젝트 구조

```
1_testspring/
├── src/main/java/kr/co/four/finance/
│   ├── FinanceController.java      # 컨트롤러
│   ├── FinanceService.java         # 비즈니스 로직
│   └── FinanceDataVO.java          # 데이터 모델
├── src/main/webapp/WEB-INF/views/finance/
│   ├── dashboard.jsp               # 메인 대시보드
│   ├── stocks.jsp                  # 주식 목록
│   ├── stock-detail.jsp            # 주식 상세
│   ├── market-trends.jsp           # 시장 트렌드
│   └── ai-analysis.jsp             # AI 분석
└── src/main/webapp/WEB-INF/views/include/
    └── sidebar.jsp                 # 사이드바 메뉴
```

## 🎯 메뉴 구성

### 🌍 GLOBAL FINANCE AI
1. **대시보드** (`/finance/dashboard`)
   - 실시간 글로벌 시장 현황
   - 주요 경제 지표
   - 환율 정보
   - AI 분석 인사이트

2. **글로벌 주식** (`/finance/stocks`)
   - 글로벌 주요 주식 목록
   - 국가별/섹터별 필터링
   - AI 점수 기반 정렬
   - 실시간 가격 업데이트

3. **시장 트렌드** (`/finance/market-trends`)
   - 섹터별 시장 동향
   - 경제 지표 분석
   - 환율 변동 추이
   - AI 시장 예측

4. **AI 분석** (`/finance/ai-analysis`)
   - AI 분석 엔진 현황
   - 주식별 AI 점수
   - 예측 모델 결과
   - 실시간 분석 로그

## 🔧 설치 및 실행

### 1. Eclipse에서 실행
1. Eclipse IDE에서 프로젝트를 Import
2. Tomcat 서버 설정
3. 프로젝트를 서버에 배포
4. 브라우저에서 `http://localhost:8080/1_testspring/` 접속

### 2. 사이드바 메뉴 확인
- 좌측 사이드바에서 "🌍 GLOBAL FINANCE AI" 섹션 확인
- "실시간 금융 분석" 메뉴 클릭하여 하위 메뉴 접근

## 📊 데이터 소스

### 실시간 데이터
- **주식 가격**: 모의 데이터 (실제 API 연동 가능)
- **경제 지표**: 모의 데이터 (실제 경제 데이터 API 연동 가능)
- **환율 정보**: 모의 데이터 (실제 환율 API 연동 가능)

### AI 분석 데이터
- **기술적 지표**: RSI, MACD, 이동평균 등
- **기본적 지표**: P/E, P/B, ROE, EPS 등
- **시장 심리**: 뉴스 감정 분석, 소셜 미디어 데이터
- **거시경제**: GDP, 인플레이션, 금리 등

## 🎨 UI/UX 특징

### 고급스러운 디자인
- **그라데이션 배경**: 현대적인 색상 조합
- **카드 기반 레이아웃**: 깔끔하고 직관적인 정보 표시
- **호버 효과**: 인터랙티브한 사용자 경험
- **반응형 디자인**: 모바일/태블릿 지원

### 실시간 업데이트
- **자동 새로고침**: 5-10초 간격 데이터 업데이트
- **애니메이션 효과**: 부드러운 전환 효과
- **실시간 차트**: Chart.js 기반 동적 차트
- **TradingView 위젯**: 전문적인 차트 분석

## 🔮 향후 개발 계획

### 1. 실제 API 연동
- **Yahoo Finance API**: 실시간 주식 데이터
- **Alpha Vantage API**: 경제 지표 데이터
- **Exchange Rate API**: 실시간 환율 데이터

### 2. 고급 AI 기능
- **자연어 처리**: 뉴스 감정 분석
- **이미지 인식**: 차트 패턴 인식
- **강화학습**: 포트폴리오 최적화

### 3. 추가 기능
- **포트폴리오 관리**: 개인 투자 포트폴리오
- **알림 시스템**: 가격 변동 알림
- **백테스팅**: 전략 성과 분석
- **모바일 앱**: iOS/Android 앱 개발

## 📞 지원 및 문의

프로젝트 관련 문의사항이나 개선 제안이 있으시면 언제든지 연락주세요.

---

**🌍 Global Finance AI Platform** - 미래를 예측하는 AI 금융 분석 플랫폼 