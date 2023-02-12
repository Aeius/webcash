create table user(
    num int primary key auto_increament,
    id varchar(10) not null unique,
    pw varchar(200) not null,
    job varchar(2) not null unique check(job in("학생", "교수"));
    kor tinyint not null check(kor < 0 and kor > 100),
    eng tinyint not null check(eng < 0 and eng > 100),
    math tinyint not null check(math < 0 and math > 100),
);

create table notice(
    num int primary key auto_increment,
    sub varchar(50) not null,
    content varchar(1000) not null,
    cnt int auto_increment,
    
);

create table correction(
	num int primary key auto_increment,
	sub varchar(50) not null,
	content varchar(1000) not null,
	ref int default 0,
	lvl int default 0,
	
);