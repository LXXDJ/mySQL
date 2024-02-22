/* DML(Data Manipulation Language) */
-- 데이터 조작언어, 테이블 값 조작(삽입, 수정, 삭제)하는 SQL의 한 부분

-- 1. INSERT : 새로운 행을 추가하는 구문
select * from tbl_menu;
insert into tbl_menu values (null, '바나나해장국', 8500, 4, 'Y');

-- NULL 허용 가능한(NULLABLE)컬럼이나 AUTO_INCREMENT가 있는 컬럼을 제외하고
-- INSERT하고 싶은 데이터 컬럼을 지정해서 INSERT 가능
insert into tbl_menu(menu_name, menu_price, category_code, orderable_status)
values ('초콜릿죽', 6500, 7, 'Y');

-- 컬럼을 명시하면 INSERT 시, 데이터 순서 변경 가능
insert into tbl_menu(orderable_status, menu_price, menu_name, category_code)
values ('Y', 5500, '파인애플탕', 4);

-- 한번에 여러개의 행 INSERT
insert into
	tbl_menu
values
	(null, '참치맛아이스크림', 1700, 12, 'Y'),
    (null, '멸치맛아이스크림', 1500, 11, 'Y'),
    (null, '소시지맛커피', 2500, 8, 'Y');
    
-- 2. UPDATE : 테이블에 기록된 컬럼의 값을 수정하는 구문
select
	menu_code,
    category_code
from
	tbl_menu
where
	menu_name = '파인애플탕';

update tbl_menu
set
	category_code = 7
where
	menu_code = 24;

-- UPDATE나 DELETE 시, 자기자신 테이블의 데이터를 사용 시 에러 발생
update tbl_menu
set
	category_code = 6
where
	menu_code = (select
					menu_code
				from
					tbl_menu
				where
					menu_name = '파인애플탕');
                    
update tbl_menu
set
	category_code = 6
where
	menu_code = (select
					tmp.menu_code
				from (select
							menu_code
						from
							tbl_menu
						where
							menu_name = '파인애플탕') tmp
);

-- 3. DELETE : 테이블의 행을 삭제하는 구문
-- LIMIT 활용한 행 삭제
delete from tbl_menu
order by menu_price
limit 2;

-- WHERE 절을 활용한 삭제
delete from
	tbl_menu
where
	menu_code = 24;
    
-- 데이터 테이블 전체 삭제
delete from tbl_menu;			-- 세이프 업데이트 모드라서 실행안됨(실수로 지우는 것을 방지하기 위해), 비활성화 시키고 실행하면 됨
set SQL_SAFE_UPDATES = 0;		-- 세이프 업데이트 모드 비활성화
set SQL_SAFE_UPDATES = 1;		-- 세이프 업데이트 모드 활성화

-- 4. REPLACE : INSERT 시, PRIMARY KEY 또는 UNIQUE KEY가 중복 발생 가능하면 REPLACE를 통해 중복된 데이터를 덮어 쓸수 있다.
insert into tbl_menu values (17, '참기름소주', 5000, 10, 'Y');		-- 17번 PRIMARY KEY가 중복되서 실행안됨
replace into tbl_menu values (17, '참기름소주', 5000, 10, 'Y');	-- replace로 실행하면 값이 덮어씌워진다.
replace tbl_menu values (17, '참기름소주', 5000, 10, 'Y');			-- into 생략가능

replace tbl_menu
set menu_code = 2,
	menu_name = '우럭쥬스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'N';
