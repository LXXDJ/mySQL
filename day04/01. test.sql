-- Q1
select
	sum(SALARY)
from
	employee a join department b on a.DEPT_CODE = b.DEPT_ID
group by
	b.DEPT_TITLE
order by
	sum(SALARY) desc
limit 1;

-- Q2    
/*                
select
	a.EMP_ID,
    a.EMP_NAME,
    a.DEPT_CODE,
    a.SALARY
from
	employee a join department b on a.DEPT_CODE = b.DEPT_ID
where
	b.DEPT_TITLE like '%영업%';
*/
    
select
	EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
from
	employee
where
	DEPT_CODE in (select
						DEPT_ID
					from
						department
					where
						DEPT_TITLE like '%영업%');

-- Q3
select
	a.EMP_ID,
    a.EMP_NAME,
    b.DEPT_TITLE,
    a.SALARY
from
	employee a join department b on a.DEPT_CODE = b.DEPT_ID
where
	DEPT_CODE in (select
						DEPT_ID
					from
						department
					where
						DEPT_TITLE like '%영업%');

-- Q4

select
	d.DEPT_ID,
    d.DEPT_TITLE,
    l.LOCAL_NAME,
    n.NATIONAL_NAME
from
	department d 
join location l on d.LOCATION_ID = l.LOCAL_CODE
join nation n on l.NATIONAL_CODE = n.NATIONAL_CODE;

/*
select
	e.EMP_ID,
    e.EMP_NAME,
    e.SALARY,
    d.DEPT_TITLE,
    l.LOCAL_NAME
from
	employee e
join department d on e.DEPT_CODE = d.DEPT_ID
join location l on d.LOCATION_ID = l.LOCAL_CODE
order by
	l.LOCAL_NAME desc;
*/

select
	e.EMP_ID,
    e.EMP_NAME,
    e.SALARY,
    z.DEPT_TITLE,
    z.NATIONAL_NAME
from
	employee e
join (select
			d.DEPT_ID,
			d.DEPT_TITLE,
			l.LOCAL_NAME,
			n.NATIONAL_NAME
		from
			department d 
		join location l on d.LOCATION_ID = l.LOCAL_CODE
		join nation n on l.NATIONAL_CODE = n.NATIONAL_CODE) z
on e.DEPT_CODE = z.DEPT_ID
order by
	z.NATIONAL_NAME desc;

/*
with z as (select
				d.DEPT_ID,
				d.DEPT_TITLE,
				l.LOCAL_NAME,
				n.NATIONAL_NAME
			from
				department d 
			join location l on d.LOCATION_ID = l.LOCAL_CODE
			join nation n on l.NATIONAL_CODE = n.NATIONAL_CODE)
            
select 
	e.EMP_ID,
    e.EMP_NAME,
    e.SALARY,
    z.DEPT_TITLE,
    z.NATIONAL_NAME
from
	employee e left join z on e.DEPT_CODE = z.DEPT_ID;
*/

-- Q5
with r as (select
				e.EMP_ID,
				e.EMP_NAME,
				e.SALARY,
				z.DEPT_TITLE,
				z.NATIONAL_NAME
			from
				employee e
			join (select
						d.DEPT_ID,
						d.DEPT_TITLE,
						l.LOCAL_NAME,
						n.NATIONAL_NAME
					from
						department d 
					join location l on d.LOCATION_ID = l.LOCAL_CODE
					join nation n on l.NATIONAL_CODE = n.NATIONAL_CODE) z
			on e.DEPT_CODE = z.DEPT_ID
			order by
				z.NATIONAL_NAME desc)

select
	r.EMP_ID,
	r.EMP_NAME,
	r.SALARY,
	r.DEPT_TITLE,
    r.NATIONAL_NAME,
    ss.MIN_SAL,
    r.SALARY + ss.MIN_SAL as '위로금'
from
	r
left join (select
				e.EMP_NAME,
				e.SALARY,
				s.MIN_SAL
			from
				employee e left join sal_grade s using (SAL_LEVEL)) as ss using (EMP_NAME)
where 
	r.NATIONAL_NAME = '러시아'
order by
	r.SALARY + ss.MIN_SAL desc;
