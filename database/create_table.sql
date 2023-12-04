-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2023 at 05:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- START TRANSACTION;
-- SET time_zone = "+00:00";


-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!40101 SET NAMES utf8mb4 */;

--
-- Database: chetcom
--

-- --------------------------------------------------------

--
-- Table structure for table ACCOUNT
--
CREATE DATABASE CHETCOM;
USE CHETCOM;

CREATE TABLE ACCOUNT (
  Acc_ID VARCHAR(10) CHECK (Acc_ID REGEXP '^[0-9]{10}$'),
  Username VARCHAR(20),
  Password VARCHAR(20),
  Acc_type VARCHAR(20),
  Student_ID VARCHAR(10) CHECK (Student_ID REGEXP '^[0-9]{10}$'),
  Employee_ID VARCHAR(10) CHECK (Employee_ID REGEXP '^[0-9]{10}$'),
  PRIMARY KEY (Acc_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table BE_WARNED
--

CREATE TABLE BE_WARNED (
  Warn_ID VARCHAR(10) CHECK (Warn_ID REGEXP '^[0-9]{10}$'),
  Student_ID VARCHAR(10) CHECK (Student_ID REGEXP '^[0-9]{10}$'),
  PRIMARY KEY (Warn_ID, Student_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table BILL
--

CREATE TABLE BILL (
  Bill_ID VARCHAR(10) CHECK (Bill_ID REGEXP '^[0-9]{10}$'),
  Detail VARCHAR(50),
  Amount VARCHAR(50),
  Date_paid DATE,
  Date_issue DATE,
  Date_expire DATE,
  Mgr_ID VARCHAR(10) CHECK (Mgr_ID REGEXP '^[0-9]{10}$'),
  Student_ID VARCHAR(10) CHECK (Student_ID REGEXP '^[0-9]{10}$'), 
  PRIMARY KEY (Bill_ID),
  CHECK (Date_issue < Date_expire)
);

-- --------------------------------------------------------

--
-- Table structure for table BUILDING
--

CREATE TABLE BUILDING (
  Name VARCHAR(50),
  Status CHAR CHECK (Status = 'A' OR Status = 'F' OR Status = 'R'), -- Available, Full, Repairing
  Mgr_ID VARCHAR(10) CHECK (Mgr_ID REGEXP '^[0-9]{10}$'),
  PRIMARY KEY (Name)
);

-- --------------------------------------------------------

--
-- Table structure for table EMPLOYEE
--

CREATE TABLE EMPLOYEE (
  CCCD_number VARCHAR(10) CHECK (CCCD_number REGEXP '^[0-9]{10}$'),
  CCCD_date DATE,
  Fname VARCHAR(50),
  Lname VARCHAR(50),
  DOB DATE,
  Sex CHAR CHECK (Sex = 'M' OR Sex = 'F'),
  Religion VARCHAR(50),
  Ethnicity VARCHAR(50),
  Email VARCHAR(50),
  Phone VARCHAR(10) CHECK (Phone REGEXP '^0[0-9]{9}$'),
  Address VARCHAR(50),
  Bname VARCHAR(50),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table LIVES_IN
--

CREATE TABLE LIVES_IN (
  Student_ID VARCHAR(10) CHECK (Student_ID REGEXP '^[0-9]{10}$'),
  Date_in DATE,
  Date_out DATE,
  Room_ID VARCHAR(10) CHECK (Room_ID REGEXP '^[0-9]{10}$'),
  PRIMARY KEY (Student_ID, Date_in),
  CHECK (Date_in < Date_out)
);

-- --------------------------------------------------------

--
-- Table structure for table MANAGER
--

CREATE TABLE MANAGER (
  CCCD_number VARCHAR(10) CHECK (CCCD_number REGEXP '^[0-9]{10}$'),
  Mgr_start_date DATE,
  High_Mgr VARCHAR(10) CHECK (High_Mgr REGEXP '^[0-9]{10}$'), -- CCCD Of High Mgr
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table NOTIFICATION
--

CREATE TABLE NOTIFICATION (
  ID VARCHAR(10) CHECK (ID REGEXP '^[0-9]{10}$'),
  Title VARCHAR(50),
  Content VARCHAR(50),
  Date DATE,
  Mgr_ID VARCHAR(10) CHECK (Mgr_ID REGEXP '^[0-9]{10}$'),
  PRIMARY KEY (ID)
);

-- --------------------------------------------------------

--
-- Table structure for table RELATIVE
--

CREATE TABLE RELATIVE (
  Student_ID VARCHAR(10) CHECK (Student_ID REGEXP '^[0-9]{10}$'),
  Fname VARCHAR(50),
  Lname VARCHAR(50),
  DOB DATE,
  Phone VARCHAR(10) CHECK (Phone REGEXP '^0[0-9]{9}$'),
  Address VARCHAR(50),
  Relationship VARCHAR(50),
  PRIMARY KEY (Fname, Lname, Student_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table ROOM
--

CREATE TABLE ROOM (
  Room_ID VARCHAR(10) CHECK (Room_ID REGEXP '^[0-9]{10}$'),
  Status CHAR CHECK (Status = 'A' OR Status = 'F' OR Status = 'R'),
  Bname VARCHAR(50),
  Room_type_ID VARCHAR(10) CHECK (Room_type_ID REGEXP '^[0-9]{10}$'),
  Leader_ID VARCHAR(10) CHECK (Leader_ID REGEXP '^[0-9]{10}$'),
  PRIMARY KEY (Room_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table ROOM_TYPE
--

CREATE TABLE ROOM_TYPE (
  Room_type_ID VARCHAR(10) CHECK (Room_type_ID REGEXP '^[0-9]{10}$'),
  Room_type_name VARCHAR(50),
  Max_student INT,
  Cost VARCHAR(50),
  PRIMARY KEY (Room_type_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table STAFF
--

CREATE TABLE STAFF (
  CCCD_number VARCHAR(10) CHECK (CCCD_number REGEXP '^[0-9]{10}$'),
  Job VARCHAR(50),
  Super_CCCD_number VARCHAR(12) CHECK (Super_CCCD_number REGEXP '^0[0-9]{2}[0-3][0-9]{8}$'),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table STUDENT
--

CREATE TABLE STUDENT (
  CCCD_number VARCHAR(10) CHECK (CCCD_number REGEXP '^[0-9]{10}$'),
  CCCD_date DATE,
  Fname VARCHAR(50),
  Lname VARCHAR(50),
  DOB DATE,
  Sex CHAR CHECK (Sex = 'M' OR Sex = 'F'),
  Religion VARCHAR(50),
  Ethnicity VARCHAR(50),
  Phone VARCHAR(10) CHECK (Phone REGEXP '^0[0-9]{9}$'),
  Email VARCHAR(50),
  Avatar VARCHAR(50),
  Bank_name VARCHAR(50),
  Bank_number VARCHAR(50),
  Address VARCHAR(100),
  Status VARCHAR (100),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table STUDIES_IN
--

CREATE TABLE STUDIES_IN (
  CCCD_number VARCHAR(10) CHECK (CCCD_number REGEXP '^[0-9]{10}$'),
  Student_ID VARCHAR(10) CHECK (Student_ID REGEXP '^[0-9]{10}$'),
  Uni_ID VARCHAR(10) CHECK (Uni_ID REGEXP '^[0-9]{10}$'),
  Department VARCHAR(50),
  PRIMARY KEY (CCCD_number)
);

-- --------------------------------------------------------

--
-- Table structure for table UNIVERSITY
--

CREATE TABLE UNIVERSITY (
  Uni_ID VARCHAR(10) CHECK (Uni_ID REGEXP '^[0-9]{10}$'),
  Name VARCHAR(50),
  Uni_Email VARCHAR(50),
  Uni_phone VARCHAR(10) CHECK (Uni_phone REGEXP '^0[0-9]{9}$'),
  PRIMARY KEY (Uni_ID)
);

-- --------------------------------------------------------

--
-- Table structure for table UNI_ADDRESS
--

CREATE TABLE UNI_ADDRESS (
  Uni_ID VARCHAR(10) CHECK (Uni_ID REGEXP '^[0-9]{10}$'),
  Uni_address VARCHAR(50),
  PRIMARY KEY (Uni_ID, Uni_address)
);

-- --------------------------------------------------------

--
-- Table structure for table WARNING
--

CREATE TABLE WARNING (
  ID VARCHAR(10) CHECK (ID REGEXP '^[0-9]{10}$'),
  Date DATE,
  Detail VARCHAR(50),
  Note VARCHAR(50),
  Mgr_ID VARCHAR(10) CHECK (Mgr_ID REGEXP '^[0-9]{10}$'),
  Type VARCHAR(50),
  PRIMARY KEY (ID)
);

----------------------------------------------------------
--
-- Table structure for table WORK_IN
--

CREATE TABLE WORK_IN (
  Employee_ID VARCHAR(10) CHECK (Employee_ID REGEXP '^[0-9]{10}$'),
  Date_in DATE,
  Date_out DATE,
  Bname VARCHAR(50),
  PRIMARY KEY (Employee_ID, Date_in),
  CHECK (Date_in < Date_out)
);

-- ALTER TABLE --
-- ADD CONSTRAINT--

ALTER TABLE ACCOUNT 
  ADD CONSTRAINT fk_account_Stu_CCCD FOREIGN KEY (Student_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE ACCOUNT 
  ADD CONSTRAINT fk_account_employee_CCCD FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE BE_WARNED  
  ADD CONSTRAINT fk_be_warned_Stu_CCCD FOREIGN KEY (Student_ID) REFERENCES STUDENT(CCCD_number)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

ALTER TABLE BE_WARNED 
  ADD CONSTRAINT fk_be_warned_ID FOREIGN KEY (Warn_ID) REFERENCES WARNING(ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT;

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

