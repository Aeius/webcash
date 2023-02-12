-- 유저
create table user(
    id int primary key,
    pw varchar(200) not null,
    job varchar(2) not null unique check(job in("학생", "교수"));
);

-- 과목
create table subject(
    num int primary key auto_increment,
    name varchar(20) not null unique
);

-- 성적
create table achieve(
    user_id int not null,
    subject_name
);

-- 공지사항
create table notice(
    num int primary key auto_increment,
    sub varchar(50) not null,
    content varchar(1000) not null,
    cnt int auto_increment,
    
);

-- 정정 요청 게시판
create table correction(
	num int primary key auto_increment,
	sub varchar(50) not null,
	content varchar(1000) not null,
	ref int default 0,
	lvl int default 0,
	ord int default num,
);

