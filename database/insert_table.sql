-- CCCD, Employee_ID, Mgr_ID, High_Mgr: 0 + 11 số

-- Student_ID: 1 + Uni_ID + MSSV

-- Uni_ID: 2 + x   -   1: BK
--                 -   2: NV
--                 -   3: IT
--                 -   4: US
--                 -   5: IU
                       
-- Room_type_ID: 3 + max_student + x   -   0: không dịch vụ
--                                     -   1: dịch vụ

-- Room_ID: 4 +  x (toà) + tầng + phòng (2-digit)  -   1: AH1
--                                                 -   2: AH2
--                                                 -   3: AG3
--                                                 -   4: AG4
                                                
-- Bill_ID: 5 + x (toà) + 8 số

-- Noti_ID: 6 + x (toà) + 8 số

-- Warn_ID: 7 + x (toà) + 8 số

-- Bank_number: 80 + DOB

-- Phone:   -   Student:    01 + DOB
--          -   Relative:   02 + DOB
--          -   Employee:   03 + DOB
--          -   Uni_phone:  04 + Uni_ID + 000000


--
-- INSERT BE_WARNED
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO BE_WARNED(Warn_ID, Student_ID)
VALUES
('7100000001', '083203001513'),
('7100000002', '083203001514'),
('7200000001', '025303001515'),
('7200000002', '025303001516');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT BILL
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO BILL(Bill_ID, Detail, Amount, Date_issue, Date_paid, Date_expire, Mgr_ID, Student_ID)
VALUES
('5400000001', 'Tiền nước', 20000, '2023-06-01', '2023-06-02', '2023-06-15', '080080001513', '025303001516'),
('5400000002', 'Tiền điện', 20000, '2023-06-01', '2023-06-02', '2023-06-15', '080080001513', '025303001516'),
('5300000001', 'Tiền điện', 35000, '2023-06-01', '2023-06-02', '2023-06-15', '083196001513', '025303001515'),
('5300000002', 'Tiền nước', 15000, '2023-06-01', '2023-06-02', '2023-06-15', '083196001513', '025303001515');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT BUILDING
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO BUILDING(Name, Status, Mgr_ID)
VALUES
('AH1', 'A', '080087001513'),
('AH2', 'R', '025099001513'),
('AG3', 'F', '083196001513'),
('AG4', 'A', '080080001513');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT EMPLOYEE
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO EMPLOYEE(CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Email, Phone, Address, Bname)
VALUES
('080087001513', '2021-04-10', 'Trọng', 'Trang Sĩ', '1987-10-27', 'M', 'Không', 'Kinh', 'TrongAH1@gmail.com', '0319871027', 'Long An', 'AH1'),
('012096001513', '2021-03-31', 'Thành', 'Nguyễn Sỹ', '1996-03-10', 'M', 'Phật', 'Kinh', 'ThanhAH1@gmail.com', '0319960310', 'Tiền Giang', 'AH1'),
('025099001513', '2021-04-05', 'Vũ', 'Trương Hoàng Nguyên', '1999-09-16', 'M', 'Chúa', 'Kinh', 'VuAH1@gmail.com', '0319990916', 'Đồng Nai', 'AH2'),
('077099001513', '2021-04-05', 'Điềm', 'Nguyễn Minh', '1999-11-29', 'M', 'Không', 'Kinh', 'DiemAH2@gmail.com', '0319991129', 'Bình Thuận', 'AH2'),
('083196001513', '2021-04-05', 'Giang', 'Trần Ngọc Quỳnh', '1996-04-24', 'F', 'Không', 'Kinh', 'GiangAG3@gmail.com', '0319960424', 'Bến Tre', 'AG3'),
('083204001513', '2021-04-05', 'Bảo', 'Ngô Quốc', '2004-01-15', 'M', 'Không', 'Kinh', 'BaoAG3@gmail.com', '0320040115', 'Bến Tre', 'AG3'),
('080080001513', '2021-04-05', 'Phúc', 'Trương Tấn', '1980-01-01', 'M', 'Không', 'Kinh', 'PhucAG4@gmail.com', '0319800101', 'Long An', 'AG4'),
('083098001513', '2021-04-05', 'Quân', 'Nguyễn Phúc Minh', '1998-12-23', 'M', 'Không', 'Kinh', 'QuanAG4@gmail.com', '0319981223', 'Bến Tre', 'AG4');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT LIVES_IN
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO LIVES_IN(Student_ID, Date_in, Date_out, Room_ID)
VALUES
('083203001513', '2021-9-15', NULL, '41101'),
('083203001514', '2021-9-15', NULL, '42101'),
('025303001515', '2021-9-15', NULL, '43101'),
('025303001516', '2021-9-15', NULL, '44514');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT MANAGER
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO MANAGER(CCCD_number, Mgr_start_date, High_Mgr)
VALUES
('080087001513', '2022-01-01', '083196001513'),
('025099001513', '2022-01-01', '083196001513'),
('083196001513', '2022-01-01', NULL),
('080080001513', '2022-01-01', '083196001513');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT NOTIFICATION
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO NOTIFICATION(ID, Title, Content, Date, Mgr_ID)
VALUES
('6300000001', 'Thông báo về Ngày thứ 7 xanh (2023-12-02)', 'Đăng ký liên hệ trưởng toà', '2023-12-01', '083196001513'),
('6300000002', 'Thông báo về Ngày thứ 7 xanh (2023-12-09)', 'Đăng ký liên hệ trưởng toà', '2023-12-08', '083196001513'),
('6300000003', 'Thông báo về Ngày thứ 7 xanh (2023-12-16)', 'Đăng ký liên hệ trưởng toà', '2023-12-15', '083196001513'),
('6300000004', 'Thông báo về Ngày thứ 7 xanh (2023-12-23)', 'Đăng ký liên hệ trưởng toà', '2023-12-22', '083196001513');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT RELATIVE
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO RELATIVE(Student_ID, Fname, Lname, DOB, Phone, Address, Relationship)
VALUES
('083203001513', 'Hằng', 'Lê Thị Thanh', '1981-10-30', '0219811030', 'Bến Tre', 'Mẹ'),
('083203001514', 'Nhàn', 'Nguyễn Thị Thanh', '1977-11-09', '0219771109', 'Bến Tre', 'Mẹ'),
('025303001515', 'Hồng', 'Dương Thị', '1968-02-14', '0219680214', 'Đồng Nai', 'Mẹ'),
('025303001516', 'Kỳ', 'Đặng Châu', '1969-12-09', '0219691209', 'Đồng Nai', 'Cha');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT ROOM
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO ROOM(Room_ID, Status, Bname, Room_type_ID, Leader_ID)
VALUES
('41101', 'F', 'AH1', '321', '083203001513'),
('42101', 'A', 'AH2', '361', '083203001514'),
('43101', 'F', 'AG3', '380', '025303001515'),
('44514', 'A', 'AG4', '340', '025303001516');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT ROOM_TYPE
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO ROOM_TYPE(Room_type_ID, Room_type_name, Max_student, Cost)
VALUES
('321', 'Phòng 2 người dịch vụ', 2, 1000000),
('361', 'Phòng 6 người dịch vụ', 6, 350000),
('380', 'Phòng 8 người không dịch vụ', 8, 150000),
('340', 'Phòng 4 người không dịch vụ', 4, 250000);
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT STAFF
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO STAFF(CCCD_number, Job, Super_CCCD_number)
VALUES
('012096001513', 'Bảo vệ', '080087001513'),
('077099001513', 'Bảo vệ', '025099001513'),
('083204001513', 'Lao công', '083196001513'),
('083098001513', 'Lao công', '080080001513');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT STUDENT
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO STUDENT(CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Phone, Email, Avatar, Bank_name, Bank_number, Address, Status)
VALUES
('083203001513', '2021-04-10', 'Nhân', 'Trần Thiện', '2003-10-30', 'M', 'Không', 'Kinh', '0120031030', 'NhanBK@gmail.com', NULL, 'OCB', '8020031030', 'Bến Tre', NULL),
('083203001514', '2021-04-10', 'Tân', 'Nguyễn Thái', '2003-11-07', 'M', 'Không', 'Kinh', '0120031107', 'TanBK@gmail.com', NULL, 'OCB', '8020031107', 'Bến Tre', NULL),
('025303001515', '2021-04-10', 'Yến', 'Lìu Ngọc', '2003-01-01', 'F', 'Không', 'Hoa', '0120030101', 'YenBK@gmail.com', NULL, 'OCB', '8020030101', 'Đồng Nai', NULL),
('025303001516', '2021-04-10', 'My', 'Lê Phạm Hoàng', '2003-12-14', 'F', 'Không', 'Kinh', '0120031214', 'MyNV@gmail.com', NULL, 'OCB', '8020031214', 'Đồng Nai', NULL);
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT STUDIES_IN
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO STUDIES_IN(CCCD_number, Student_ID, Uni_ID, Department)
VALUES
('083203001513', '1212111913', '21', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001514', '1212112256', '21', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001515', '1212111128', '21', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001516', '1222122256', '22', 'Khoa Ngôn ngữ Ý');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT UNIVERSITY
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO UNIVERSITY(Uni_ID, Name, Uni_Email, Uni_phone)
VALUES
('21', 'Trường Đại học Bách Khoa', 'BK@edu.vn', '0421000000'),
('22', 'Trường Đại học Khoa học Xã hội và Nhân văn', 'NV@edu.vn', '0422000000'),
('23', 'Trường Đại học Công nghệ Thông tin', 'IT@edu.vn', '0423000000'),
('24', 'Trường Đại học Khoa học Tự nhiên', 'US@edu.vn', '0424000000'),
('25', 'Trường Đại học Quốc tế', 'IU@edu.vn', '0425000000');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT UNI_ADDRESS
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO UNI_ADDRESS(Uni_ID, Uni_address)
VALUES
('21', '21, Đông Hoà, Dĩ An, Bình Dương'),
('22', '22, Đông Hoà, Dĩ An, Bình Dương'),
('23', '23, Đông Hoà, Dĩ An, Bình Dương'),
('24', '24, Đông Hoà, Dĩ An, Bình Dương'),
('25', '25, Đông Hoà, Dĩ An, Bình Dương');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT WARNING
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO WARNING(ID, Date, Detail, Note, Mgr_ID, Type)
VALUES
('7100000001', '2022-12-31', 'Cảnh cáo về trễ', 'lần 1', '080087001513', 'Cảnh cáo'),
('7100000002', '2022-12-31', 'Cảnh cáo về trễ', 'lần 2', '080087001513', 'Cảnh cáo'),
('7200000001', '2022-12-31', 'Cảnh cáo về trễ', 'lần 1', '025099001513', 'Cảnh cáo'),
('7200000002', '2022-12-31', 'Cảnh cáo về trễ', 'lần 2', '025099001513', 'Cảnh cáo');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INfERT WORK_IN
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO WORK_IN(Employee_ID, Date_in, Date_out, Bname)
VALUES
('080087001513', '2022-01-01', NULL, 'AH1'),
('012096001513', '2022-01-01', NULL, 'AH1'),
('025099001513', '2022-01-01', NULL, 'AH2'),
('077099001513', '2022-01-01', NULL, 'AH2'),
('083196001513', '2022-01-01', NULL, 'AG3'),
('083204001513', '2022-01-01', NULL, 'AG3'),
('080080001513', '2022-01-01', NULL, 'AG4'),
('083098001513', '2022-01-01', NULL, 'AG4');
SET FOREIGN_KEY_CHECKS = 1;








