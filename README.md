# ai_project_smartfarm
## 주제
- 스마트팜 관련 프론트엔드 구현

## 진행사항
### 2023-05-10(수)
- API 연동 및 UI 적용
1. controller status 확인 하는 기능 추가
2. 그래프 내부 습도와 토양 습도가 나오게 변경

- 기타
1. 앱 빌드시 버전 반영

### 2023-05-09(화)
- API 연동
1. public api 최종 적용

### 2023-05-04(목)
- API 연동
1. public api 주소 적용 (internal, etc 적용해야함)
2. 기타 제어 api 적용

### 2023-05-03(수)
- apk build 테스트
1. 앱 아이콘 적용

- API 연동
1. cctv 화면을 플러터에서 바로 보는게 아니라 webview 방식으로 진행

- UI 진행
1. 농장 선택화면에서 리스트 선택시 메시지 출력(실제 데이터 전환은 안됨)

### 2023-05-02(화)
- API 연동
1. 농장 나누기 (진행중)
2. external, internal 연동 완료
3. graph 연동 완료

- UI 진행
1. 경보 설정값 저장(shared_preferences)
2. 고온 및 저온 경보 울리게 설정

### 2023-04-28(금)
- UI 화면 추가
1. CCTV 화면 내 영상 재생

- API 연동
1. 로그인(post)
2. 비밀번호 변경(post)

### 2023-04-27(목)
- UI 구조 변경
1. 비밀번호 변경을 로그인 > 설정 이후로
2. 내부환경 internal 모델로 적용
3. 환경 및 토양제어 대시보드 더미데이터 적용

- UI 화면 변경
1. (공통) 토양 온도 -> CO2
2. 토양 제어 > 하단에 이미지 추가
3. 환경 설정 > 로그아웃 추가

- 모델 및 API 불러오기 (json 형식)
1. internals (soil_temperature -> soil_co2)

### 2023-04-26(수)
- UI 구현
1. controller_screen (환경 제어)
* etc_controller_screen (기타 제어)
2. soil_screen (토양 제어)
* soil_dashboard_screen (토양 제어 대시보드)
3. cctv_screen (CCTV)
* cctv1_screen (CCTV #1)
4. settings_screen (설정)
* warning_setting_screen (경보 설정)

- 모델 및 API 불러오기 (json 형식)
1. users
2. externals
3. colors


### 2023-04-24(월)
- UI 구현
1. change_password_screen (비밀번호 변경)
2. sensor_screen (센서)
* external_sensor_screen (외부 환경)
* internal_sensor_screen (내부 환경)
3. controller_screen (환경 제어)
* controller_dashboard_screen (환경 제어 대시보드)

### 2023-04-21(금)
- 기본 color palettes
- 0XFFBBD6B8
- 0XFFAEC2B6
- 0XFF94AF9F
- 0XFFDBE4C6

- 플러터 프로젝트 생성
```bash
flutter create smartfarm
```

- UI 구현
1. menu_drawer (농장선택)
2. menu_bottom (하단 메뉴)
3. login_screen (로그인 화면)
4. home_screen (로그인 후 최초 화면)