create table student(
id bigint not null primary key,
name varchar(max),
birthday date,
"group" int
);

create table subject(
id bigint not null primary key,
name varchar(max),
description varchar(max),
grade int
);

create table paymenttype(
id bigint not null primary key,
name varchar(max)
);

create table payment(
id bigint not null primary key,
type_id bigint,
amount decimal(18,4),
student_id bigint,
payment_date datetime,
foreign key (type_id) references PaymentType,
foreign key (student_id) references Student
);

create table Mark(
id bigint not null primary key,
student_id bigint,
subject_id bigint,
mark int,
foreign key (student_id) references Student,
foreign key (subject_id) references Subject
);



