create database if not exists student_manager;
use student_manager;

create table class(
	id int primary key auto_increment,
	class_name varchar(60) not null,
	start_date datetime not null,
	`status` bit 
);
create table student(
	id int primary key auto_increment,
	student_name varchar(30) not null,
	address varchar(50),
	phone varchar(20),
	`status` bit,
	class_id int not null,
    foreign key(class_id) references class(id)
);
create table `subject`(
	id int primary key auto_increment,
	sub_name varchar(30) not null,
	credit tinyint default 1 check (credit >=1),
	`status` bit default 1
);
create table mark(
	id int primary key auto_increment,
    sub_id int not null,
    foreign key(sub_id) references `subject`(id),
    student_id int not null,
	foreign key(student_id) references student(id),
    mark float default 0 check(mark between 0 and 100),
    exam_times tinyint default 1,
    unique(sub_id,student_id)
);


insert into class 
values (1,'A1', '2008-12-20', 1),
		(2,'A2', '2008-12-20', 1),
        (3,'B3', current_date(), 0);
select * from class;        

insert into student(student_name,address,phone,`status`,class_id)
values ('Hung','Ha Noi', '0912113113', 1, 1),
		('Hoa', 'Hai phong','0123123123', 1, 1),
        ('Manh', 'HCM', '0123123123', 0, 2);
        select * from student;
insert into `subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
select * from subject;

insert into mark (sub_id,student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
select * from mark;
-- Truy vấn dữ liệu với CSDL Quản lý sinh viên
select * from student where student_name like 'h%';
select * from class where month(start_date);
select * from `subject` where credit between 3 and 5;
update student set class_id=2 where student_name ='Hung';

select a.student_name , c.sub_name, b.mark from student a
join mark b on a.id = b.student_id
join `subject` c on c.id = b.sub_id
order by b.mark desc, a.student_name asc;

create view class_view as 
select * from class;
