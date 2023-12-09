ALTER TABLE ROOM ADD COLUMN student_count INT DEFAULT 0;

DELIMITER //
USE chetcom //
CREATE TRIGGER UpdateStudentCountAfterInsert
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

CREATE TRIGGER UpdateStudentCountAfterDelete
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

CREATE TRIGGER UpdateStudentCountAfterUpdate
    AFTER UPDATE
    ON LIVES_IN
    FOR EACH ROW
BEGIN
    DECLARE v_old_room_id VARCHAR(5);
    DECLARE v_new_room_id VARCHAR(5);

    SET v_old_room_id = OLD.Room_ID;
    SET v_new_room_id = NEW.Room_ID;

    IF v_old_room_id IS NOT NULL THEN
        UPDATE ROOM
        SET student_count = student_count - 1
        WHERE Room_ID = v_old_room_id;
    END IF;

    UPDATE ROOM
    SET student_count = student_count + 1
    WHERE Room_ID = v_new_room_id;

    UPDATE ROOM
    SET status = CASE
            WHEN student_count > 0 THEN 'A'
            ELSE 'F'
        END
    WHERE Room_ID IN (v_old_room_id, v_new_room_id);
END //
DELIMITER ;