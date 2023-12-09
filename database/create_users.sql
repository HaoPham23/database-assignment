DROP USER IF EXISTS 'admin_ktx'@'localhost';
CREATE USER 'admin_ktx'@'localhost' IDENTIFIED BY 'admin_ktx';
GRANT ALL PRIVILEGES on chetcom.* TO 'admin_ktx'@'localhost';