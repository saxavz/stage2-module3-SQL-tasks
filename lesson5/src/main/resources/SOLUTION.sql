-- #1 Select all Payments with amount more or equal 500
select * from payment where amount >= 500
    ;

-- #2 Select students older than 20
select * from student where DATEADD('YEAR',20, birthday) < CURRENT_DATE
    ;

-- #3 Select students from the same group (10) but younger than 20
select * from student where groupnumber = 10
    and DATEADD('YEAR',20, birthday) > CURRENT_DATE
    ;

-- #4 Select Students with Name ‘Mike’ or from the group 4, 5, 6
select * from student where groupnumber in (4,5,6)
    or name = 'Mike'
    ;

-- #5 Select Payments dated conducted in past 8 months
select * from payment where payment_date >= DATEADD('MONTH',-8, CURRENT_DATE)
    ;

-- #6 Select all students whose name starts with ‘A’
select * from student where 1=1
    or name like 'A%'
    ;

-- #7 Select students with name = Roxi and group= 4 or name Tallie and group = 9
select * from student where 1=1
    and (
        name = 'Roxi'
        and
        groupnumber = 4
        )
    or
        (
        name = 'Tallie'
        and
        groupnumber = 9
        )
    ;