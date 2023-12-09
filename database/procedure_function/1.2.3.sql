-- Procedure(X) xuất ra danh sách sinh viên (Họ tên, DOB, avatar,...) thuộc phòng X, theo thứ tự ngày nhận phòng.
DELIMITER //
USE chetcom //
CREATE PROCEDURE PrintStudentListByDatein(IN p_Room_ID VARCHAR(5))
BEGIN
    IF p_Room_ID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không được để trống vùng mã phòng!';
    END IF;

    -- DECLARE studentIDList VARCHAR(12);

    SELECT * 
    FROM 
        STUDENT S 
    RIGHT JOIN
        LIVES_IN L ON L.Student_ID = S.CCCD_number
    WHERE
        L.Room_ID = p_Room_ID
    ORDER BY L.Date_in ASC;
    

    -- SELECT Student_ID INTO studentIDList
    -- FROM lives_in
    -- WHERE Room_ID = p_Room_ID
    -- ORDER BY Date_in ASC;

    -- SELECT *
    -- FROM student
    -- WHERE CCCD_number = studentIDList;
END //

CREATE PROCEDURE PrintGeneralInfo(IN p_Building_name VARCHAR(50))
BEGIN
    IF p_Building_name IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không được để trống vùng tên tòa!';
    END IF;

    SELECT
        R.Room_ID,
        R.Bname,
        COUNT(L.Student_ID) AS StudentCount,
        AVG(YEAR(NOW()) - YEAR(S.DOB)) AS AvgAge
    FROM
        ROOM R
    LEFT JOIN
        LIVES_IN L ON R.Room_ID = L.Room_ID
    LEFT JOIN
        STUDENT S ON L.Student_ID = S.CCCD_number
    WHERE
        R.Bname = p_Building_name
    GROUP BY
        R.Room_ID, R.Bname
    ORDER BY
        AvgAge ASC;
END //

DELIMITER ;