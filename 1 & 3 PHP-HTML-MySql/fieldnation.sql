-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2018 at 06:30 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fieldnation`
--
CREATE DATABASE IF NOT EXISTS `fieldnation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fieldnation`;

-- --------------------------------------------------------

--
-- Table structure for table `test_result`
--

CREATE TABLE `test_result` (
  `user_id` int(10) NOT NULL,
  `test_id` int(10) NOT NULL,
  `correct` int(10) NOT NULL,
  `time_taken` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test_result`
--

INSERT INTO `test_result` (`user_id`, `test_id`, `correct`, `time_taken`) VALUES
(1, 1, 88, '2012-09-02 13:01:28'),
(3, 2, 56, '2012-09-03 09:39:02'),
(1, 2, 44, '2012-09-05 16:22:11'),
(2, 3, 97, '2012-09-15 11:27:51'),
(3, 4, 22, '2012-09-15 15:01:49');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`) VALUES
(1, 'Bob', 'Sanders'),
(2, 'Dave', 'Greggers'),
(3, 'Susan', 'Bowie'),
(4, 'Gary', 'Anderson');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
