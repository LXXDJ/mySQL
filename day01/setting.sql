CREATE USER 'ohgiraffers'@'%' IDENTIFIED BY 'ohgiraffers';
SHOW databases;
USE mysql;
SELECT * FROM user;
CREATE DATABASE menudb;
GRANT ALL privileges ON menudb.* TO 'ohgiraffers'@'%';
SHOW GRANTS FOR 'ohgiraffers'@'%';
USE menudb;