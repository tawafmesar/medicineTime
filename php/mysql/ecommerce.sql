-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2023 at 12:48 AM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لابتوب', 'laptop.svg', '2023-07-21 00:35:57'),
(2, 'camera', 'كاميرا', 'camera.svg', '2023-07-21 00:37:28'),
(3, 'mobile', 'موبايل', 'mobile.svg', '2023-07-21 00:37:28'),
(4, 'shoes', 'أحذية', 'shoes.svg', '2023-07-21 00:38:21'),
(5, 'dresses', 'فساتين', 'dresses.svg', '2023-07-25 23:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_at` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1,
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_at`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'laptop surface go 2', 'لابتوب سيرفس غو', 'laptop amazing core i5 gen 11 ram 16', 'لابتوب مميز انيق رفيع معالج كور اي فايف رام 16', 'laptop.png', 5, 1, 200, 10, '2023-07-27 21:43:15', 1),
(2, 'mobile S22 Ultra', 'سامسونج اس 22 الترا', 'Samsung S22 Ultra Ram 12 Hard 512GB Camera 100M', 'سامسونج اس 22 الترا رام 12 هارد 5122 كاميرا 100 ميغ', 'samsung.jpg', 22, 1, 300, 0, '2023-07-27 21:46:19', 3),
(3, 'Camera 250d Canon', 'كاميرا 250 دي كانون', 'Camera 22 megapixel 4K 30 frame', 'كاميرا بدقة 22 ميغا بيكسل', 'camera.png', 3, 1, 20, 10, '2023-07-27 21:48:53', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_at` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

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
(21, 'asasas', '8cb2237d0679ca88db6464eac60da96345513964', 0, 'tawaf@gmail.com', '123456789', 16681, 1, '2023-07-15 23:55:09'),
(23, 'adddda', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 'asaaas@gmail.com', '1122456789', 52493, 1, '2023-07-16 00:27:24'),
(24, 'sasas', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, 'fafaffa@gmail.com', '12345521677', 36462, 1, '2023-07-16 00:38:55'),
(26, 'tawafmesar', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, 'nawafmesar@gmail.com', '3123456789', 41045, 1, '2023-07-20 01:04:30');

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_at` AS `items_name_at`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on(`items`.`items_cat` = `categories`.`categories_id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_cat` (`items_cat`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
