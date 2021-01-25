# ERP
ERP란? Enterprise Resource Planning( 전사적 자원관리)의 약어입니다.
본 프로젝트에서는 회사의 구매, 영업, 회계, 생산, 인적 자원활동 등 비즈니스 프로세스를 통합 관리하는 소프트웨어를 개발하였습니다.



## 🙌목차 
1. 개발환경
2. 구현 기능 및 담당역할
3. ERP 기능


### 1. 👉개발 환경
- Java 1.8
- Spring Faramework 4.3.27
- Spring security 4.2.15
- ORACLE DB 11g
- Tomcat 8.5


### 2. 🙋‍♀️구현 기능 및 담당역할
- EXERD를 활용하여 **DB를 설계**하고, 논리,물리ERD를 구현하여 구축
- 단어사전, 용어사전을 정의하여 DB에 저장될 데이터의 이름들을 미리 동일시하기
- 데이터들 사이의 관계를 정의하여 참조 관계 정의
- ORACLE에서 참조관계를 고려하여 DB를 **구축**하고, 더미 데이터를 넣어 프로젝트를 수행 할 수 있는 기본 환경을 구축
- 공통 기능 구현 시, 다른 팀원들도 함께 사용할 수 있도록 **모듈화** 작업

- 구매부서
    - 자재를 구매하기 위한 **구매요청관리**
    - 거래처에게 발주서를 보내는 **발주관리**
    - 발주한 물품을 매입하는 **매입관리**
    - 매입한 물품 중 반품하기 **위한 반품관리**
    - 등록된 원자재 단가 수정을 **위한 단가관리**

- 기타부서
    - 주요 거래처를 관리하는 **거래처관리**
    - **매출 반품 관리**
    - **dataTable api**를 활용한 출하서 조회
    - 퇴직금 및 급여 내역 및 **계산**하는 쿼리문 작성
    - QR 코드를 이용한 **근태 등록** 기능

### 3. ERP 기능
🔷 **구매요청서**
<img width="410" alt="구매요청서" src="https://user-images.githubusercontent.com/49690185/105695833-e12ae900-5f45-11eb-91c6-42384e8f0b44.png">
- _원자재 추가_ 를 클릭할 시, 등록된 원자재를 보여줍니다.
- 구매할 원자재를 선택하여 구매 요청을 합니다.
- 잘못 선택한 원자재 목록을 '_선택삭제_'를 통해 삭제할 수 있습니다.

🔷 **구매요청 현황**
<img width="410" alt="구매요청현황" src="https://user-images.githubusercontent.com/49690185/105696194-54ccf600-5f46-11eb-8a5f-36465c311815.png">
- _전체, 진행중, 발주완료 탭_ 으로 구분하여 리스트를 출력합니다.
- 작성일자, 작성자명 별로 _검색_ 이 가능합니다.
- 작성자명에서 '_찾기_'를 클릭할 시, 사원 리스트가 출력됩니다.

🔷 **발주신청서**
<img width="410" alt="발주신청서" src="https://user-images.githubusercontent.com/49690185/105698643-7e3b5100-5f49-11eb-8747-2e2896b6f368.png">
- '일반 발주 추가' : 저장된 원자재 **이외의 물품** 을 발주시에 사용하며, '일반 발주 추가'를 클릭 시, 발주 목록에 빈칸으로 목록이 추가됩니다.
- '삭제'버튼 : 구매요청이 들어온 요청목록을 삭제 할 수 있습니다.
- '발주이동'버튼 : _구매요청 리스트_ 를 나타내는 테이블의 목록을 체크한 뒤, '발주이동'클릭 시 발주목록으로 추가합니다.

🔷 **발주현황**
<img width="410" alt="발주현황" src="https://user-images.githubusercontent.com/49690185/105699518-d32b9700-5f4a-11eb-983b-fe86fac6d6c7.png">
- _전체, 진행중, 매입완료, 발주취소_ 탭으로 리스트를 보여주며, '진행중'탭에서는 발주취소와 매입등록을 할 수 있습니다.



