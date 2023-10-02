-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 11:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicinetime`
--

-- --------------------------------------------------------

--
-- Table structure for table `alarm`
--

CREATE TABLE `alarm` (
  `alarm_id` int(11) NOT NULL,
  `alarm_title` varchar(255) NOT NULL,
  `alarm_time` varchar(255) NOT NULL,
  `users_id` int(11) NOT NULL,
  `alarm_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `medicine_type` varchar(255) NOT NULL,
  `HealthCondition` varchar(255) NOT NULL,
  `users_id` int(11) NOT NULL,
  `medicine_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `medicine_name`, `medicine_type`, `HealthCondition`, `users_id`, `medicine_create`) VALUES
(50, 'اسبرين', 'أقراص (حبوب)', 'وقاية من الجلطة', 38, '2023-09-26 01:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users` int(11) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` varchar(100) NOT NULL,
  `users_verfiycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users`, `users_email`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(36, 'layan', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 'layanahmed@gmail.com', '1212213441', 90209, 1, '2023-09-20 01:31:25'),
(38, 'test', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 'test@gmail.com', '1231243312', 19503, 0, '2023-09-26 01:12:55'),
(43, 'tatatta', 'b3e911673560819e917aae8c5f0a2af7ffbdd5bd', 0, 'ttt@gmail.com', '121213344', 68852, 0, '2023-09-26 21:34:14'),
(44, 'aass', '298d75b4126c83bb43193d31c5c351e23f73ce4a', 0, 'aass@aass.com', '12121214343', 22409, 1, '2023-09-26 21:54:57'),
(45, 'tyyyyyyr', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, 'rt12@y.com', '123456789', 49563, 0, '2023-10-01 21:23:32'),
(46, 'kiir', '3acd0be86de7dcccdbf91b20f94a68cea535922d', 0, 'xxrand12@hotmail.com', '0565318194', 20494, 1, '2023-10-01 21:30:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alarm`
--
ALTER TABLE `alarm`
  ADD PRIMARY KEY (`alarm_id`),
  ADD KEY `alarmuser` (`users_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`),
  ADD KEY `medicine` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_phone` (`users_phone`),
  ADD UNIQUE KEY `users_email` (`users_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alarm`
--
ALTER TABLE `alarm`
  MODIFY `alarm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alarm`
--
ALTER TABLE `alarm`
  ADD CONSTRAINT `alarmuser` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicine`
--
ALTER TABLE `medicine`
  ADD CONSTRAINT `medicine` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
