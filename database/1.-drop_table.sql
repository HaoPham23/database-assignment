SET FOREIGN_KEY_CHECKS = 0;

SELECT GROUP_CONCAT('DROP TABLE ', table_name, ';')
FROM information_schema.tables
WHERE table_schema = 'CHETCOM';

SET FOREIGN_KEY_CHECKS = 1;

-- Drop the database
DROP DATABASE IF EXISTS CHETCOM