-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2021 at 01:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `adddiagnosistable`
--

CREATE TABLE `adddiagnosistable` (
  `PatientID` varchar(20) NOT NULL,
  `Symptom` varchar(100) NOT NULL,
  `Diagnosis` varchar(100) NOT NULL,
  `Medicine` varchar(100) NOT NULL,
  `Ward_Req` varchar(5) NOT NULL,
  `Type_Ward` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adddiagnosistable`
--

INSERT INTO `adddiagnosistable` (`PatientID`, `Symptom`, `Diagnosis`, `Medicine`, `Ward_Req`, `Type_Ward`) VALUES
('A001', 'Fever', 'Cold fever', 'panadol', 'YES', 'Standard');

-- --------------------------------------------------------

--
-- Table structure for table `addpatienttable`
--

CREATE TABLE `addpatienttable` (
  `PatientID` varchar(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Contact_No` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Blood_Group` varchar(10) NOT NULL,
  `Adress` varchar(50) NOT NULL,
  `Major_Disease` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addpatienttable`
--

INSERT INTO `addpatienttable` (`PatientID`, `Name`, `Contact_No`, `Age`, `Gender`, `Blood_Group`, `Adress`, `Major_Disease`) VALUES
('3', 'dwa', '3214', 21, 'Male', 'ee', 'efd', 'edf'),
('5', 'awfa', '34235', 43, 'Male', 'ef', 'ees', 'af'),
('6', 'wd', '324', 21, 'Male', 'efw', 'ef', 'feffa'),
('A001', 'Adrian Leo', '0221312', 19, 'Male', 'AB+', 'Sulawesi st', 'none');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adddiagnosistable`
--
ALTER TABLE `adddiagnosistable`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `addpatienttable`
--
ALTER TABLE `addpatienttable`
  ADD PRIMARY KEY (`PatientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
