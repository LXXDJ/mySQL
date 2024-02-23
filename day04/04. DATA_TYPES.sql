/* DATA_TYPES */

-- 명시적 형변환
-- CAST (expression AS 데이터형식[(길이)]) : as
-- CONVERT (expression, 데이터형식[(길이)]) : ,
-- 데이터 형식으로 가능한 것 : BINARY, CHAR, DATE, DATETIME, TIME, DECIMAL, JSON, SIGNED INTEGER, UNSIGNED INTEGER 등
-- SIGNED INTEGER : 음수, 0, 양수를 모두 포함하는 정수값 저장 가능
-- UNSIGNED INTEGER : 음수값 저장 불가 (0과 양수만 가능)

select
	avg(menu_price)
from
	tbl_menu;

select 
	cast(avg(menu_price) as signed integer) as '평균 메뉴 가격'
from
	tbl_menu;
    
select
	convert(avg(menu_price), signed integer) as '평균 메뉴 가격'
from
	tbl_menu;
    
-- $, /, %, @ 사용가능
select cast('2024$2$23' as date);
select cast('2024/2/23' as date);
select cast('2024%2%23' as date);
select cast('2024@2@23' as date);

select
	concat(cast(menu_price as char(5)), '원')		-- char는 고정형, 5는 길이(길이를 넘어가면 절삭됨)
from
	tbl_menu;
    
-- 카테고리별 메뉴 가격 합계 구하기
select
	category_code,
    concat(cast(sum(menu_price) as char(10)), '원')
from
	tbl_menu
group by
	category_code;
    
-- 암시적 형변환
select '1' + '2';	-- 각 문자가 정수로 변환
select concat(menu_price, '원') from tbl_menu;	-- menu_price가 문자로 변환
select 3 > 'MAY';	-- 문자는 0으로 변환(true = 1, false = 0 로 반환)
select 5 > '6MAY';	-- 문자에서 첫번째로 나온 숫자는 정수로 변환
select 5 > 'M6AY'; 	-- 숫자가 뒤에 나오면 문자로 인식하여 0으로 변환
select '2024-2-23';	-- 날짜형으로 바뀔 수 있는 문자는 DATE형으로 변환