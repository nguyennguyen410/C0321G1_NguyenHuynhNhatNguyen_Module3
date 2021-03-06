CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    status    BIT
);

CREATE TABLE Student
(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    `status`      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id)
);

CREATE TABLE Subject
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    `status`  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

USE QuanLySinhVien;
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (student_name, Address, Phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (student_name, Address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, Address, Phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (sub_id, student_id, Mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT * FROM Student;

SELECT *
FROM Student
WHERE `status` = true;

SELECT *
FROM Subject
WHERE Credit < 10;

SELECT S.student_id, S.student_name, C.class_name
FROM Student S join Class C on S.class_id = C.class_iD
WHERE C.class_name = 'A1';

SELECT S.student_id, S.student_name, Sub.sub_name, M.Mark
FROM Student S 
join Mark M on S.student_id = M.student_id 
join Subject Sub on M.sub_id = Sub.sub_id
WHERE Sub.sub_name = 'CF';

/*Hien Thi sinh vien co ten bat dau bang ky tu 'H'*/
select student_name from Student
where student_name like "H%";

/*Hi???n th??? c??c th??ng tin l???p h???c c?? th???i gian b???t ?????u v??o th??ng 12*/
select * from class
where month(start_date) = 12;

/*Hi???n th??? t???t c??? c??c th??ng tin m??n h???c c?? credit trong kho???ng t??? 3-5*/
select * from Subject
where credit between 3 and 5;

/*Thay ?????i m?? l???p(ClassID) c???a sinh vi??n c?? t??n ???Hung??? l?? 2*/
update Student
set class_iD = 2
where student_name = 'Hung';

/*Hi???n th??? c??c th??ng tin: StudentName, SubName, Mark. D??? li???u s???p x???p theo ??i???m thi (mark) gi???m d???n. n???u tr??ng s???p theo t??n t??ng d???n*/
select student_name, sub_name, Mark
from Student S 
join Mark M on S.student_id = M.student_id
join Subject on Subject.sub_id = M.sub_id
order by M.Mark desc, S.student_name;

use quanlysinhvien;
-- S??? d???ng h??m count ????? hi???n th??? s??? l?????ng sinh vi??n ??? t???ng n??i
SELECT address, COUNT(student_id) AS 'S??? l?????ng h???c vi??n'
FROM Student
GROUP BY Address;

-- T??nh ??i???m trung b??nh c??c m??n h???c c???a m???i h???c vi??n b???ng c??ch s??? d???ng h??m AVG
SELECT S.student_id,S.student_name, AVG(Mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name;

-- Hi???n th??? nh???ng b???n h???c vi??n co ??i???m trung b??nh c??c m??n h???c l???n h??n 15
SELECT S.student_id,S.student_name, AVG(Mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(Mark) > 15;

-- Hi???n th??? th??ng tin c??c h???c vi??n c?? ??i???m trung b??nh l???n nh???t.
SELECT S.student_id, S.student_name, AVG(Mark)
FROM Student S join Mark M on S.student_id = M.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.student_id);

-- Hi???n th??? t???t c??? c??c th??ng tin m??n h???c (b???ng subject) c?? credit l???n nh???t.
select *
from Subject
where credit >= all (select max(credit) from subject);

-- Hi???n th??? c??c th??ng tin m??n h???c c?? ??i???m thi l???n nh???t.
select subject.sub_name, mark.mark
from mark
inner join subject on mark.sub_id = subject.sub_id
where mark.mark >= all (select max(mark) from mark);

-- Hi???n th??? c??c th??ng tin sinh vi??n v?? ??i???m trung b??nh c???a m???i sinh vi??n, x???p h???ng theo th??? t??? ??i???m gi???m d???n
select student.student_id, student.student_name, student.phone, student.class_id, avg(mark) as avg_diem
from mark
inner join subject on mark.sub_id = subject.sub_id
inner join student on mark.student_id = student.student_id
group by student.student_id
order by avg_diem desc;
use quanlysinhvien;

