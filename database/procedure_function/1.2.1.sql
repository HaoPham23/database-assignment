
DELIMITER //
USE chetcom //
CREATE PROCEDURE InsertStudent(
    IN p_CCCD_number VARCHAR(12),
    IN p_CCCD_date DATE,
    IN p_Fname VARCHAR(50),
    IN p_Lname VARCHAR(50),
    IN p_DOB DATE,
    IN p_Sex CHAR,
    IN p_Religion VARCHAR(50),
    IN p_Ethnicity VARCHAR(50),
    IN p_Phone VARCHAR(10),
    IN p_Email VARCHAR(50),
    IN p_Avatar VARCHAR(100),
    IN p_Bank_name VARCHAR(50),
    IN p_Bank_number VARCHAR(10),
    IN p_Address VARCHAR(100),
    IN p_Status VARCHAR (100)
)
BEGIN
    IF p_CCCD_number IS NULL OR p_CCCD_date IS NULL OR p_Fname IS NULL OR p_Lname IS NULL OR p_DOB IS NULL OR p_Sex IS NULL OR p_Religion IS NULL OR p_Ethnicity IS NULL OR p_Phone IS NULL OR p_Email IS NULL OR p_Bank_name IS NULL OR p_Bank_number IS NULL OR p_Address IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không được để trống bất kỳ trường nào trừ avatar và status!';
    END IF;
    IF EXISTS (SELECT 1 FROM STUDENT WHERE CCCD_number = p_CCCD_number) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Đã tồn tại định danh sinh viên!';
    END IF;
    IF TIMESTAMPDIFF(YEAR, p_DOB, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Sinh viên phải trên 18 tuổi!';
    END IF;

    IF NOT (p_CCCD_number REGEXP '^[0-9]{12}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng CCCD không hợp lệ!';
    END IF; 

    IF NOT (p_Sex = 'M' OR p_Sex = 'F') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Giới tính không hợp lệ!';
    END IF;

    IF NOT (p_Phone REGEXP '^0[1-9][0-9]{8}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng số điện thoại không hợp lệ!';
    END IF;

    IF LOCATE('@', p_Email) = 0 OR LOCATE('.', p_Email) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng email không hợp lệ!';
    END IF;

    IF NOT (p_Bank_number REGEXP '^80[0-9]{8}') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng số tài khoản ngân hàng không hợp lệ!';
    END IF;

    -- Thêm dữ liệu vào bảng nếu không có lỗi
    INSERT INTO STUDENT(CCCD_number, CCCD_date, Fname, Lname, DOB, Sex, Religion, Ethnicity, Phone, Email, Avatar, Bank_name, Bank_number, Address, Status)
    VALUES (p_CCCD_number, p_CCCD_date, p_Fname, p_Lname, p_DOB, p_Sex, p_Religion, p_Ethnicity, p_Phone, p_Email, p_Avatar, p_Bank_name, p_Bank_number, p_Address, p_Status);
END //

CREATE PROCEDURE DeleteStudent(IN p_CCCD_number VARCHAR(12))
BEGIN
    IF p_CCCD_number IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không được để trống vùng cccd!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM student WHERE CCCD_number = p_CCCD_number) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không tìm thấy sinh viên!';
    END IF;

    DELETE FROM STUDENT WHERE CCCD_number = p_CCCD_number;
    SELECT 'Xóa sinh viên thành công!' AS Result;
END //

CREATE PROCEDURE UpdateStudent(
    IN p_CCCD_number VARCHAR(12),
    IN p_CCCD_date DATE,
    IN p_Fname VARCHAR(50),
    IN p_Lname VARCHAR(50),
    IN p_DOB DATE,
    IN p_Sex CHAR,
    IN p_Religion VARCHAR(50),
    IN p_Ethnicity VARCHAR(50),
    IN p_Phone VARCHAR(10),
    IN p_Email VARCHAR(50),
    IN p_Avatar VARCHAR(100),
    IN p_Bank_name VARCHAR(50),
    IN p_Bank_number VARCHAR(10),
    IN p_Address VARCHAR(100),
    IN p_Status VARCHAR (100)
)
BEGIN
    IF p_CCCD_number IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không được để trống vùng cccd!';
    END IF;

    IF p_CCCD_date IS NULL OR p_Fname IS NULL OR p_Lname IS NULL OR p_DOB IS NULL OR p_Sex IS NULL OR p_Religion IS NULL OR p_Ethnicity IS NULL OR p_Phone IS NULL OR p_Email IS NULL OR p_Bank_name IS NULL OR p_Bank_number IS NULL OR p_Address IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không được để trống bất kỳ trường nào trừ avatar và status!';
    END IF;

    IF TIMESTAMPDIFF(YEAR, p_DOB, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Sinh viên phải trên 18 tuổi!';
    END IF;

    IF NOT (p_CCCD_number REGEXP '^[0-9]{12}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng CCCD không hợp lệ!';
    END IF; 

    IF NOT (p_Sex = 'M' OR p_Sex = 'F') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Giới tính không hợp lệ!';
    END IF;

    IF NOT (p_Phone REGEXP '^0[1-9][0-9]{8}$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng số điện thoại không hợp lệ!';
    END IF;

    IF LOCATE('@', p_Email) = 0 OR LOCATE('.', p_Email) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng email không hợp lệ!';
    END IF;

    IF NOT (p_Bank_number REGEXP '^80[0-9]{8}') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Định dạng số tài khoản ngân hàng không hợp lệ!';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM student WHERE CCCD_number = p_CCCD_number) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không tìm thấy sinh viên!';
    END IF;

    UPDATE student
    SET
        CCCD_date = p_CCCD_date,
        Fname = p_Fname,
        Lname = p_Lname,
        DOB = p_DOB,
        Sex = p_Sex,
        Religion = p_Religion,
        Ethnicity = p_Ethnicity,
        Phone = p_Phone,
        Email = p_Email,
        Avatar = p_Avatar,
        Bank_name = p_Bank_name,
        Bank_number = p_Bank_number,
        Address = p_Address,
        Status = p_Status
    WHERE CCCD_number = p_CCCD_number;

    SELECT 'Cập nhật sinh viên thành công!' AS Result;
END //
DELIMITER ;
