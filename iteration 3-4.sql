create schema if not exists scheme;

CREATE table scheme.Teachers
(
teacher_id int primary key,
teacher_name varchar(43) not null,
teacher_surname varchar(43) not null,
teacher_experience int,
teacher_specialisation varchar(43)
);

INSERT INTO scheme.Teachers values
('2299', 'Nina', 'Fenster', 5, 'graphs'),
('22166', 'Vova', 'Oryol', 5, 'geometry'),
('22121', 'Masha', 'Tsinker', 2, 'graphs'),
('2292', 'Oleg', 'Serniy', 5, 'geometry'),
('2251', 'Dima', 'Katsva', 2, 'combinatorics'),
('2268', 'Alina', 'Gelpher', 4, 'combinatorics'),
('22141', 'Nina', 'Erikhman', 1, 'combinatorics'),
('22122', 'Sonya', 'Oryol', 4, 'geometry'),
('2266', 'Anna', 'Kogan', 3, 'graphs'),
('22174', 'Masha', 'Kravets', 2, 'algebra');


CREATE table scheme.Assistants
(
assistant_id int primary key,
assistant_name varchar(43) not null,
assistant_surname varchar(43) not null,
is_reliable boolean,
assistant_experience int
);

INSERT INTO scheme.Assistants values
('33100', 'Maya', 'Serniy', True, 4) ,
('33107', 'Ilya', 'Erikhman', True, 1) ,
('33168', 'Dima', 'Kravets', True, 4) ,
('33128', 'Yael', 'Oryol', False, 4) ,
('33169', 'Yael', 'Oryol', False, 4) ,
('33106', 'Nina', 'Kogan', True, 2) ,
('3388', 'Anna', 'Kravets', True, 4) ,
('33890', 'Oleg', 'Litkens', True, 2) ,
('33142', 'Nina', 'Katsva', False, 3) ,
('3389', 'Yael', 'Tereshenko', False, 2);



CREATE table scheme.TeacherAssistantConnection
(
teacher_id int not null,
assistant_id int not null,

foreign key(teacher_id) references Teachers(teacher_id),
foreign key(assistant_id) references Assistants(assistant_id)
);

INSERT INTO scheme.TeacherAssistantConnection values
(2299, 33100),
(22166, 33107),
(22121, 33168),
(2299, 3389),
(22174, 33100),
(2266, 3389),
(22141, 33100);



CREATE table scheme.Groups
(
group_id int primary key,
group_name varchar(43),
medium_student_strength int not null,
leading_teacher_id int,

foreign key(leading_teacher_id) references Teachers(teacher_id)
);

INSERT INTO scheme.Groups values
('44101', 'green', 6, 1188) ,
('4491', 'blue', 7, 2299) ,
('4476', 'green', 7, 2292) ,
('44172', 'green', 4, 22166) ,
('44110', 'yellow', 6, 22141) ,
('44171', 'blue', 3, 2251) ,
('4482', 'green', 5, 22121) ,
('4459', 'green', 1, 22174) ,
('44123', 'green', 4, 2266) ,
('4475', 'blue', 10, 2268);


CREATE table scheme.Students
(
student_id int primary key,
student_name varchar(43) not null,
student_surname varchar(43) not null,
student_behaviour int check(student_behaviour > 0 and student_behaviour < 11),
student_specialisation varchar(43), 
student_group int not null,

foreign key(student_group) references Groups(group_id)
);

INSERT INTO scheme.Students values
('1188', 'Anya', 'Gelpher', 10, 'graphs', 'yellow'),
('1178', 'Eva', 'Tsinker', 7, 'combinatorics', 'yellow'),
('1166', 'Dima', 'Tsinker', 10, 'graphs', 'blue'),
('1193', 'Nina', 'Kogan', 5, 'geometry', 'green'),
('11128', 'Anya', 'Fenster', 1, 'graphs', 'yellow'),
('11121', 'Eva', 'Kravets', 10, 'combinatorics', 'yellow'),
('11112', 'Ilya', 'Kogan', 6, 'algebra', 'blue'),
('11124', 'Oleg', 'Katsva', 6, 'combinatorics', 'blue'),
('11119', 'Vasya', 'Kogan', 10, 'graphs', 'blue'),
('11109', 'Alina', 'Katsva', 10, 'combinatorics', 'yellow');


CREATE table scheme.Olympiads
(
olympiad_id int primary key,
olympiad_name varchar(43) not null,
olympiad_level int,
class_its_for int 

);

INSERT INTO scheme.Olympiads values
('55102', 'Autumn Olymp', 0, 5) ,
('5591', 'Phistech', 3, 5) ,
('55164', 'Vseros', 2, 8) ,
('5559', 'Spring Olymp', 0, 8) ,
('55174', 'Vseros', 0, 8) ,
('55166', 'Autumn Olymp', 0, 5) ,
('55120', 'VseSib', 1, 7) ,
('55101', 'Spring Olymp', 0, 7) ,
('55107', 'Euler Olympiad', 0, 7) ,
('55112', 'Phistech', 2, 5);


CREATE table scheme.Achievements
(
student_id int not null,
olympiad_id int not null,
olympiad_date date check(olympiad_date > '2018-01-01'),
student_result varchar(43) not null,

foreign key(olympiad_id) references Olympiads(olympiad_id),
foreign key(student_id) references Students(student_id)
);

INSERT INTO scheme.Achievements values
(1188, 55102, '2019-09-30', 'awardee'),
(1193, 5591, '2021-10-27', 'winner'),
(1188, 55102, '2022-03-15', 'awardee'),
(1188, 55102, '2022-03-16', 'awardee'),
(11121, 55112, '2022-04-13', 'winner');


CREATE table scheme.TaskList
(
group_id int not null,
task_theme varchar(43) not null,

foreign key(group_id) references Groups(group_id)
);


INSERT INTO scheme.TaskList values
(44101, 'Dirikhle'),
(4491, 'MathFights'),
(4476, 'Corner Princip'),
(44172,	'Graphs'),
(44110,	'Diaphant equations'),
(4482, 'Graphs');
