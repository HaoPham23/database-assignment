ALTER TABLE ROOM ADD COLUMN student_count INT;

DELIMITER //
USE chetcom //
CREATE TRIGGER UpdateStudentCount
    AFTER INSERT
    ON LIVES_IN
    FOR EACH ROW
BEGIN
    DECLARE v_student_count INT;
    DECLARE v_room_id VARCHAR(5);

    SET v_room_id = NEW.Room_ID;

    SET v_student_count = (
        SELECT COUNT(*)
        FROM LIVES_IN
        WHERE Room_ID = v_room_id
    );

    UPDATE ROOM
    SET status = CASE
            WHEN v_student_count > 0 THEN 'A'
            ELSE 'F'
        END,
        student_count = v_student_count
    WHERE Room_ID = v_room_id;
END //

CREATE TRIGGER UpdateStudentCount
    AFTER DELETE
    ON LIVES_IN
    FOR EACH ROW
BEGIN
    DECLARE v_student_count INT;
    DECLARE v_room_id VARCHAR(5);

    SET v_room_id = OLD.Room_ID;

    SET v_student_count = (
        SELECT COUNT(*)
        FROM LIVES_IN
        WHERE Room_ID = v_room_id
    );

    UPDATE ROOM
    SET status = CASE
            WHEN v_student_count > 0 THEN 'A'
            ELSE 'F'
        END,
        student_count = v_student_count
    WHERE Room_ID = v_room_id;
END //

CREATE TRIGGER UpdateStudentCount
    AFTER UPDATE
    ON LIVES_IN
    FOR EACH ROW
BEGIN
    DECLARE v_student_count INT;
    DECLARE v_room_id VARCHAR(5);

    SET v_room_id = NEW.Room_ID;

    UPDATE ROOM
    SET status = CASE
            WHEN v_student_count > 0 THEN 'A'
            ELSE 'F'
        END,
        student_count = v_student_count
    WHERE Room_ID = v_room_id;
END //
DELIMITER ;