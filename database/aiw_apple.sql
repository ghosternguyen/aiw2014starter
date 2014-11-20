-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2014 at 07:37 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aiw_apple`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `Ad_ID` int(11) NOT NULL,
  `Ad_User` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Ad_Pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Ad_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Ad_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Ad_Phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Ad_Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Ad_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_advertise`
--

CREATE TABLE IF NOT EXISTS `tbl_advertise` (
  `Adv_ID` int(11) NOT NULL,
  `Adv_Link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Adv_Brief` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Adv_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_author`
--

CREATE TABLE IF NOT EXISTS `tbl_author` (
  `A_ID` int(11) NOT NULL,
  `A_User` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `A_Pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `A_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `A_Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `A_Avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `A_Sex` tinyint(1) NOT NULL,
  `A_Birthday` date NOT NULL,
  `A_Regdate` date NOT NULL,
  `A_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `A_Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `A_Check` tinyint(1) NOT NULL,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE IF NOT EXISTS `tbl_banner` (
  `B_ID` int(11) NOT NULL,
  `B_Note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_Link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `B_Order` int(11) NOT NULL,
  PRIMARY KEY (`B_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `P_ID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `U_ID` int(11) NOT NULL,
  `C_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `C_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `C_Web` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_Content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`P_ID`),
  KEY `fk_nguoibinhluan` (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `CO_ID` int(11) NOT NULL,
  `CO_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CO_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CO_Web` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CO_Message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_count`
--

CREATE TABLE IF NOT EXISTS `tbl_count` (
  `P_ID` int(11) NOT NULL,
  `Countsee` int(11) NOT NULL,
  `Countcomment` int(11) NOT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genre`
--

CREATE TABLE IF NOT EXISTS `tbl_genre` (
  `G_ID` int(11) NOT NULL,
  `G_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`G_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_genre`
--

INSERT INTO `tbl_genre` (`G_ID`, `G_Name`) VALUES
(1, 'iPhone'),
(2, 'iPad'),
(3, 'iPod'),
(4, 'Mac'),
(5, 'iTunes'),
(6, 'iWatch');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE IF NOT EXISTS `tbl_group` (
  `Gr_ID` int(11) NOT NULL,
  `Gr_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Gr_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`Gr_ID`, `Gr_Name`) VALUES
(1, 'Hot News'),
(2, 'Product News'),
(3, 'Apple Events');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE IF NOT EXISTS `tbl_image` (
  `P_ID` int(11) NOT NULL,
  `I_Link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `I_Description` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả ngắn gọn về ảnh',
  `I_Order` tinyint(2) NOT NULL COMMENT 'Nếu ảnh có trật tự = 0 => Ảnh đó làm ảnh đại diện bên ngoài.',
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE IF NOT EXISTS `tbl_post` (
  `P_ID` int(11) NOT NULL,
  `P_Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `G_ID` int(11) NOT NULL,
  `Gr_ID` int(11) NOT NULL,
  `P_Content` text COLLATE utf8_unicode_ci NOT NULL,
  `P_Brief` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `A_ID` int(11) NOT NULL,
  `P_Date` date NOT NULL,
  `P_Keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`P_ID`),
  KEY `fk_nhom` (`G_ID`),
  KEY `fk_loai` (`Gr_ID`),
  KEY `fk_tacgia` (`A_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `U_ID` int(11) NOT NULL,
  `U_User` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `U_Pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `U_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `U_Avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Đường dẫn link',
  `U_Sex` tinyint(1) NOT NULL,
  `U_Birthday` date NOT NULL,
  `U_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `U_Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `U_Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `U_Regdate` date NOT NULL,
  `U_Check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: Có thể đăng nhập. - 0: Bị ban account',
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE IF NOT EXISTS `tbl_video` (
  `V_ID` int(11) NOT NULL,
  `V_Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `V_Link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`V_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `fk_nguoibinhluan` FOREIGN KEY (`U_ID`) REFERENCES `tbl_user` (`U_ID`),
  ADD CONSTRAINT `fk_binhluan` FOREIGN KEY (`P_ID`) REFERENCES `tbl_post` (`P_ID`);

--
-- Constraints for table `tbl_count`
--
ALTER TABLE `tbl_count`
  ADD CONSTRAINT `fk_dem` FOREIGN KEY (`P_ID`) REFERENCES `tbl_post` (`P_ID`);

--
-- Constraints for table `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD CONSTRAINT `fk_anh` FOREIGN KEY (`P_ID`) REFERENCES `tbl_post` (`P_ID`);

--
-- Constraints for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD CONSTRAINT `fk_loai` FOREIGN KEY (`Gr_ID`) REFERENCES `tbl_group` (`Gr_ID`),
  ADD CONSTRAINT `fk_nhom` FOREIGN KEY (`G_ID`) REFERENCES `tbl_genre` (`G_ID`),
  ADD CONSTRAINT `fk_tacgia` FOREIGN KEY (`A_ID`) REFERENCES `tbl_author` (`A_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
