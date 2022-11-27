use student_manager;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject where credit=(select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select s.*, m.mark,m.exam_times from `subject` s
join mark m on s.id = m.sub_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select * from mark;
select s.*, ifnull(avg(m.mark), 'chua co diem') as  'avg mark'from student s
left join mark m on m.student_id = s.id
group by s.id; 
select s.*, ifnull(avg(m.mark),'không có điểm') as 'avg mark' from student s left join mark m on m.StudentId = s.StudentId group by s.StudentId;
