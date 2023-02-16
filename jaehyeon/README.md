## 📢INTRODUCTION
* 학생 성적 관리 웹사이트(ver 0.7.0)
* 개요 : 웹사이트 만들기(UI 설계 구현)
* 기간 : ~ 23.02.17
## 🛠 SKILLS
* JSP
* Servlet
* HTML
* CSS
* JavaScript
* jQuery
## 🗽DEVELOPMENT
* carousel
* media query
  * mobile
  * pc
* modal
* user
  * login, join
  * session
  * validation
* board
  * CRUD 
* reply

## 🛕STRUCTURE
```
-- 초기화
drop table if exists correction;
drop table if exists notice;
drop table if exists achieve;
drop table if exists subject;
drop table if exists user;
-- 유저
create table user(
id int primary key auto_increment,
num int not null unique,
name varchar(10) not null,
pw varchar(200) not null,
job varchar(2) not null check(job in('학생', '교수'))
);

-- dummy
insert into user value(0, 00000001, '이순신', '1234', '교수');
insert into user value(0, 20230201, '홍길동', '1234', '학생');
insert into user value(0, 20230202, '이햇님', '1234', '학생');
insert into user value(0, 20230203, '김콩쥐', '1234', '학생');
insert into user value(0, 20230204, '박흥부', '1234', '학생');
commit;

-- 과목
create table subject(
id int primary key auto_increment,
name varchar(20) not null unique
);

-- dummy
insert into subject value(0, 'JAVA I/O Stream');
insert into subject value(0, 'Database SQL');
insert into subject value(0, 'UI(HTML,CSS)');
insert into subject value(0, 'JavaScript/jQuery');
commit;

-- 성적
create table achieve(
user_num int not null,
sub_name varchar(20) not null,
score int not null check(score between 0 and 100),
constraint achieve_num_fk foreign key (user_num) references user(num) on delete cascade,
constraint achieve_name_fk foreign key (sub_name) references subject(name) on delete cascade
);

-- dummy
insert into achieve value(20230202, 'Java I/O Stream', 94);
insert into achieve value(20230201, 'Java I/O Stream', 95);
insert into achieve value(20230203, 'Java I/O Stream', 93);
insert into achieve value(20230204, 'Java I/O Stream', 92);
insert into achieve value(20230201, 'Database SQL', 85);
insert into achieve value(20230202, 'Database SQL', 84);
insert into achieve value(20230203, 'Database SQL', 83);
insert into achieve value(20230204, 'Database SQL', 82);
insert into achieve value(20230201, 'UI(HTML,CSS)', 75);
insert into achieve value(20230202, 'UI(HTML,CSS)', 74);
insert into achieve value(20230203, 'UI(HTML,CSS)', 73);
insert into achieve value(20230204, 'UI(HTML,CSS)', 72);
insert into achieve value(20230201, 'JavaScript/jQuery', 65);
insert into achieve value(20230202, 'JavaScript/jQuery', 64);
insert into achieve value(20230203, 'JavaScript/jQuery', 63);
insert into achieve value(20230204, 'JavaScript/jQuery', 62);
commit;

-- 공지사항
create table notice(
num int primary key auto_increment,
user_num int not null,
title varchar(50) not null,
content varchar(1000) not null,
date date not null,
cnt int default 0,
constraint notice_name_fk foreign key (user_num) references user(num) on delete cascade
);

-- dummy
insert into notice value(0, 00000001, '점수 정정기간 신청 안내', '정정 기간은 2월 17일 까지입니다.',now(),0);
insert into notice value(0, 00000001, '학생 성적 관리 안내', '교수님들께선 로그인 후 학생 성적 관리를 하실 수 있으십니다.',now(),0);

-- 정정 요청 게시판
create table correction(
num int primary key auto_increment,
user_num int not null,
title varchar(50) not null,
content varchar(1000) not null,
date date not null,
ref int not null,
seq int not null default 0,
lvl int not null default 0,
cnt int default 0,
constraint correction_name_fk foreign key (user_num) references user(num) on delete cascade
);

-- dummy
insert into correction value(0, 20230201,'java 성적 정정 요청 합니다', 'java 성적이 잘못된 것 같습니다.',now(), 1,0,0,0);
insert into correction value(0, 20230203,'DB 성적 정정 요청 합니다', 'DB 성적이 잘못된 것 같습니다.',now(), (select max(num)+1 from correction b),0,0,0);
```
## ✔KPT 회고
### KEEP
수업시간에 배운 내용을 최대한 적용하여 프로젝트를 완성하려한 것. 
외부 공용 리소스를 많이 이용하는 것 보단 불편하고 어렵지만 최대한 레거시하게 코드를 짜본 것이 좋았다.

### Problem
짧은 시간 내에 혼자서 프론트와 백엔드를 전부 만들려고 하다보니 시간이 상대적으로 촉박했다.   
작업하는데 시간이 많이 들다보니 초반에 기획이라던가 작업 계획 및 관리가 어려웠었다.  
그러다보니 작업 진행 사항에 대해서 머릿속으로만 가지고 있다보니 복잡한 느낌도 많이 들었었다.   
거기다 정해진 프레임워크도 없었기 때문에 당장 떠오르는 방법을 사용하다 보니 효율적인 작업을 하지 못한 것 같아 아쉽다.
그래도 이 방법 저 방법으로 다양한 방식으로 구현해본 것은 좋은 경험이면서 나쁜경험이었다. 

### Try
청사진을 미리 그려서 당장은 사용되지 않더라도 미래에 사용될 가능성이 높은 것들을 미리 예측해서 대비해놓는 것
이번 페이지네이션이나 검색기능 같은 경우에는 사용될 파라미터들을 미리 생각해서 당장 개발하지않더라도 준비 해놓았더라면 적은 시간으로도 구현할 수 있었을 텐데 아쉬웠다.
통신하는 방식도 통일해서 사용했었으면 더 좋았을 것 같다.