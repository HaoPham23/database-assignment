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
INSERT INTO BE_WARNED(Student_ID)
VALUES
('083203001513'),
('083203001514'),
('025303001515'),
('025303001516');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT BILL
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO BILL(Detail, Amount, Date_issue, Date_paid, Date_expire, Mgr_ID, Student_ID)
VALUES
('Tiền nước', 20000, '2023-06-01', '2023-06-02', '2023-06-15', '080080001513', '025303001516'),
('Tiền điện', 20000, '2023-06-01', '2023-06-02', '2023-06-15', '080080001513', '025303001516'),
('Tiền điện', 35000, '2023-06-01', '2023-06-02', '2023-06-15', '083196001513', '025303001515'),
('Tiền nước', 15000, '2023-06-01', '2023-06-02', '2023-06-15', '083196001513', '025303001515');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT BUILDING
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO BUILDING(Name, Status, Mgr_ID)
VALUES
('AH1', 'A', '080087001513'),
('AH2', 'A', '025099001513'),
('AG3', 'A', '083196001513'),
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
('065088001513', '2021-04-05', 'Linh', 'Đinh Thị Ngọc', '1988-12-05', 'F', 'Không', 'Kinh', 'LinhAH2@gmail.com', '0319881205', 'Cần Thơ', 'AH2'),
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
('083203001513', '2021-09-15', NULL, '1101'),
('083203001514', '2021-09-15', NULL, '1101'),
('095201002925', '2021-09-15', NULL, '1102'),
('052201010829', '2021-09-15', NULL, '1102'),
('083201008742', '2021-09-15', NULL, '1201'),
('025303001517', '2021-09-15', NULL, '1201'),
('095201002519', '2021-09-15', NULL, '1202'),
('025303001622', '2021-09-15', NULL, '1202'),

('025303001515', '2021-09-15', NULL, '2101'),
('025303001516', '2021-09-15', NULL, '2101'),
('083203001517', '2021-09-15', NULL, '2101'),
('052201010618', '2021-09-15', NULL, '2101'),
('083201008719', '2021-09-15', NULL, '2101'),
('083203001720', '2021-09-15', NULL, '2101'),
('052201010921', '2021-09-15', NULL, '2102'),
('052201010922', '2021-09-15', NULL, '2102'),
('052201010923', '2021-09-15', NULL, '2102'),
('052201010925', '2021-09-15', NULL, '2102'),
('025303001526', '2021-09-15', NULL, '2102'),
('025303001527', '2021-09-15', NULL, '2102'),

('095201002828', '2021-09-15', NULL, '3101'),
('083201008829', '2021-09-15', NULL, '3101'),
('083201008830', '2021-09-15', NULL, '3101'),
('083201008831', '2021-09-15', NULL, '3101'),
('095201002932', '2021-09-15', NULL, '3101'),
('052201010833', '2021-09-15', NULL, '3101'),
('083201008734', '2021-09-15', NULL, '3102'),
('025303001535', '2021-09-15', NULL, '3102'),
('083201008836', '2021-09-15', NULL, '3102'),
('095201002537', '2021-09-15', NULL, '3102'),

('025303001538', '2021-09-15', NULL, '4101'),
('025303001539', '2021-09-15', NULL, '4101'),
('083203001518', '2021-09-15', NULL, '4101'),
('052201010620', '2021-09-15', NULL, '4101'),
('083201008721', '2021-09-15', NULL, '4102'),
('025303001640', '2021-09-15', NULL, '4102'),
('083203001723', '2021-09-15', NULL, '4102'),
('083203001724', '2021-09-15', NULL, '4103'),
('083203001725', '2021-09-15', NULL, '4103'),
('095201002824', '2021-09-15', NULL, '4103');
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
INSERT INTO NOTIFICATION(Title, Content, Date, Mgr_ID)
VALUES
('Thông báo về Ngày thứ 7 xanh (02-12-2023)', 'Đăng ký liên hệ trưởng toà', '2023-12-01', '083196001513'),
('Thông báo về Ngày thứ 7 xanh (09-12-2023)', 'Đăng ký liên hệ trưởng toà', '2023-12-08', '083196001513'),
('Thông báo về Ngày thứ 7 xanh (16-12-2023)', 'Đăng ký liên hệ trưởng toà', '2023-12-15', '083196001513'),
('Thông báo về Ngày thứ 7 xanh (22-12-2023)', 'Đăng ký liên hệ trưởng toà', '2023-12-22', '083196001513');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT RELATIVE
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO RELATIVE(Student_ID, Fname, Lname, DOB, Phone, Address, Relationship)
VALUES
('083203001513', 'Hằng', 'Lê Thị Thanh', '1981-10-30', '0219811030', 'Bến Tre', 'Mẹ'),
('083203001514', 'Nhàn', 'Nguyễn Thị Thanh', '1977-11-09', '0219771109', 'Bến Tre', 'Mẹ'),
('095201002925', 'Hồng', 'Dương Thị', '1968-02-14', '0219680212', 'Đồng Nai', 'Mẹ'),
('052201010829', 'Kỳ', 'Đặng Châu', '1969-12-09', '0219691299', 'Đồng Nai', 'Cha'),
('083201008742', 'Bình', 'Võ Hữu', '1985-06-10', '0219850611', 'Vĩnh Long', 'Cha'),
('025303001517', 'Liên', 'Lê Thị', '1979-09-25', '0219790923', 'Hồ Chí Minh', 'Mẹ'),
('095201002519', 'Minh', 'Nguyễn Thanh', '1975-07-22', '0219750222', 'Quảng Nam', 'Cha'),
('025303001622', 'Hoa', 'Trần Thị', '1982-04-28', '0219820424', 'Hải Phòng', 'Mẹ'),

('025303001515', 'Đông', 'Nguyễn Phương', '1978-11-28', '0219781121', 'Hà Nội', 'Cha'),
('025303001516', 'Linh', 'Lê Văn', '1975-03-15', '0219750312', 'Tiền Giang', 'Mẹ'),
('083203001517', 'Tâm', 'Phạm Thanh', '1977-12-01', '0219771200', 'Cần Thơ', 'Mẹ'),
('052201010618', 'Vương', 'Nguyễn Thế', '1979-05-18', '0219790512', 'Long An', 'Cha'),
('083201008719', 'Hồng', 'Lê Thị', '1975-10-09', '0219751099', 'Vũng Tàu', 'Mẹ'),
('083203001720', 'Hồng', 'Lê Thị Thanh', '1975-10-09', '0219741009', 'Vũng Tàu', 'Mẹ'),
('052201010921', 'Ngân', 'Lê Kim', '1975-10-09', '0219751209', 'Vũng Tàu', 'Mẹ'),
('052201010922', 'Hường', 'Thái Thị', '1975-10-09', '0219451009', 'Vũng Tàu', 'Mẹ'),
('052201010923', 'Thoa', 'Trần Kim', '1975-10-09', '0219761009', 'Vũng Tàu', 'Mẹ'),
('052201010925', 'Bích', 'Lương Thị', '1975-10-09', '0219251009', 'Vũng Tàu', 'Mẹ'),
('025303001526', 'Kim', 'Trần Thị', '1975-10-09', '0219752209', 'Vũng Tàu', 'Mẹ'),
('025303001527', 'Thảo', 'Nguyễn Thu', '1978-07-02', '0219870702', 'Bà Rịa - Vũng Tàu', 'Mẹ'),

('095201002828', 'Nga', 'Lê Thị Hằng', '1981-10-30', '0219811003', 'Bến Tre', 'Mẹ'),
('083201008829', 'Tâm', 'Nguyễn Thị Thanh', '1977-11-09', '0219771108', 'Bến Tre', 'Mẹ'),
('083201008830', 'Thắm', 'Lê Thị', '1968-02-14', '0219680214', 'Đồng Nai', 'Mẹ'),
('083201008831', 'Nhàn', 'Đặng Thanh', '1969-12-09', '0219691209', 'Đồng Nai', 'Cha'),
('095201002932', 'Danh', 'Võ Thành', '1985-06-10', '0219850610', 'Vĩnh Long', 'Cha'),
('052201010833', 'Liên', 'Lê Kim', '1979-09-25', '0219790925', 'Hồ Chí Minh', 'Mẹ'),
('083201008734', 'Minh', 'Nguyễn Thành', '1975-07-22', '0219750722', 'Quảng Nam', 'Cha'),
('025303001535', 'Hòa', 'Trần Thị', '1982-04-28', '0219820428', 'Hải Phòng', 'Mẹ'),
('083201008836', 'Vinh', 'Nguyễn Phương', '1978-11-28', '0219781128', 'Hà Nội', 'Cha'),
('095201002537', 'Lan', 'Lê Văn', '1975-03-15', '0219750315', 'Tiền Giang', 'Mẹ'),

('025303001538', 'Tâm', 'Phạm Thị', '1977-12-01', '0219771201', 'Cần Thơ', 'Mẹ'),
('025303001539', 'Hoàng', 'Nguyễn Thế', '1979-05-18', '0219790518', 'Long An', 'Cha'),
('083203001518', 'Vinh', 'Lê Thế', '1975-10-09', '0219751009', 'Vũng Tàu', 'Cha'),
('052201010620', 'Sơn', 'Trần Thái', '1975-10-09', '0219751008', 'Vũng Tàu', 'Cha'),
('083201008721', 'Trí', 'Lê Hữu', '1975-10-09', '0219751007', 'Vũng Tàu', 'Cha'),
('025303001640', 'Trọng', 'Trần Bình', '1975-10-09', '0219751006', 'Vũng Tàu', 'Cha'),
('083203001723', 'Hữu', 'Lưu Bích', '1975-10-09', '0219751005', 'Vũng Tàu', 'Mẹ'),
('083203001724', 'Lệ', 'Lê Thị', '1975-10-09', '0219751004', 'Vũng Tàu', 'Mẹ'),
('083203001725', 'Hồng', 'Vũ Thị', '1975-10-09', '0219751003', 'Vũng Tàu', 'Mẹ'),
('095201002824', 'Thu', 'Nguyễn', '1978-07-02', '0219780702', 'Bà Rịa - Vũng Tàu', 'Mẹ');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT ROOM
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO ROOM(Room_ID, Status, Bname, Room_type_ID, Leader_ID)
VALUES
('1101', 'F', 'AH1', '21', '083203001513'),
('1102', 'F', 'AH1', '21', '095201002925'),
('1201', 'F', 'AH1', '21', '083201008742'),
('1202', 'F', 'AH1', '21', '095201002519'),
('2101', 'F', 'AH2', '61', '025303001515'),
('2102', 'F', 'AH2', '60', '052201010921'),
('3101', 'A', 'AG3', '80', '095201002828'),
('3102', 'F', 'AG3', '40', '083201008734'),
('4101', 'F', 'AG4', '40', '025303001538'),
('4102', 'A', 'AG4', '41', '083201008721'),
('4103', 'A', 'AG4', '41', '083203001724');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT ROOM_TYPE
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO ROOM_TYPE(Room_type_ID, Room_type_name, Max_student, Cost)
VALUES
('21', 'Phòng 2 người dịch vụ', 2, 600000),
('60', 'Phòng 6 người không dịch vụ', 6, 250000),
('61', 'Phòng 6 người dịch vụ', 6, 350000),
('80', 'Phòng 8 người không dịch vụ', 8, 150000),
('41', 'Phòng 4 người dịch vụ', 4, 450000),
('40', 'Phòng 4 người không dịch vụ', 4, 300000);
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT STAFF
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO STAFF(CCCD_number, Job, Super_CCCD_number)
VALUES
('012096001513', 'Bảo vệ', '080087001513'),
('077099001513', 'Bảo vệ', '025099001513'),
('083204001513', 'Bảo vệ', '083196001513'),
('083098001513', 'Bảo vệ', '080080001513'),
('092085001513', 'Lao công', '080087001513'),
('038094001513', 'Lao công', '080087001513'),
('065088001513', 'Lao công', '025099001513'),
('077096001513', 'Lao công', '025099001513'),
('063094001513', 'Lao công', '083196001513'),
('087205001513', 'Lao công', '083196001513'),
('060080001513', 'Lao công', '080080001513'),
('093098001513', 'Lao công', '080080001513');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT STUDENT
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO STUDENT(CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Phone, Email, Avatar, Bank_name, Bank_number, Address, Status)
VALUES
('083203001513', '2021-04-10', 'Nhân', 'Trần Thiện', '2003-10-30', 'M', 'Không', 'Kinh', '0120031030', 'NhanBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/656451.jpg', 'OCB', '8020031030', 'Bến Tre', 'Đang ở'),
('083203001514', '2021-04-10', 'Tân', 'Nguyễn Thái', '2003-11-07', 'M', 'Không', 'Kinh', '0120031107', 'TanBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/658020.jpg', 'OCB', '8020031107', 'Bến Tre', 'Đang ở'),
('095201002925', '2021-08-14', 'Linh', 'Phạm Nhật', '2001-02-04', 'M', 'Không', 'Kinh', '0911997511', 'Phamnhatlinh0911997515@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/170835.jpg', 'OCB', '8000731001', 'Bạc Liêu', 'Đang ở'),
('052201010829', '2022-09-22', 'Hùng', 'Phan Văn', '2001-01-03', 'M', 'Không', 'Kinh', '0911997512', 'hung.phanpvh0301@hcmut.edu.vn', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/660616.jpg', 'Agribank', '8061002052', 'Khánh Hòa', 'Đang ở'),
('083201008742', '2021-05-04', 'Phú', 'Nguyễn Thanh', '2002-02-02', 'M', 'Không', 'Kinh', '0868854613', 'phu.nguyen02022001@hcmut.edu.vn', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/034205011193.jpg', 'MB', '8012225663', 'Bến Tre', 'Đang ở'),
('025303001517', '2021-04-10', 'Anh', 'Võ Hữu', '2003-05-20', 'M', 'Không', 'Kinh', '0120030514', 'AnhVH@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/54203002733.jpg', 'ACB', '8020030524', 'Vĩnh Long', 'Đang ở'),
('095201002519', '2021-08-14', 'Đức', 'Nguyễn Thành', '2001-07-12', 'M', 'Không', 'Kinh', '0912998815', 'DucNguyen@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/064205000507.jpg', 'Techcombank', '8001234565', 'Quảng Nam', 'Đang ở'),
('025303001622', '2021-04-10', 'Nam', 'Lê Văn', '2003-06-25', 'M', 'Không', 'Kinh', '0120030616', 'NamLV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/077204003301.jpg', 'Vietinbank', '8020030626', 'Tiền Giang', 'Đang ở'),

('025303001515', '2021-04-10', 'Yến', 'Lìu Ngọc', '2003-01-01', 'F', 'Không', 'Hoa', '0120030117', 'YenBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/644698.jpg', 'OCB', '8020030102', 'Đồng Nai', 'Đang ở'),
('025303001516', '2021-04-10', 'My', 'Lê Phạm Hoàng', '2003-12-14', 'F', 'Không', 'Kinh', '0120031218', 'MyNV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/659111.jpg', 'OCB', '8020031213', 'Đồng Nai', 'Đang ở'),
('083203001517', '2021-04-10', 'Hương', 'Lê Thị', '2003-09-15', 'F', 'Không', 'Kinh', '0120030919', 'HuongLe@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/038305025344.jpg', 'Vietcombank', '8020030913', 'TP. Hồ Chí Minh', 'Đang ở'),
('052201010618', '2022-09-22', 'Thảo', 'Trần Thị', '2002-04-08', 'F', 'Không', 'Kinh', '0912003020', 'ThaoTran@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/630069.jpg', 'BIDV', '8062003041', 'Hải Phòng', 'Đang ở'),
('083201008719', '2021-05-04', 'Điệp', 'Nguyễn Phương', '2002-11-18', 'F', 'Không', 'Kinh', '0868888821', 'DiepNP@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/074305001855.jpg', 'Sacombank', '8029999999', 'Hà Nội', 'Đang ở'),
('083203001720', '2021-06-01', 'Loan', 'Phạm Thị', '2003-03-14', 'F', 'Không', 'Kinh', '0120030322', 'LoanPT@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/53.jpg', 'HSBC', '8020030315', 'Cần Thơ', 'Đang ở'),
('052201010921', '2022-10-22', 'Ngân', 'Lê Kim', '2001-09-01', 'F', 'Không', 'Kinh', '0912001123', 'NganLe@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/038302016745.jpg', 'ANZ', '8062001120', 'Cần Thơ', 'Đang ở'),
('052201010922', '2022-09-22', 'Nga', 'Hoàng Thuý', '2001-09-01', 'F', 'Không', 'Kinh', '0912001124', 'Nga@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/340.jpg', 'ANZ', '8062001121', 'TP. Hồ Chí Minh', 'Đang ở'),
('052201010923', '2022-12-22', 'Ngọc', 'Trần Lê Kim', '2001-09-01', 'F', 'Không', 'Kinh', '0912001125', 'Ngoc@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/092305006578.jpg', 'ANZ', '8062001122', 'Lâm Đồng', 'Đang ở'),
('052201010925', '2022-11-23', 'Phụng', 'Võ Thị', '2001-09-01', 'F', 'Không', 'Kinh', '0912001122', 'Phung@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/633043.jpg', 'ANZ', '8062001123', 'Lâm Đồng', 'Đang ở'),
('025303001526', '2021-04-18', 'Trúc', 'Lê Thanh', '2003-01-01', 'F', 'Không', 'Hoa', '0120001026', 'TrucBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/632923.jpg', 'OCB', '8020030100', 'Đồng Nai', 'Đang ở'),
('025303001527', '2021-01-03', 'Thanh', 'Lê Trúc', '2003-12-14', 'F', 'Không', 'Kinh', '0120031227', 'ThanhNV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/051305009904.jpg', 'OCB', '8020031212', 'Đồng Nai', 'Đang ở'),

('095201002828', '2021-08-22', 'Ngọc', 'Nguyễn Thế', '2001-10-09', 'M', 'Không', 'Kinh', '0912997628', 'MinhNT@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/648637.jpg', 'Standard Chartered', '8009876543', 'Long An', 'Đang ở'),
('083201008829', '2021-07-07', 'Tùng', 'Nguyễn Minh', '2002-08-27', 'M', 'Không', 'Kinh', '0868777629', 'TungNM@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/086205004782.jpg', 'Shinhan Bank', '8112333444', 'Bà Rịa - Vũng Tàu', 'Đang ở'),
('083203001530', '2021-07-03', 'Hiểu', 'Trần Thế', '2003-10-30', 'M', 'Không', 'Kinh', '0120031032', 'HieuBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/628913.jpg', 'OCB', '8020031031', 'Bến Tre', 'Đang ở'),
('083203001531', '2021-04-01', 'Thời', 'Nguyễn Thái', '2003-11-07', 'M', 'Không', 'Kinh', '0120031102', 'Thoi@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/629058.jpg', 'OCB', '8020031109', 'Bến Tre', 'Đang ở'),
('095201002932', '2021-08-14', 'Tân', 'Phạm Nhật', '2001-02-04', 'M', 'Không', 'Kinh', '0911997513', 'Phamnhattan0911997515@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/663312.jpg', 'OCB', '8000731000', 'Bạc Liêu', 'Đang ở'),
('052201010833', '2022-09-22', 'Vũ', 'Phan Văn', '2001-01-03', 'M', 'Không', 'Kinh', '0911997515', 'vu.phanpvh0301@hcmut.edu.vn', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/654931.jpg', 'Agribank', '8061002055', 'Khánh Hòa', 'Đang ở'),
('083201008734', '2021-05-04', 'Liêm', 'Nguyễn Thanh', '2002-02-02', 'M', 'Không', 'Kinh', '0868854632', 'liem.nguyen02022001@hcmut.edu.vn', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/056205000367.jpg', 'MB', '8012225667', 'Bến Tre', 'Đang ở'),
('025303001535', '2021-04-30', 'Tài', 'Võ Hữu', '2003-05-20', 'M', 'Không', 'Kinh', '0120030520', 'TaiVH@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/630148.jpg', 'ACB', '8020030520', 'Nghệ An', 'Đang ở'),
('083201008836', '2021-05-04', 'Mẫn', 'Nguyễn Minh', '2002-08-27', 'M', 'Không', 'Kinh', '0868777666', 'ManNM@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/630544.jpg', 'Shinhan Bank', '8012333444', 'Bà Rịa - Vũng Tàu', 'Đang ở'),
('095201002537', '2021-08-17', 'Tài', 'Nguyễn Thành', '2001-07-12', 'M', 'Không', 'Kinh', '0912998822', 'TaiNguyen@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/657512.jpg', 'Techcombank', '8001234567', 'Quảng Nam', 'Đang ở'),

('025303001538', '2021-04-16', 'Ngà', 'Lã Ngọc', '2003-01-01', 'F', 'Không', 'Hoa', '0120030101', 'NgaBK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/631882.jpg', 'OCB', '8020030101', 'Đồng Nai', 'Đang ở'),
('025303001539', '2021-07-12', 'Na', 'Lê', '2003-12-14', 'F', 'Không', 'Kinh', '0120031214', 'NaNV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/631796.jpg', 'OCB', '8020031214', 'Đồng Nai', 'Đang ở'),
('083203001518', '2021-06-10', 'Hương', 'Lê Thanh', '2003-09-15', 'F', 'Không', 'Kinh', '0120030915', 'HuongNV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/631846.jpg', 'Vietcombank', '8020030915', 'Hồ Chí Minh', 'Đang ở'),
('052201010620', '2022-09-22', 'Thảo', 'Trần Thanh', '2002-04-08', 'F', 'Không', 'Kinh', '0912003040', 'ThaoNV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/631613.jpg', 'BIDV', '8062003040', 'Hải Phòng', 'Đang ở'),
('083201008721', '2021-05-04', 'Khánh', 'Nguyễn Phương', '2002-11-18', 'F', 'Không', 'Kinh', '0868888888', 'KhanhNP@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/644391.jpg', 'Sacombank', '8019999999', 'Hà Nội', 'Đang ở'),
('025303001640', '2021-06-06', 'Nhàn', 'Lê Thanh', '2003-06-25', 'F', 'Không', 'Kinh', '0120030625', 'NhanLV@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/070305005516.jpg', 'Vietinbank', '8020030625', 'Tiền Giang', 'Đang ở'),
('083203001723', '2021-04-11', 'Linh', 'Phạm Thị', '2003-03-14', 'F', 'Không', 'Kinh', '0120030314', 'LinhPT@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/50513040118783.jpg', 'HSBC', '8020030314', 'Cần Thơ', 'Đang ở'),
('083203001724', '2021-05-10', 'Hoa', 'Trương Thiên', '2003-03-14', 'F', 'Không', 'Kinh', '0120030314', 'HoaTT@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/068305003270.jpg', 'HSBC', '8020030315', 'Cần Thơ', 'Đang ở'),
('083203001725', '2021-04-10', 'Ánh', 'Trịnh Ngọc', '2003-03-14', 'F', 'Không', 'Kinh', '0120030314', 'AnhTN@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/079305021038.jpg', 'HSBC', '8020030316', 'Cần Thơ', 'Đang ở'),
('095201002824', '2021-08-14', 'Anh', 'Nguyễn Kiều', '2001-10-09', 'F', 'Không', 'Kinh', '0912997654', 'AnhNK@gmail.com', 'http://svktx.vnuhcm.edu.vn:8010/Data/HinhSV/200356.jpg', 'Standard Chartered', '8009876545', 'Long An', 'Đang ở');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT STUDIES_IN
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO STUDIES_IN(CCCD_number, Student_ID, Uni_ID, Department)
VALUES
('083203001513', '12111913', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001514', '12112256', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('095201002925', '12111120', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010829', '12111121', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083201008742', '12111122', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001517', '12111123', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('095201002519', '12111124', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001622', '12111125', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),

('025303001515', '52111126', '5', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001516', '52111128', '5', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001517', '52111118', '5', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010618', '42111128', '4', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083201008719', '42211128', '4', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001720', '42221128', '4', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010921', '32111128', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010922', '32211128', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010923', '22111128', '2', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010925', '22011128', '2', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001526', '12111118', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001527', '22222256', '2', 'Khoa Ngôn ngữ Ý'),

('095201002828', '22111914', '2', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083201008829', '32112255', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001530', '22111128', '2', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001531', '12111128', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('095201002932', '52111128', '5', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010833', '52211128', '5', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083201008734', '42011128', '4', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001535', '32211128', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083201008836', '22311128', '2', 'Khoa Khoa học và Kĩ thuật máy tính'),
('095201002537', '32131128', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),

('025303001538', '12111110', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001539', '12311128', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001518', '12211128', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('052201010620', '12111328', '1', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083201008721', '32114128', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('025303001640', '32121128', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001723', '32112268', '3', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001724', '42111155', '4', 'Khoa Khoa học và Kĩ thuật máy tính'),
('083203001725', '42311128', '4', 'Khoa Khoa học và Kĩ thuật máy tính'),
('095201002824', '52222256', '5', 'Khoa Ngôn ngữ Ý');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT UNIVERSITY
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO UNIVERSITY(Uni_ID, Name, Uni_Email, Uni_phone)
VALUES
('1', 'Trường Đại học Bách Khoa', 'BK@edu.vn', '0421000000'),
('2', 'Trường Đại học Khoa học Xã hội và Nhân văn', 'NV@edu.vn', '0422000000'),
('3', 'Trường Đại học Công nghệ Thông tin', 'IT@edu.vn', '0423000000'),
('4', 'Trường Đại học Khoa học Tự nhiên', 'US@edu.vn', '0424000000'),
('5', 'Trường Đại học Quốc tế', 'IU@edu.vn', '0425000000');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT UNI_ADDRESS
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO UNI_ADDRESS(Uni_ID, Uni_address)
VALUES
('1', '21, Đông Hoà, Dĩ An, Bình Dương'),
('2', '22, Đông Hoà, Dĩ An, Bình Dương'),
('3', '23, Đông Hoà, Dĩ An, Bình Dương'),
('4', '24, Đông Hoà, Dĩ An, Bình Dương'),
('5', '25, Đông Hoà, Dĩ An, Bình Dương');
SET FOREIGN_KEY_CHECKS = 1;

--
-- INSERT WARNING
--

SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO WARNING(Date, Detail, Note, Mgr_ID, Type)
VALUES
('2022-12-31', 'Cảnh cáo về trễ', 'lần 1', '080087001513', 'Cảnh cáo'),
('2022-12-31', 'Cảnh cáo về trễ', 'lần 2', '080087001513', 'Cảnh cáo'),
('2022-12-31', 'Cảnh cáo về trễ', 'lần 1', '025099001513', 'Cảnh cáo'),
('2022-12-31', 'Cảnh cáo về trễ', 'lần 2', '025099001513', 'Cảnh cáo');
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
('083098001513', '2022-01-01', NULL, 'AG4'),
('092085001513', '2022-01-01', NULL, 'AH1'),
('038094001513', '2022-01-01', NULL, 'AH1'),
('065088001513', '2022-01-01', NULL, 'AH2'),
('077096001513', '2022-01-01', NULL, 'AH2'),
('063094001513', '2022-01-01', NULL, 'AG3'),
('087205001513', '2022-01-01', NULL, 'AG3'),
('060080001513', '2022-01-01', NULL, 'AG4'),
('093098001513', '2022-01-01', NULL, 'AG4');
SET FOREIGN_KEY_CHECKS = 1;