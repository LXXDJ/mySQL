-- DISTINCT
-- 중복값 제거 시 사용
-- 컬럼에 있는 컬럼값들의 종류를 쉽게 파악 가능

select
	category_code
from
	tbl_menu
order by
	category_code;
    
select
	distinct category_code
from
	tbl_menu
order by
	category_code;
    
-- null값을 포함한 열의 disdinct 사용
select
	ref_category_code
from
	tbl_category;
    
select
	distinct ref_category_code
from
	tbl_category;
    
-- 다중열 distinct 사용
select
	category_code,
    orderable_status
from
	tbl_menu;
    
select distinct
	category_code,
    orderable_status		-- 두개의 값이 모두 중복되어야 중복으로 판단해서 제거
from
	tbl_menu;