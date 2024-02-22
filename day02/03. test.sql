-- Q1
select
	category_code,
	category_name
from
	tbl_category
where
	-- ref_category_code is not null
	ref_category_code != 'null'
order by
	category_name desc;

-- Q2    
select
	menu_name,
	menu_price
from
	tbl_menu
where
	menu_name like '%밥%' and
    -- menu_price between 20000 and 30000
    (menu_price >= 20000 and menu_price <= 30000);

-- Q3
select
	*
from
	tbl_menu
where
	menu_name like '%김치%' or
	menu_price < 10000
order by
	menu_price,
	menu_name desc;

-- Q4
select
	menu_code,
	menu_name,
    menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code not in (10,9,8) and
	menu_price = 13000 and
    orderable_status <> 'N';
    
select
	a.menu_code,
	a.menu_name,
    a.menu_price,
	a.category_code,
	a.orderable_status
from
	tbl_menu a
join tbl_category b on a.category_code = b.category_code
where
	b.category_code not in ('기타','쥬스','커피') and
    a.menu_price = 13000 and
    a.orderable_status <> 'N';