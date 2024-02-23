/* DDL(Data Definition Language) */
-- 데이터베이스의 스키마를 정의하거나 수정하는데 사용되는 SQL의 한 부분

-- 1. CREATE : 테이블 생성을 위한 구문
-- 컬럼 설정 방법
-- column_name data_type(length) [NOT NULL] [DEFAULT value] [AUTO_INCREMENT] column_constraint
create table if not exists tb1 (		-- tb1이 존재하지 않는다면 create 하겠다.
	pk int primary key,					-- primary key로 설정하면 not null(null값 불가)
    fk int,
    col1 varchar(255),
    check(col1 in ('Y', 'N'))
) engine = InnoDB;						-- 실행 후 스키마 새로고침하면 tb1이 생성된 것을 확인할 수 있다.

describe tb1;							-- 테이블 구조 보기

insert into tb1 values (1,10,'Y');
select * from tb1;

-- 2. AUTO_INCREMENT : 정의
-- insert 시, primary key에 해당하는 컬럼에 자동으로 중복되지 않는 번호를 발생시켜 저장할 수 있다.
create table if not exists tb2 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in ('Y','N'))
) engine = InnoDB;

insert into tb2 values(null, 10, 'Y');
insert into tb2 values(null, 20, 'Y');

-- 3. ALTER : 테이블에 추가, 변경, 수정, 삭제하는 모든 것은 ALTER 명령어를 사용하여 적용

-- 열 추가
-- ALTER TABLE 테이블명 ADD 컬럼명 컬럼정의
-- col2 컬럼 추가 (int형, not null 제약조건 존재)
alter table tb2
add col2 int not null;

describe tb2;

-- 열 삭제
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명
alter table tb2
drop column col2;

describe tb2;

-- 열 이름 및 데이터 형식 변경
-- ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 바꿀컬럼명 컬럼정의
-- fk 컬럼을 change_fk 컬럼으로 변경(not null 제약조건 존재)
alter table tb2 change column fk change_fk int not null;

describe tb2;

-- 열 제약 조건 추가 및 삭제(이후 챕터에서 다룰 내용)
-- ALTER TABLE 테이블명 DROP 제약조건
-- tb2 테이블의 primary key 제약조건 제거
alter table tb2 drop primary key;	-- 에러 발생 : auto_increment가 적용된 컬럼은 primary key 제거 불가, auto_increment를 modify(컬럼 정의 변경) 명령어로 먼저 제거 해야한다.
alter table tb2 modify pk int;		-- auto_crement 제거

describe tb2;

alter table tb2 drop primary key;	-- primary key 삭제됨

describe tb2;

-- 다시 pk 컬럼에 PRIMARY KEY 제약조건 추가
alter table tb2 add primary key(pk);

describe tb2;

-- 여기서부터 추가 입력
-- 컬럼 여러개 추가하기
alter table tb2
add col3 date not null,
add col4 tinyint not null;		-- 1292 에러 발생

select @@global.sql_mode;		-- MySQL 데이터베이스 서버의 전역 SQL 모드 설정을 조회(NO_ZERO_IN_DATE)
								-- root 계정에서 모드 설정을 비워준 후 workbench 껐다 킨 후 다시 date형 컬럼 추가
describe tb2;

-- 4. DROP : 테이블을 삭제하기 위한 구문
-- tb3 테이블 생성
create table if not exists tb3 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in ('Y', 'N'))
) engine = InnoDB;

-- tb3 테이블 삭제
drop table if exists tb3;

-- 5. TRUNCATE : 전체 테이블의 모든 행을 삭제하고 테이블 새로 생성 (WHERE절 지원 안함)
-- 삭제할 행에 대한 로그를 남기지 않기 때문에, 되돌릴 수 없다.
create table if not exists tb4 (
	pk int auto_increment primary key,
    fk int,
    col1 varchar(255),
    check(col1 in('Y', 'N'))
) engine = InnoDB;

insert into tb4 values (null, 10, 'Y');
insert into tb4 values (null, 20, 'Y');
insert into tb4 values (null, 30, 'Y');
insert into tb4 values (null, 40, 'Y');

select * from tb4;

-- 테이블 초기화
truncate table tb4;		-- table 키워드 생략 가능 : truncate tb4;

select * from tb4;