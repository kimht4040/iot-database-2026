# iot-database-2026
2026년 IoT 개발자 데이터베이스 리포지토리




## 1일차

### 데이터/정보/지식

- '데이터' : 단순한 수치가 값
- '정보' : 데이터에 의미를 부여한 것
- '지식' : 정보를 통한 사물이나 현상에 대한 이해



 ### 데이터베이스

- 조직에 필요한 정보를 위해서 논리적으로 연관된 데이터를 구조적으로 통합, 저장해 놓은 것 
- **도메인** - 자기 업무에 관련된 지식
- 기업/기관은 자기 도메인 정보만 저장
- 보통 CS(client - server) 프로그램이라고 명칭, DB쪽이 서버, 프로그램쪽이 클라이언트



#### 데이터베이스 개념, 특징

- 통합 데이터 - 데이터 중복 최소화 , 중복으로 인한 테이터 **불일치 현상 제거**
- 저장 데이터 - 문서가 아닌 컴퓨터 저장장치에 저장, 반영구적 저장
- 운영 데이터 - 저장된 상태에서 **업무를 위해 사용**, 검색, 수정 등
- 공용 데이터 - 여러 사람이 업무를 위해서 **공동으로 사용**


#### 특징

- 실시간 접근성 - 수 초내 결과가 리턴
- 계속적 변화 - 추가, 수정, 조회, 삭제가 가능
- 동시 공유 - 여러 사용자가 동시에 공유, 같은 데이터를 사용하더라도 최대한 문제가 없게 처리
- 내용에 따른 참조 - 물리적인 저장 데이터가 아닌 데이터 값을 참조


#### DBMS

- 데이터베이스를 관리하는 시스템 DataBase Management System의 약자
- DBMS를 DB로 보통 통칭함


#### DBMS 장점 
- 데이터 중복최소화, 데이터 일관성, 데이터 독립성, 관리기능(백업, 복구, **동시성제어**, 보안), 개발 생산성, 데이터 무결성 유지ㅏ, 데이터 표준 준수....


### 데이터베이스 설치(윈도우 기준)


#### 로컬에 설치
1. https://www.mysql.com/ 사이트
2. My SQL Community Edition 아래 링크 클릭
3. My SQL Installer for Windows 링크 클릭
4. MySQL Installer 8.0.45, Windows(x86, 32-bit) 다운로드
5. 다운받은 프로그램 실행
![alt text](KakaoTalk_Photo_2026-03-13-11-07-12.png)
![alt text](KakaoTalk_Photo_2026-03-13-11-07-17.png)
![alt text](KakaoTalk_Photo_2026-03-13-11-07-20.png)

#### 도커에 설치

- Docker - 애플리케이션 신속구축, 테스팅, 서비스할 수 있는 컨테이너 기반의 오픈소스 가상화 플랫폼
  - 온라인 상에서 이미지를 다운로드(pull)
  - 실행하는 컨테이너로 만듬(run)

1. 도커 설치
   1. 도커 데스크탑 다운로드
   2. 다운로드한 설치 파일 실행
   3. wsl 업데이트 및 설치 후 재실행
2. 도커 콘솔 명령어
   ```
   - docker 
   - docker --version
   - docker search 이미지명
   - docker pull 이미지명
   - docker run ...
   - docker ps : 실행 중인 컨테이너 확인
   - docker exec - 도커 컨테이너 내부 접속
   ```

3. MySQL 설치
    - 파워쉘 켜기
    - docker search 는 도커 허브를 검색
    - docker search mysql
    - docker pull 이미지 다운
    - docker pull mysql:8.0.45
    - 명령어 입력(기존에 mysql 설치되어 있어서 포트3307로 변경함)
    -  docker run -d --name mysql80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my123456 -e MYSQL_DATABASE=mydb -e MYSQL_USER=myuser -e MYSQL_PASSWORD=my123456 -v mysql80_data:/var/lib/mysql --restart unless-stopped mysql:8.0.45
    -  윈도우에서 설치할때 \로 줄넘김이 불가능함
    -  옵션 설명
       -  --name mysql80 : 컨테이너 이름
       -  -p 3307:3306 -> 앞에3307은 도커랑 로컬이랑 연결한 포트 뒤에 3306은 도커 컨테이너 내부에서 쓰는 포트
       -  MYSQL_ROOT_PASSWORD : 관리자 root 계정 비밀번호 초기화
       -  MYSQL_DATABASE : 컨테이너 실행시 자동 생성되는 db
       -  MYSQL_USER=myuser -e MYSQL_PASSWORD=my123456 : 일반 사용자 계정 설정
       -  mysql80_data:/var/lib/mysql: 컨테이너에서 mysql 데이터 저장 위치
       -  --restart unless-stopped: 도커 재시작 할경우 자동으로 복구


- 현재 생성 db
  - id : root, madang, myuser
  - password : my123456

1. MySQL Workbench 설치
    - Database 개발툴
    - 로컬에서 다운로드한 mysql 설치 프로그램 실행
2. vscode DB 확장 설치
    - 확장 > database 검색
    - database client 설치
    - ![alt text](image-1.png)
3. datagrip 설치(따로 설치함)
    - datagrip 검색
    - 홈페이지에서 설치
    - ![alt text](image.png)




7. 대문자로 자동 변경
    - sql 설정에서 자동변경 설정하여 대분자로 자동 변경됨

### 기본이론

#### 관계형 데이터베이스
- relational database
  - 1969년 E.F.Codd 수학 모델에 근간해서 고안
  - 테이블을 최소단위로 구성
  - 각 테이블간 관계를 통해서 데이터 모델 구성



#### 데이터베이스 종류
- 관계형 데이터베이스
  - Oracle, SQL Server(MS), MySQL(Oracle), MariaDB, PostgreSQL(오픈소스)
- NoSQL 데이터베이스
  - MongoDB, Redis, Apache, Cassandra,
- In-memory 데이터베이스
  - SAP HANA...



#### SQL
- Structured Query Language
  - 구조화된 질의 언어
  - 데이터베이스에서 데이터를 조작하고, 테이블과 같은 객체를 컨트롤하는 등의 작업을 수행하는 프로그래밍 언어
  
- SQL 종류
  - DML - 데이터 조작 언어. SELECT, INSERT, UPDATE, DELETE 와 같은 데이터를 조작하는 언어
  - DDL - 데이터 정의어. CREATE, ALTER, RENAME, DROP 같은 객체(데이터베이스 , 테이블, 사용자, 뷰, 인덱스,..)를 처리하는 언어
  - DCL - 데이터 제어어. GRANT, REVOKE 와 같이 사용자에게 권한을 주고 해제하는 기능을 처리하는 언어.
  - TCL - 트랜잭션 제어어. BEGIN TRAN, COMMIT, ROLLBACK 같은 트랜잭션 처리로 동시성 제어를 위한 언어.


### SELECT 실습

- 기본문법
    ```sql
    -- 기본 조회 궈치, * 전부라는 뜻
    SELECT *
        FROM 테이블명;
    -- 컬럼 명시할 때
    SELECT 열1, 열2 ... 열n
        FROM 테이블명;

    -- 조건 필터링(필요한 행, 레코드)만 조회할 때
    SELECT *|열이름 나열
        FROM 테이블명
    WHERE 조건....;

    -- 정렬하고 싶을 때
    -- ASCending(오름차순), DESCending(내림차순)
    -- ASC는 기본이기 때문에 생략이 가능하다
    SELECT *| 열이름 나열
        FROM 테이블 명
    WHERE 조건
    ORDER BY 열1, 열2 ASC|DESC
    ```
