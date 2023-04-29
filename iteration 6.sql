
select teacher_name, teacher_surname, teacher_specialisation from Teachers
where teacher_experience > 2
group by teacher_name
having teacher_specialisation like 'graphs';

select assistant_name, assistant_surname from Assistants
where is_reliable = True
group by assistant_surname
having assistant_name like 'Maya';

select student_group, count(student_id) from Students
group by student_group;


select group_id, group_name, avg(medium_student_strength) over (partition by group_name) as best_result from Groups;

select group_id, lag(task_theme) over (order by group_id) as next_task from TaskList;

select group_id, group_name, row_number() over (partition by medium_student_strength order by group_name) from Groups;