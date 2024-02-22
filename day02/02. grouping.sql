-- GROUPING
-- GROUP BY 절은 특정 열의 값에 따라 그룹화하는데 사용된다.
-- HAVING은 GROUP BY 절과 함께 사용해야 하며 그룹에 대한 조건을 적용하는데 사용된다.
    
-- where : 그룹화 전의 개별 행에 대한 조건 지정
-- having : 그룹화 후의 집계 결과에 대한 조건 지정

select
	category_code
from
	tbl_menu
group by
	category_code;
    
select
	category_code,
    count(*)		-- count : 행의 수를 세는데 사용하는 함수
from
	tbl_menu
group by category_code;

select
	category_code,
    sum(menu_price) -- sum : 합계
from
	tbl_menu
group by category_code;

select
	category_code,
    avg(menu_price)	-- avg : 평균
from
	tbl_menu
group by category_code;

select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code;

-- group by 여러개 적용
select
	menu_price,
    category_code
from
	tbl_menu
group by
	menu_price,
    category_code
having
	category_code >= 5 and category_code <= 8;

-- group by를 rollup과 함께 사용
-- with rollup : 그룸화 한것의 합계와 전체 합계(여기서 category_code는 null로 표시됨)
select
	category_code,
    sum(menu_price)
from
	tbl_menu
group by
	category_code
with rollup;

-- 칼럼 두개를 활용한 rollup
select
	menu_price,
    category_code,
    sum(menu_price)
from
	tbl_menu
group by
	menu_price,
    category_code
with rollup;