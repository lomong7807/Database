#날짜: 2023/06/16
#이름: 강윤수
#내용: 3.데이터베이스 관리

#실습3-1
CREATE DATABASE `TestDB`;
CREATE USER 'tester'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON TestDB. * TO 'tester'@'%';
FLUSH PRIVILEGES;

#실습3-1
ALTER USER 'tester'@'%' IDENTIFIED BY '12345';
DROP USER 'tester'@'%';
FLUSH PRIVILEGES;