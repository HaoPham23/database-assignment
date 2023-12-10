USE chetcom;
DROP FUNCTION IF EXISTS FindStudentsInMonth;
DROP FUNCTION IF EXISTS CalculateExpensesForBuildingMonth;
DELIMITER //
USE chetcom //
CREATE FUNCTION FindStudentsInMonth(p_Month INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE v_result VARCHAR(255);
    DECLARE v_done BOOLEAN DEFAULT FALSE;
    DECLARE v_student_id VARCHAR(12);
    DECLARE v_student_name VARCHAR(100);
    DECLARE v_student_dob DATE;

    -- Create iterate
    DECLARE student_cursor CURSOR FOR
        SELECT CCCD_number, CONCAT(Lname, ' ', Fname) AS Fullname, DOB
        FROM STUDENT;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;

    SET v_result = '';

    OPEN student_cursor;

    student_loop: LOOP
        SET v_done = FALSE;

        -- Iterating over student
        FETCH student_cursor INTO v_student_id, v_student_name, v_student_dob;

        -- Check rows
        IF v_done THEN
            LEAVE student_loop;
        END IF;

        -- Check month
        IF MONTH(v_student_dob) = p_Month THEN
            SET v_result = CONCAT(v_result, 'Student ID: ', v_student_id, ', Name: ', v_student_name, ', DOB: ', v_student_dob, '\n');
        END IF;
    END LOOP;

    CLOSE student_cursor;

    RETURN v_result;
END //

CREATE FUNCTION CalculateExpensesForBuildingMonth(p_Bname VARCHAR(50), p_Month INT)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE v_total_expenses DECIMAL(10, 2) DEFAULT 0;
    DECLARE v_room_id VARCHAR(5);
    DECLARE v_expense DECIMAL(10, 2);

    DECLARE v_done BOOLEAN DEFAULT FALSE;

    -- Create iterate
    DECLARE room_cursor CURSOR FOR
        SELECT Room_ID
        FROM ROOM
        WHERE Bname = p_Bname;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;

    OPEN room_cursor;

    -- Start the loop
    room_loop: LOOP
        SET v_done = FALSE;
        
        -- Iterating over room
        FETCH room_cursor INTO v_room_id;

        -- Check rows
        IF v_done THEN
            LEAVE room_loop;
        END IF;

        -- Calculate expenses for the month
        SELECT IFNULL(SUM(Amount), 0)
        INTO v_expense
        FROM BILL B
        LEFT JOIN STUDENT S ON B.Student_ID = S.CCCD_number 
        RIGHT JOIN LIVES_IN L ON S.CCCD_number = L.Student_ID AND L.Room_ID = v_room_id
        WHERE MONTH(B.Date_issue) = p_Month;

        SET v_total_expenses = v_total_expenses + v_expense;
    END LOOP;

    CLOSE room_cursor;

    RETURN v_total_expenses;
END//
DELIMITER ;

SELECT CalculateExpensesForBuildingMonth('AG4', 6);