drop table if exists member;

create table if not exists stock(
	STK_NAME VARCHAR(255) primary key,
    STK_PRICE int not null
) engine = InnoDB;

insert into stock values
("삼성전자", 73300),
("SK하이닉스", 149600),
("LG에너지솔루션", 404000),
("삼성바이오로직스", 818000),
("삼성전자우", 62900),
("현대차", 242000),
("기아", 116100),
("셀트리온", 179900),
("POSCO홀딩스", 440000),
("LG화학", 506000);

select * from stock;

create table if not exists account(
	MEM_NAME VARCHAR(255) primary key,
    MEM_MONEY int not null
) engine = InnoDB;

select * from account;