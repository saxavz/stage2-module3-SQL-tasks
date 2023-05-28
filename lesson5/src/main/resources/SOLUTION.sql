select * from payment where amount >= 500;

select * from student where DATEADD('YEAR',20, birthday) < CURRENT_DATE;

select * from student where groupnumber = 10 and DATEADD('YEAR',20, birthday) > CURRENT_DATE;

select * from student where groupnumber in (4,5,6) or name = 'Mike';

select * from payment where payment_date >= DATEADD('MONTH',-8, CURRENT_DATE);

select * from student where name like 'A%';

select * from student where 1=1 and (name = 'Roxi' and groupnumber = 4) or (name = 'Tallie' and groupnumber = 9);