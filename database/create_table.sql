-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
-- SET time_zone = "+00:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;

--
-- Database: CHETCOM
--

CREATE DATABASE IF NOT EXISTS CHETCOM;
USE CHETCOM;

-- --------------------------------------------------------

--
-- Table structure for table BE_WARNED
--

CREATE TABLE BE_WARNED (
  Warn_ID INT(10) NOT NULL AUTO_INCREMENT,
  Student_ID VARCHAR(12) CHECK (Student_ID REGEXP '^[0-9]{12}$'),
  PRIMARY KEY (Warn_ID, Student_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table BILL
--

CREATE TABLE BILL (
  Bill_ID INT(10) NOT NULL AUTO_INCREMENT,
  Detail VARCHAR(100),
  Amount INT,
  Date_paid DATE,
  Date_issue DATE,
  Date_expire DATE,
  Mgr_ID VARCHAR(12) CHECK (Mgr_ID REGEXP '^[0-9]{12}$'),
  Student_ID VARCHAR(12) CHECK (Student_ID REGEXP '^[0-9]{12}$'), 
  PRIMARY KEY (Bill_ID),
  CHECK (Date_issue < Date_expire)
);

-- --------------------------------------------------------

--
-- Table structure for table BUILDING
--

CREATE TABLE BUILDING (
  Name VARCHAR(100),
  Status CHAR CHECK (Status = 'A' OR Status = 'F' OR Status = 'R'), -- Available, Full, Repairing
  Mgr_ID VARCHAR(12) CHECK (Mgr_ID REGEXP '^[0-9]{12}$'),
  PRIMARY KEY (Name)
);

-- --------------------------------------------------------

--
-- Table structure for table EMPLOYEE
--

CREATE TABLE EMPLOYEE (
  CCCD_number VARCHAR(12) CHECK (CCCD_number REGEXP '^[0-9]{12}$'),
  CCCD_date DATE,
  Fname VARCHAR(100),
  Lname VARCHAR(100),
  DOB DATE,
  Sex CHAR CHECK (Sex = 'M' OR Sex = 'F'),
  Religion VARCHAR(10),
  Ethnicity VARCHAR(10),
  Email VARCHAR(100),
  Phone VARCHAR(10),
  Address VARCHAR(100),
  Bname VARCHAR(10),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table LIVES_IN
--

CREATE TABLE LIVES_IN (
  Student_ID VARCHAR(12) CHECK (Student_ID REGEXP '^[0-9]{12}$'),
  Date_in DATE,
  Date_out DATE,
  Room_ID VARCHAR(4) CHECK (Room_ID REGEXP '^[1-4][0-9]{3}$'),
  PRIMARY KEY (Student_ID, Date_in),
  CHECK (Date_out IS NULL OR Date_in < Date_out)
);

-- --------------------------------------------------------

--
-- Table structure for table MANAGER
--

CREATE TABLE MANAGER (
  CCCD_number VARCHAR(12) CHECK (CCCD_number REGEXP '^[0-9]{12}$'),
  Mgr_start_date DATE,
  High_Mgr VARCHAR(12) CHECK (High_Mgr REGEXP '^[0-9]{12}$'), -- CCCD Of High Mgr
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table NOTIFICATION
--

CREATE TABLE NOTIFICATION (
  ID INT(10) NOT NULL AUTO_INCREMENT,
  Title VARCHAR(100),
  Content VARCHAR(100),
  Date DATE,
  Mgr_ID VARCHAR(12) CHECK (Mgr_ID REGEXP '^[0-9]{12}$'),
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table RELATIVE
--

CREATE TABLE RELATIVE (
  Student_ID VARCHAR(12) CHECK (Student_ID REGEXP '^[0-9]{12}$'),
  Fname VARCHAR(10),
  Lname VARCHAR(100),
  DOB DATE,
  Phone VARCHAR(10),
  Address VARCHAR(100),
  Relationship VARCHAR(10),
  PRIMARY KEY (Fname, Lname, Student_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table ROOM
--

CREATE TABLE ROOM (
  Room_ID VARCHAR(4) CHECK (Room_ID REGEXP '^[1-4][0-9]{3}$'),
  Status CHAR CHECK (Status = 'A' OR Status = 'F' OR Status = 'R'),
  Bname VARCHAR(100),
  Room_type_ID VARCHAR(2) CHECK (Room_type_ID REGEXP '^[2-8][0-1]$'),
  Leader_ID VARCHAR(12) CHECK (Leader_ID REGEXP '^[0-9]{12}$'),
  PRIMARY KEY (Room_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table ROOM_TYPE
--

CREATE TABLE ROOM_TYPE (
  Room_type_ID VARCHAR(2) CHECK (Room_type_ID REGEXP '^[2-8][0-1]$'),
  Room_type_name VARCHAR(100),
  Max_student INT,
  Cost INT,
  PRIMARY KEY (Room_type_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table STAFF
--

CREATE TABLE STAFF (
  CCCD_number VARCHAR(12) CHECK (CCCD_number REGEXP '^[0-9]{12}$'),
  Job VARCHAR(100),
  Super_CCCD_number VARCHAR(12) CHECK (Super_CCCD_number REGEXP '^[0-9]{12}$'),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table STUDENT
--

CREATE TABLE STUDENT (
  CCCD_number VARCHAR(12) CHECK (CCCD_number REGEXP '^[0-9]{12}$'),
  CCCD_date DATE,
  Fname VARCHAR(10),
  Lname VARCHAR(100),
  DOB DATE,
  Sex CHAR CHECK (Sex = 'M' OR Sex = 'F'),
  Religion VARCHAR(100),
  Ethnicity VARCHAR(100),
  Phone VARCHAR(10),
  Email VARCHAR(100),
  Avatar VARCHAR(100),
  Bank_name VARCHAR(100),
  Bank_number VARCHAR(10),
  Address VARCHAR(100),
  Status VARCHAR (100),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table STUDIES_IN
--

CREATE TABLE STUDIES_IN (
  CCCD_number VARCHAR(12) CHECK (CCCD_number REGEXP '^[0-9]{12}$'),
  Student_ID VARCHAR(8) CHECK (Student_ID REGEXP '^[1-5][0-9]{7}$'),
  Uni_ID VARCHAR(1) CHECK (Uni_ID REGEXP '^[1-5]$'),
  Department VARCHAR(100),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table UNIVERSITY
--

CREATE TABLE UNIVERSITY (
  Uni_ID VARCHAR(1) CHECK (Uni_ID REGEXP '^[1-5]$'),
  Name VARCHAR(100),
  Uni_Email VARCHAR(100),
  Uni_phone VARCHAR(10),
  PRIMARY KEY (Uni_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table UNI_ADDRESS
--

CREATE TABLE UNI_ADDRESS (
  Uni_ID VARCHAR(1) CHECK (Uni_ID REGEXP '^[1-5]$'),
  Uni_address VARCHAR(100),
  PRIMARY KEY (Uni_ID, Uni_address)
);

-- --------------------------------------------------------

--
-- Table structure for table WARNING
--

CREATE TABLE WARNING (
  ID INT(10) NOT NULL AUTO_INCREMENT,
  Date DATE,
  Detail VARCHAR(100),
  Note VARCHAR(100),
  Mgr_ID VARCHAR(12) CHECK (Mgr_ID REGEXP '^[0-9]{12}$'),
  Type VARCHAR(100),
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------
--
-- Table structure for table WORK_IN
--

CREATE TABLE WORK_IN (
  Employee_ID VARCHAR(12) CHECK (Employee_ID REGEXP '^[0-9]{12}$'),
  Date_in DATE,
  Date_out DATE,
  Bname VARCHAR(100),
  PRIMARY KEY (Employee_ID, Date_in),
  CHECK (Date_out IS NULL OR Date_in < Date_out)
);

-- ALTER TABLE --
-- ADD CONSTRAINT--

ALTER TABLE BE_WARNED
  AUTO_INCREMENT = 1;

ALTER TABLE BE_WARNED  
  ADD CONSTRAINT fk_be_warned_Stu_CCCD FOREIGN KEY (Student_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE BE_WARNED 
  ADD CONSTRAINT fk_be_warned_ID FOREIGN KEY (Warn_ID) REFERENCES WARNING(ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE BILL
  AUTO_INCREMENT = 1;

ALTER TABLE BILL 
  ADD CONSTRAINT fk_bill_Stu_CCCD FOREIGN KEY (Student_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE BILL 
  ADD CONSTRAINT fk_bill_Mgr_CCCD FOREIGN KEY (Mgr_ID) REFERENCES MANAGER(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE BUILDING 
  ADD CONSTRAINT fk_building_Mgr_CCCD FOREIGN KEY (Mgr_ID) REFERENCES MANAGER(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE LIVES_IN
  ADD CONSTRAINT fk_lives_in_Stu_CCCD FOREIGN KEY (Student_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE LIVES_IN
  ADD CONSTRAINT fk_lives_in_room_ID FOREIGN KEY (Room_ID) REFERENCES ROOM(Room_ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE MANAGER
  ADD CONSTRAINT fk_manager_Mgr_CCCD FOREIGN KEY (High_Mgr) REFERENCES MANAGER(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE MANAGER
  ADD CONSTRAINT fk_manager_employee_CCCD FOREIGN KEY (CCCD_number) REFERENCES EMPLOYEE(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE NOTIFICATION
  AUTO_INCREMENT = 1;

ALTER TABLE NOTIFICATION
  ADD CONSTRAINT fk_notification_Mgr_CCCD FOREIGN KEY (Mgr_ID) REFERENCES MANAGER(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE RELATIVE 
  ADD CONSTRAINT fk_relative_Stu_CCCD FOREIGN KEY (Student_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE ROOM
  ADD CONSTRAINT fk_room_Stu_CCCD FOREIGN KEY (Leader_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE ROOM
  ADD CONSTRAINT fk_room_Bname FOREIGN KEY (Bname) REFERENCES BUILDING(Name)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE ROOM
  ADD CONSTRAINT fk_room_type_ID FOREIGN KEY (Room_type_ID) REFERENCES ROOM_TYPE(Room_type_ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE STAFF
  ADD CONSTRAINT fk_staff_Mgr_CCCD FOREIGN KEY (Super_CCCD_number) REFERENCES MANAGER(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE STAFF
  ADD CONSTRAINT fk_staff_employee_CCCD FOREIGN KEY (CCCD_number) REFERENCES EMPLOYEE(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE STUDIES_IN 
  ADD CONSTRAINT fk_studies_in_Stu_CCCD FOREIGN KEY (CCCD_number) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE STUDIES_IN 
  ADD CONSTRAINT fk_studies_in_Uni_ID FOREIGN KEY (Uni_ID) REFERENCES UNIVERSITY(Uni_ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE UNI_ADDRESS 
  ADD CONSTRAINT fk_uni_address_ID FOREIGN KEY (Uni_ID) REFERENCES UNIVERSITY(Uni_ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE WARNING
  AUTO_INCREMENT = 1;

ALTER TABLE WARNING 
  ADD CONSTRAINT fk_warning_CCCD FOREIGN KEY (Mgr_ID) REFERENCES MANAGER(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE WORK_IN 
  ADD CONSTRAINT fk_work_in_name FOREIGN KEY (Bname) REFERENCES BUILDING(Name)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE WORK_IN 
  ADD CONSTRAINT fk_work_in_CCCD FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;
