create table tyuser01(
	num int primary key auto_increment,
	id varchar(40) not null unique,
	pw varchar(32) not null
);

create table tybasket01(
	num int primary key auto_increment,
	id varchar(40) ,
	sub varchar(50) default '제목없음',
	content text,
	cnt int default 0,
	foreign key (id) references tyuser01(id)
);

create table tybasketfind01(
	num int primary key auto_increment,
	id varchar(40) ,
	sub varchar(50) default '제목없음',
	content text,
	cnt int default 0,
	foreign key (id) references tyuser01(id)
);

create table tyhelp01(
	num int primary key auto_increment,
	id varchar(40) ,
	sub varchar(50) default '제목없음',
	content text,
	cnt int default 0,
	foreign key (id) references tyuser01(id)
);


insert into tyuser01 values (0,'admin1@admin.com',md5('1234'));
insert into tyuser01 values (0,'admin2@admin.com',md5('4567'));
insert into tyuser01 values (0,'admin3@admin.com',md5('1234'));
insert into tyuser01 values (0,'admin4@admin.com',md5('4567'));

insert into tybasket01(id,sub,content) value ('admin1@admin.com','test1-1','testing...1');
insert into tybasket01(id,sub,content) value ('admin1@admin.com','test2-1','testing...2');
insert into tybasket01(id,sub,content) value ('admin2@admin.com','test2','testing...3');
insert into tybasket01(id,sub,content) value ('admin3@admin.com','test3','testing...4');
insert into tybasket01(id,sub,content) value ('admin4@admin.com','test4','testing...5');

insert into tybasketfind01(id,sub,content) value ('admin1@admin.com','팀 구합니다','키-  178 몸무게 - 75 포지션-가드 ');
insert into tybasketfind01(id,sub,content) value ('admin2@admin.com','즐겁게 게임하는 팀 들어가려합니다','키-  185 몸무게 - 82 포지션-포워드 ');
insert into tybasketfind01(id,sub,content) value ('admin3@admin.com','멤버 구합니다','키-상관없음  178 몸무게 - 상관없음  포지션-상관없음 ');
insert into tybasketfind01(id,sub,content) value ('admin3@admin.com','팀원 구해요 가족같은 분위기~','키-180이상 몸무게 - 상관없음  포지션-상관없음 ');
insert into tybasketfind01(id,sub,content) value ('admin4@admin.com','팀 구해용','키-  198 몸무게 - 110 포지션-센터 ');

insert into tyhelp01(id,sub,content) value ('admin1@admin.com','게시판 카데고리를 늘려주세요','다름이 아니라 이런 게시판이 있으면 더 좋을 것 같아서 문의드립니다.');
insert into tyhelp01(id,sub,content) value ('admin2@admin.com','예약이 잘 안되요','예약 사이트에 들어가려는데 사이트 업로드가 안되요');

