/* TRANSACTION */
-- 데이터 베이스에서 한번에 수행되는 작업의 단위
-- 시작, 진행, 종료 단계를 가지며, 만약 중간에 오류가 발생하면 롤백(시작 이전의 단계로 되돌림)을 수행하고 데이터베이스에 제대로 반영하기 위해서는 커밋(이후 롤백이 되지 않음)을 진행한다.
-- MySQL은 기본적으로 자동 커밋 설정이 되어있어(롤백불가), 롤백을 하기 위해서는 자동 커밋 설정 해제를 해줘야 한다.

-- autocommit 활성화
set autocommit = 1;
-- 또는
set autocommit = on;

-- autocommit 비활성화
set autocommit = 0;
-- 또는
set autocommit = off;		-- 1. 비활성화 실행 후

start transaction;			-- 2. transaction 시작

-- DML 진행
select * from tbl_menu;
insert into tbl_menu values (null, '바나나해장국', 8500, 4, 'Y');	-- 3. 새로운 행 추가
update tbl_menu set menu_name = '수정된메뉴' where menu_code = 5;	-- 4. 메뉴 수정
delete from tbl_menu where menu_code = 7;						-- 5. 메뉴 삭제

-- 커밋을 하지 않은 상태이기 때문에 롤백을 통해 시작단계로 돌아갈 수 있다.
rollback;					-- 6. 롤백 실행 (테이블이 다시 처음상태로 돌아간다.)

-- 커밋을 하고 난 후에는 롤백불가
commit;		-- 7. 다시 DML 진행(3,4,5)하고 커밋 실행한 후
rollback;	-- 8. 롤백을 실행하면, 오류는 나지 않지만 테이블이 수정된 상태 그대로 있다.