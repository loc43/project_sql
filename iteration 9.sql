CREATE VIEW open_achievements AS
SELECT Students.student_name || ' ' || Students.student_surname, Groups.group_name, Olympiads.olympiad_name, Achievements.student_result, Achievements.olympiad_date
FROM Students
INNER JOIN Achievements on Students.student_id = Achievements.student_id
INNER JOIN Olympiads on Olympiads.olympiad_id = Achievements.olympiad_id
INNER JOIN Groups on Groups.group_id = Students.student_group

ORDER BY Students.student_name || ' ' || Students.student_surname;

Select * from open_achievements;


CREATE VIEW group_list AS
SELECT Teachers.teacher_name || ' ' || Teachers.teacher_surname, Groups.group_name, Students.student_name || ' ' || Students.student_surname
FROM Teachers
INNER JOIN Groups ON Groups.leading_teacher_id = Teachers.teacher_id
INNER JOIN Students ON Students.student_group = Groups.group_id

ORDER BY Teachers.teacher_name || ' ' || Teachers.teacher_surname;

SELECT * FROM group_list;


CREATE VIEW vseros_team AS
SELECT Students.student_name || ' ' || Students.student_surname, Students.student_specialisation
FROM Students
INNER JOIN Achievements ON Students.student_id = Achievements.student_id

ORDER BY Students.student_specialisation;

SELECT distinct * FROM vseros_team;


CREATE VIEW teacher_assistant AS
SELECT Teachers.teacher_name || ' ' || Teachers.teacher_surname, Assistants.assistant_name || ' ' || Assistants.assistant_surname
FROM Teachers
INNER JOIN TeacherAssistantConnection on Teachers.teacher_id = TeacherAssistantConnection.teacher_id
INNER JOIN Assistants on TeacherAssistantConnection.assistant_id = Assistants.assistant_id

ORDER BY Teachers.teacher_name || ' ' || Teachers.teacher_surname;

SELECT * FROM teacher_assistant;


CREATE VIEW student_info AS
SELECT Students.student_name || ' ' || Students.student_surname, Students.student_behaviour, SUBSTR(student_id, 1, 3) || '***' || SUBSTR(student_id, 4, 5)
FROM Students
ORDER BY Students.student_name || ' ' || Students.student_surname;

SELECT * FROM student_info;


CREATE VIEW assistant_info AS
SELECT Assistants.assistant_name || ' ' || Assistants.assistant_surname, Assistants.assistant_experience , SUBSTR(assistant_id, 1, 3) || '***' || SUBSTR(assistant_id, 4, 5)
FROM Assistants
ORDER BY Assistants.assistant_name || ' ' || Assistants.assistant_surname;

SELECT * FROM assistant_info;