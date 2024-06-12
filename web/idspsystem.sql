-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 13, 2019 at 11:17 PM
-- Server version: 5.7.22-0ubuntu0.17.10.1
-- PHP Version: 7.1.19-1+ubuntu17.10.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idspsystem`
--
CREATE DATABASE IF NOT EXISTS `idspsystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `idspsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `attacker_list`
--

CREATE TABLE `attacker_list` (
  `id` bigint(20) NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attacker_list`
--

INSERT INTO `attacker_list` (`id`, `ip_address`, `user_agent`, `created`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:11:14'),
(2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filepath` varchar(100) DEFAULT NULL,
  `enckey` varchar(255) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `algo` enum('AES','EP-ABBE') NOT NULL,
  `master_key` varchar(100) DEFAULT NULL,
  `attribute_lenght` int(10) DEFAULT NULL,
  `adding_date` datetime DEFAULT NULL,
  `enc_time` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `filename`, `filepath`, `enckey`, `uname`, `algo`, `master_key`, `attribute_lenght`, `adding_date`, `enc_time`) VALUES
(15, 'testing giles', 'uploads/f1553407977779.xlsx.aes', 'USZF6YJ2RG3YCOJQ', '1', 'AES', NULL, NULL, '2019-03-24 11:42:57', 53),
(16, 'testing files asdfghjklaaaaaaaaa', 'uploads/f1570975457712.doc.aes', 'M5UOTY1TUUQW41BR', '1', 'AES', NULL, NULL, '2019-10-13 19:34:17', 57),
(17, 'testing giles 12222', 'uploads/f1570977906575.doc.aes', 'asdfghjklpoi8765', '1', 'AES', NULL, NULL, '2019-10-13 20:15:06', 49);

-- --------------------------------------------------------

--
-- Table structure for table `filetimes`
--

CREATE TABLE `filetimes` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `algo` varchar(20) DEFAULT NULL,
  `dec_time` int(20) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filetimes`
--

INSERT INTO `filetimes` (`id`, `user_id`, `file_id`, `file_name`, `algo`, `dec_time`, `created`) VALUES
(7, 1, 15, 'testing giles', 'AES', 67, '2019-03-24 12:32:59'),
(8, 1, 17, 'testing giles 12222', 'AES', 63, '2019-10-13 20:25:10'),
(9, 1, 17, 'testing giles 12222', 'AES', 52, '2019-10-13 20:25:48'),
(10, 3, 17, 'testing giles 12222', 'AES', 48, '2019-10-13 23:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `file_share`
--

CREATE TABLE `file_share` (
  `id` bigint(20) NOT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `message` text,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file_share`
--

INSERT INTO `file_share` (`id`, `sender_id`, `receiver_id`, `file_id`, `message`, `created`) VALUES
(5, 1, 3, 17, ' testing hare file', '2019-10-13 20:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `ip_list`
--

CREATE TABLE `ip_list` (
  `id` bigint(20) NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ip_list`
--

INSERT INTO `ip_list` (`id`, `ip_address`, `created_by`, `created`) VALUES
(3, '127.0.0.1', '1', '2019-03-24 11:42:57'),
(5, '192.1.168.1', '1', '2019-03-24 11:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `log_table`
--

CREATE TABLE `log_table` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `log_activity` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `user_agent` text,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_table`
--

INSERT INTO `log_table` (`id`, `user_id`, `log_activity`, `ipaddress`, `user_agent`, `created`) VALUES
(87, 1, 'Login at 2019-03-24 11:38:47 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 11:38:47'),
(88, 1, 'Upload file testing giles at 2019-03-24 11:42:57 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 11:42:57'),
(89, 2, 'Login at 2019-03-24 12:28:15 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 12:28:15'),
(90, 1, 'Login at 2019-03-24 12:32:53 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 12:32:53'),
(92, 1, 'Login at 2019-03-24 12:52:55 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 12:52:55'),
(93, 0, 'Ip address - 127.0.0.1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36 is try to attak on your system at 2019-03-24 13:11:14', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:11:14'),
(94, 0, 'Ip address - 127.0.0.1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36 is try to attak on your system at 2019-03-24 13:11:52', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:11:52'),
(95, 1, 'Login at 2019-03-24 13:14:51 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:14:51'),
(96, 0, 'Register at 2019-03-24 13:26:05 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:26:05'),
(97, 3, 'Login at 2019-03-24 13:26:18 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-03-24 13:26:18'),
(98, 1, 'Login at 2019-10-13 19:29:16 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 19:29:16'),
(99, 1, 'Upload file testing files asdfghjklaaaaaaaaa at 2019-10-13 19:34:17 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 19:34:17'),
(100, 1, 'Upload file testing giles at 2019-10-13 20:15:06 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:15:06'),
(101, 1, 'Dowanload uploads/f1553407977779.xlsx.aes at 2019-10-13 20:22:27 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:22:27'),
(102, 1, 'Dowanload uploads/f1570977906575.doc.aes at 2019-10-13 20:25:10 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:25:10'),
(103, 1, 'Dowanload uploads/f1570975457712.doc.aes at 2019-10-13 20:25:33 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:25:33'),
(104, 1, 'Dowanload uploads/f1570977906575.doc.aes at 2019-10-13 20:25:48 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:25:48'),
(105, 1, 'You share file with 3 at 2019-10-13 20:45:42 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:45:42'),
(106, 3, 'Login at 2019-10-13 20:48:04 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 20:48:04'),
(107, 3, 'Login at 2019-10-13 23:04:39 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 23:04:39'),
(108, 3, 'Dowanload  at 2019-10-13 23:12:28 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 23:12:28'),
(109, 3, 'Dowanload  at 2019-10-13 23:12:56 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 23:12:56'),
(110, 3, 'Dowanload  at 2019-10-13 23:15:29 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 23:15:29'),
(111, 3, 'Dowanload uploads/f1570977906575.doc.aes at 2019-10-13 23:16:30 with ip address - 0:0:0:0:0:0:0:1 and user agentMozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '2019-10-13 23:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `registers`
--

CREATE TABLE `registers` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `lname` varchar(100) NOT NULL DEFAULT '',
  `dob` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `contno` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL DEFAULT '',
  `utype` varchar(50) NOT NULL DEFAULT 'user',
  `post` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `adding_date` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registers`
--

INSERT INTO `registers` (`id`, `fname`, `lname`, `dob`, `gender`, `email`, `contno`, `location`, `city`, `password`, `utype`, `post`, `department`, `adding_date`, `status`) VALUES
(1, 'Kamal', 'Kant', '27-02-1987', 'Male', 'admin@gmail.com', '9898989898', 'New Delhi', 'Delhi', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Doctor', 'Dental', '2019-03-21 15:39:55', 1),
(2, 'Pawan', 'Kumar', '15-03-1997', 'Male', 'pawan@gmail.com', '8989898989', 'New Delhi', 'Delhi', '21232f297a57a5a743894a0e4a801fc3', 'user', NULL, NULL, '2019-03-22 00:23:00', 1),
(3, 'Kamal', 'Kant', '14-03-2002', 'Male', 'kamal@gmail.com', '8989898989', 'New Delhi', 'Delhi', '21232f297a57a5a743894a0e4a801fc3', 'user', 'Software Engineer', 'Information Technologies', '2019-03-24 13:26:05', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attacker_list`
--
ALTER TABLE `attacker_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filetimes`
--
ALTER TABLE `filetimes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_share`
--
ALTER TABLE `file_share`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ip_list`
--
ALTER TABLE `ip_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_table`
--
ALTER TABLE `log_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attacker_list`
--
ALTER TABLE `attacker_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `filetimes`
--
ALTER TABLE `filetimes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `file_share`
--
ALTER TABLE `file_share`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ip_list`
--
ALTER TABLE `ip_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `log_table`
--
ALTER TABLE `log_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `registers`
--
ALTER TABLE `registers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
