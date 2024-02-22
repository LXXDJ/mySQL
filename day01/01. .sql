SELECT * FROM menudb.tbl_menu;
select
	*
from
	tbl_menu;
select 6 + 3;
select 6 * 3;
select 6 % 3;

select NOW();
select CONCAT('홍.',' ','길동');

select CONCAT('홍.',' ','길동') AS name;
select concat('홍.',' ','길동') AS 'Full name';

select
	menu_code,
    menu_name,
    menu_price
From
	tbl_menu
ORDER BY
	-- menu_price ASC;			-- ASC : 오름차순, 생략가능
    menu_price;
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC;	-- DESC : 내림차순, 생략불가
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC;
    
select
	menu_code,
    menu_price,
    menu_code * menu_price
from
	tbl_menu
order by
	menu_code * menu_price;
    
select field('a', 'a', 'b', 'c');	-- 1 / field : 첫번째 인자값과 일치하는 인자값의 위치값
select field('b', 'a', 'b', 'c');	-- 2

select
	field(orderable_status, 'N', 'Y')
from
	tbl_menu;
    
select
	menu_name,
    orderable_status,
    field(orderable_status, 'N', 'Y')
from
	tbl_menu
order by
	field(orderable_status, 'N', 'Y');
    
select
	category_code,
    category_name,
    ref_category_code
from
	tbl_category
order by
	-- ref_category_code;		-- 오름차순 : null 값이 가장 위에 출력된다.
	ref_category_code is null;	-- is null : null 값이 가장 아래로 간다.
    
select
	category_code,
    category_name,
    ref_category_code
from
	tbl_category
order by
	-- ref_category_code desc;			-- 내림차순 : null 값이 가장 아래에 출력된다.
    -- ref_category_code is null desc;	-- is null : null 값이 가장 위로 간다.(null에만 내림차순 적용) 
    
    ref_category_code is null desc,		-- 조건을 두가지 적용해서 null을 가장 위로 올리고, 내림차순을 적용한다.
    ref_category_code desc;				-- null, 3, 2, 1 순서로 나열된다.

select
	menu_name,
    menu_price,
    orderable_status
from
	tbl_menu
where
	orderable_status = 'Y';
    
select
	menu_name,
    menu_price,
    orderable_status
from
	tbl_menu
where
	menu_price = 13000;
    
select
	menu_code,
    menu_name,
    orderable_status
from
	tbl_menu
where
	-- orderable_status <> 'Y';		-- <> : 같지 않다는 의미 / Y 값이 아닌 값만 출력
    orderable_status != 'Y';		-- != : 같지 않다는 의미
    
select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
where
	menu_price >= 20000;
    
select 1 and 1;									-- 1(true)
select 1 and 0, 0 and 1, 0 and 0, 0 and null; 	-- 0(false) : false 값이 하나라도 있으면 false 반환
select 1 and null, null and null; 				-- null : false가 아닌 값과 null 값을 비교하면 null 반환

select
	menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	orderable_status = 'Y' and
    category_code = 10;

select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price > 5000 and
    category_code = 10;
    
select 1 or 1, 1 or 0, 0 or 1;				-- 1
select 0 or 0;								-- 0 : false 값만 있을때
select 0 or null, null or 0, null or null;	-- null : true가 아닌값과 null 값일 때 

select
	menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	orderable_status = 'Y' or
    category_code = 10
order by
	category_code;
    
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price > 5000 or
    category_code = 10;
    
select 1 or 0 and 0;		-- 1 : and 연산자가 우선순위가 더 높다.
select (1 or 0) and 0;		-- 0

select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 4 or
    menu_price = 9000 and
    menu_code > 10;
    
select
    menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price >= 10000 and
    menu_price <= 25000
order by
	menu_price;
    
select
    menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price between 10000 and 25000
order by
	menu_price;
    
select
	menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price not between 10000 and 25000
order by
	menu_price;
    
select
	menu_name,
    menu_price
FROM
	tbl_menu
where
	menu_name like '%마늘%';		-- % : 0개 이상의 임의 문자를 의미 / _ : 하나의 임의 문자
    
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price > 5000 and
    category_code = 10 and
    menu_name like '%갈치%';
    
select
    menu_name,
    menu_price
from
	tbl_menu
where
	menu_name not like '%마늘%'
order by
	menu_name;

select
	menu_name,
    category_code
from
	tbl_menu
where
	category_code = 4 or
    category_code = 5 or
    category_code = 6
order by
	category_code;
    
select
	menu_name,
    category_code
from
	tbl_menu
where
	category_code in (4,5,6)
    -- category_code not in (4,5,6)
order by
	category_code;
    
select 
	category_code,
    category_name,
    ref_category_code
from
	tbl_category
where
	-- ref_category_code is null;
	ref_category_code is not null;		-- is와 null 사이에 not 입력
    

    
