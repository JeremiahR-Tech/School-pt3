-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2022 at 05:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctoral`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseId` char(7) NOT NULL,
  `CName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseId`, `CName`) VALUES
('CSE1310', 'Introduction to programming'),
('CSE1320', 'Intermediate Programming'),
('CSE1325', 'Object-Oriented Programming'),
('CSE3302', 'Programming Languages'),
('CSE3310', 'Fundamentals of Software Engineerin'),
('CSE3330', 'Database 1'),
('CSE3442', 'Embedded Systems'),
('CSE4351', 'Parallel Processing'),
('CSE4354', 'Operating System'),
('CSE5322', 'Software Design'),
('CSE5324', 'Artificial Intelligence'),
('CSE6338', 'Neural Networks'),
('CSE6365', 'Computer Graphics');

-- --------------------------------------------------------

--
-- Table structure for table `coursestaught`
--

CREATE TABLE `coursestaught` (
  `CourseId` char(7) NOT NULL,
  `InstructorId` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coursestaught`
--

INSERT INTO `coursestaught` (`CourseId`, `InstructorId`) VALUES
('CSE1320', 'AO1290'),
('CSE1325', 'AO1290'),
('CSE1325', 'CA2876'),
('CSE3302', 'XZ3456'),
('CSE3310', 'HY1945'),
('CSE3330', 'AD4267'),
('CSE3442', 'AD4267'),
('CSE3442', 'CA2876'),
('CSE4351', 'DP6712'),
('CSE4351', 'SB2561'),
('CSE4351', 'XZ3456'),
('CSE4354', 'DP6712'),
('CSE4354', 'HY1945'),
('CSE4354', 'SB2561'),
('CSE5322', 'AS2348'),
('CSE5322', 'BL9856'),
('CSE5324', 'AO5671'),
('CSE5324', 'AS2348'),
('CSE5324', 'RB1897'),
('CSE6338', 'AO5671'),
('CSE6338', 'AS2348'),
('CSE6338', 'RB1897'),
('CSE6365', 'BL9856'),
('CSE6365', 'RB1897'),
('CSE6365', 'SB2561');

-- --------------------------------------------------------

--
-- Table structure for table `gra`
--

CREATE TABLE `gra` (
  `StudentId` char(6) NOT NULL,
  `Funding` char(4) DEFAULT NULL,
  `MonthlyPay` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gra`
--

INSERT INTO `gra` (`StudentId`, `Funding`, `MonthlyPay`) VALUES
('AW1023', 'NIH3', '3000.00'),
('CC6716', 'DOE1', '1000.00'),
('JP9384', 'DOT4', '3000.00'),
('KH1029', 'NIH3', '3000.00'),
('KJ1928', 'DOT4', '1000.00'),
('LY1049', 'NSF2', '2000.00'),
('RK1489', 'NSF2', '3000.00'),
('RY1726', 'DOT4', '2000.00'),
('WW3847', 'DOE1', '3000.00'),
('XY2938', 'DOE1', '3000.00'),
('ZW1029', 'DOE1', '3000.00');

-- --------------------------------------------------------

--
-- Table structure for table `grantassociated`
--

CREATE TABLE `grantassociated` (
  `AccountNo` char(4) NOT NULL,
  `InstructorId` char(6) NOT NULL,
  `InstrType` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grantassociated`
--

INSERT INTO `grantassociated` (`AccountNo`, `InstructorId`, `InstrType`) VALUES
('DOE1', 'AO5671', 'PI'),
('DOE1', 'AS2348', 'COPI'),
('DOE1', 'BL9856', 'COPI'),
('DOT4', 'AO5671', 'COPI'),
('DOT4', 'BL9856', 'COPI'),
('DOT4', 'SB2561', 'PI'),
('NIH3', 'BL9856', 'COPI'),
('NIH3', 'RB1897', 'PI '),
('NIH3', 'SB2561', 'COPI'),
('NSF2', 'AS2348', 'PI'),
('NSF2', 'BL9856', 'COPI'),
('NSF2', 'RB1897', 'COPI');

-- --------------------------------------------------------

--
-- Table structure for table `gta`
--

CREATE TABLE `gta` (
  `SectionId` char(11) DEFAULT NULL,
  `MonthlyPay` decimal(10,2) DEFAULT NULL,
  `StudentId` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gta`
--

INSERT INTO `gta` (`SectionId`, `MonthlyPay`, `StudentId`) VALUES
('CSE5322-003', '2000.00', 'AB2903'),
('CSE3302-001', '1500.00', 'AD1035'),
('CSE3442-002', '1000.00', 'AK1958'),
('CSE6338-001', '2000.00', 'AL8345'),
('CSE6338-002', '2000.00', 'AM8051'),
('CSE4351-002', '1500.00', 'AY2653'),
('CSE6365-003', '2000.00', 'DB1783'),
('CSE6365-002', '2000.00', 'DB6291'),
('CSE3442-001', '1000.00', 'FS6892'),
('CSE4354-001', '1500.00', 'JF1092'),
('CSE5322-001', '2000.00', 'JG1036'),
('CSE5324-003', '2000.00', 'JG8927'),
('CSE5324-001', '2000.00', 'JR1930'),
('CSE6338-003', '2000.00', 'KY4892'),
('CSE3330-002', '1000.00', 'LM1405'),
('CSE3330-003', '1000.00', 'MA1234'),
('CSE5324-002', '2000.00', 'MA1968'),
('CSE1325-001', '1000.00', 'MG1940'),
('CSE3302-003', '1500.00', 'ML3902'),
('CSE6365-001', '2000.00', 'MN2903'),
('CSE3302-002', '1500.00', 'MP3478'),
('CSE3310-001', '1500.00', 'NN1629'),
('CSE3310-002', '1500.00', 'OT8190'),
('CSE3330-001', '1500.00', 'PG2469'),
('CSE1320-001', '1000.00', 'PH2091'),
('CSE4354-002', '1500.00', 'PS1904'),
('CSE3310-003', '1500.00', 'RS1903'),
('CSE4351-003', '1500.00', 'SD1946'),
('CSE3442-003', '1000.00', 'SJ1947'),
('CSE4351-001', '1500.00', 'SP1938'),
('CSE4354-003', '1500.00', 'SS1304'),
('CSE1310-001', '1000.00', 'TC1038'),
('CSE5322-002', '2000.00', 'VA1938');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `InstructorId` char(6) NOT NULL,
  `FName` varchar(15) NOT NULL,
  `LName` varchar(15) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `Degree` varchar(8) DEFAULT NULL,
  `Rank` varchar(25) DEFAULT NULL,
  `Type` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`InstructorId`, `FName`, `LName`, `StartDate`, `Degree`, `Rank`, `Type`) VALUES
('AD4267', 'Andrea', 'Delgado', '2002-07-15', 'PhD', 'Associate Professor', 'Adjunct'),
('AO1290', 'Asu', 'Ozdaglar', '2002-07-15', 'PhD', 'Associate Professor', 'Adjunct'),
('AO5671', 'Adegoke', 'Olubummo', '1982-07-19', 'PhD', 'Professor', 'TT'),
('AS2348', 'Ahmed', 'Sarhan', '1989-07-19', 'PhD', 'Professor', 'TT'),
('BL9856', 'Barbara', 'Liskov', '2001-07-19', 'PhD', 'Professor', 'TT'),
('CA2876', 'Corey', 'Ashley', '2002-07-15', 'Masters', 'Associate Professor', 'Adjunct'),
('CC8908', 'Carlos', 'Castillo', '2017-07-15', 'PhD', 'Associate Professor', 'Adjunct'),
('DP6712', 'David', 'Patterson', '2001-07-19', 'PhD', 'Professor', 'NTT'),
('HY1945', 'Henry', 'Yuen', '2008-07-25', 'PhD', 'Associate Professor', 'NTT'),
('RB1897', 'Ravindran', 'Balaraman', '1990-02-10', 'PhD', 'Professor', 'TT'),
('SB2561', 'Sanghamitra', 'Bandyopadhyay', '1999-09-15', 'PhD', 'Assistant Professor', 'TT'),
('XZ3456', 'Xia', 'Zhou', '2005-07-20', 'PhD', 'Associate Professor', 'NTT');

-- --------------------------------------------------------

--
-- Table structure for table `milestone`
--

CREATE TABLE `milestone` (
  `MId` char(2) NOT NULL,
  `MName` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `milestone`
--

INSERT INTO `milestone` (`MId`, `MName`) VALUES
('CE', 'Comprehensive Exam'),
('CM', 'Committee Formed'),
('DE', 'Diagnostics Evaluation'),
('DF', 'Defense'),
('PR', 'Proposal');

-- --------------------------------------------------------

--
-- Table structure for table `milestonespassed`
--

CREATE TABLE `milestonespassed` (
  `StudentId` char(6) NOT NULL,
  `MId` char(2) NOT NULL,
  `PassDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `milestonespassed`
--

INSERT INTO `milestonespassed` (`StudentId`, `MId`, `PassDate`) VALUES
('AA1234', 'CM', '2016-12-01'),
('AA2345', 'CM', '2016-12-01'),
('AB2903', 'CM', '2016-12-05'),
('AJ1836', 'CM', '2016-12-02'),
('AJ1934', 'CM', '2016-12-02'),
('AK1958', 'CM', '2017-12-07'),
('AL8345', 'CM', '2016-12-05'),
('AM2950', 'CM', '2016-12-05'),
('AM8051', 'CM', '2016-12-06'),
('BD5678', 'CM', '2017-12-07'),
('BE1256', 'CM', '2017-12-07'),
('BM1745', 'CM', '2016-12-05'),
('DB1783', 'CM', '2016-12-07'),
('DB1783', 'DE', '2017-06-05'),
('DB6291', 'CM', '2016-12-07'),
('DB6291', 'DE', '2017-06-06'),
('EN4589', 'CM', '2018-12-06'),
('FE6789', 'CM', '2017-12-07'),
('FK8907', 'CE', '2018-05-07'),
('FK8907', 'CM', '2017-12-07'),
('FK8907', 'DE', '2017-12-07'),
('HA2680', 'CM', '2018-12-08'),
('IJ1569', 'CM', '2017-12-07'),
('IJ1569', 'DE', '2017-12-06'),
('IS2945', 'CM', '2016-12-02'),
('JG1036', 'CM', '2016-12-06'),
('JG8927', 'CM', '2016-12-05'),
('JP9384', 'CE', '2017-12-07'),
('JP9384', 'CM', '2016-12-09'),
('JP9384', 'DE', '2017-06-07'),
('JP9384', 'PR', '2018-12-08'),
('JR1930', 'CM', '2016-12-06'),
('KH1029', 'CE', '2017-12-07'),
('KH1029', 'CM', '2016-12-09'),
('KH1029', 'DE', '2017-06-07'),
('KH1029', 'PR', '2018-12-07'),
('KO1905', 'CM', '2018-12-07'),
('KY4892', 'CM', '2016-12-08'),
('KY4892', 'DE', '2017-06-06'),
('MA1968', 'CM', '2016-12-05'),
('MN2903', 'CE', '2017-12-07'),
('MN2903', 'CM', '2016-12-08'),
('MN2903', 'DE', '2017-06-06'),
('MS1259', 'CM', '2016-12-02'),
('NZ1278', 'CM', '2018-12-07'),
('RK1489', 'CE', '2017-12-07'),
('RK1489', 'CM', '2016-12-08'),
('RK1489', 'DE', '2017-06-07'),
('RK1489', 'PR', '2018-12-07'),
('SJ1947', 'CM', '2017-12-07'),
('VA1938', 'CM', '2016-12-05'),
('VW8930', 'CM', '2016-12-02'),
('WW3847', 'CE', '2017-12-07'),
('WW3847', 'CM', '2016-12-08'),
('WW3847', 'DE', '2017-06-07'),
('XY2938', 'CE', '2017-12-07'),
('XY2938', 'CM', '2016-12-08'),
('XY2938', 'DE', '2017-06-07'),
('ZW1029', 'CE', '2017-12-07'),
('ZW1029', 'CM', '2016-12-08'),
('ZW1029', 'DE', '2017-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `phdcommittee`
--

CREATE TABLE `phdcommittee` (
  `StudentId` char(6) NOT NULL,
  `InstructorId` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phdcommittee`
--

INSERT INTO `phdcommittee` (`StudentId`, `InstructorId`) VALUES
('AA1234', 'AS2348'),
('AA1234', 'RB1897'),
('AA2345', 'BL9856'),
('AA2345', 'SB2561'),
('AB2903', 'RB1897'),
('AB2903', 'SB2561'),
('AJ1836', 'BL9856'),
('AJ1836', 'SB2561'),
('AJ1934', 'AS2348'),
('AJ1934', 'RB1897'),
('AK1958', 'AO5671'),
('AK1958', 'AS2348'),
('AL8345', 'AS2348'),
('AL8345', 'RB1897'),
('AM2950', 'BL9856'),
('AM2950', 'SB2561'),
('AM8051', 'BL9856'),
('AM8051', 'SB2561'),
('BD5678', 'RB1897'),
('BD5678', 'SB2561'),
('BE1256', 'AO5671'),
('BE1256', 'RB1897'),
('BE1256', 'SB2561'),
('BM1745', 'AS2348'),
('BM1745', 'BL9856'),
('DB1783', 'AS2348'),
('DB1783', 'RB1897'),
('DB6291', 'BL9856'),
('DB6291', 'SB2561'),
('EN4589', 'AO5671'),
('EN4589', 'AS2348'),
('FE6789', 'BL9856'),
('FE6789', 'RB1897'),
('FE6789', 'SB2561'),
('FK8907', 'AO5671'),
('FK8907', 'AS2348'),
('HA2680', 'AO5671'),
('HA2680', 'AS2348'),
('IJ1569', 'AS2348'),
('IJ1569', 'SB2561'),
('IS2945', 'AS2348'),
('IS2945', 'BL9856'),
('JG1036', 'AO5671'),
('JG1036', 'AS2348'),
('JG8927', 'AS2348'),
('JG8927', 'BL9856'),
('JP9384', 'AS2348'),
('JP9384', 'RB1897'),
('JR1930', 'AO5671'),
('JR1930', 'RB1897'),
('KH1029', 'AS2348'),
('KH1029', 'RB1897'),
('KO1905', 'BL9856'),
('KO1905', 'RB1897'),
('KY4892', 'AO5671'),
('KY4892', 'BL9856'),
('MA1968', 'BL9856'),
('MA1968', 'RB1897'),
('MN2903', 'RB1897'),
('MN2903', 'SB2561'),
('MS1259', 'RB1897'),
('MS1259', 'SB2561'),
('NZ1278', 'AS2348'),
('NZ1278', 'RB1897'),
('RK1489', 'AO5671'),
('RK1489', 'SB2561'),
('SJ1947', 'AO5671'),
('SJ1947', 'AS2348'),
('SJ1947', 'RB1897'),
('SJ1947', 'SB2561'),
('VA1938', 'AS2348'),
('VA1938', 'RB1897'),
('VW8930', 'RB1897'),
('VW8930', 'SB2561'),
('WW3847', 'RB1897'),
('WW3847', 'SB2561'),
('XY2938', 'BL9856'),
('XY2938', 'RB1897'),
('ZW1029', 'AS2348'),
('ZW1029', 'RB1897');

-- --------------------------------------------------------

--
-- Table structure for table `phdstudent`
--

CREATE TABLE `phdstudent` (
  `StudentId` char(6) NOT NULL,
  `FName` varchar(15) NOT NULL,
  `LNAME` varchar(15) NOT NULL,
  `StSem` varchar(7) DEFAULT NULL,
  `StYear` smallint(6) DEFAULT NULL,
  `Supervisor` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phdstudent`
--

INSERT INTO `phdstudent` (`StudentId`, `FName`, `LNAME`, `StSem`, `StYear`, `Supervisor`) VALUES
('AA1234', 'Abimbola', 'Abioye', 'Fall', 2016, 'AO5671'),
('AA2345', 'Afia', 'Achebe', 'Fall', 2016, 'AO5671'),
('AB2903', 'Aditya', 'Bhatt', 'Fall', 2016, 'AS2348'),
('AD1035', 'Ashish', 'Dwivedi', 'Fall', 2017, 'RB1897'),
('AJ1836', 'Alice', 'Jones', 'Fall', 2016, 'AS2348'),
('AJ1934', 'Adriana', 'Johnson', 'Fall', 2016, 'AO5671'),
('AK1958', 'Abdul', 'Kalam', 'Fall', 2018, 'BL9856'),
('AL8345', 'Alejandro', 'Lopez', 'Fall', 2016, 'AO5671'),
('AM2950', 'Armand', 'Martin', 'Fall', 2016, 'AO5671'),
('AM8051', 'Antonio', 'Martinez', 'Fall', 2016, 'AS2348'),
('AP2578', 'Anastasia', 'Petrov', 'Fall', 2017, 'SB2561'),
('AW1023', 'Abdurrahman', 'Wahid', 'Fall', 2017, 'BL9856'),
('AY2653', 'Adarsh', 'Yadav', 'Fall', 2017, 'AS2348'),
('BD5678', 'Berko', 'Dogo', 'Fall', 2017, 'AO5671'),
('BE1256', 'Bosede', 'Eesuola', 'Fall', 2017, 'AS2348'),
('BM1745', 'Ben', 'Mueller', 'Fall', 2016, 'RB1897'),
('CC6716', 'Chayton', 'Chavis', 'Fall', 2018, 'BL9856'),
('DB1783', 'Dakota', 'Benally', 'Fall', 2016, 'AO5671'),
('DB6291', 'Dyani', 'Begay', 'Fall', 2016, 'AO5671'),
('EN4589', 'Emeka', 'Nenge', 'Fall', 2018, 'RB1897'),
('FE6789', 'Fumnaya', 'Egebe', 'Fall', 2017, 'AS2348'),
('FK8907', 'Folami', 'Kanye', 'Fall', 2017, 'RB1897'),
('FS6892', 'Francisco', 'Sanchez', 'Fall', 2018, 'AO5671'),
('GD1948', 'Gabriel', 'Durand', 'Fall', 2017, 'RB1897'),
('GM6294', 'Gabriella', 'Miller', 'Fall', 2017, 'RB1897'),
('HA2680', 'Hector', 'Adams', 'Fall', 2018, 'SB2561'),
('IJ1569', 'Ife', 'Jelani', 'Fall', 2017, 'RB1897'),
('IS2945', 'Ivan', 'Sokolov', 'Fall', 2016, 'AO5671'),
('JF1092', 'Josefina', 'Flores', 'Fall', 2017, 'BL9856'),
('JG1036', 'Juan', 'Gonzalez', 'Fall', 2016, 'BL9856'),
('JG8927', 'Jose', 'Garcia', 'Fall', 2016, 'AO5671'),
('JP9384', 'Jung', 'Park', 'Fall', 2016, 'AO5671'),
('JR1930', 'Jesus', 'Rodriguez', 'Fall', 2016, 'AS2348'),
('JT6936', 'Jules', 'Thomas', 'Fall', 2018, 'RB1897'),
('KH1029', 'Ki', 'Hajar', 'Fall', 2016, 'BL9856'),
('KJ1928', 'Kim', 'Jee', 'Fall', 2018, 'AS2348'),
('KO1905', 'Kojo', 'Okoro', 'Fall', 2018, 'SB2561'),
('KY4892', 'Kaya', 'Yazzie', 'Fall', 2016, 'AS2348'),
('LB2673', 'Leo', 'Bernard', 'Fall', 2017, 'AS2348'),
('LF150', 'Luis', 'Fischer', 'Fall', 2018, 'RB1897'),
('LM1405', 'Lucinda', 'Moreau', 'Fall', 2018, 'SB2561'),
('LY1049', 'Li', 'Ying', 'Fall', 2017, 'AS2348'),
('MA1234', 'Miguel', 'Angel', 'Fall', 2018, 'BL9856'),
('MA1968', 'Muhammad', 'Ansari', 'Fall', 2016, 'AS2348'),
('MG1940', 'Maanas', 'Gandhi', 'Fall', 2018, 'BL9856'),
('MI1589', 'Mikhail', 'Ivanov', 'Fall', 2017, 'AS2348'),
('ML3902', 'Malia', 'Locklear', 'Fall', 2017, 'AS2348'),
('MN2903', 'Mika', 'Nyhoff', 'Fall', 2016, 'AS2348'),
('MP3478', 'Maria', 'Perez', 'Fall', 2017, 'AS2348'),
('MS1259', 'Maya', 'Smith', 'Fall', 2016, 'AO5671'),
('NN1629', 'Nokomis', 'Nez', 'Fall', 2017, 'BL9856'),
('NS4289', 'Noah', 'Schmidt', 'Fall', 2017, 'AS2348'),
('NZ1278', 'Nia', 'Zivai', 'Fall', 2018, 'SB2561'),
('OT8190', 'Odina', 'Toledo', 'Fall', 2017, 'AS2348'),
('PG2469', 'Patricia', 'Gomez', 'Fall', 2017, 'RB1897'),
('PH2091', 'Pocahontas', 'Hill', 'Fall', 2018, 'BL9856'),
('PS1904', 'Parvinder', 'Singh', 'Fall', 2017, 'AS2348'),
('RK1489', 'Ranomi', 'Kromowidjojo', 'Fall', 2016, 'BL9856'),
('RS1903', 'Rosa', 'Sanchez', 'Fall', 2017, 'AS2348'),
('RW9267', 'Raymond', 'Wilson', 'Fall', 2017, 'AS2348'),
('RY1726', 'Rhee', 'Yi', 'Fall', 2017, 'AS2348'),
('SC1894', 'Steven', 'Cooper', 'Fall', 2018, 'SB2561'),
('SD1946', 'Shalini', 'Desai', 'Fall', 2017, 'RB1897'),
('SJ1947', 'Salil', 'Jha', 'Fall', 2018, 'BL9856'),
('SP1938', 'Sai', 'Paranjape', 'Fall', 2017, 'AS2348'),
('SS1304', 'Simarjeet', 'Suri', 'Fall', 2017, 'AS2348'),
('TC1038', 'Tala', 'Castillo', 'Fall', 2018, 'BL9856'),
('VA1938', 'Vivaan', 'Ahuja', 'Fall', 2016, 'AO5671'),
('VB1059', 'Victor', 'Brown', 'Fall', 2017, 'AS2348'),
('VW8930', 'Violet', 'Williams', 'Fall', 2016, 'AO5671'),
('WW3847', 'Wang', 'Wei', 'Fall', 2016, 'BL9856'),
('XY2938', 'Xiu', 'Ying', 'Fall', 2016, 'AS2348'),
('ZW1029', 'Zhang', 'Wei', 'Fall', 2016, 'AO5671');

-- --------------------------------------------------------

--
-- Table structure for table `scholarshipsupport`
--

CREATE TABLE `scholarshipsupport` (
  `StudentId` char(6) NOT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `Source` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scholarshipsupport`
--

INSERT INTO `scholarshipsupport` (`StudentId`, `Type`, `Source`) VALUES
('AJ1836', 'STEM', 'NSF'),
('AM2950', 'Maverick', 'University'),
('AP2578', 'Departmental', 'University'),
('BM1745', 'Maverick', 'University'),
('GD1948', 'STEM', 'NSF'),
('GM6294', 'STEM', 'NSF'),
('HA2680', 'Departmental', 'University'),
('IS2945', 'Departmental', 'University'),
('JT6936', 'Maverick', 'University'),
('LB2673', 'Maverick', 'University'),
('LF150', 'Maverick', 'University'),
('MI1589', 'Departmental', 'University'),
('NS4289', 'Maverick', 'University'),
('RW9267', 'STEM', 'NSF'),
('SC1894', 'Departmental', 'University'),
('VB1059', 'STEM', 'NSF');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `SectionId` char(11) NOT NULL,
  `CourseId` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`SectionId`, `CourseId`) VALUES
('CSE1310-001', 'CSE1310'),
('CSE1320-001', 'CSE1320'),
('CSE1325-001', 'CSE1325'),
('CSE3302-001', 'CSE3302'),
('CSE3302-002', 'CSE3302'),
('CSE3302-003', 'CSE3302'),
('CSE3310-001', 'CSE3310'),
('CSE3310-002', 'CSE3310'),
('CSE3310-003', 'CSE3310'),
('CSE3330-001', 'CSE3330'),
('CSE3330-002', 'CSE3330'),
('CSE3330-003', 'CSE3330'),
('CSE3442-001', 'CSE3442'),
('CSE3442-002', 'CSE3442'),
('CSE3442-003', 'CSE3442'),
('CSE4351-001', 'CSE4351'),
('CSE4351-002', 'CSE4351'),
('CSE4351-003', 'CSE4351'),
('CSE4354-001', 'CSE4354'),
('CSE4354-002', 'CSE4354'),
('CSE4354-003', 'CSE4354'),
('CSE5322-001', 'CSE5322'),
('CSE5322-002', 'CSE5322'),
('CSE5322-003', 'CSE5322'),
('CSE5324-001', 'CSE5324'),
('CSE5324-002', 'CSE5324'),
('CSE5324-003', 'CSE5324'),
('CSE6338-001', 'CSE6338'),
('CSE6338-002', 'CSE6338'),
('CSE6338-003', 'CSE6338'),
('CSE6365-001', 'CSE6365'),
('CSE6365-002', 'CSE6365'),
('CSE6365-003', 'CSE6365');

-- --------------------------------------------------------

--
-- Table structure for table `selfsupport`
--

CREATE TABLE `selfsupport` (
  `StudentId` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selfsupport`
--

INSERT INTO `selfsupport` (`StudentId`) VALUES
('AA1234'),
('AA2345'),
('AJ1934'),
('BD5678'),
('BE1256'),
('EN4589'),
('FE6789'),
('FK8907'),
('IJ1569'),
('KO1905'),
('MS1259'),
('NZ1278'),
('VW8930');

-- --------------------------------------------------------

--
-- Table structure for table `stu_grant`
--

CREATE TABLE `stu_grant` (
  `AccountNo` char(4) NOT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `GrantTitle` varchar(50) DEFAULT NULL,
  `Sourc` varchar(50) DEFAULT NULL,
  `StDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `StAmount` decimal(10,2) DEFAULT NULL,
  `CurrBalance` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stu_grant`
--

INSERT INTO `stu_grant` (`AccountNo`, `Type`, `GrantTitle`, `Sourc`, `StDate`, `EndDate`, `StAmount`, `CurrBalance`) VALUES
('DOE1', 'Educational', 'GAANN', 'US Department of Education', '2015-01-01', '2022-08-30', '1500000.00', '500000.00'),
('DOT4', 'Research', 'University Transportation', 'U.S. Department of Transportation', '2016-01-01', '2021-12-31', '1500000.00', '400000.00'),
('NIH3', 'Research', 'Resistance to Infections', 'National Institutes of Health', '2018-09-01', '2024-08-30', '450000.00', '375000.00'),
('NSF2', 'Research', 'Undergraduate Experiences', 'National Science Foundation', '2018-09-01', '2021-08-30', '300000.00', '250000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tt`
--

CREATE TABLE `tt` (
  `InstructorId` char(6) NOT NULL,
  `NoOfPhDStudents` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tt`
--

INSERT INTO `tt` (`InstructorId`, `NoOfPhDStudents`) VALUES
('AO5671', 10),
('AS2348', 20),
('BL9856', 9),
('RB1897', 13),
('SB2561', 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseId`);

--
-- Indexes for table `coursestaught`
--
ALTER TABLE `coursestaught`
  ADD PRIMARY KEY (`CourseId`,`InstructorId`),
  ADD KEY `InstructorId` (`InstructorId`);

--
-- Indexes for table `gra`
--
ALTER TABLE `gra`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `grantassociated`
--
ALTER TABLE `grantassociated`
  ADD PRIMARY KEY (`AccountNo`,`InstructorId`),
  ADD KEY `InstructorId` (`InstructorId`);

--
-- Indexes for table `gta`
--
ALTER TABLE `gta`
  ADD PRIMARY KEY (`StudentId`),
  ADD KEY `SectionId` (`SectionId`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`InstructorId`);

--
-- Indexes for table `milestone`
--
ALTER TABLE `milestone`
  ADD PRIMARY KEY (`MId`);

--
-- Indexes for table `milestonespassed`
--
ALTER TABLE `milestonespassed`
  ADD PRIMARY KEY (`StudentId`,`MId`),
  ADD KEY `MId` (`MId`);

--
-- Indexes for table `phdcommittee`
--
ALTER TABLE `phdcommittee`
  ADD PRIMARY KEY (`StudentId`,`InstructorId`),
  ADD KEY `InstructorId` (`InstructorId`);

--
-- Indexes for table `phdstudent`
--
ALTER TABLE `phdstudent`
  ADD PRIMARY KEY (`StudentId`),
  ADD KEY `Supervisor` (`Supervisor`);

--
-- Indexes for table `scholarshipsupport`
--
ALTER TABLE `scholarshipsupport`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`SectionId`),
  ADD KEY `CourseId` (`CourseId`);

--
-- Indexes for table `selfsupport`
--
ALTER TABLE `selfsupport`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `stu_grant`
--
ALTER TABLE `stu_grant`
  ADD PRIMARY KEY (`AccountNo`),
  ADD UNIQUE KEY `GrantTitle` (`GrantTitle`);

--
-- Indexes for table `tt`
--
ALTER TABLE `tt`
  ADD PRIMARY KEY (`InstructorId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coursestaught`
--
ALTER TABLE `coursestaught`
  ADD CONSTRAINT `coursestaught_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`),
  ADD CONSTRAINT `coursestaught_ibfk_2` FOREIGN KEY (`InstructorId`) REFERENCES `instructor` (`InstructorId`);

--
-- Constraints for table `gra`
--
ALTER TABLE `gra`
  ADD CONSTRAINT `gra_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `phdstudent` (`StudentId`);

--
-- Constraints for table `grantassociated`
--
ALTER TABLE `grantassociated`
  ADD CONSTRAINT `grantassociated_ibfk_1` FOREIGN KEY (`AccountNo`) REFERENCES `stu_grant` (`AccountNo`),
  ADD CONSTRAINT `grantassociated_ibfk_2` FOREIGN KEY (`InstructorId`) REFERENCES `instructor` (`InstructorId`);

--
-- Constraints for table `gta`
--
ALTER TABLE `gta`
  ADD CONSTRAINT `gta_ibfk_1` FOREIGN KEY (`SectionId`) REFERENCES `section` (`SectionId`),
  ADD CONSTRAINT `gta_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `phdstudent` (`StudentId`);

--
-- Constraints for table `milestonespassed`
--
ALTER TABLE `milestonespassed`
  ADD CONSTRAINT `milestonespassed_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `phdstudent` (`StudentId`),
  ADD CONSTRAINT `milestonespassed_ibfk_2` FOREIGN KEY (`MId`) REFERENCES `milestone` (`MId`);

--
-- Constraints for table `phdcommittee`
--
ALTER TABLE `phdcommittee`
  ADD CONSTRAINT `phdcommittee_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `phdstudent` (`StudentId`),
  ADD CONSTRAINT `phdcommittee_ibfk_2` FOREIGN KEY (`InstructorId`) REFERENCES `instructor` (`InstructorId`);

--
-- Constraints for table `phdstudent`
--
ALTER TABLE `phdstudent`
  ADD CONSTRAINT `phdstudent_ibfk_1` FOREIGN KEY (`Supervisor`) REFERENCES `instructor` (`InstructorId`);

--
-- Constraints for table `scholarshipsupport`
--
ALTER TABLE `scholarshipsupport`
  ADD CONSTRAINT `scholarshipsupport_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `phdstudent` (`StudentId`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`);

--
-- Constraints for table `selfsupport`
--
ALTER TABLE `selfsupport`
  ADD CONSTRAINT `selfsupport_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `phdstudent` (`StudentId`);

--
-- Constraints for table `tt`
--
ALTER TABLE `tt`
  ADD CONSTRAINT `tt_ibfk_1` FOREIGN KEY (`InstructorId`) REFERENCES `instructor` (`InstructorId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
