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
('083098001513', '2021-04-05', 'Quân', 'Nguyễn Phúc Minh', '1998-12-23', 'M', 'Không', 'Kinh', 'QuanAG4@gmail.com', '0319981223', 'Bến Tre', 'AG4'),
('092085001513', '2021-04-10', 'Hương', 'Nguyễn Thị', '1985-08-20', 'F', 'Không', 'Kinh', 'HuongAH1@gmail.com', '0319850820', 'Hồ Chí Minh', 'AH1'),
('038094001513', '2021-03-31', 'Tuấn', 'Trần Văn', '1994-06-15', 'M', 'Không', 'Kinh', 'TuanAH1@gmail.com', '0319940615', 'Đồng Tháp', 'AH1'),
('065088001513', '2021-04-05', 'Linh', 'Đinh Thị Ngọc', '1988-12-05', 'F', 'Không', 'Kinh', 'LinhAH1@gmail.com', '0319881205', 'Cần Thơ', 'AH2'),
('077096001513', '2021-04-05', 'Hải', 'Vũ Đức', '1996-09-10', 'M', 'Không', 'Kinh', 'HaiAH2@gmail.com', '0319960910', 'Bình Dương', 'AH2'),
('063094001513', '2021-04-05', 'Thảo', 'Phan Thị', '1994-07-18', 'F', 'Không', 'Kinh', 'ThaoAG3@gmail.com', '0319940718', 'Bình Phước', 'AG3'),
('087205001513', '2021-04-05', 'Nhật', 'Lê Thị Kim', '2005-03-22', 'F', 'Không', 'Kinh', 'NhatAG3@gmail.com', '0320050322', 'Vũng Tàu', 'AG3'),
('060080001513', '2021-04-05', 'An', 'Nguyễn Minh', '1980-06-30', 'M', 'Không', 'Kinh', 'AnAG4@gmail.com', '0319800630', 'Hồ Chí Minh', 'AG4'),
('093098001513', '2021-04-05', 'Tâm', 'Nguyễn Văn', '1998-02-17', 'M', 'Không', 'Kinh', 'TamAG4@gmail.com', '0319980217', 'Đồng Nai', 'AG4');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT LIVES_IN
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO LIVES_IN(Student_ID, Date_in, Date_out, Room_ID)
VALUES
('083203001513', '2021-09-15', NULL, '41101'),
('083203001514', '2021-09-15', NULL, '42101'),
('025303001515', '2021-09-15', NULL, '43101'),
('025303001516', '2021-09-15', NULL, '44514'),
('095201002925', '2021-09-15', NULL, '41102'),
('052201010829', '2021-09-15', NULL, '42203'),
('083201008742', '2021-09-15', NULL, '43304'),
('025303001517', '2021-09-15', NULL, '44405'),
('083203001518', '2021-09-15', NULL, '41106'),
('095201002519', '2021-09-15', NULL, '42607'),
('052201010620', '2021-09-15', NULL, '43708'),
('083201008721', '2021-09-15', NULL, '44809'),
('025303001622', '2021-09-15', NULL, '41910'),
('083203001723', '2021-09-15', NULL, '42111'),
('095201002824', '2021-09-15', NULL, '43201'),
('052201010925', '2021-09-15', NULL, '44302'),
('083201008826', '2021-09-15', NULL, '41403'),
('092085001513', '2021-09-15', NULL, '42504'),
('038094001513', '2021-09-15', NULL, '43605'),
('065088001513', '2021-09-15', NULL, '44706'),
('077096001513', '2021-09-15', NULL, '41807'),
('063094001513', '2021-09-15', NULL, '42908'),
('087205001513', '2021-09-15', NULL, '43209'),
('060080001513', '2021-09-15', NULL, '44110'),
('093098001513', '2021-09-15', NULL, '41211');
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
('025303001516', 'Kỳ', 'Đặng Châu', '1969-12-09', '0219691209', 'Đồng Nai', 'Cha'),
('025303001517', 'Bình', 'Võ Hữu', '1985-06-10', '0219850610', 'Vĩnh Long', 'Anh'),
('083203001518', 'Liên', 'Lê Thị', '1979-09-25', '0219790925', 'Hồ Chí Minh', 'Chị'),
('095201002519', 'Minh', 'Nguyễn Thành', '1975-07-22', '0219750722', 'Quảng Nam', 'Anh'),
('052201010620', 'Hòa', 'Trần Thị', '1982-04-28', '0219820428', 'Hải Phòng', 'Chị'),
('083201008721', 'Vinh', 'Nguyễn Phương', '1978-11-28', '0219781128', 'Hà Nội', 'Anh'),
('025303001622', 'Lan', 'Lê Văn', '1975-03-15', '0219750315', 'Tiền Giang', 'Chị'),
('083203001723', 'Tâm', 'Phạm Thị', '1977-12-01', '0219771201', 'Cần Thơ', 'Chị'),
('095201002824', 'Hoàng', 'Nguyễn Thế', '1979-05-18', '0219790518', 'Long An', 'Anh'),
('052201010925', 'Hùng', 'Lê Thị', '1975-10-09', '0219751009', 'Vũng Tàu', 'Anh'),
('083201008826', 'Thu', 'Nguyễn Minh', '1978-07-02', '0219780702', 'Bà Rịa - Vũng Tàu', 'Anh');
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
('083203001513', '2021-04-10', 'Nhân', 'Trần Thiện', '2003-10-30', 'M', 'Không', 'Kinh', '0120031030', 'NhanBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/656451.jpg', 'OCB', '8020031030', 'Bến Tre', 'Đang ở'),
('083203001514', '2021-04-10', 'Tân', 'Nguyễn Thái', '2003-11-07', 'M', 'Không', 'Kinh', '0120031107', 'TanBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/658020.jpg', 'OCB', '8020031107', 'Bến Tre', 'Đang ở'),
('025303001515', '2021-04-10', 'Yến', 'Lìu Ngọc', '2003-01-01', 'F', 'Không', 'Hoa', '0120030101', 'YenBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/644698.jpg', 'OCB', '8020030101', 'Đồng Nai', 'Đang ở'),
('025303001516', '2021-04-10', 'My', 'Lê Phạm Hoàng', '2003-12-14', 'F', 'Không', 'Kinh', '0120031214', 'MyNV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/659111.jpg', 'OCB', '8020031214', 'Đồng Nai', 'Đang ở'),
('095201002925', '2021-08-14', 'Linh', 'Phạm Nhật', '2001-02-04', 'M', 'Không', 'Kinh', '0911997515', 'Phamnhatlinh0911997515@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/170835.jpg', 'OCB', '8000731000', 'Bạc Liêu', 'Đang ở'),
('052201010829', '2022-09-22', 'Hùng', 'Phan Văn', '2001-01-03', 'M', 'Không', 'Kinh', '0911997515', 'hung.phanpvh0301@hcmut.edu.vn', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/660616.jpg', 'Agribank', '8061002055', 'Khánh Hòa', 'Đang ở'),
('083201008742', '2017-05-04', 'Phú', 'Nguyễn Thanh', '2002-02-02', 'M', 'Không', 'Kinh', '0868854632', 'phu.nguyen02022001@hcmut.edu.vn', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/034205011193.jpg', 'MB', '8012225667', 'Bến Tre', 'Đang ở'),
('025303001517', '2021-04-10', 'Anh', 'Võ Hữu', '2003-05-20', 'M', 'Không', 'Kinh', '0120030520', 'AnhVH@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/54203002733.jpg', 'ACB', '8020030520', 'Vĩnh Long', 'Đang ở'),
('083203001518', '2021-04-10', 'Hương', 'Lê Thị', '2003-09-15', 'F', 'Không', 'Kinh', '0120030915', 'HuongLe@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/038305025344.jpg', 'Vietcombank', '8020030915', 'Hồ Chí Minh', 'Đang ở'),
('095201002519', '2021-08-14', 'Đức', 'Nguyễn Thành', '2001-07-12', 'M', 'Không', 'Kinh', '0912998822', 'DucNguyen@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/064205000507.jpg', 'Techcombank', '8001234567', 'Quảng Nam', 'Đang ở'),
('052201010620', '2022-09-22', 'Thảo', 'Trần Thị', '2002-04-08', 'F', 'Không', 'Kinh', '0912003040', 'ThaoTran@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/630069.jpg', 'BIDV', '8062003040', 'Hải Phòng', 'Đang ở'),
('083201008721', '2017-05-04', 'Điệp', 'Nguyễn Phương', '2002-11-18', 'F', 'Không', 'Kinh', '0868888888', 'DiepNP@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/074305001855.jpg', 'Sacombank', '8019999999', 'Hà Nội', 'Đang ở'),
('025303001622', '2021-04-10', 'Nam', 'Lê Văn', '2003-06-25', 'M', 'Không', 'Kinh', '0120030625', 'NamLV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/077204003301.jpg', 'Vietinbank', '8020030625', 'Tiền Giang', 'Đang ở'),
('083203001723', '2021-04-10', 'Loan', 'Phạm Thị', '2003-03-14', 'F', 'Không', 'Kinh', '0120030314', 'LoanPT@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/53.jpg', 'HSBC', '8020030314', 'Cần Thơ', 'Đang ở'),
('095201002824', '2021-08-14', 'Minh', 'Nguyễn Thế', '2001-10-09', 'M', 'Không', 'Kinh', '0912997654', 'MinhNT@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/648637.jpg', 'Standard Chartered', '8009876543', 'Long An', 'Đang ở'),
('052201010925', '2022-09-22', 'Hà', 'Lê Thị', '2001-09-01', 'F', 'Không', 'Kinh', '0912001122', 'HaLe@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/038302016745.jpg', 'ANZ', '8062001122', 'Vũng Tàu', 'Đang ở'),
('083201008826', '2017-05-04', 'Tùng', 'Nguyễn Minh', '2002-08-27', 'M', 'Không', 'Kinh', '0868777666', 'TungNM@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/630544.jpg', 'Shinhan Bank', '8012333444', 'Bà Rịa - Vũng Tàu', 'Đang ở');
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
-- INSERT WORK_IN
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








