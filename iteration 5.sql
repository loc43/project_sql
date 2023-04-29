select student_id from Students where student_name like 'Anya';
select olympiad_name from Olympiads where olympiad_level < 2;
select teacher_name from Teachers where teacher_specialisation like 'geometry';

update Teachers set teacher_specialisation = Null where teacher_name like 'Vova';
update Students set student_group = 'red' where student_specialisation like 'geometry';
update Olympiads set class_its_for = 8 where olympiad_level < 2 and class_its_for < 8;

insert into Teachers values (2243, 'Vova', 'Gelpher', 4, 'geometry');
insert into Groups values ('4443', 'red', 10, 2243);
insert into Students values ('1143', 'Ilya', 'Katsva', 8, 'combinatorics', 'red');

delete from Tasklist where group_id = 44101; 
