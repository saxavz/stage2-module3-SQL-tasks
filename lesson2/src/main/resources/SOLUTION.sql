
insert into STUDENT(name,birthday,groupnumber)
    select  name,
        birthday,
        groupnumber
        from student where 1=2
 union all
    select 'John',      LOCALTIMESTAMP - INTERVAL '30' YEAR, 1 union all
    select 'Chris',     LOCALTIMESTAMP - INTERVAL '31' YEAR, 1 union all
    select 'Carl',      LOCALTIMESTAMP - INTERVAL '32' YEAR, 1 union all
    select 'Oliver',    LOCALTIMESTAMP - INTERVAL '20' YEAR, 2 union all
    select 'James',     LOCALTIMESTAMP - INTERVAL '21' YEAR, 2 union all
    select 'Lucas',     LOCALTIMESTAMP - INTERVAL '22' YEAR, 2 union all
    select 'Jacob',     LOCALTIMESTAMP - INTERVAL '40' YEAR, 3 union all
    select 'Logan',     LOCALTIMESTAMP - INTERVAL '41' YEAR, 3 union all
    select 'Henry',     LOCALTIMESTAMP - INTERVAL '41' YEAR, 3 union all
    select 'Bibba',     LOCALTIMESTAMP - INTERVAL '10' YEAR, 4 union all
    select 'Bobba',     LOCALTIMESTAMP - INTERVAL '11' YEAR, 5
    ;


insert into SUBJECT(name,grade)
    select  name,
        grade
        from subject where 1=2
 union all
    select 'Art',                   1 union all
    select 'Music',                 1 union all
    select 'Geography',             2 union all
    select 'History',               2 union all
    select 'PE',                    3 union all
    select 'Math',                  3 union all
    select 'Science',               4 union all
    select 'IT',                    4 union all
    select 'Labor lessons',         5 union all
    select 'Physical ed.',          5
    ;


insert into PAYMENTTYPE(name)
    select  'DAILY'     union all
    select  'WEEKLY'    union all
    select  'MONTHLY'
    ;


insert into PAYMENT(type_id,amount,payment_date,student_id)
    select
    type_id,
    amount,
    payment_date,
    student_id
    from payment where 1=2
 union all
    select
        (select id from paymenttype t where t.name = s.paymenttype_name) as type_id,
        amount,
        payment_date,
        student_id
    from (
    select
      decode(s.name,
                     'John',    'WEEKLY',
                     'Henry',   'WEEKLY',
                     'Oliver',  'MONTHLY',
                     'James',   'DAILY',
                                'WEEKLY'
                     )  as paymenttype_name,
      100               as amount,
      LOCALTIMESTAMP    as payment_date,
      s.id              as student_id
      from student s
      ) s
      ;

insert into MARK(student_id,subject_id,mark)
    select
     s.student_id,
    (select id from subject sbj where sbj.name = s.subject_name) as subject_id,
    s.mark
    from (
    select
      s.id              as student_id,
      decode(s.name,
                     'Chris',   'Art',
                     'Oliver',  'History',
                     'James',   'Geography',
                     'Jacob',   'Math',
                     'Logan',   'PE',
                                'Labor lessons'
                     )  as subject_name,
      decode(s.name,
                     'Chris',   8,
                     'Oliver',  5,
                     'James',   9,
                     'Jacob',   4,
                     'Logan',   9,
                                1
                     )  as mark,

      from student s
      ) s
      ;