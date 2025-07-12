# Academic-Management-Program
JAVA + JSP 기반 학원 관리 프로그램 <br>

### :computer: 프로젝트 소개
쌍용교육센터 학원을 모티브로 하여 학원 내부 이용자들에게 학원 관리 서비스를 제공하는 관리 프로그램입니다.


:calendar:  **작업 기간** <br>
- 2025년 3월 26일 → 2025년 4월 20일

:page_with_curl: **개발 환경** <br>
- Java 11
- jdk 11.0.26
- IDE: Eclipse
- Database: Oracle DB
- WAS: Apache Tomcat

:busts_in_silhouette:  **팀원 기능별 역할** <br>
- 전체: 프로젝트 기획 및 설계
- 이종원: 회원가입 및 로그인 / 관리자 (반관리 / 매니저 관리)
- 김도영: 매니저 (강좌 관리 / 학생 및 강사 정보 조회 / 강사 근태 관리 / 학생 출결 관리 / 게시판)
- 오진우: 학생 (내 정보 관리 / 출결 / 강좌 신청 / 시험 조회 및 제출 / 질병, 조퇴 신청 / 강사 평가)
- 채수림: 강사 (내 정보 관리 / 출결 / 학생 정보 조회 / 강좌 평가 조회 / 시험 등록)

:file_folder: **폴더 및 파일 구조** <br>
```
semi2_AcademicManage/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/semi2/
│   │   │       ├── board/
│   │   │       │   ├── ABoardDAO.java
│   │   │       │   ├── BoardDTO.java
│   │   │       │   ├── MBoardDAO.java
│   │   │       │   └── TBoardDAO.java
│   │   │       ├── db/
│   │   │       ├── group/
│   │   │       ├── lecture/
│   │   │       ├── member/
│   │   │       ├── record/
│   │   │       └── test/
│   │   └── webapp/
│   │       ├── css/
│   │       ├── fonts/
│   │       ├── header/
│   │       ├── img/
│   │       ├── manager/
│   │       ├── META-INF/
│   │       ├── recordingm/
│   │       ├── server/
│   │       ├── sql/
│   │       ├── student/
│   │       ├── teacher/
│   │       ├── WEB-INF/
│   │       └── mainFrame.jsp
├── build/
├── Web App Libraries/
├── JRE System Library [JavaSE-11]
└── Server Runtime [Apache Tomcat v9.0]

```
- com.semi2.: DAO 및 DTO를 기능 관련 패키지별로 분리
- webapp/student, teacher, manager: 사용자 권한별 JSP 분리
- mainFrame.jsp: 프로젝트의 메인 프레임으로, 각 기능 JSP를 포함하는 틀 역할
- Tomcat v9.0 기반으로 로컬 서버 환경 구성
- JavaSE-11을 기반으로 개발


## :pushpin: 주요 기능 소개 (매니저)



## :dizzy: 세미프로젝트 회고

