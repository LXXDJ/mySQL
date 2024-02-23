-- Q1
select
	EMP_ID,
    EMP_NAME,
    PHONE,
    HIRE_DATE,
    ENT_YN
from
	employee
where
    ENT_YN = 'N' and
	PHONE like '%2'
order by
	HIRE_DATE DESC
limit
	3;

-- Q2
select
    a.EMP_NAME,
    b.JOB_NAME,
    a.SALARY,
    a.EMP_ID,
    a.EMAIL,
    a.PHONE,
    a.HIRE_DATE
from
	employee a
join job b on a.JOB_CODE = b.JOB_CODE
where
    ENT_YN = 'N' and
	b.JOB_NAME = '대리'
order by
	SALARY DESC;

-- Q3
select
	b.DEPT_TITLE as '부서명',
    count(a.DEPT_CODE) as '인원',
	sum(salary) as '급여합계',
    avg(salary) as '급여평균'
from
	employee a
join department b on a.DEPT_CODE = b.DEPT_ID
where
    ENT_YN = 'N'
group by
	b.DEPT_TITLE
with rollup;

-- Q4
select
    EMP_NAME,
    EMP_NO,
    PHONE,
    b.DEPT_TITLE,
    c.JOB_NAME
from
	employee a
left join department b on a.DEPT_CODE = b.DEPT_ID
join job c on a.JOB_CODE = c.JOB_CODE
order by
	HIRE_DATE;

-- Q5-1
select
	count(*)
from
	employee
where
	-- MANAGER_ID != 'NULL';
	MANAGER_ID IS NOT NULL;

-- Q5-2
select
	count(*)
from
	employee a
join employee b on a.EMP_ID = b.MANAGER_ID;

-- Q5-3
select
    a.EMP_NAME,
    b.EMP_NAME
from
	employee a left join employee b on a.MANAGER_ID = b.EMP_ID
order by
	a.EMP_NAME;

-- Q5-4
select
    a.EMP_NAME,
    c.DEPT_TITLE,
    b.EMP_NAME,
    d.DEPT_TITLE
from
	employee a
left join employee b on a.MANAGER_ID = b.EMP_ID
join department c on a.DEPT_CODE = c.DEPT_ID
join department d on b.DEPT_CODE = d.DEPT_ID
where
	b.EMP_NAME is not null
order by
	a.EMP_NAME;
	
	