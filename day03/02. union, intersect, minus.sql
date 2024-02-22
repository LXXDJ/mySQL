/* SET_OPERATORS */

-- UNION : 두 개 이상의 SELECT문의 결과를 결합하여 중복된 레코드 제거 후 반환
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10    
UNION
select
	menu_code,
    menu_name,
    menu_price,
	category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;
    
-- UNION ALL : 중복된 레코드를 제거하지 않고 모두 반환
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10    
UNION ALL
select
	menu_code,
    menu_name,
    menu_price,
	category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;

-- INTERSECT : 두 SELECT 문의 결과 중 공통되는 레코드만 반환
-- MySQL은 미제공. 하지만 INNER JOIN 또는 IN 연산자를 활용하여 구현가능

-- INNER JOIN 연산자 이용
SELECT
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
from
	tbl_menu a
inner join (select
				menu_code,
                menu_name,
                menu_price,
                category_code,
                orderable_status
			from
				tbl_menu
			where
				menu_price < 9000) b on (a.menu_code = b.menu_code)
where
	a.category_code = 10;
    
-- IN 연산자 이용 : 포함되어 있는 값
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10 and
    menu_code in (select
					menu_code
				from 
					tbl_menu
				where
					menu_price < 9000);

-- MINUS : 첫번째 SELECT문의 결과에서 두번째 SELECT문의 결과가 포함하는 레코드를 제외하고 반환
-- MySQL은 MINUS 미제공. LEFT JOIN을 활용하여 구현가능

select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status,
    b.menu_code,
	b.menu_price,
    b.menu_name
from
	tbl_menu a
left join (select
				menu_code,
                menu_name,
                menu_price,
                category_code,
                orderable_status
			from
				tbl_menu
			where
				menu_price < 9000) b on (a.menu_code = b.menu_code)
where
	b.menu_code is null and
    a.category_code = 10;