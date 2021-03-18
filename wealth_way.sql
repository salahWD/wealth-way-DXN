-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2020 at 11:25 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baka_system`
--
CREATE DATABASE IF NOT EXISTS `baka_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `baka_system`;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `planID` int(11) NOT NULL,
  `dxnID` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `growth` int(11) DEFAULT NULL,
  `monthlyTarget` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `endDate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`planID`, `dxnID`, `rank`, `growth`, `monthlyTarget`, `target`, `endDate`) VALUES
(1, 123456789, 0, 257, 553, 2, '2020-08-24'),
(3, 132456789, 2, 200, 600, 12, '2020-04-13'),
(4, 123698548, 1, 300, 600, 3, '2020-11-01'),
(5, 123456710, 0, 50, 600, 2, '2021-03-20'),
(6, 546123987, 4, 0, 0, 3, '0000-00-00'),
(7, 145784121, 0, 0, 0, 0, '0000-00-00'),
(9, 987456321, 3, 0, 0, 0, '2020-08-31'),
(10, 987456322, 3, 0, 0, 0, '0000-00-00'),
(11, 145879623, 1, 0, 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `dxnID` int(11) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `approve` tinyint(4) NOT NULL DEFAULT 0,
  `groupId` int(11) NOT NULL DEFAULT 0,
  `AGPV` int(11) NOT NULL,
  `sponsorCode` int(11) NOT NULL,
  `subscription` int(11) NOT NULL,
  `signDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `mobile`, `dxnID`, `password`, `approve`, `groupId`, `AGPV`, `sponsorCode`, `subscription`, `signDate`) VALUES
('salah', NULL, NULL, 123456710, NULL, 1, 0, 0, 132456789, 1, '2020-08-31 15:25:28'),
('malek', 'moshagger@gmail.com', 2147483647, 123456789, '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, 1, 0, 815612330, 0, '2020-08-24 13:38:28'),
('mohamed', NULL, NULL, 123698548, NULL, 0, 0, 0, 132456789, 0, '2020-08-31 16:50:03'),
('khaled', 'khaled@gmail.com', 5434452, 132456789, '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 0, 0, 123456789, 1, '2020-08-24 19:59:30'),
('mohammed', NULL, NULL, 145784121, NULL, 0, 0, 0, 132456789, 0, '2020-08-31 21:12:27'),
('ahmed', NULL, 365478921, 145879623, NULL, 0, 0, 0, 132456789, 0, '2020-09-06 20:21:04'),
('3bdoo', NULL, 543434452, 546123987, NULL, 0, 0, 0, 132456789, 0, '2020-08-31 20:51:00'),
('omar', NULL, 548635241, 987456321, NULL, 0, 0, 0, 132456789, 0, '2020-08-31 20:51:03'),
('omara', NULL, 548635243, 987456322, NULL, 0, 0, 0, 132456789, 0, '2020-08-31 21:12:36'),
('ahmed', 'ahmed@gmail.com', 5534452, 1345556789, '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 0, 0, 123456789, 1, '2020-08-24 19:59:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`planID`),
  ADD KEY `dxnId_add` (`dxnID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `dxnID` (`dxnID`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `planID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56429;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `dxn_id` FOREIGN KEY (`dxnID`) REFERENCES `users` (`dxnID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `baka_train`
--
CREATE DATABASE IF NOT EXISTS `baka_train` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `baka_train`;

-- --------------------------------------------------------

--
-- Table structure for table `ansers`
--

CREATE TABLE `ansers` (
  `anser_id` int(11) NOT NULL,
  `q_id` int(11) NOT NULL,
  `anser` varchar(255) NOT NULL,
  `is_right` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ansers`
--

INSERT INTO `ansers` (`anser_id`, `q_id`, `anser`, `is_right`) VALUES
(1, 1, 'it is a product', 0),
(2, 1, 'it is a company', 1),
(12, 4, 'test1', 0),
(13, 4, 'test2', 1),
(14, 4, 'test3', 0),
(19, 9, 'nomber one', 0),
(20, 9, 'nomber tow', 1),
(21, 9, 'i don\'t know', 0);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_desc` text NOT NULL,
  `course_img` varchar(255) NOT NULL,
  `course_visibility` tinyint(4) NOT NULL DEFAULT 1,
  `course_order` tinyint(4) NOT NULL DEFAULT 3,
  `last_update` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `course_desc`, `course_img`, `course_visibility`, `course_order`, `last_update`) VALUES
(1, 'dxn systems', 'in this course we will explain dxn systems containes [', 'pyjctnryj.c02su2x.jpg', 1, 1, '2020-12-23'),
(13, 'this is', 'this is desc', 'bbhkje2b3.px69zdj.jpg', 1, 3, '2020-12-15'),
(23, 'this course is good', 'good', 'bbhkje2b3.px69zdj.jpg', 1, 2, '2020-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `dayle_tasks`
--

CREATE TABLE `dayle_tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gethering` varchar(255) DEFAULT NULL,
  `continueu` varchar(255) DEFAULT NULL,
  `training` varchar(255) DEFAULT NULL,
  `social_media` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dayle_tasks`
--

INSERT INTO `dayle_tasks` (`id`, `user_id`, `gethering`, `continueu`, `training`, `social_media`) VALUES
(1, 1, 'asadfiouhafadfiouhafadfiouhaf', NULL, 'sdasd', NULL),
(2, 1, NULL, 'dasd', NULL, 'sdasdas'),
(11, 1, 'salah', 'asdasd\r\n', NULL, NULL),
(12, 1, 'asdasd', 'asdasd', 'asdas', 'dasd'),
(13, 1, 'sabrer', 'aermohammmer', 'sdad6651', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

CREATE TABLE `episodes` (
  `episode_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `episode_name` varchar(255) NOT NULL,
  `course_id` int(11) NOT NULL,
  `episode_link` varchar(255) NOT NULL,
  `episode_img` varchar(255) DEFAULT NULL,
  `add_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `episodes`
--

INSERT INTO `episodes` (`episode_id`, `order`, `episode_name`, `course_id`, `episode_link`, `episode_img`, `add_date`) VALUES
(1, 4, 'bounes system introduction', 1, 'klPhpmHvMcg', 'test.png', '2020-11-10'),
(2, 5, 'bounes system advance', 1, 'PfWImHfnIWQ', 'test.png', '2020-12-16'),
(5, 1, 'test', 1, 'j3_FM8DbkFU', 'test.png', '2020-12-16'),
(8, 3, 'testing ep', 1, 'H4kBv_cnk48', 'test.png', '2020-12-16'),
(9, 1, 'this is a', 13, 'ERw0qvu5IH0', 'course.jpg', '2020-11-10'),
(15, 4, 'this is a testing episode', 13, 'S02xqW13iXU', 'course.jpg', '2020-12-05'),
(18, 2, 'sadasdas', 1, 'xWIKgOju7WQ', 'test.png', '2020-12-16'),
(19, 2, 'asdfsdfsadf', 13, 'XVf64gVnkWQ', 'course.jpg', '2020-12-05'),
(20, 3, 'adfasfasdfdsaf', 13, 'xasKgOju7WQ', 'course.jpg', '2020-12-05'),
(21, 6, 'anything', 13, 'asdasdasfgaas', 'course.jpg', '2020-12-08'),
(22, 5, 'sadafqwq123', 13, '9AXVwarH7nU', 'course.jpg', '2020-12-08'),
(23, 1, 'google dorka', 23, 'asdfsadf', 'test.png', '2020-12-01'),
(24, 3, 'google dorks 2', 23, 'asdwaasd321dawda', 'HTNnuAFmJ.tSgvQG4.png', '2020-12-15'),
(25, 2, 'test1', 23, 'asdasdasdqweqweq', 'XahuiHLau.Qwipqof.jpg', '2020-12-15'),
(26, 7, 'asdasdasdasd', 13, 'asdqw165asdqwda', 'test.png', '2020-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `q_id` int(11) NOT NULL,
  `e_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`q_id`, `e_id`, `question`) VALUES
(1, 1, 'what is dxn ?'),
(4, 9, 'test'),
(9, 5, 'dxn !!');

-- --------------------------------------------------------

--
-- Table structure for table `sd_plan`
--

CREATE TABLE `sd_plan` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `number` bigint(11) DEFAULT NULL COMMENT 'phone number for contact',
  `dxn_id` int(11) NOT NULL,
  `start_date` date NOT NULL DEFAULT current_timestamp(),
  `current_cumulative` int(11) DEFAULT NULL,
  `current_rank` int(11) NOT NULL,
  `target_cumulative` int(11) DEFAULT 4500,
  `target_rank` tinyint(11) DEFAULT 3,
  `up_line` int(11) NOT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sd_plan`
--

INSERT INTO `sd_plan` (`user_id`, `username`, `number`, `dxn_id`, `start_date`, `current_cumulative`, `current_rank`, `target_cumulative`, `target_rank`, `up_line`, `end_date`) VALUES
(12, 'testing 5', 5434344522, 12456879, '0000-00-00', 320, 1, 4500, 3, 2, '2020-12-31'),
(13, 'testing 1', 105434344523, 123321456, '2020-12-12', 350, 0, 4500, 3, 5, '2021-05-11'),
(21, 'salah', 12312312, 12335412, '2020-12-24', 32, 0, 4500, 3, 1, '2021-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `dxn_id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `groupId` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `phone_number`, `dxn_id`, `password`, `groupId`) VALUES
(1, 'salah', 543434452, 847154694, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3),
(2, 'baraa', 436957114, 147147147, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0),
(3, 'anasnas', 546469999, 14785421, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0),
(4, 'zoober', 35435156, 2147483647, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0),
(5, 'testa', 543443425, 147147852, '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_courses`
--

CREATE TABLE `users_courses` (
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `last_ep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_courses`
--

INSERT INTO `users_courses` (`user_id`, `course_id`, `last_ep`) VALUES
(2, 1, 1),
(1, 1, 1),
(1, 13, 1),
(3, 1, 1),
(4, 13, 2),
(4, 1, 5),
(3, 23, 1),
(5, 23, 3),
(5, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ansers`
--
ALTER TABLE `ansers`
  ADD PRIMARY KEY (`anser_id`),
  ADD KEY `anser_question` (`q_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_name` (`course_name`);

--
-- Indexes for table `dayle_tasks`
--
ALTER TABLE `dayle_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`episode_id`),
  ADD UNIQUE KEY `episode_link` (`episode_link`),
  ADD KEY `ep_course` (`course_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`),
  ADD KEY `question_episode` (`e_id`);

--
-- Indexes for table `sd_plan`
--
ALTER TABLE `sd_plan`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `up_line_users_id` (`up_line`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `dxn_id` (`dxn_id`);

--
-- Indexes for table `users_courses`
--
ALTER TABLE `users_courses`
  ADD KEY `users_table` (`user_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `last_ep` (`last_ep`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ansers`
--
ALTER TABLE `ansers`
  MODIFY `anser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `dayle_tasks`
--
ALTER TABLE `dayle_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `episodes`
--
ALTER TABLE `episodes`
  MODIFY `episode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sd_plan`
--
ALTER TABLE `sd_plan`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ansers`
--
ALTER TABLE `ansers`
  ADD CONSTRAINT `anser_question` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dayle_tasks`
--
ALTER TABLE `dayle_tasks`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `ep_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `question_episode` FOREIGN KEY (`e_id`) REFERENCES `episodes` (`episode_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sd_plan`
--
ALTER TABLE `sd_plan`
  ADD CONSTRAINT `up_line_users_id` FOREIGN KEY (`up_line`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_courses`
--
ALTER TABLE `users_courses`
  ADD CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_table` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `dxn`
--
CREATE DATABASE IF NOT EXISTS `dxn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dxn`;

-- --------------------------------------------------------

--
-- Table structure for table `g1`
--

CREATE TABLE `g1` (
  `id` int(11) NOT NULL,
  `up_line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g1`
--

INSERT INTO `g1` (`id`, `up_line`) VALUES
(1, 3),
(2, 3),
(4, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `g2`
--

CREATE TABLE `g2` (
  `id` int(11) NOT NULL,
  `up_line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g2`
--

INSERT INTO `g2` (`id`, `up_line`) VALUES
(1, 1),
(3, 2),
(6, 2),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `g3`
--

CREATE TABLE `g3` (
  `id` int(11) NOT NULL,
  `up_line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g3`
--

INSERT INTO `g3` (`id`, `up_line`) VALUES
(1, 1),
(2, 3),
(3, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `g4`
--

CREATE TABLE `g4` (
  `id` int(11) NOT NULL,
  `up_line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g4`
--

INSERT INTO `g4` (`id`, `up_line`) VALUES
(7, 1),
(6, 2),
(3, 3),
(8, 5);

-- --------------------------------------------------------

--
-- Table structure for table `g5`
--

CREATE TABLE `g5` (
  `id` int(11) NOT NULL,
  `up_line` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `g5`
--

INSERT INTO `g5` (`id`, `up_line`) VALUES
(2, 3),
(3, 6),
(1, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone_number`) VALUES
(1, 'salah', 'salah@gmail.com', 543434452),
(2, 'baraa', 'baraa@gmail.com', 1547823610),
(3, 'malek', 'malek@gmail.com', 1425362145),
(4, 'samer', 'samer@gmail.com', 1754896324);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `g1`
--
ALTER TABLE `g1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upLine_prim` (`up_line`);

--
-- Indexes for table `g2`
--
ALTER TABLE `g2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upLine_g1` (`up_line`);

--
-- Indexes for table `g3`
--
ALTER TABLE `g3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upLine_g2` (`up_line`);

--
-- Indexes for table `g4`
--
ALTER TABLE `g4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upLine_g3` (`up_line`);

--
-- Indexes for table `g5`
--
ALTER TABLE `g5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upLine_g4` (`up_line`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `g1`
--
ALTER TABLE `g1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `g2`
--
ALTER TABLE `g2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `g3`
--
ALTER TABLE `g3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `g4`
--
ALTER TABLE `g4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `g5`
--
ALTER TABLE `g5`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `g1`
--
ALTER TABLE `g1`
  ADD CONSTRAINT `upLine_prim` FOREIGN KEY (`up_line`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g2`
--
ALTER TABLE `g2`
  ADD CONSTRAINT `upLine_g1` FOREIGN KEY (`up_line`) REFERENCES `g1` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g3`
--
ALTER TABLE `g3`
  ADD CONSTRAINT `upLine_g2` FOREIGN KEY (`up_line`) REFERENCES `g2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g4`
--
ALTER TABLE `g4`
  ADD CONSTRAINT `upLine_g3` FOREIGN KEY (`up_line`) REFERENCES `g3` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `g5`
--
ALTER TABLE `g5`
  ADD CONSTRAINT `upLine_g4` FOREIGN KEY (`up_line`) REFERENCES `g4` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `my_wordpress`
--
CREATE DATABASE IF NOT EXISTS `my_wordpress` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `my_wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `site_commentmeta`
--

CREATE TABLE `site_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_commentmeta`
--

INSERT INTO `site_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'akismet_history', 'a:3:{s:4:\"time\";d:1605172228.702723;s:5:\"event\";s:12:\"status-trash\";s:4:\"user\";s:5:\"salah\";}'),
(2, 1, '_wp_trash_meta_status', '1'),
(3, 1, '_wp_trash_meta_time', '1605172228');

-- --------------------------------------------------------

--
-- Table structure for table `site_comments`
--

CREATE TABLE `site_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_comments`
--

INSERT INTO `site_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-10-30 21:42:02', '2020-10-30 21:42:02', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, 'trash', '', 'comment', 0, 0),
(2, 9, 'baraa backhash', 'baraa@gmail.com', '', '::1', '2020-11-03 21:46:05', '2020-11-03 21:46:05', 'this is a nice post', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', 'comment', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `site_links`
--

CREATE TABLE `site_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE `site_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_options`
--

INSERT INTO `site_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'baka blog', 'yes'),
(4, 'blogdescription', 'salah&#039;s blog', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'salahb170@gmail.com', 'yes'),
(7, 'start_of_week', '0', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '12', 'yes'),
(23, 'date_format', 'Y-m-d', 'yes'),
(24, 'time_format', 'g:i A', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:250:{s:9:\"agents/?$\";s:32:\"index.php?post_type=estate_agent\";s:39:\"agents/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=estate_agent&feed=$matches[1]\";s:34:\"agents/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=estate_agent&feed=$matches[1]\";s:26:\"agents/page/([0-9]{1,})/?$\";s:50:\"index.php?post_type=estate_agent&paged=$matches[1]\";s:13:\"properties/?$\";s:35:\"index.php?post_type=estate_property\";s:43:\"properties/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?post_type=estate_property&feed=$matches[1]\";s:38:\"properties/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?post_type=estate_property&feed=$matches[1]\";s:30:\"properties/page/([0-9]{1,})/?$\";s:53:\"index.php?post_type=estate_property&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:10:\"invoice/?$\";s:36:\"index.php?post_type=wpestate_invoice\";s:40:\"invoice/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?post_type=wpestate_invoice&feed=$matches[1]\";s:35:\"invoice/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?post_type=wpestate_invoice&feed=$matches[1]\";s:27:\"invoice/page/([0-9]{1,})/?$\";s:54:\"index.php?post_type=wpestate_invoice&paged=$matches[1]\";s:10:\"package/?$\";s:38:\"index.php?post_type=membership_package\";s:40:\"package/feed/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?post_type=membership_package&feed=$matches[1]\";s:35:\"package/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?post_type=membership_package&feed=$matches[1]\";s:27:\"package/page/([0-9]{1,})/?$\";s:56:\"index.php?post_type=membership_package&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"agents/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"agents/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"agents/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"agents/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"agents/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"agents/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"agents/([^/]+)/embed/?$\";s:45:\"index.php?estate_agent=$matches[1]&embed=true\";s:27:\"agents/([^/]+)/trackback/?$\";s:39:\"index.php?estate_agent=$matches[1]&tb=1\";s:47:\"agents/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?estate_agent=$matches[1]&feed=$matches[2]\";s:42:\"agents/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?estate_agent=$matches[1]&feed=$matches[2]\";s:35:\"agents/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?estate_agent=$matches[1]&paged=$matches[2]\";s:42:\"agents/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?estate_agent=$matches[1]&cpage=$matches[2]\";s:31:\"agents/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?estate_agent=$matches[1]&page=$matches[2]\";s:23:\"agents/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"agents/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"agents/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"agents/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"agents/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"agents/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:55:\"agent_listings/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:62:\"index.php?property_category_agent=$matches[1]&feed=$matches[2]\";s:50:\"agent_listings/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:62:\"index.php?property_category_agent=$matches[1]&feed=$matches[2]\";s:31:\"agent_listings/([^/]+)/embed/?$\";s:56:\"index.php?property_category_agent=$matches[1]&embed=true\";s:43:\"agent_listings/([^/]+)/page/?([0-9]{1,})/?$\";s:63:\"index.php?property_category_agent=$matches[1]&paged=$matches[2]\";s:25:\"agent_listings/([^/]+)/?$\";s:45:\"index.php?property_category_agent=$matches[1]\";s:53:\"agent-action/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?property_action_category_agent=$matches[1]&feed=$matches[2]\";s:48:\"agent-action/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:69:\"index.php?property_action_category_agent=$matches[1]&feed=$matches[2]\";s:29:\"agent-action/([^/]+)/embed/?$\";s:63:\"index.php?property_action_category_agent=$matches[1]&embed=true\";s:41:\"agent-action/([^/]+)/page/?([0-9]{1,})/?$\";s:70:\"index.php?property_action_category_agent=$matches[1]&paged=$matches[2]\";s:23:\"agent-action/([^/]+)/?$\";s:52:\"index.php?property_action_category_agent=$matches[1]\";s:51:\"agent-city/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?property_city_agent=$matches[1]&feed=$matches[2]\";s:46:\"agent-city/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?property_city_agent=$matches[1]&feed=$matches[2]\";s:27:\"agent-city/([^/]+)/embed/?$\";s:52:\"index.php?property_city_agent=$matches[1]&embed=true\";s:39:\"agent-city/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?property_city_agent=$matches[1]&paged=$matches[2]\";s:21:\"agent-city/([^/]+)/?$\";s:41:\"index.php?property_city_agent=$matches[1]\";s:51:\"agent-area/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?property_area_agent=$matches[1]&feed=$matches[2]\";s:46:\"agent-area/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:58:\"index.php?property_area_agent=$matches[1]&feed=$matches[2]\";s:27:\"agent-area/([^/]+)/embed/?$\";s:52:\"index.php?property_area_agent=$matches[1]&embed=true\";s:39:\"agent-area/([^/]+)/page/?([0-9]{1,})/?$\";s:59:\"index.php?property_area_agent=$matches[1]&paged=$matches[2]\";s:21:\"agent-area/([^/]+)/?$\";s:41:\"index.php?property_area_agent=$matches[1]\";s:52:\"agent-state/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?property_county_state_agent=$matches[1]&feed=$matches[2]\";s:47:\"agent-state/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:66:\"index.php?property_county_state_agent=$matches[1]&feed=$matches[2]\";s:28:\"agent-state/([^/]+)/embed/?$\";s:60:\"index.php?property_county_state_agent=$matches[1]&embed=true\";s:40:\"agent-state/([^/]+)/page/?([0-9]{1,})/?$\";s:67:\"index.php?property_county_state_agent=$matches[1]&paged=$matches[2]\";s:22:\"agent-state/([^/]+)/?$\";s:49:\"index.php?property_county_state_agent=$matches[1]\";s:38:\"properties/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:48:\"properties/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:68:\"properties/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"properties/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:63:\"properties/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:44:\"properties/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:27:\"properties/([^/]+)/embed/?$\";s:48:\"index.php?estate_property=$matches[1]&embed=true\";s:31:\"properties/([^/]+)/trackback/?$\";s:42:\"index.php?estate_property=$matches[1]&tb=1\";s:51:\"properties/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?estate_property=$matches[1]&feed=$matches[2]\";s:46:\"properties/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:54:\"index.php?estate_property=$matches[1]&feed=$matches[2]\";s:39:\"properties/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?estate_property=$matches[1]&paged=$matches[2]\";s:46:\"properties/([^/]+)/comment-page-([0-9]{1,})/?$\";s:55:\"index.php?estate_property=$matches[1]&cpage=$matches[2]\";s:35:\"properties/([^/]+)(?:/([0-9]+))?/?$\";s:54:\"index.php?estate_property=$matches[1]&page=$matches[2]\";s:27:\"properties/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"properties/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"properties/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"properties/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"properties/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"properties/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:49:\"listings/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:56:\"index.php?property_category=$matches[1]&feed=$matches[2]\";s:44:\"listings/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:56:\"index.php?property_category=$matches[1]&feed=$matches[2]\";s:25:\"listings/([^/]+)/embed/?$\";s:50:\"index.php?property_category=$matches[1]&embed=true\";s:37:\"listings/([^/]+)/page/?([0-9]{1,})/?$\";s:57:\"index.php?property_category=$matches[1]&paged=$matches[2]\";s:19:\"listings/([^/]+)/?$\";s:39:\"index.php?property_category=$matches[1]\";s:47:\"action/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:63:\"index.php?property_action_category=$matches[1]&feed=$matches[2]\";s:42:\"action/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:63:\"index.php?property_action_category=$matches[1]&feed=$matches[2]\";s:23:\"action/([^/]+)/embed/?$\";s:57:\"index.php?property_action_category=$matches[1]&embed=true\";s:35:\"action/([^/]+)/page/?([0-9]{1,})/?$\";s:64:\"index.php?property_action_category=$matches[1]&paged=$matches[2]\";s:17:\"action/([^/]+)/?$\";s:46:\"index.php?property_action_category=$matches[1]\";s:45:\"city/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?property_city=$matches[1]&feed=$matches[2]\";s:40:\"city/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?property_city=$matches[1]&feed=$matches[2]\";s:21:\"city/([^/]+)/embed/?$\";s:46:\"index.php?property_city=$matches[1]&embed=true\";s:33:\"city/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?property_city=$matches[1]&paged=$matches[2]\";s:15:\"city/([^/]+)/?$\";s:35:\"index.php?property_city=$matches[1]\";s:45:\"area/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?property_area=$matches[1]&feed=$matches[2]\";s:40:\"area/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?property_area=$matches[1]&feed=$matches[2]\";s:21:\"area/([^/]+)/embed/?$\";s:46:\"index.php?property_area=$matches[1]&embed=true\";s:33:\"area/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?property_area=$matches[1]&paged=$matches[2]\";s:15:\"area/([^/]+)/?$\";s:35:\"index.php?property_area=$matches[1]\";s:46:\"state/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?property_county_state=$matches[1]&feed=$matches[2]\";s:41:\"state/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:60:\"index.php?property_county_state=$matches[1]&feed=$matches[2]\";s:22:\"state/([^/]+)/embed/?$\";s:54:\"index.php?property_county_state=$matches[1]&embed=true\";s:34:\"state/([^/]+)/page/?([0-9]{1,})/?$\";s:61:\"index.php?property_county_state=$matches[1]&paged=$matches[2]\";s:16:\"state/([^/]+)/?$\";s:43:\"index.php?property_county_state=$matches[1]\";s:35:\"invoice/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"invoice/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"invoice/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"invoice/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"invoice/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"invoice/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"invoice/([^/]+)/embed/?$\";s:49:\"index.php?wpestate_invoice=$matches[1]&embed=true\";s:28:\"invoice/([^/]+)/trackback/?$\";s:43:\"index.php?wpestate_invoice=$matches[1]&tb=1\";s:48:\"invoice/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?wpestate_invoice=$matches[1]&feed=$matches[2]\";s:43:\"invoice/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:55:\"index.php?wpestate_invoice=$matches[1]&feed=$matches[2]\";s:36:\"invoice/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?wpestate_invoice=$matches[1]&paged=$matches[2]\";s:43:\"invoice/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?wpestate_invoice=$matches[1]&cpage=$matches[2]\";s:32:\"invoice/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?wpestate_invoice=$matches[1]&page=$matches[2]\";s:24:\"invoice/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"invoice/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"invoice/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"invoice/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"invoice/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"invoice/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:36:\"searches/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"searches/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"searches/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"searches/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"searches/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"searches/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"searches/([^/]+)/embed/?$\";s:48:\"index.php?wpestate_search=$matches[1]&embed=true\";s:29:\"searches/([^/]+)/trackback/?$\";s:42:\"index.php?wpestate_search=$matches[1]&tb=1\";s:37:\"searches/([^/]+)/page/?([0-9]{1,})/?$\";s:55:\"index.php?wpestate_search=$matches[1]&paged=$matches[2]\";s:44:\"searches/([^/]+)/comment-page-([0-9]{1,})/?$\";s:55:\"index.php?wpestate_search=$matches[1]&cpage=$matches[2]\";s:33:\"searches/([^/]+)(?:/([0-9]+))?/?$\";s:54:\"index.php?wpestate_search=$matches[1]&page=$matches[2]\";s:25:\"searches/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"searches/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"searches/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"searches/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"searches/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:31:\"searches/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:35:\"package/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"package/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"package/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"package/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"package/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"package/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"package/([^/]+)/embed/?$\";s:51:\"index.php?membership_package=$matches[1]&embed=true\";s:28:\"package/([^/]+)/trackback/?$\";s:45:\"index.php?membership_package=$matches[1]&tb=1\";s:48:\"package/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?membership_package=$matches[1]&feed=$matches[2]\";s:43:\"package/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:57:\"index.php?membership_package=$matches[1]&feed=$matches[2]\";s:36:\"package/([^/]+)/page/?([0-9]{1,})/?$\";s:58:\"index.php?membership_package=$matches[1]&paged=$matches[2]\";s:43:\"package/([^/]+)/comment-page-([0-9]{1,})/?$\";s:58:\"index.php?membership_package=$matches[1]&cpage=$matches[2]\";s:32:\"package/([^/]+)(?:/([0-9]+))?/?$\";s:57:\"index.php?membership_package=$matches[1]&page=$matches[2]\";s:24:\"package/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"package/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"package/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"package/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"package/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"package/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:19:\"akismet/akismet.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:3:{i:0;s:68:\"D:\\localhost\\htdocs\\wordpress/wp-content/themes/songwriter/style.css\";i:2;s:72:\"D:\\localhost\\htdocs\\wordpress/wp-content/themes/songwriter/functions.php\";i:3;s:0:\"\";}', 'no'),
(40, 'template', 'wpresidence', 'yes'),
(41, 'stylesheet', 'wpresidence', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '48748', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'file', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:1:{i:0;i:61;}', 'yes'),
(76, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1619646117', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'initial_db_version', '48748', 'yes'),
(96, 'site_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(97, 'fresh_site', '0', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:3:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;i:4;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:10:{s:19:\"wp_inactive_widgets\";a:8:{i:0;s:6:\"meta-2\";i:1;s:10:\"nav_menu-3\";i:2;s:13:\"custom_html-3\";i:3;s:16:\"akismet_widget-3\";i:4;s:10:\"archives-2\";i:5;s:17:\"recent-comments-2\";i:6;s:11:\"tag_cloud-3\";i:7;s:10:\"archives-4\";}s:19:\"primary-widget-area\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:7:\"pages-2\";}s:21:\"secondary-widget-area\";a:0:{}s:24:\"first-footer-widget-area\";a:0:{}s:25:\"second-footer-widget-area\";a:0:{}s:24:\"third-footer-widget-area\";a:0:{}s:25:\"fourth-footer-widget-area\";a:0:{}s:24:\"top-bar-left-widget-area\";a:0:{}s:25:\"top-bar-right-widget-area\";a:1:{i:0;s:12:\"categories-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:7:{i:1607181847;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1607204523;a:2:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1607204524;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1607204558;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1607204560;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1607264296;a:1:{s:40:\"prefix_wpestate_cron_generate_pins_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:2:{i:2;a:3:{s:5:\"title\";s:8:\"site map\";s:6:\"sortby\";s:10:\"post_title\";s:7:\"exclude\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:3:{s:5:\"title\";s:4:\"tags\";s:5:\"count\";i:1;s:8:\"taxonomy\";s:8:\"category\";}}', 'yes'),
(112, 'widget_nav_menu', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:2:{s:5:\"title\";s:7:\"testing\";s:8:\"nav_menu\";i:4;}}', 'yes'),
(113, 'widget_custom_html', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:0:{}}', 'yes'),
(115, 'recovery_keys', 'a:0:{}', 'yes'),
(118, 'theme_mods_twentytwenty', 'a:4:{s:18:\"custom_css_post_id\";i:14;s:16:\"background_color\";s:6:\"1e73be\";s:24:\"accent_accessible_colors\";a:2:{s:7:\"content\";a:5:{s:4:\"text\";s:7:\"#ffffff\";s:6:\"accent\";s:7:\"#fcf2f4\";s:10:\"background\";s:7:\"#1e73be\";s:7:\"borders\";s:7:\"#2a8adf\";s:9:\"secondary\";s:7:\"#ffffff\";}s:13:\"header-footer\";a:4:{s:4:\"text\";s:7:\"#000000\";s:6:\"accent\";s:7:\"#cd2653\";s:9:\"secondary\";s:7:\"#6d6d6d\";s:7:\"borders\";s:7:\"#dcd7ca\";}}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1604674851;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:2:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";}s:9:\"sidebar-2\";a:2:{i:0;s:12:\"categories-2\";i:1;s:6:\"meta-2\";}}}}', 'yes'),
(130, 'can_compress_scripts', '1', 'no'),
(143, 'finished_updating_comment_type', '1', 'yes'),
(157, 'category_children', 'a:0:{}', 'yes'),
(160, 'WPLANG', '', 'yes'),
(161, 'new_admin_email', 'salahb170@gmail.com', 'yes'),
(178, '_transient_health-check-site-status-result', '{\"good\":\"13\",\"recommended\":\"7\",\"critical\":\"0\"}', 'yes'),
(247, 'current_theme', 'Wp Residence 1.15.2', 'yes'),
(248, 'theme_mods_songwriter', 'a:22:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:15:\"main-navigation\";i:5;}s:18:\"custom_css_post_id\";i:-1;s:16:\"background_color\";s:6:\"eeeeee\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1607177895;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:6:\"meta-2\";i:1;s:10:\"nav_menu-3\";i:2;s:13:\"custom_html-3\";i:3;s:16:\"akismet_widget-3\";i:4;s:10:\"archives-2\";i:5;s:17:\"recent-comments-2\";}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:7:\"pages-2\";}s:9:\"sidebar-2\";a:1:{i:0;s:12:\"categories-2\";}s:9:\"sidebar-3\";a:1:{i:0;s:11:\"tag_cloud-3\";}s:9:\"sidebar-4\";a:1:{i:0;s:10:\"archives-4\";}s:9:\"sidebar-5\";a:0:{}}}s:12:\"header_image\";s:13:\"remove-header\";s:26:\"songwriter_display_sidebar\";s:7:\"Display\";s:29:\"songwriter_display_breadcrumb\";s:7:\"Display\";s:31:\"songwriter_display_header_image\";s:10:\"Everywhere\";s:35:\"songwriter_display_site_description\";s:7:\"Display\";s:30:\"songwriter_display_search_form\";s:4:\"Hide\";s:25:\"songwriter_header_address\";s:12:\"561 / 32 / 1\";s:23:\"songwriter_header_email\";s:15:\"salah@gmail.com\";s:23:\"songwriter_header_phone\";s:13:\"+90 547891236\";s:23:\"songwriter_header_skype\";s:18:\"skype account name\";s:29:\"songwriter_display_image_post\";s:7:\"Display\";s:28:\"songwriter_display_meta_post\";s:7:\"Display\";s:28:\"songwriter_next_preview_post\";s:7:\"Display\";s:32:\"songwriter_latest_posts_headline\";s:0:\"\";s:24:\"songwriter_character_set\";s:5:\"latin\";s:28:\"songwriter_body_google_fonts\";s:7:\"default\";s:32:\"songwriter_headings_google_fonts\";s:7:\"default\";}', 'yes'),
(249, 'theme_switched', '', 'yes'),
(250, 'nav_menu_options', 'a:1:{s:8:\"auto_add\";a:0:{}}', 'yes'),
(252, 'recently_activated', 'a:0:{}', 'yes'),
(254, 'widget_akismet_widget', 'a:2:{s:12:\"_multiwidget\";i:1;i:3;a:0:{}}', 'yes'),
(255, 'akismet_strictness', '0', 'yes'),
(256, 'akismet_show_user_comments_approved', '0', 'yes'),
(257, 'akismet_comment_form_privacy_notice', 'hide', 'yes'),
(258, 'wordpress_api_key', '467830b6931c', 'yes'),
(259, 'akismet_spam_count', '0', 'yes'),
(273, 'theme_mods_salah', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:14:\"bootstrap-menu\";i:5;s:11:\"footer-menu\";i:4;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1607171089;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:12:{i:0;s:6:\"meta-2\";i:1;s:10:\"nav_menu-3\";i:2;s:13:\"custom_html-3\";i:3;s:16:\"akismet_widget-3\";i:4;s:10:\"archives-2\";i:5;s:17:\"recent-comments-2\";i:6;s:8:\"search-2\";i:7;s:14:\"recent-posts-2\";i:8;s:7:\"pages-2\";i:9;s:12:\"categories-2\";i:10;s:11:\"tag_cloud-3\";i:11;s:10:\"archives-4\";}}}}', 'yes'),
(314, 'wpcf7', 'a:2:{s:7:\"version\";s:3:\"5.3\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1605040030;s:7:\"version\";s:3:\"5.3\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(319, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.5.3\";s:7:\"version\";s:5:\"5.5.3\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1607169293;s:15:\"version_checked\";s:5:\"5.5.3\";s:12:\"translations\";a:0:{}}', 'no'),
(320, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1607177903;s:7:\"checked\";a:5:{s:5:\"salah\";s:0:\"\";s:10:\"songwriter\";s:5:\"2.0.5\";s:14:\"twentynineteen\";s:3:\"1.7\";s:15:\"twentyseventeen\";s:3:\"2.4\";s:12:\"twentytwenty\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:10:\"songwriter\";a:6:{s:5:\"theme\";s:10:\"songwriter\";s:11:\"new_version\";s:5:\"2.0.5\";s:3:\"url\";s:40:\"https://wordpress.org/themes/songwriter/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/songwriter.2.0.5.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";b:0;}s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(325, 'secret_key', ',.Gm=?[k92!U;`/L|OH/8q!4[ACRw?hZahZZ&j=(+jdD+r|1xGw3W;0T#V%@WpI-', 'no'),
(411, '_site_transient_timeout_theme_roots', '1607179692', 'no'),
(412, '_site_transient_theme_roots', 'a:6:{s:5:\"salah\";s:7:\"/themes\";s:10:\"songwriter\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:11:\"wpresidence\";s:7:\"/themes\";}', 'no'),
(414, 'theme_mods_wpresidence', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:5;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(415, 'wp_estate_show_top_bar_user_login', 'no', 'yes'),
(416, 'wp_estate_show_top_bar_user_menu', 'no', 'yes'),
(417, 'wp_estate_show_adv_search_general', 'yes', 'yes'),
(418, 'wp_estate_currency_symbol', '$', 'yes'),
(419, 'wp_estate_where_currency_symbol', 'before', 'yes'),
(420, 'wp_estate_measure_sys', 'ft', 'yes'),
(421, 'wp_estate_facebook_login', 'no', 'yes'),
(422, 'wp_estate_google_login', 'no', 'yes'),
(423, 'wp_estate_yahoo_login', 'no', 'yes'),
(424, 'wp_estate_wide_status', '1', 'yes'),
(425, 'wp_estate_header_type', '4', 'yes'),
(426, 'wp_estate_prop_no', '12', 'yes'),
(427, 'wp_estate_show_empty_city', 'no', 'yes'),
(428, 'wp_estate_blog_sidebar', 'right', 'yes'),
(429, 'wp_estate_blog_sidebar_name', 'primary-widget-area', 'yes'),
(430, 'wp_estate_blog_unit', 'normal', 'yes'),
(431, 'wp_estate_general_latitude', '40.781711', 'yes'),
(432, 'wp_estate_general_longitude', '-73.955927', 'yes'),
(433, 'wp_estate_default_map_zoom', '15', 'yes'),
(434, 'wp_estate_cache', 'no', 'yes'),
(435, 'wp_estate_show_adv_search_map_close', 'yes', 'yes'),
(436, 'wp_estate_pin_cluster', 'yes', 'yes'),
(437, 'wp_estate_zoom_cluster', '10', 'yes'),
(438, 'wp_estate_hq_latitude', '40.781711', 'yes'),
(439, 'wp_estate_hq_longitude', '-73.955927', 'yes'),
(440, 'wp_estate_idx_enable', 'no', 'yes'),
(441, 'wp_estate_geolocation_radius', '1000', 'yes'),
(442, 'wp_estate_min_height', '300', 'yes'),
(443, 'wp_estate_max_height', '450', 'yes'),
(444, 'wp_estate_keep_min', 'no', 'yes'),
(445, 'wp_estate_paid_submission', 'no', 'yes'),
(446, 'wp_estate_admin_submission', 'yes', 'yes'),
(447, 'wp_estate_user_agent', 'no', 'yes'),
(448, 'wp_estate_price_submission', '0', 'yes'),
(449, 'wp_estate_price_featured_submission', '0', 'yes'),
(450, 'wp_estate_submission_curency', 'USD', 'yes'),
(451, 'wp_estate_paypal_api', 'sandbox', 'yes'),
(452, 'wp_estate_free_mem_list', '0', 'yes'),
(453, 'wp_estate_free_feat_list', '0', 'yes'),
(454, 'wp_estate_free_feat_list_expiration', '0', 'yes'),
(455, 'wp_estate_custom_fields', 'a:7:{i:0;a:4:{i:0;s:13:\"property year\";i:1;s:10:\"Year Built\";i:2;s:4:\"date\";i:3;i:1;}i:1;a:4:{i:0;s:15:\"property garage\";i:1;s:7:\"Garages\";i:2;s:10:\"short text\";i:3;i:2;}i:2;a:4:{i:0;s:20:\"property garage size\";i:1;s:11:\"Garage Size\";i:2;s:10:\"short text\";i:3;i:3;}i:3;a:4:{i:0;s:13:\"property date\";i:1;s:14:\"Available from\";i:2;s:10:\"short text\";i:3;i:4;}i:4;a:4:{i:0;s:17:\"property basement\";i:1;s:8:\"Basement\";i:2;s:10:\"short text\";i:3;i:5;}i:5;a:4:{i:0;s:30:\"property external construction\";i:1;s:21:\"external construction\";i:2;s:10:\"short text\";i:3;i:6;}i:6;a:4:{i:0;s:16:\"property roofing\";i:1;s:7:\"Roofing\";i:2;s:10:\"short text\";i:3;i:7;}}', 'yes'),
(456, 'wp_estate_custom_advanced_search', 'no', 'yes'),
(457, 'wp_estate_adv_search_type', '1', 'yes'),
(458, 'wp_estate_show_adv_search', 'yes', 'yes'),
(459, 'wp_estate_cron_run', '1607177898', 'yes'),
(460, 'wp_estate_feature_list', 'attic, gas heat, ocean view, wine cellar, basketball court, gym,pound, fireplace, lake view, pool, back yard, front yard, fenced yard, sprinklers, washer and dryer, deck, balcony, laundry, concierge, doorman, private space, storage, recreation, roof deck', 'yes'),
(461, 'wp_estate_show_no_features', 'yes', 'yes'),
(462, 'wp_estate_property_features_text', 'Property Features', 'yes'),
(463, 'wp_estate_property_description_text', 'Property Description', 'yes'),
(464, 'wp_estate_property_details_text', 'Property Details ', 'yes'),
(465, 'wp_estate_status_list', 'open house, sold', 'yes'),
(466, 'wp_estate_slider_cycle', '0', 'yes'),
(467, 'wp_estate_show_save_search', 'no', 'yes'),
(468, 'wp_estate_search_alert', '1', 'yes'),
(469, 'wp_estate_color_scheme', 'no', 'yes'),
(470, 'wp_estate_main_color', '3C90BE', 'yes'),
(471, 'wp_estate_background_color', 'f3f3f3', 'yes'),
(472, 'wp_estate_content_back_color', 'ffffff', 'yes'),
(473, 'wp_estate_header_color', 'ffffff', 'yes'),
(474, 'wp_estate_breadcrumbs_font_color', '99a3b1', 'yes'),
(475, 'wp_estate_font_color', '768082', 'yes'),
(476, 'wp_estate_menu_items_color', '768082', 'yes'),
(477, 'wp_estate_link_color', '#a171b', 'yes'),
(478, 'wp_estate_headings_color', '434a54', 'yes'),
(479, 'wp_estate_sidebar_heading_boxed_color', '434a54', 'yes'),
(480, 'wp_estate_sidebar_heading_color', '434a54', 'yes'),
(481, 'wp_estate_sidebar_widget_color', 'fdfdfd', 'yes'),
(482, 'wp_estate_sidebar2_font_color', '888C8E', 'yes'),
(483, 'wp_estate_footer_back_color', '282D33', 'yes'),
(484, 'wp_estate_footer_font_color', '72777F', 'yes'),
(485, 'wp_estate_footer_copy_color', '72777F', 'yes'),
(486, 'wp_estate_menu_font_color', '434a54', 'yes'),
(487, 'wp_estate_menu_hover_back_color', '3C90BE', 'yes'),
(488, 'wp_estate_menu_hover_font_color', 'ffffff', 'yes'),
(489, 'wp_estate_top_bar_back', 'fdfdfd', 'yes'),
(490, 'wp_estate_top_bar_font', '1a171b', 'yes'),
(491, 'wp_estate_adv_search_back_color', 'fdfdfd', 'yes'),
(492, 'wp_estate_adv_search_font_color', '1a171b', 'yes'),
(493, 'wp_estate_box_content_back_color', 'fdfdfd', 'yes'),
(494, 'wp_estate_box_content_border_color', '347DA4', 'yes'),
(495, 'wp_estate_hover_button_color', 'f0f0f0', 'yes');
INSERT INTO `site_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(496, 'wp_estate_show_g_search', 'no', 'yes'),
(497, 'wp_estate_show_adv_search_extended', 'no', 'yes'),
(498, 'wp_estate_readsys', 'no', 'yes'),
(499, 'wp_estate_ssl_map', 'no', 'yes'),
(500, 'wp_estate_enable_stripe', 'no', 'yes'),
(501, 'wp_estate_enable_paypal', 'no', 'yes'),
(502, 'wp_estate_enable_direct_pay', 'no', 'yes'),
(503, 'wp_estate_global_property_page_agent_sidebar', 'no', 'yes'),
(504, 'wp_estate_global_prpg_slider_type', 'horizontal', 'yes'),
(505, 'wp_estate_global_prpg_content_type', 'accordion', 'yes'),
(506, 'wp_estate_logo_margin', '0', 'yes'),
(507, 'wp_estate_header_transparent', 'no', 'yes'),
(508, 'wp_estate_default_map_type', 'ROADMAP', 'yes'),
(509, 'wp_estate_prices_th_separator', '.', 'yes'),
(510, 'wp_estate_multi_curr', '', 'yes'),
(511, 'wp_estate_date_lang', 'default', 'yes'),
(512, 'wp_estate_logo_header_type', 'type1', 'yes'),
(513, 'wp_estate_enable_autocomplete', 'no', 'yes'),
(514, 'wp_estate_enable_user_pass', 'no', 'yes'),
(515, 'wp_estate_auto_curency', 'no', 'yes'),
(516, 'wp_estate_use_mimify', 'no', 'yes'),
(517, 'wp_estate_subject_password_reset_request', 'Password Reset Request', 'yes'),
(518, 'wp_estate_password_reset_request', 'Someone requested that the password be reset for the following account:\r\n%website_url \r\nUsername: %username.\r\nIf this was a mistake, just ignore this email and nothing will happen. To reset your password, visit the following address:%reset_link,\r\nThank You!', 'yes'),
(519, 'wp_estate_subject_password_reseted', 'Your Password was Reset', 'yes'),
(520, 'wp_estate_password_reseted', 'Your new password for the account at: %website_url: \r\nUsername:%username, \r\nPassword:%user_pass.\r\nYou can now login with your new password at: %website_url', 'yes'),
(521, 'wp_estate_subject_purchase_activated', 'Your purchase was activated', 'yes'),
(522, 'wp_estate_purchase_activated', 'Hi there,\r\nYour purchase on  %website_url is activated! You should go check it out.', 'yes'),
(523, 'wp_estate_subject_approved_listing', 'Your listing was approved', 'yes'),
(524, 'wp_estate_approved_listing', 'Hi there,\r\nYour listing, %property_title was approved on  %website_url! The listing is: %property_url.\r\nYou should go check it out.', 'yes'),
(525, 'wp_estate_subject_new_wire_transfer', 'You ordered a new Wire Transfer', 'yes'),
(526, 'wp_estate_new_wire_transfer', 'We received your Wire Transfer payment request on  %website_url !\r\nPlease follow the instructions below in order to start submitting properties as soon as possible.\r\nThe invoice number is: %invoice_no, Amount: %total_price. \r\nInstructions:  %payment_details.', 'yes'),
(527, 'wp_estate_subject_admin_new_wire_transfer', 'Somebody ordered a new Wire Transfer', 'yes'),
(528, 'wp_estate_admin_new_wire_transfer', 'Hi there,\r\nYou received a new Wire Transfer payment request on %website_url.\r\nThe invoice number is:  %invoice_no,  Amount: %total_price.\r\nPlease wait until the payment is made to activate the user purchase.', 'yes'),
(529, 'wp_estate_subject_admin_new_user', 'New User Registration', 'yes'),
(530, 'wp_estate_admin_new_user', 'New user registration on %website_url.\r\nUsername: %user_login_register, \r\nE-mail: %user_email_register', 'yes'),
(531, 'wp_estate_subject_new_user', 'Your username and password on %website_url', 'yes'),
(532, 'wp_estate_new_user', 'Hi there,\r\nWelcome to %website_url! You can login now using the below credentials:\r\nUsername:%user_login_register\r\nPassword: %user_pass_register\r\nIf you have any problems, please contact me.\r\nThank you!', 'yes'),
(533, 'wp_estate_subject_admin_expired_listing', 'Expired Listing sent for approval on %website_url', 'yes'),
(534, 'wp_estate_admin_expired_listing', 'Hi there,\r\nA user has re-submited a new property on %website_url! You should go check it out.\r\nThis is the property title: %submission_title.', 'yes'),
(535, 'wp_estate_subject_matching_submissions', 'Matching Submissions on %website_url', 'yes'),
(536, 'wp_estate_matching_submissions', 'Hi there,\r\nA new submission matching your chosen criteria has been published at %website_url.\r\nThese are the new submissions: \r\n%matching_submissions\r\n', 'yes'),
(537, 'wp_estate_subject_paid_submissions', 'New Paid Submission on %website_url', 'yes'),
(538, 'wp_estate_paid_submissions', 'Hi there,\r\nYou have a new paid submission on  %website_url! You should go check it out.', 'yes'),
(539, 'wp_estate_subject_featured_submission', 'New Feature Upgrade on  %website_url', 'yes'),
(540, 'wp_estate_featured_submission', 'Hi there,\r\nYou have a new featured submission on  %website_url! You should go check it out.', 'yes'),
(541, 'wp_estate_subject_account_downgraded', 'Account Downgraded on %website_url', 'yes'),
(542, 'wp_estate_account_downgraded', 'Hi there,\r\nYou downgraded your subscription on %website_url. Because your listings number was greater than what the actual package offers, we set the status of all your listings to \"expired\". You will need to choose which listings you want live and send them again for approval.\r\nThank you!', 'yes'),
(543, 'wp_estate_subject_membership_cancelled', 'Membership Cancelled on %website_url', 'yes'),
(544, 'wp_estate_membership_cancelled', 'Hi there,\r\nYour subscription on %website_url was cancelled because it expired or the recurring payment from the merchant was not processed. All your listings are no longer visible for our visitors but remain in your account.\r\nThank you.', 'yes'),
(545, 'wp_estate_subject_membership_activated', 'Membership Activated on %website_url', 'yes'),
(546, 'wp_estate_membership_activated', 'Hi there,\r\nYour new membership on %website_url is activated! You should go check it out.', 'yes'),
(547, 'wp_estate_subject_free_listing_expired', 'Free Listing expired on %website_url', 'yes'),
(548, 'wp_estate_free_listing_expired', 'Hi there,\r\nOne of your free listings on  %website_url has \"expired\". The listing is %expired_listing_url.\r\nThank you!', 'yes'),
(549, 'wp_estate_subject_new_listing_submission', 'New Listing Submission on %website_url', 'yes'),
(550, 'wp_estate_new_listing_submission', 'Hi there,\r\nA user has submited a new property on %website_url! You should go check it out.This is the property title %new_listing_title!', 'yes'),
(551, 'wp_estate_subject_listing_edit', 'Listing Edited on %website_url', 'yes'),
(552, 'wp_estate_listing_edit', 'Hi there,\r\nA user has edited one of his listings  on %website_url ! You should go check it out. The property name is : %editing_listing_title!', 'yes'),
(553, 'wp_estate_subject_recurring_payment', 'Recurring Payment on %website_url', 'yes'),
(554, 'wp_estate_recurring_payment', 'Hi there,\r\nWe charged your account on %merchant for a subscription on %website_url ! You should go check it out.', 'yes'),
(555, 'widget_twitter-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(556, 'widget_facebook_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(557, 'widget_mortgage_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(558, 'widget_contact_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(559, 'widget_social_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(560, 'widget_featured_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(561, 'widget_footer_latest_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(562, 'widget_advanced_search_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(563, 'widget_zillow_estimate_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(564, 'widget_login_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(565, 'widget_social_widget_top', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(566, 'widget_featured_agent', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(567, 'widget_multiple_currency_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(569, '_site_transient_update_plugins', 'O:8:\"stdClass\":1:{s:12:\"last_checked\";i:1607177902;}', 'no'),
(570, 'wpestate_pagination_meta_query', 'a:1:{i:0;a:4:{s:3:\"key\";s:14:\"property_price\";s:5:\"value\";d:0;s:4:\"type\";s:7:\"numeric\";s:7:\"compare\";s:2:\">=\";}}', 'yes'),
(571, 'wpestate_pagination_categ_query', '', 'yes'),
(572, 'wpestate_pagination_action_query', '', 'yes'),
(573, 'wpestate_pagination_city_query', '', 'yes'),
(574, 'wpestate_pagination_area_query', '', 'yes'),
(575, 'wpestate_pagination_county_state_query', '', 'yes'),
(578, 'property_category_agent_children', 'a:0:{}', 'yes'),
(579, 'property_city_agent_children', 'a:0:{}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `site_postmeta`
--

CREATE TABLE `site_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_postmeta`
--

INSERT INTO `site_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 1, '_edit_lock', '1604094087:1'),
(4, 2, '_edit_lock', '1604094337:1'),
(5, 6, '_edit_lock', '1604674895:1'),
(7, 9, '_edit_lock', '1605944925:1'),
(23, 21, '_edit_lock', '1604655905:1'),
(24, 23, '_wp_trash_meta_status', 'publish'),
(25, 23, '_wp_trash_meta_time', '1604656161'),
(26, 3, '_wp_trash_meta_status', 'draft'),
(27, 3, '_wp_trash_meta_time', '1604675054'),
(28, 3, '_wp_desired_post_slug', 'privacy-policy'),
(29, 26, '_wp_trash_meta_status', 'publish'),
(30, 26, '_wp_trash_meta_time', '1604675140'),
(31, 27, '_wp_trash_meta_status', 'publish'),
(32, 27, '_wp_trash_meta_time', '1604675161'),
(81, 28, '_wp_trash_meta_status', 'publish'),
(82, 28, '_wp_trash_meta_time', '1604675202'),
(102, 39, '_edit_lock', '1604955624:1'),
(121, 44, '_menu_item_type', 'post_type'),
(122, 44, '_menu_item_menu_item_parent', '0'),
(123, 44, '_menu_item_object_id', '9'),
(124, 44, '_menu_item_object', 'post'),
(125, 44, '_menu_item_target', ''),
(126, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(127, 44, '_menu_item_xfn', ''),
(128, 44, '_menu_item_url', ''),
(130, 45, '_menu_item_type', 'post_type'),
(131, 45, '_menu_item_menu_item_parent', '0'),
(132, 45, '_menu_item_object_id', '1'),
(133, 45, '_menu_item_object', 'post'),
(134, 45, '_menu_item_target', ''),
(135, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(136, 45, '_menu_item_xfn', ''),
(137, 45, '_menu_item_url', ''),
(139, 46, '_wp_trash_meta_status', 'publish'),
(140, 46, '_wp_trash_meta_time', '1604989068'),
(141, 47, '_menu_item_type', 'post_type'),
(142, 47, '_menu_item_menu_item_parent', '0'),
(143, 47, '_menu_item_object_id', '1'),
(144, 47, '_menu_item_object', 'post'),
(145, 47, '_menu_item_target', ''),
(146, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(147, 47, '_menu_item_xfn', ''),
(148, 47, '_menu_item_url', ''),
(150, 48, '_menu_item_type', 'post_type'),
(151, 48, '_menu_item_menu_item_parent', '47'),
(152, 48, '_menu_item_object_id', '21'),
(153, 48, '_menu_item_object', 'page'),
(154, 48, '_menu_item_target', ''),
(155, 48, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(156, 48, '_menu_item_xfn', ''),
(157, 48, '_menu_item_url', ''),
(177, 51, '_menu_item_type', 'post_type'),
(178, 51, '_menu_item_menu_item_parent', '47'),
(179, 51, '_menu_item_object_id', '2'),
(180, 51, '_menu_item_object', 'page'),
(181, 51, '_menu_item_target', ''),
(182, 51, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(183, 51, '_menu_item_xfn', ''),
(184, 51, '_menu_item_url', ''),
(186, 52, '_menu_item_type', 'post_type'),
(187, 52, '_menu_item_menu_item_parent', '0'),
(188, 52, '_menu_item_object_id', '9'),
(189, 52, '_menu_item_object', 'post'),
(190, 52, '_menu_item_target', ''),
(191, 52, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(192, 52, '_menu_item_xfn', ''),
(193, 52, '_menu_item_url', ''),
(204, 54, '_form', '<label>\n   [text text-572 placeholder \"username\"]\n</label>\n<label>\n[email email-920 placeholder \"email\"]\n</label>[submit \"send\"]'),
(205, 54, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:35:\"[_site_title] <salahb170@gmail.com>\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:4:\"body\";s:163:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:18:\"additional_headers\";s:29:\"Reply-To: salahb170@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(206, 54, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:35:\"[_site_title] <salahb170@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:105:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(207, 54, '_messages', 'a:22:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
(208, 54, '_additional_settings', ''),
(209, 54, '_locale', 'en_US'),
(213, 55, '_form', '<label> Your name\n    [text* your-name[text* username placeholder \"username\"]] </label>\n\n<label> Your email\n    [email* your-email[text* email placeholder \"email\"]] </label>\n\n[submit \"Submit\"]'),
(214, 55, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:35:\"[_site_title] <salahb170@gmail.com>\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:4:\"body\";s:163:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:18:\"additional_headers\";s:29:\"Reply-To: salahb170@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(215, 55, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:35:\"[_site_title] <salahb170@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:105:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(216, 55, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";}'),
(217, 55, '_additional_settings', ''),
(218, 55, '_locale', 'en_US'),
(219, 56, '_wp_attached_file', '2020/11/course.jpg'),
(220, 56, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:770;s:6:\"height\";i:433;s:4:\"file\";s:18:\"2020/11/course.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"course-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"course-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:18:\"course-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(221, 56, '_edit_lock', '1605171375:1'),
(222, 56, '_wp_attachment_custom_header_last_used_songwriter', '1605171537'),
(223, 56, '_wp_attachment_is_custom_header', 'songwriter'),
(224, 57, '_edit_lock', '1605171837:1'),
(225, 57, '_wp_trash_meta_status', 'publish'),
(226, 57, '_wp_trash_meta_time', '1605171857'),
(227, 58, '_edit_lock', '1605172004:1'),
(228, 58, '_wp_trash_meta_status', 'publish'),
(229, 58, '_wp_trash_meta_time', '1605172008'),
(231, 59, '_wp_trash_meta_status', 'publish'),
(232, 59, '_wp_trash_meta_time', '1605172507'),
(234, 61, '_edit_lock', '1605944723:1'),
(237, 61, '_thumbnail_id', '56'),
(244, 9, '_wp_old_slug', 'this-is-my-first-post'),
(247, 9, '_thumbnail_id', '56'),
(252, 61, '_edit_last', '1'),
(259, 67, '_wp_page_template', 'compare_listings.php'),
(260, 68, '_wp_page_template', 'advanced_search_results.php'),
(261, 69, '_edit_lock', '1607178217:1'),
(262, 69, '_edit_last', '1'),
(263, 69, 'agent_position', 'esanyurt'),
(264, 69, 'agent_email', 'salahb170@gmail.com'),
(265, 69, 'agent_phone', '0543434452'),
(266, 69, 'agent_mobile', '0543434452'),
(267, 69, 'agent_skype', '@salah'),
(268, 69, 'agent_facebook', '@salah'),
(269, 69, 'agent_twitter', '@salah'),
(270, 69, 'agent_linkedin', 'www.linkedin.com/salah'),
(271, 69, 'agent_pinterest', ''),
(272, 69, 'agent_website', 'www.salah.com'),
(273, 69, 'header_type', '0'),
(274, 69, 'header_transparent', 'global'),
(275, 69, 'page_custom_lat', ''),
(276, 69, 'page_custom_long', ''),
(277, 69, 'page_custom_zoom', '15'),
(278, 69, 'min_height', '0'),
(279, 69, 'max_height', '0'),
(280, 69, 'keep_min', ''),
(281, 69, 'page_custom_image', ''),
(282, 69, 'rev_slider', ''),
(283, 69, 'sidebar_option', 'right'),
(284, 69, 'sidebar_select', 'primary-widget-area'),
(285, 69, 'plan_title', ''),
(286, 69, 'plan_description', ''),
(287, 69, 'plan_image_attach', ''),
(288, 69, 'plan_image', ''),
(289, 69, 'plan_size', ''),
(290, 69, 'plan_rooms', ''),
(291, 69, 'plan_bath', ''),
(292, 69, 'plan_price', ''),
(293, 69, 'adv_filter_search_action', ''),
(294, 69, 'adv_filter_search_category', ''),
(295, 69, 'current_adv_filter_city', ''),
(296, 69, 'current_adv_filter_area', ''),
(297, 70, 'original_author', '1'),
(298, 70, '_edit_lock', '1607178683:1'),
(299, 70, '_edit_last', '1'),
(300, 71, 'pay_status', '1'),
(301, 71, '_edit_lock', '1607178849:1'),
(302, 72, '_edit_lock', '1607178771:1'),
(303, 72, '_edit_last', '1'),
(304, 72, 'biling_period', 'Week'),
(305, 72, 'billing_freq', '0'),
(306, 72, 'pack_listings', ''),
(307, 72, 'mem_list_unl', ''),
(308, 72, 'pack_featured_listings', ''),
(309, 72, 'pack_price', '500'),
(310, 72, 'pack_visible', 'yes'),
(311, 72, 'pack_stripe_id', ''),
(312, 72, 'plan_title', ''),
(313, 72, 'plan_description', ''),
(314, 72, 'plan_image_attach', ''),
(315, 72, 'plan_image', ''),
(316, 72, 'plan_size', ''),
(317, 72, 'plan_rooms', ''),
(318, 72, 'plan_bath', ''),
(319, 72, 'plan_price', ''),
(320, 72, 'adv_filter_search_action', ''),
(321, 72, 'adv_filter_search_category', ''),
(322, 72, 'current_adv_filter_city', ''),
(323, 72, 'current_adv_filter_area', '');

-- --------------------------------------------------------

--
-- Table structure for table `site_posts`
--

CREATE TABLE `site_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_posts`
--

INSERT INTO `site_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-10-30 21:42:02', '2020-10-30 21:42:02', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-10-30 21:42:02', '2020-10-30 21:42:02', '', 0, 'http://localhost/wordpress/?p=1', 0, 'post', '', 0),
(2, 1, '2020-10-30 21:42:02', '2020-10-30 21:42:02', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-10-30 21:42:02', '2020-10-30 21:42:02', '', 0, 'http://localhost/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-10-30 21:42:02', '2020-10-30 21:42:02', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'trash', 'closed', 'open', '', 'privacy-policy__trashed', '', '', '2020-11-06 15:04:14', '2020-11-06 15:04:14', '', 0, 'http://localhost/wordpress/?page_id=3', 0, 'page', '', 0),
(5, 1, '2020-10-30 21:47:50', '2020-10-30 21:47:50', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like piña coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/wordpress/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>sdasd</li><li>asdasd</li><li>asdasd</li><li>asdasdasd</li></ul>\n<!-- /wp:list -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-autosave-v1', '', '', '2020-10-30 21:47:50', '2020-10-30 21:47:50', '', 2, 'http://localhost/wordpress/2020/10/30/2-autosave-v1/', 0, 'revision', '', 0),
(6, 1, '2020-10-30 21:49:09', '2020-10-30 21:49:09', '<!-- wp:paragraph -->\n<p>in this page wich is the first page in my_woordpres site i will just write anything.</p>\n<!-- /wp:paragraph -->', 'this is the new page', '', 'publish', 'closed', 'closed', '123', 'this-is-the-new-page', '', '', '2020-11-06 15:02:28', '2020-11-06 15:02:28', '', 0, 'http://localhost/wordpress/?page_id=6', 0, 'page', '', 0),
(7, 1, '2020-10-30 21:49:09', '2020-10-30 21:49:09', '<!-- wp:paragraph -->\n<p>in this page wich is the first page in my_woordpres site i will just write anything.</p>\n<!-- /wp:paragraph -->', 'this is the new page', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2020-10-30 21:49:09', '2020-10-30 21:49:09', '', 6, 'http://localhost/wordpress/2020/10/30/6-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2020-10-30 21:50:21', '2020-10-30 21:50:21', '<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the timei`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the timei`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>this is heading level 3</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->', 'this is my first post', '', 'publish', 'open', 'open', '', 'my-first-post', '', '', '2020-11-21 07:51:07', '2020-11-21 07:51:07', '', 0, 'http://localhost/wordpress/?p=9', 0, 'post', '', 1),
(10, 1, '2020-10-30 21:50:21', '2020-10-30 21:50:21', '', 'this is my first post', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2020-10-30 21:50:21', '2020-10-30 21:50:21', '', 9, 'http://localhost/wordpress/2020/10/30/9-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2020-10-31 12:02:36', '2020-10-31 12:02:36', '', 'twentytwenty', '', 'publish', 'closed', 'closed', '', 'twentytwenty', '', '', '2020-11-06 09:49:20', '2020-11-06 09:49:20', '', 0, 'http://localhost/wordpress/twentytwenty/', 0, 'custom_css', '', 0),
(15, 1, '2020-10-31 12:02:36', '2020-10-31 12:02:36', '.entry-title {\n	background-color: #bbb;\n	padding: 5px;\n}', 'twentytwenty', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2020-10-31 12:02:36', '2020-10-31 12:02:36', '', 14, 'http://localhost/wordpress/14-revision-v1/', 0, 'revision', '', 0),
(18, 2, '2020-11-03 21:45:42', '2020-11-03 21:45:42', '<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->', 'this is my first post', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2020-11-03 21:45:42', '2020-11-03 21:45:42', '', 9, 'http://localhost/wordpress/9-revision-v1/', 0, 'revision', '', 0),
(21, 1, '2020-11-06 09:47:23', '2020-11-06 09:47:23', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>this is the filrst game</li><li>this is the socand game</li><li>this is the last game</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"align\":\"center\",\"level\":3} -->\n<h3 class=\"has-text-align-center\">this is the description for all games</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'games', '', 'publish', 'closed', 'closed', '', 'games', '', '', '2020-11-06 09:47:23', '2020-11-06 09:47:23', '', 0, 'http://localhost/wordpress/?page_id=21', 0, 'page', '', 0),
(22, 1, '2020-11-06 09:47:04', '2020-11-06 09:47:04', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>this is the filrst game</li><li>this is the socand game</li><li>this is the last game</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"align\":\"center\",\"level\":3} -->\n<h3 class=\"has-text-align-center\">this is the description for all games</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'games', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2020-11-06 09:47:04', '2020-11-06 09:47:04', '', 21, 'http://localhost/wordpress/21-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2020-11-06 09:49:20', '2020-11-06 09:49:20', '{\n    \"custom_css[twentytwenty]\": {\n        \"value\": \"\",\n        \"type\": \"custom_css\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 09:49:20\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '98f1f280-118f-4c88-adb5-543c69393a9e', '', '', '2020-11-06 09:49:20', '2020-11-06 09:49:20', '', 0, 'http://localhost/wordpress/98f1f280-118f-4c88-adb5-543c69393a9e/', 0, 'customize_changeset', '', 0),
(24, 1, '2020-11-06 09:49:20', '2020-11-06 09:49:20', '', 'twentytwenty', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2020-11-06 09:49:20', '2020-11-06 09:49:20', '', 14, 'http://localhost/wordpress/14-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2020-11-06 15:04:14', '2020-11-06 15:04:14', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '3-revision-v1', '', '', '2020-11-06 15:04:14', '2020-11-06 15:04:14', '', 3, 'http://localhost/wordpress/3-revision-v1/', 0, 'revision', '', 0),
(26, 1, '2020-11-06 15:05:40', '2020-11-06 15:05:40', '{\n    \"songwriter::background_color\": {\n        \"value\": \"#eeeeee\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:05:40\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'b953732d-b592-4626-9f6e-ae654b177f82', '', '', '2020-11-06 15:05:40', '2020-11-06 15:05:40', '', 0, 'http://localhost/wordpress/b953732d-b592-4626-9f6e-ae654b177f82/', 0, 'customize_changeset', '', 0),
(27, 1, '2020-11-06 15:06:01', '2020-11-06 15:06:01', '{\n    \"blogdescription\": {\n        \"value\": \"salah\'s blog\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:01\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '85fbfd61-4b1f-469c-8170-bcf73f5fbc93', '', '', '2020-11-06 15:06:01', '2020-11-06 15:06:01', '', 0, 'http://localhost/wordpress/85fbfd61-4b1f-469c-8170-bcf73f5fbc93/', 0, 'customize_changeset', '', 0),
(28, 1, '2020-11-06 15:06:40', '2020-11-06 15:06:40', '{\n    \"songwriter::nav_menu_locations[main-navigation]\": {\n        \"value\": -3592372466928298000,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu[-3592372466928298000]\": {\n        \"value\": {\n            \"name\": \"navbar\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu_item[-4165314103013198000]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"custom\",\n            \"title\": \"Home\",\n            \"url\": \"http://localhost/wordpress\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Home\",\n            \"nav_menu_term_id\": -3592372466928298000,\n            \"_invalid\": false,\n            \"type_label\": \"Custom Link\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu_item[-325083810876594200]\": {\n        \"value\": {\n            \"object_id\": 21,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"post_type\",\n            \"title\": \"games\",\n            \"url\": \"http://localhost/wordpress/games/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"games\",\n            \"nav_menu_term_id\": -3592372466928298000,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu_item[-6328553450357707000]\": {\n        \"value\": {\n            \"object_id\": 6,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 3,\n            \"type\": \"post_type\",\n            \"title\": \"this is the new page\",\n            \"url\": \"http://localhost/wordpress/this-is-the-new-page/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"this is the new page\",\n            \"nav_menu_term_id\": -3592372466928298000,\n            \"_invalid\": false,\n            \"type_label\": \"Password protected\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu_item[-4117438864026859500]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 4,\n            \"type\": \"post_type\",\n            \"title\": \"Sample Page\",\n            \"url\": \"http://localhost/wordpress/sample-page/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"Sample Page\",\n            \"nav_menu_term_id\": -3592372466928298000,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu_item[-8805343391957039000]\": {\n        \"value\": {\n            \"object_id\": 9,\n            \"object\": \"post\",\n            \"menu_item_parent\": 0,\n            \"position\": 5,\n            \"type\": \"post_type\",\n            \"title\": \"this is my first post\",\n            \"url\": \"http://localhost/wordpress/this-is-my-first-post/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"this is my first post\",\n            \"nav_menu_term_id\": -3592372466928298000,\n            \"_invalid\": false,\n            \"type_label\": \"Post\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    },\n    \"nav_menu_item[-5047800752389014000]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"category\",\n            \"menu_item_parent\": 0,\n            \"position\": 6,\n            \"type\": \"taxonomy\",\n            \"title\": \"tests\",\n            \"url\": \"http://localhost/wordpress/category/tests/\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"original_title\": \"tests\",\n            \"nav_menu_term_id\": -3592372466928298000,\n            \"_invalid\": false,\n            \"type_label\": \"Category\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-06 15:06:40\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'aaa6ed76-1eb5-49dd-992f-71f08d0efaf5', '', '', '2020-11-06 15:06:40', '2020-11-06 15:06:40', '', 0, 'http://localhost/wordpress/aaa6ed76-1eb5-49dd-992f-71f08d0efaf5/', 0, 'customize_changeset', '', 0),
(39, 1, '2020-11-09 21:01:51', '2020-11-09 21:01:51', '<!-- wp:paragraph -->\n<p>testing paragraph</p>\n<!-- /wp:paragraph -->', 'this is a sub page from new page', '', 'publish', 'closed', 'closed', '', 'sub-page', '', '', '2020-11-09 21:02:56', '2020-11-09 21:02:56', '', 6, 'http://localhost/wordpress/?page_id=39', 2, 'page', '', 0),
(40, 1, '2020-11-09 21:01:51', '2020-11-09 21:01:51', '', 'this is a sub page from new page', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2020-11-09 21:01:51', '2020-11-09 21:01:51', '', 39, 'http://localhost/wordpress/39-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2020-11-09 21:02:14', '2020-11-09 21:02:14', '<!-- wp:paragraph -->\n<p>testing paragraph</p>\n<!-- /wp:paragraph -->', 'this is a sub page from new page', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2020-11-09 21:02:14', '2020-11-09 21:02:14', '', 39, 'http://localhost/wordpress/39-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2020-11-10 06:15:31', '2020-11-10 06:15:31', ' ', '', '', 'publish', 'closed', 'closed', '', '44', '', '', '2020-11-10 06:41:56', '2020-11-10 06:41:56', '', 0, 'http://localhost/wordpress/?p=44', 1, 'nav_menu_item', '', 0),
(45, 1, '2020-11-10 06:15:31', '2020-11-10 06:15:31', ' ', '', '', 'publish', 'closed', 'closed', '', '45', '', '', '2020-11-10 06:41:56', '2020-11-10 06:41:56', '', 0, 'http://localhost/wordpress/?p=45', 2, 'nav_menu_item', '', 0),
(46, 1, '2020-11-10 06:17:48', '2020-11-10 06:17:48', '{\n    \"salah::nav_menu_locations[bootstrap-menu]\": {\n        \"value\": 4,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-10 06:17:48\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '00b26cfe-2c85-4953-b012-567eebbd4846', '', '', '2020-11-10 06:17:48', '2020-11-10 06:17:48', '', 0, 'http://localhost/wordpress/00b26cfe-2c85-4953-b012-567eebbd4846/', 0, 'customize_changeset', '', 0),
(47, 1, '2020-11-10 06:35:18', '2020-11-10 06:35:18', ' ', '', '', 'publish', 'closed', 'closed', '', '47', '', '', '2020-11-10 07:32:18', '2020-11-10 07:32:18', '', 0, 'http://localhost/wordpress/?p=47', 1, 'nav_menu_item', '', 0),
(48, 1, '2020-11-10 06:35:18', '2020-11-10 06:35:18', ' ', '', '', 'publish', 'closed', 'closed', '', '48', '', '', '2020-11-10 07:32:18', '2020-11-10 07:32:18', '', 0, 'http://localhost/wordpress/?p=48', 2, 'nav_menu_item', '', 0),
(51, 1, '2020-11-10 06:35:18', '2020-11-10 06:35:18', ' ', '', '', 'publish', 'closed', 'closed', '', '51', '', '', '2020-11-10 07:32:18', '2020-11-10 07:32:18', '', 0, 'http://localhost/wordpress/?p=51', 3, 'nav_menu_item', '', 0),
(52, 1, '2020-11-10 06:41:40', '2020-11-10 06:41:40', ' ', '', '', 'publish', 'closed', 'closed', '', '52', '', '', '2020-11-10 07:32:18', '2020-11-10 07:32:18', '', 0, 'http://localhost/wordpress/?p=52', 4, 'nav_menu_item', '', 0),
(54, 1, '2020-11-10 20:27:10', '2020-11-10 20:27:10', '<label>\r\n   [text text-572 placeholder \"username\"]\r\n</label>\r\n<label>\r\n[email email-920 placeholder \"email\"]\r\n</label>[submit \"send\"]\n1\n[_site_title] \"[your-subject]\"\n[_site_title] <salahb170@gmail.com>\n[_site_admin_email]\nFrom: [your-name] <[your-email]>\r\nSubject: [your-subject]\r\n\r\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: salahb170@gmail.com\n\n\n\n\n[_site_title] \"[your-subject]\"\n[_site_title] <salahb170@gmail.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: [_site_admin_email]\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'loginForm', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2020-11-12 09:26:37', '2020-11-12 09:26:37', '', 0, 'http://localhost/wordpress/?post_type=wpcf7_contact_form&#038;p=54', 0, 'wpcf7_contact_form', '', 0),
(55, 1, '2020-11-10 20:36:42', '2020-11-10 20:36:42', '<label> Your name\n    [text* your-name[text* username placeholder \"username\"]] </label>\n\n<label> Your email\n    [email* your-email[text* email placeholder \"email\"]] </label>\n\n[submit \"Submit\"]\n1\n[_site_title] \"[your-subject]\"\n[_site_title] <salahb170@gmail.com>\n[_site_admin_email]\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: salahb170@gmail.com\n\n\n\n\n[_site_title] \"[your-subject]\"\n[_site_title] <salahb170@gmail.com>\n[your-email]\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: [_site_admin_email]\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.\nYour entered code is incorrect.', 'loginForm_copy', '', 'publish', 'closed', 'closed', '', 'loginform_copy', '', '', '2020-11-10 20:36:42', '2020-11-10 20:36:42', '', 0, 'http://localhost/wordpress/?post_type=wpcf7_contact_form&p=55', 0, 'wpcf7_contact_form', '', 0),
(56, 1, '2020-11-12 08:57:12', '2020-11-12 08:57:12', '', 'course', '', 'inherit', 'open', 'closed', '', 'course', '', '', '2020-11-12 08:57:12', '2020-11-12 08:57:12', '', 0, 'http://localhost/wordpress/wp-content/uploads/2020/11/course.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2020-11-12 09:04:16', '2020-11-12 09:04:16', '{\n    \"songwriter::header_image\": {\n        \"value\": \"remove-header\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 08:59:57\"\n    },\n    \"songwriter::header_image_data\": {\n        \"value\": \"remove-header\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 08:59:57\"\n    },\n    \"songwriter::nav_menu_locations[main-navigation]\": {\n        \"value\": 5,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:00:57\"\n    },\n    \"sidebars_widgets[sidebar-1]\": {\n        \"value\": [\n            \"search-2\",\n            \"recent-posts-2\",\n            \"pages-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:01:57\"\n    },\n    \"sidebars_widgets[sidebar-2]\": {\n        \"value\": [\n            \"categories-2\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:02:57\"\n    },\n    \"sidebars_widgets[sidebar-3]\": {\n        \"value\": [\n            \"tag_cloud-3\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:02:57\"\n    },\n    \"widget_custom_html[3]\": {\n        \"value\": [],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:02:57\"\n    },\n    \"widget_nav_menu[3]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YToyOntzOjU6InRpdGxlIjtzOjc6InRlc3RpbmciO3M6ODoibmF2X21lbnUiO2k6NDt9\",\n            \"title\": \"testing\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"90bf68450c16b4776be566376d3f8a5f\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:02:57\"\n    },\n    \"widget_tag_cloud[3]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTozOntzOjU6InRpdGxlIjtzOjQ6InRhZ3MiO3M6NToiY291bnQiO2k6MTtzOjg6InRheG9ub215IjtzOjg6ImNhdGVnb3J5Ijt9\",\n            \"title\": \"tags\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"9bccc9e503bb4d29eb986ef60858bfe8\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:03:57\"\n    },\n    \"sidebars_widgets[sidebar-4]\": {\n        \"value\": [\n            \"archives-4\"\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:03:57\"\n    },\n    \"widget_akismet_widget[3]\": {\n        \"value\": [],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:03:57\"\n    },\n    \"widget_archives[4]\": {\n        \"value\": {\n            \"encoded_serialized_instance\": \"YTozOntzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJjb3VudCI7aTowO3M6ODoiZHJvcGRvd24iO2k6MDt9\",\n            \"title\": \"\",\n            \"is_widget_customizer_js_value\": true,\n            \"instance_hash_key\": \"01d05b5ddbb6d368321c7fa9a1e3b196\"\n        },\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:04:16\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '751d02fc-07e5-4455-95c6-79296ab09063', '', '', '2020-11-12 09:04:16', '2020-11-12 09:04:16', '', 0, 'http://localhost/wordpress/?p=57', 0, 'customize_changeset', '', 0),
(58, 1, '2020-11-12 09:06:47', '2020-11-12 09:06:47', '{\n    \"songwriter::songwriter_display_sidebar\": {\n        \"value\": \"Display\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:04:57\"\n    },\n    \"songwriter::songwriter_display_breadcrumb\": {\n        \"value\": \"Display\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:05:57\"\n    },\n    \"songwriter::songwriter_display_header_image\": {\n        \"value\": \"Everywhere\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:05:57\"\n    },\n    \"songwriter::songwriter_display_site_description\": {\n        \"value\": \"Display\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:05:57\"\n    },\n    \"songwriter::songwriter_display_search_form\": {\n        \"value\": \"Hide\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:05:57\"\n    },\n    \"songwriter::songwriter_header_address\": {\n        \"value\": \"561 / 32 / 1\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:06:47\"\n    },\n    \"songwriter::songwriter_header_email\": {\n        \"value\": \"salah@gmail.com\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:06:47\"\n    },\n    \"songwriter::songwriter_header_phone\": {\n        \"value\": \"+90 547891236\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:06:47\"\n    },\n    \"songwriter::songwriter_header_skype\": {\n        \"value\": \"skype account name\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:06:47\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ab8eed9e-5454-42b4-8e1b-73dbfc9ead61', '', '', '2020-11-12 09:06:47', '2020-11-12 09:06:47', '', 0, 'http://localhost/wordpress/?p=58', 0, 'customize_changeset', '', 0),
(59, 1, '2020-11-12 09:15:07', '2020-11-12 09:15:07', '{\n    \"songwriter::songwriter_display_image_post\": {\n        \"value\": \"Display\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:12:35\"\n    },\n    \"songwriter::songwriter_display_meta_post\": {\n        \"value\": \"Display\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:12:35\"\n    },\n    \"songwriter::songwriter_next_preview_post\": {\n        \"value\": \"Display\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:12:35\"\n    },\n    \"songwriter::songwriter_latest_posts_headline\": {\n        \"value\": \"\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:14:35\"\n    },\n    \"songwriter::songwriter_character_set\": {\n        \"value\": \"latin\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:14:35\"\n    },\n    \"songwriter::songwriter_body_google_fonts\": {\n        \"value\": \"default\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:14:35\"\n    },\n    \"songwriter::songwriter_headings_google_fonts\": {\n        \"value\": \"default\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-11-12 09:15:07\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '9a3d3bda-7c5f-4138-9d29-d3af517bcd7c', '', '', '2020-11-12 09:15:07', '2020-11-12 09:15:07', '', 0, 'http://localhost/wordpress/?p=59', 0, 'customize_changeset', '', 0),
(61, 1, '2020-11-12 09:19:23', '2020-11-12 09:19:23', '<!-- wp:contact-form-7/contact-form-selector {\"id\":54,\"title\":\"loginForm\"} -->\n<div class=\"wp-block-contact-form-7-contact-form-selector\">[contact-form-7 id=\"54\" title=\"loginForm\"]</div>\n<!-- /wp:contact-form-7/contact-form-selector -->', 'form', '', 'publish', 'open', 'open', '', 'form', '', '', '2020-11-21 07:45:23', '2020-11-21 07:45:23', '', 0, 'http://localhost/wordpress/?p=61', 0, 'post', '', 0),
(62, 1, '2020-11-12 09:19:23', '2020-11-12 09:19:23', '<!-- wp:contact-form-7/contact-form-selector {\"id\":54,\"title\":\"loginForm\"} -->\n<div class=\"wp-block-contact-form-7-contact-form-selector\">[contact-form-7 id=\"54\" title=\"loginForm\"]</div>\n<!-- /wp:contact-form-7/contact-form-selector -->', 'form', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2020-11-12 09:19:23', '2020-11-12 09:19:23', '', 61, 'http://localhost/wordpress/61-revision-v1/', 0, 'revision', '', 0),
(64, 1, '2020-11-21 07:50:12', '2020-11-21 07:50:12', '<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->', 'this is my first post', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2020-11-21 07:50:12', '2020-11-21 07:50:12', '', 9, 'http://localhost/wordpress/9-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2020-11-21 07:51:07', '2020-11-21 07:51:07', '<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the timei`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the timei`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>this is heading level 3</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>i`this is a testing paragraph and speed writing from more then one month i was not writing any thing on this keyboard but now i have a spped up it is the growth of a skill with the time</p>\n<!-- /wp:paragraph -->', 'this is my first post', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2020-11-21 07:51:07', '2020-11-21 07:51:07', '', 9, 'http://localhost/wordpress/9-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2020-11-29 19:22:04', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-11-29 19:22:04', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=66', 0, 'post', '', 0),
(67, 1, '2020-12-05 14:18:16', '2020-12-05 14:18:16', '', 'Compare Listings', '', 'publish', 'closed', 'closed', '', 'compare-listings', '', '', '2020-12-05 14:18:16', '2020-12-05 14:18:16', '', 0, 'http://localhost/wordpress/compare-listings/', 0, 'page', '', 0),
(68, 1, '2020-12-05 14:18:16', '2020-12-05 14:18:16', '', 'Advanced Search', '', 'publish', 'closed', 'closed', '', 'advanced-search', '', '', '2020-12-05 14:18:16', '2020-12-05 14:18:16', '', 0, 'http://localhost/wordpress/advanced-search/', 0, 'page', '', 0),
(69, 1, '2020-12-05 14:25:26', '2020-12-05 14:25:26', '', '', '', 'publish', 'open', 'closed', '', '69', '', '', '2020-12-05 14:25:26', '2020-12-05 14:25:26', '', 0, 'http://localhost/wordpress/?post_type=estate_agent&#038;p=69', 0, 'estate_agent', '', 0),
(70, 1, '2020-12-05 14:28:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2020-12-05 14:28:24', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=estate_property&p=70', 0, 'estate_property', '', 0),
(71, 1, '2020-12-05 14:33:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-12-05 14:33:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?post_type=wpestate_invoice&p=71', 0, 'wpestate_invoice', '', 0),
(72, 1, '2020-12-05 14:35:09', '2020-12-05 14:35:09', '', '', '', 'publish', 'closed', 'closed', '', '72', '', '', '2020-12-05 14:35:09', '2020-12-05 14:35:09', '', 0, 'http://localhost/wordpress/?post_type=membership_package&#038;p=72', 0, 'membership_package', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `site_termmeta`
--

CREATE TABLE `site_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_terms`
--

CREATE TABLE `site_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_terms`
--

INSERT INTO `site_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'tests', 'tests', 0),
(4, 'posts menu', 'posts-menu', 0),
(5, 'navbar', 'navbar', 0),
(6, 'html', 'html', 0),
(7, 'css', 'css', 0),
(8, 'testing-tag', 'testing-tag', 0),
(9, 'markits', 'markits', 0),
(10, 'offices', 'offices', 0),
(11, 'istanbul', 'istanbul-city', 0);

-- --------------------------------------------------------

--
-- Table structure for table `site_term_relationships`
--

CREATE TABLE `site_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_term_relationships`
--

INSERT INTO `site_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(9, 2, 0),
(9, 8, 0),
(44, 4, 0),
(45, 4, 0),
(47, 5, 0),
(48, 5, 0),
(51, 5, 0),
(52, 5, 0),
(61, 2, 0),
(61, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `site_term_taxonomy`
--

CREATE TABLE `site_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_term_taxonomy`
--

INSERT INTO `site_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 2),
(4, 4, 'nav_menu', '', 0, 2),
(5, 5, 'nav_menu', '', 0, 4),
(6, 6, 'post_tag', 'Anything related to html', 0, 1),
(7, 7, 'post_tag', 'css and ui in globaly', 0, 0),
(8, 8, 'post_tag', '', 0, 1),
(9, 9, 'property_category_agent', '', 0, 0),
(10, 10, 'property_category_agent', '', 0, 0),
(11, 11, 'property_city_agent', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `site_usermeta`
--

CREATE TABLE `site_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_usermeta`
--

INSERT INTO `site_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'salah'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'false'),
(11, 1, 'locale', ''),
(12, 1, 'site_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'site_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '0'),
(17, 1, 'site_dashboard_quick_press_last_post_id', '66'),
(18, 1, 'closedpostboxes_dashboard', 'a:3:{i:0;s:21:\"dashboard_site_health\";i:1;s:21:\"dashboard_quick_press\";i:2;s:17:\"dashboard_primary\";}'),
(19, 1, 'metaboxhidden_dashboard', 'a:1:{i:0;s:17:\"dashboard_primary\";}'),
(20, 2, 'nickname', 'baraa'),
(21, 2, 'first_name', 'baraa'),
(22, 2, 'last_name', 'backhash'),
(23, 2, 'description', ''),
(24, 2, 'rich_editing', 'true'),
(25, 2, 'syntax_highlighting', 'true'),
(26, 2, 'comment_shortcuts', 'false'),
(27, 2, 'admin_color', 'modern'),
(28, 2, 'use_ssl', '0'),
(29, 2, 'show_admin_bar_front', 'true'),
(30, 2, 'locale', 'ar'),
(31, 2, 'site_capabilities', 'a:1:{s:6:\"editor\";b:1;}'),
(32, 2, 'site_user_level', '7'),
(33, 2, 'dismissed_wp_pointers', ''),
(35, 2, 'site_dashboard_quick_press_last_post_id', '17'),
(36, 1, 'session_tokens', 'a:2:{s:64:\"8837437ebaedfaffd18da966a18c823bfc70982b010b37d2681116f9e99b55f5\";a:4:{s:10:\"expiration\";i:1607343796;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36\";s:5:\"login\";i:1607170996;}s:64:\"8a65c6b76a98737745f629e6426a63447d67e206c4bdbcbd77580e41a84bad3c\";a:4:{s:10:\"expiration\";i:1607343902;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36\";s:5:\"login\";i:1607171102;}}'),
(37, 1, 'site_user-settings', 'posts_list_mode=list&mfold=o&libraryContent=browse&editor=tinymce'),
(38, 1, 'site_user-settings-time', '1607178323'),
(39, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:63:\"dashboard_right_now,dashboard_site_health,dashboard_quick_press\";s:4:\"side\";s:36:\"dashboard_activity,dashboard_primary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(40, 1, 'nav_menu_recently_edited', '5'),
(41, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(42, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(43, 1, 'wpcf7_hide_welcome_panel_on', 'a:1:{i:0;s:3:\"5.3\";}'),
(44, 1, 'closedpostboxes_estate_property', 'a:0:{}'),
(45, 1, 'metaboxhidden_estate_property', 'a:1:{i:0;s:7:\"slugdiv\";}');

-- --------------------------------------------------------

--
-- Table structure for table `site_users`
--

CREATE TABLE `site_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_users`
--

INSERT INTO `site_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'salah', '$P$BBJD8UZS9NItcf0Yn0fSVu.CSp/zTM0', 'salah', 'salahb170@gmail.com', 'http://localhost/wordpress', '2020-10-30 21:42:01', '', 0, 'salah'),
(2, 'baraa', '$P$BjIxU/6Rv0Xm/H7NJ2VHTMqRDWGFkP.', 'baraa', 'baraa@gmail.com', '', '2020-11-03 21:40:19', '1604439619:$P$Bykq9y9h9mWNQC7buwWMJUCpmKCewD0', 0, 'baraa backhash');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `site_commentmeta`
--
ALTER TABLE `site_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `site_comments`
--
ALTER TABLE `site_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `site_links`
--
ALTER TABLE `site_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `site_options`
--
ALTER TABLE `site_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `site_postmeta`
--
ALTER TABLE `site_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `site_posts`
--
ALTER TABLE `site_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `site_termmeta`
--
ALTER TABLE `site_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `site_terms`
--
ALTER TABLE `site_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `site_term_relationships`
--
ALTER TABLE `site_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `site_term_taxonomy`
--
ALTER TABLE `site_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `site_usermeta`
--
ALTER TABLE `site_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `site_users`
--
ALTER TABLE `site_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `site_commentmeta`
--
ALTER TABLE `site_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `site_comments`
--
ALTER TABLE `site_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_links`
--
ALTER TABLE `site_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_options`
--
ALTER TABLE `site_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;

--
-- AUTO_INCREMENT for table `site_postmeta`
--
ALTER TABLE `site_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT for table `site_posts`
--
ALTER TABLE `site_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `site_termmeta`
--
ALTER TABLE `site_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_terms`
--
ALTER TABLE `site_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `site_term_taxonomy`
--
ALTER TABLE `site_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `site_usermeta`
--
ALTER TABLE `site_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `site_users`
--
ALTER TABLE `site_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"baka_train\",\"table\":\"episodes\"},{\"db\":\"dxn\",\"table\":\"users\"},{\"db\":\"dxn\",\"table\":\"g1\"},{\"db\":\"test\",\"table\":\"test\"},{\"db\":\"baka_train\",\"table\":\"ansers\"},{\"db\":\"baka_train\",\"table\":\"questions\"},{\"db\":\"baka_train\",\"table\":\"users_courses\"},{\"db\":\"baka_train\",\"table\":\"courses\"},{\"db\":\"baka_train\",\"table\":\"users\"},{\"db\":\"my_wordpress\",\"table\":\"site_users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('baka_system', 'plans', 'monthlyTarget'),
('baka_train', 'ansers', 'anser'),
('baka_train', 'courses', 'course_name'),
('baka_train', 'episodes', 'episode_name'),
('baka_train', 'questions', 'question'),
('mini_blog', 'posts', 'title'),
('shop', 'categories', 'Name'),
('shop', 'comments', 'Comment'),
('shop', 'items', 'Name');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'baka_train', 'episodes', '{\"sorted_col\":\"`episodes`.`course_id`  ASC\"}', '2020-12-01 20:27:31'),
('root', 'baka_train', 'users', '{\"sorted_col\":\"`users`.`groupId`  DESC\"}', '2020-11-19 06:15:14'),
('root', 'baka_train', 'users_courses', '{\"sorted_col\":\"`users_courses`.`user_id` ASC\"}', '2020-11-12 12:56:18'),
('root', 'shop', 'items', '{\"sorted_col\":\"`items`.`Rating`  DESC\"}', '2020-08-06 21:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-12-01 20:27:32', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` smallint(6) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Parent` smallint(11) NOT NULL,
  `Ordering` int(11) NOT NULL,
  `Visibilty` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Comment` tinyint(4) NOT NULL DEFAULT 0,
  `Allow_Ads` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`, `Parent`, `Ordering`, `Visibilty`, `Allow_Comment`, `Allow_Ads`) VALUES
(1, 'Hand Made', '', 0, 0, 0, 0, 0),
(2, 'Games', '', 0, 0, 0, 0, 0),
(3, 'boys games', '', 2, 0, 0, 0, 0),
(4, 'girls games', '', 2, 0, 0, 0, 0),
(5, 'Accessories', '', 1, 0, 0, 0, 0),
(6, 'Men Watches', '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Cid` int(11) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 0,
  `CommentDate` date NOT NULL,
  `ItemId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`ID`, `Name`) VALUES
(1, 'U.S.A'),
(2, 'E.G.B'),
(3, 'T.U.R');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` int(11) NOT NULL,
  `image` int(11) NOT NULL,
  `Add_Date` datetime NOT NULL,
  `Country_Made` int(11) NOT NULL,
  `Status` smallint(6) NOT NULL,
  `Rating` float NOT NULL,
  `Approve` tinyint(4) NOT NULL DEFAULT 0,
  `catId` smallint(6) NOT NULL,
  `memberId` int(11) NOT NULL,
  `Tags` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_ID`, `Name`, `Description`, `Price`, `image`, `Add_Date`, `Country_Made`, `Status`, `Rating`, `Approve`, `catId`, `memberId`, `Tags`) VALUES
(1, 'Swiss Watch', 'good Swiss Watch', 50, 0, '2020-08-12 17:13:02', 1, 1, 5, 1, 6, 2, 'men,wetch,sswess'),
(2, 'adedas cap', 'this cap from adedas is very good', 20, 0, '2020-08-14 12:52:03', 3, 1, 5, 1, 6, 5, 'caps,cap,adedas,watch,men');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `loginDate` date NOT NULL,
  `groupId` int(11) NOT NULL DEFAULT 0,
  `trustStatus` int(11) NOT NULL DEFAULT 0,
  `regStatus` int(11) NOT NULL DEFAULT 0,
  `Avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `email`, `password`, `fullName`, `loginDate`, `groupId`, `trustStatus`, `regStatus`, `Avatar`) VALUES
(1, 'salahAdmin', 'salahAdmin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'salah malek', '2020-08-12', 1, 1, 1, 'default_user.png'),
(2, 'baraa', 'baraa@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'baraa mohammed', '2020-06-24', 0, 0, 1, '397057803_logo.jpg'),
(4, 'khaled', 'khaled@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'khaled omar', '0000-00-00', 0, 0, 1, 'default_user.png'),
(5, 'mohammed', 'mohammed@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '2020-08-13', 0, 0, 0, 'default_user.png'),
(7, '3dbo', '3bdo@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'abo 3bed', '2020-08-15', 0, 0, 1, '397057803_logo.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Cid`),
  ADD KEY `items_comment` (`ItemId`),
  ADD KEY `members_comment` (`UserId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_ID`),
  ADD KEY `add_member` (`memberId`),
  ADD KEY `add_category` (`catId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `Cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `items_comment` FOREIGN KEY (`ItemId`) REFERENCES `items` (`item_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `members_comment` FOREIGN KEY (`UserId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `add_category` FOREIGN KEY (`catId`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `add_member` FOREIGN KEY (`memberId`) REFERENCES `users` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
