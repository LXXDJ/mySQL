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
	PHONE like '%2'
order by
	HIRE_DATE
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
group by
	b.DEPT_TITLE
with rollup;

-- Q4
select
    EMP_NAME,
    EMP_NO,
    PHONE,
    b.DEPT_TITLE
from
	employee a
join department b on a.DEPT_CODE = b.DEPT_ID
order by
	HIRE_DATE;

-- Q5-1
select
	count(*)
from
	employee
where
	MANAGER_ID IS NOT NULL;

-- Q5-2
select
	count(*)
from
	employee
where
	MANAGER_ID IS NOT NULL;
