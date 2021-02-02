-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 23, 2014 at 05:15 AM
-- Server version: 5.5.20
-- PHP Version: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_optholidays`
--

CREATE TABLE IF NOT EXISTS `tbl_optholidays` (
  `facility_id` int(11) NOT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_optholidays`
--

INSERT INTO `tbl_optholidays` (`facility_id`, `Date`, `Description`) VALUES
(116, '', ''),
(117, '', ''),
(125, '', ''),
(132, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_weekholidays`
--

CREATE TABLE IF NOT EXISTS `tbl_weekholidays` (
  `day_id` int(11) NOT NULL,
  `Days` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_weekholidays`
--

INSERT INTO `tbl_weekholidays` (`day_id`, `Days`) VALUES
(1, 'Sunday'),
(2, 'Monday');

-- --------------------------------------------------------

--
-- Table structure for table `tb_appointment`
--

CREATE TABLE IF NOT EXISTS `tb_appointment` (
  `appoint_id` int(3) NOT NULL AUTO_INCREMENT,
  `facility_id` int(3) NOT NULL,
  `user_id` int(3) DEFAULT NULL,
  `appoint_from_time` time DEFAULT NULL,
  `appoint_to_time` time DEFAULT NULL,
  `appoint_from_date` date DEFAULT NULL,
  `appoint_to_date` date DEFAULT NULL,
  `appointment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`appoint_id`),
  KEY `facility_id` (`facility_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=305 ;

--
-- Dumping data for table `tb_appointment`
--

INSERT INTO `tb_appointment` (`appoint_id`, `facility_id`, `user_id`, `appoint_from_time`, `appoint_to_time`, `appoint_from_date`, `appoint_to_date`, `appointment_status`) VALUES
(304, 134, 138, '06:00:00', '10:00:00', '2014-05-28', '2014-05-28', 'Cancelled'),
(303, 133, 145, '14:00:00', '19:00:00', '2014-05-08', '2014-05-08', 'Cancelled'),
(302, 133, 145, '09:00:00', '14:00:00', '2014-05-07', '2014-05-07', 'Cancelled'),
(301, 133, 145, '09:00:00', '14:00:00', '2014-05-07', '2014-05-07', 'Cancelled'),
(218, 109, 119, '15:50:00', '17:00:00', '2010-08-19', '2010-08-19', 'Booked'),
(219, 110, 122, '11:00:00', '12:00:00', '2010-08-22', '2010-08-22', 'Cancelled'),
(229, 113, 124, '09:00:00', '10:00:00', '2010-09-01', '2010-09-01', 'Cancelled'),
(230, 114, 124, '09:00:00', '10:00:00', '2010-09-03', '2010-09-03', 'Postponed'),
(231, 12, 124, '13:00:00', '13:15:00', '2010-09-04', '2010-09-04', 'Cancelled'),
(232, 113, 124, '14:00:00', '15:00:00', '2010-09-04', '2010-09-04', 'Cancelled'),
(233, 113, 124, '15:00:00', '16:00:00', '2010-09-04', '2010-09-04', 'Cancelled'),
(234, 113, 124, '15:00:00', '16:00:00', '2010-09-04', '2010-09-04', 'Cancelled'),
(235, 114, 124, '16:00:00', '17:00:00', '2010-09-04', '2010-09-04', 'Booked'),
(236, 114, 124, '17:00:00', '18:00:00', '2010-09-04', '2010-09-04', 'Booked'),
(237, 114, 124, '17:00:00', '18:00:00', '2010-09-04', '2010-09-04', 'Booked'),
(238, 114, 124, '17:00:00', '18:00:00', '2010-09-04', '2010-09-04', 'Booked'),
(239, 114, 124, '18:00:00', '19:00:00', '2010-09-04', '2010-09-04', 'Postponed'),
(240, 114, 124, '09:00:00', '10:00:00', '2010-09-05', '2010-09-05', 'Booked'),
(241, 114, 124, '09:00:00', '10:00:00', '2010-09-05', '2010-09-05', 'Booked'),
(242, 114, 124, '10:00:00', '11:00:00', '2010-09-05', '2010-09-05', 'Booked'),
(243, 114, 124, '10:00:00', '11:00:00', '2010-09-05', '2010-09-05', 'Booked'),
(244, 114, 124, '11:00:00', '12:00:00', '2010-09-05', '2010-09-05', 'Booked'),
(245, 114, 124, '11:00:00', '12:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(246, 113, 124, '11:00:00', '12:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(247, 109, 124, '11:10:00', '12:20:00', '2010-09-06', '2010-09-06', 'Booked'),
(248, 113, 124, '14:00:00', '15:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(249, 113, 124, '14:00:00', '15:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(250, 113, 124, '14:00:00', '15:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(251, 113, 124, '15:00:00', '16:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(252, 113, 124, '15:00:00', '16:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(253, 113, 124, '16:00:00', '17:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(254, 113, 124, '16:00:00', '17:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(255, 113, 124, '16:00:00', '17:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(256, 113, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(257, 113, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(258, 113, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(259, 113, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(260, 113, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(261, 113, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(262, 113, 124, '18:00:00', '19:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(263, 113, 124, '18:00:00', '19:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(264, 113, 124, '09:00:00', '10:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(265, 114, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(266, 114, 124, '17:00:00', '18:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(267, 114, 124, '18:00:00', '19:00:00', '2010-09-06', '2010-09-06', 'Booked'),
(268, 114, 124, '12:00:00', '13:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(269, 114, 124, '09:00:00', '10:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(270, 114, 124, '09:00:00', '10:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(271, 114, 124, '09:00:00', '10:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(272, 114, 124, '09:00:00', '10:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(273, 114, 124, '09:00:00', '10:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(274, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(275, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(276, 113, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(277, 113, 124, '16:00:00', '17:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(278, 113, 124, '11:00:00', '12:00:00', '2010-09-08', '2010-09-08', 'Booked'),
(279, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(280, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(281, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(282, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(283, 113, 124, '10:00:00', '11:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(284, 113, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(285, 114, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(286, 114, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(287, 114, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(288, 114, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(289, 114, 124, '11:00:00', '12:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(290, 114, 124, '12:00:00', '13:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(291, 114, 124, '13:00:00', '14:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(292, 114, 124, '13:00:00', '14:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(293, 110, 128, '16:00:00', '17:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(294, 110, 128, '17:00:00', '18:00:00', '2010-09-07', '2010-09-07', 'Cancelled'),
(295, 110, 128, '16:00:00', '17:00:00', '2010-09-07', '2010-09-07', 'Booked'),
(296, 125, 131, '06:00:00', '12:25:00', '2014-05-01', '2014-05-01', 'Booked'),
(297, 125, 129, '06:00:00', '12:25:00', '2014-04-29', '2014-04-29', 'Booked'),
(298, 127, 138, '17:00:00', '23:00:00', '2014-04-30', '2014-04-30', 'Cancelled'),
(299, 128, 139, '00:00:00', '03:00:00', '2014-04-30', '2014-04-30', 'Completed'),
(300, 129, 138, '20:00:00', '01:00:00', '2014-04-29', '2014-04-29', 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `tb_appointment_invitations`
--

CREATE TABLE IF NOT EXISTS `tb_appointment_invitations` (
  `invite_id` int(3) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(3) NOT NULL,
  `invite_type` varchar(20) NOT NULL,
  `address` varchar(62) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`invite_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `tb_appointment_invitations`
--

INSERT INTO `tb_appointment_invitations` (`invite_id`, `appointment_id`, `invite_type`, `address`, `name`) VALUES
(1, 121, 'mail', 'radhikavkr68@gmail.com', 'radhika'),
(2, 121, 'mail', 'jagadeesh.friends@gmail.com', 'jagadeesh'),
(3, 5, 'sms', '9986647687', 'radhika'),
(54, 5, 'mail', 'asd', 'ad'),
(55, 5, 'mail', 'gdf', 'gdfgd'),
(56, 5, 'mail', 'gdfdfg', 'gdfgddfg'),
(57, 5, 'mail', 'gdfdfg', 'radhikavkr68@gmail.com'),
(58, 5, 'mail', 'erw', 'wre@g.com'),
(59, 5, 'mail', 'erw', 'wre@g.com'),
(60, 5, 'mail', 'erw', 'wre@g.com'),
(61, 5, 'mail', 'erw', 'wre@g.com'),
(62, 5, 'mail', 'erw', 'wre@g.com'),
(63, 5, 'mail', 'erw', 'wre@g.com'),
(64, 5, 'mail', 'erw', 'wre@g.com'),
(65, 135, 'mail', 'Shankar', 'shankarg82@gmail.com'),
(66, 135, 'mail', 'Shankar', 'shankargrediffmail.com'),
(67, 149, 'mail', 'shankar', 'shankar@gg.com'),
(68, 149, 'mail', 'shankar', 'shankar@gg.com'),
(69, 149, 'mail', 'shankar', 'shankar@gg.com'),
(70, 149, 'sms', 'sfdg', '9876543213');

-- --------------------------------------------------------

--
-- Table structure for table `tb_business`
--

CREATE TABLE IF NOT EXISTS `tb_business` (
  `business_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `business_name` varchar(60) DEFAULT NULL,
  `owner_name` varchar(35) DEFAULT NULL,
  `business_start` date DEFAULT NULL,
  `business_end` date DEFAULT NULL,
  `business_categoty` varchar(64) NOT NULL,
  `business_add1` varchar(100) DEFAULT NULL,
  `business_add2` varchar(100) DEFAULT NULL,
  `business_city` varchar(50) DEFAULT NULL,
  `business_zipcode` varchar(32) DEFAULT NULL,
  `business_stateid` int(11) DEFAULT NULL,
  `business_countryid` int(11) DEFAULT NULL,
  `business_desc` text,
  PRIMARY KEY (`business_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `tb_business`
--

INSERT INTO `tb_business` (`business_id`, `user_id`, `business_name`, `owner_name`, `business_start`, `business_end`, `business_categoty`, `business_add1`, `business_add2`, `business_city`, `business_zipcode`, `business_stateid`, `business_countryid`, `business_desc`) VALUES
(73, 141, 'Gangotri Hospital', 'Pratap Reddy', '2014-04-29', '2024-04-28', 'Hospital', 'JP Nagar 6th Phase', '', 'Bangalore', '560078', 400, 99, 'Modern Equipments with well trained doctors and nurses to take care.'),
(74, 142, 'Bright and White', 'Raman Jha', '2014-04-29', '2024-04-28', 'Beauty Parlour', 'N.S Palya,BTM 2nd Stage', '', 'Bangalore', '560068', 400, 99, 'Hair cutting and washing at a very reasonable rate.'),
(75, 144, 'Fortis ', 'Aman Kumar', '2014-05-05', '2024-05-04', 'Hospital', 'Bannerghatta Road ', '', 'Bangalore', '560078', 400, 99, 'A hospital with all modern equipments and well trained doctors'),
(72, 140, 'Bannerghatta Sports  Club', 'Vikas Singh', '2014-04-29', '2021-04-28', 'Club', 'Bannerghatta Road ,Near IIM Bangalore', '', 'Bangalore', '560067', 400, 99, 'Training club for all kinds of sports for kids as well as teenagers with a lot of experienced coaches.'),
(67, 133, 'Yashwantpur Sports Club', 'Harshawardhana', '2014-04-29', '2024-04-28', 'Club', 'Opposite World Trade Center', '', 'Bangalore', '560096', 400, 99, 'A club that deals with not only with one sport but has a variety of sports under one roof. '),
(68, 134, 'Ford Hospitals', 'Anuj Kumar', '2014-04-29', '2034-04-28', 'Hospital', 'BTM  100 Feet Road ', 'Opposite to AXA Building', 'Bangalore', '560068', 400, 99, 'A hospital with all modern facilities.'),
(69, 135, 'Life Care Hospitals', 'Pranav Kumar', '2014-04-29', '2034-04-28', 'Hospital', 'Near Jayadeva Flyover,JP Nagar ', '', 'Bangalore', '560067', 400, 99, 'A modern hospital with world class facilities and well trained doctors'),
(70, 136, 'Naturals', 'Abhishek Krishna', '2014-04-29', '2019-04-28', 'Beauty Parlour', 'Forum Mall Koramangala', '', 'Bangalore', '560066', 400, 99, 'Unisex saloon with modern equipments'),
(71, 137, 'Choppers', 'Phaneesh', '2014-04-29', '2019-04-28', 'Beauty Parlour', 'MG Road ', '', 'Bangalore', '560032', 400, 99, 'Beauty Saloon for men with highly equipped and modern machines.  '),
(66, 132, 'Bangalore Cricket Club', 'Vikas', '2014-04-29', '2034-04-28', 'Club', 'JP Nagar 6th Main ', '', 'Bangalore', '560076', 400, 99, 'Located in the heart of the city for young aspiring cricketers.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_business_settings`
--

CREATE TABLE IF NOT EXISTS `tb_business_settings` (
  `business_id` int(3) DEFAULT NULL,
  `user_activation` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE IF NOT EXISTS `tb_category` (
  `category_id` int(3) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(1, 'Beauty Parlour'),
(2, 'Club'),
(3, 'Hospital');

-- --------------------------------------------------------

--
-- Table structure for table `tb_country`
--

CREATE TABLE IF NOT EXISTS `tb_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=245 ;

--
-- Dumping data for table `tb_country`
--

INSERT INTO `tb_country` (`country_id`, `country_name`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'American Samoa'),
(5, 'Andorra'),
(6, 'Angola'),
(7, 'Anguilla'),
(8, 'Antarctica'),
(9, 'Antigua and Barbuda'),
(10, 'Argentina'),
(11, 'Armenia'),
(12, 'Aruba'),
(13, 'Australia'),
(14, 'Austria'),
(15, 'Azerbaijan'),
(16, 'Bahamas'),
(17, 'Bahrain'),
(18, 'Bangladesh'),
(19, 'Barbados'),
(20, 'Belarus'),
(21, 'Belgium'),
(22, 'Belize'),
(23, 'Benin'),
(24, 'Bermuda'),
(25, 'Bhutan'),
(26, 'Bolivia'),
(27, 'Bosnia and Herzegowina'),
(28, 'Botswana'),
(29, 'Bouvet Island'),
(30, 'Brazil'),
(31, 'British Indian Ocean Territory'),
(32, 'Brunei Darussalam'),
(33, 'Bulgaria'),
(34, 'Burkina Faso'),
(35, 'Burundi'),
(36, 'Cambodia'),
(37, 'Cameroon'),
(38, 'Canada'),
(39, 'Cape Verde'),
(40, 'Cayman Islands'),
(41, 'Central African Republic'),
(42, 'Chad'),
(43, 'Chile'),
(44, 'China'),
(45, 'Christmas Island'),
(46, 'Cocos (Keeling) Islands'),
(47, 'Colombia'),
(48, 'Comoros'),
(49, 'Congo'),
(50, 'Cook Islands'),
(51, 'Costa Rica'),
(52, 'Cote D''Ivoire'),
(53, 'Croatia'),
(54, 'Cuba'),
(55, 'Cyprus'),
(56, 'Czech Republic'),
(57, 'Denmark'),
(58, 'Djibouti'),
(59, 'Dominica'),
(60, 'Dominican Republic'),
(61, 'East Timor'),
(62, 'Ecuador'),
(63, 'Egypt'),
(64, 'El Salvador'),
(65, 'Equatorial Guinea'),
(66, 'Eritrea'),
(67, 'Estonia'),
(68, 'Ethiopia'),
(69, 'Falkland Islands (Malvinas)'),
(70, 'Faroe Islands'),
(71, 'Fiji'),
(72, 'Finland'),
(73, 'France'),
(74, 'France, Metropolitan'),
(75, 'French Guiana'),
(76, 'French Polynesia'),
(77, 'French Southern Territories'),
(78, 'Gabon'),
(79, 'Gambia'),
(80, 'Georgia'),
(81, 'Germany'),
(82, 'Ghana'),
(83, 'Gibraltar'),
(84, 'Greece'),
(85, 'Greenland'),
(86, 'Grenada'),
(87, 'Guadeloupe'),
(88, 'Guam'),
(89, 'Guatemala'),
(90, 'Guinea'),
(91, 'Guinea-bissau'),
(92, 'Guyana'),
(93, 'Haiti'),
(94, 'Heard and Mc Donald Islands'),
(95, 'Honduras'),
(96, 'Hong Kong'),
(97, 'Hungary'),
(98, 'Iceland'),
(99, 'India'),
(100, 'Indonesia'),
(101, 'Iran (Islamic Republic of)'),
(102, 'Iraq'),
(103, 'Ireland'),
(104, 'Israel'),
(105, 'Italy'),
(106, 'Jamaica'),
(107, 'Japan'),
(108, 'Jordan'),
(109, 'Kazakhstan'),
(110, 'Kenya'),
(111, 'Kiribati'),
(112, 'Korea, Democratic People''s Republic of'),
(113, 'Korea, Republic of'),
(114, 'Kuwait'),
(115, 'Kyrgyzstan'),
(116, 'Lao People''s Democratic Republic'),
(117, 'Latvia'),
(118, 'Lebanon'),
(119, 'Lesotho'),
(120, 'Liberia'),
(121, 'Libyan Arab Jamahiriya'),
(122, 'Liechtenstein'),
(123, 'Lithuania'),
(124, 'Luxembourg'),
(125, 'Macau'),
(126, 'Macedonia, The Former Yugoslav Republic of'),
(127, 'Madagascar'),
(128, 'Malawi'),
(129, 'Malaysia'),
(130, 'Maldives'),
(131, 'Mali'),
(132, 'Malta'),
(133, 'Marshall Islands'),
(134, 'Martinique'),
(135, 'Mauritania'),
(136, 'Mauritius'),
(137, 'Mayotte'),
(138, 'Mexico'),
(139, 'Micronesia, Federated States of'),
(140, 'Moldova, Republic of'),
(141, 'Monaco'),
(142, 'Mongolia'),
(143, 'Montserrat'),
(144, 'Morocco'),
(145, 'Mozambique'),
(146, 'Myanmar'),
(147, 'Namibia'),
(148, 'Nauru'),
(149, 'Nepal'),
(150, 'Netherlands'),
(151, 'Netherlands Antilles'),
(152, 'New Caledonia'),
(153, 'New Zealand'),
(154, 'Nicaragua'),
(155, 'Niger'),
(156, 'Nigeria'),
(157, 'Niue'),
(158, 'Norfolk Island'),
(159, 'Northern Mariana Islands'),
(160, 'Norway'),
(161, 'Oman'),
(162, 'Pakistan'),
(163, 'Palau'),
(164, 'Panama'),
(165, 'Papua New Guinea'),
(166, 'Paraguay'),
(167, 'Peru'),
(168, 'Philippines'),
(169, 'Pitcairn'),
(170, 'Poland'),
(171, 'Portugal'),
(172, 'Puerto Rico'),
(173, 'Qatar'),
(174, 'Reunion'),
(175, 'Romania'),
(176, 'Russian Federation'),
(177, 'Rwanda'),
(178, 'Saint Kitts and Nevis'),
(179, 'Saint Lucia'),
(180, 'Saint Vincent and the Grenadines'),
(181, 'Samoa'),
(182, 'San Marino'),
(183, 'Sao Tome and Principe'),
(184, 'Saudi Arabia'),
(185, 'Senegal'),
(186, 'Seychelles'),
(187, 'Sierra Leone'),
(188, 'Singapore'),
(189, 'Slovakia (Slovak Republic)'),
(190, 'Slovenia'),
(191, 'Solomon Islands'),
(192, 'Somalia'),
(193, 'South Africa'),
(194, 'South Georgia and the South Sandwich Islands'),
(195, 'Spain'),
(196, 'Sri Lanka'),
(197, 'St. Helena'),
(198, 'St. Pierre and Miquelon'),
(199, 'Sudan'),
(200, 'Suriname'),
(201, 'Svalbard and Jan Mayen Islands'),
(202, 'Swaziland'),
(203, 'Sweden'),
(204, 'Switzerland'),
(205, 'Syrian Arab Republic'),
(206, 'Taiwan'),
(207, 'Tajikistan'),
(208, 'Tanzania, United Republic of'),
(209, 'Thailand'),
(210, 'Togo'),
(211, 'Tokelau'),
(212, 'Tonga'),
(213, 'Trinidad and Tobago'),
(214, 'Tunisia'),
(215, 'Turkey'),
(216, 'Turkmenistan'),
(217, 'Turks and Caicos Islands'),
(218, 'Tuvalu'),
(219, 'Uganda'),
(220, 'Ukraine'),
(221, 'United Arab Emirates'),
(222, 'United Kingdom'),
(223, 'United States'),
(224, 'United States Minor Outlying Islands'),
(225, 'Uruguay'),
(226, 'Uzbekistan'),
(227, 'Vanuatu'),
(228, 'Vatican City State (Holy See)'),
(229, 'Venezuela'),
(230, 'Viet Nam'),
(231, 'Virgin Islands (British)'),
(232, 'Virgin Islands (U.S.)'),
(233, 'Wallis and Futuna Islands'),
(234, 'Western Sahara'),
(235, 'Yemen'),
(236, 'Yugoslavia'),
(237, 'The Democratic Republic of Congo'),
(238, 'Zambia'),
(239, 'Zimbabwe'),
(240, 'East Timor'),
(241, 'Jersey'),
(242, 'St. Barthelemy'),
(243, 'St. Eustatius'),
(244, 'Canary Islands');

-- --------------------------------------------------------

--
-- Table structure for table `tb_currency`
--

CREATE TABLE IF NOT EXISTS `tb_currency` (
  `currency_id` int(3) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_currency`
--

INSERT INTO `tb_currency` (`currency_id`, `currency_name`) VALUES
(1, 'INR'),
(2, 'RUB'),
(3, 'US$');

-- --------------------------------------------------------

--
-- Table structure for table `tb_facilities`
--

CREATE TABLE IF NOT EXISTS `tb_facilities` (
  `facility_id` int(3) NOT NULL AUTO_INCREMENT,
  `facility_business_id` int(3) NOT NULL,
  `facility_name` varchar(64) NOT NULL,
  `facility_type` varchar(16) NOT NULL,
  `facility_from_date` date DEFAULT NULL,
  `facility_to_date` date DEFAULT NULL,
  `facility_from_time` time DEFAULT NULL,
  `facility_to_time` time DEFAULT NULL,
  `time_per_slot` time DEFAULT NULL,
  `members_per_slot` int(3) DEFAULT NULL,
  `facility_desc` varchar(256) NOT NULL,
  `facility_add1` varchar(256) NOT NULL,
  `facility_add2` varchar(256) NOT NULL,
  `facility_city` varchar(50) DEFAULT NULL,
  `facility_zip_code` varchar(32) DEFAULT NULL,
  `facility_state_id` int(11) DEFAULT NULL,
  `facility_country_id` int(11) DEFAULT NULL,
  `facility_contact_no` varchar(15) NOT NULL,
  `facility_status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `tb_facilities`
--

INSERT INTO `tb_facilities` (`facility_id`, `facility_business_id`, `facility_name`, `facility_type`, `facility_from_date`, `facility_to_date`, `facility_from_time`, `facility_to_time`, `time_per_slot`, `members_per_slot`, `facility_desc`, `facility_add1`, `facility_add2`, `facility_city`, `facility_zip_code`, `facility_state_id`, `facility_country_id`, `facility_contact_no`, `facility_status`) VALUES
(146, 75, 'Neuro Sciences', 'public', '2014-05-05', '2024-05-04', '00:00:00', '23:55:00', '05:00:00', 3, 'One of the leading centres in India for the treatment of Epilepsy.', 'Bannerghatta Road ', '', 'Bangalore', '560078', 400, 99, '9790998768', 'open'),
(145, 68, 'Pharmacy', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '05:00:00', 5, 'Free reliable quality medicines are available to beneficiaries on doctor prescription during OPD hours. Medicines not available are provided by S.O. signed by prescribing Doctor and Head and collected from on campus chemist shop.', 'BTM  100 Feet Road ', 'Opposite to AXA Building', 'Bangalore', '560068', 400, 99, '9901182244', 'open'),
(144, 68, 'ECG Services', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '05:00:00', 5, '24hours ECG services including machine report, done by trained staff.', 'BTM  100 Feet Road ', 'Opposite to AXA Building', 'Bangalore', '560068', 400, 99, '7607756564', 'open'),
(140, 73, 'Blood Donation ', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '10:00:00', 5, 'All categories of blood under one roof. ', 'JP Nagar 6th Phase', '', 'Bangalore', '560078', 400, 99, '7790982334', 'open'),
(132, 74, 'Pedicure', 'public', '2014-04-29', '2014-04-29', '09:00:00', '20:00:00', '05:00:00', 5, 'Pedicure at reasonable rates.', 'N.S Palya,BTM 2nd Stage', '', 'Bangalore', '560068', 384, 99, '9790998765', 'open'),
(133, 72, 'Lawn Tennis ', 'public', '2014-04-29', '2021-04-28', '09:00:00', '17:00:00', '05:00:00', 5, 'Lawn tennis academy where training is given by Mahesh Bhupati', 'Bannerghatta Road ,Near IIM Bangalore', '', 'Bangalore', '560067', 384, 99, '9886543432', 'open'),
(134, 72, 'Football Training', 'public', '2014-04-29', '2021-04-28', '06:00:00', '21:00:00', '04:00:00', 5, 'Young aspiring footballers to be trained by experienced coaches from the English Football Clubs.', 'Bannerghatta Road ,Near IIM Bangalore', '', 'Bangalore', '560067', 384, 99, '9883678765', 'open'),
(135, 72, 'Swimming', 'public', '2014-04-29', '2024-04-28', '06:00:00', '18:00:00', '05:00:00', 5, 'Rooftop Swimming Pool ', 'Bannerghatta Road ,Near IIM Bangalore', '', 'Bangalore', '560067', 384, 99, '9887675565', 'open'),
(136, 67, 'Hockey Training', 'public', '2014-04-29', '2024-04-28', '06:00:00', '22:00:00', '04:00:00', 5, 'Hockey training on turf grounds.', 'Opposite World Trade Center', '', 'Bangalore', '560096', 400, 99, '9886543231', 'open'),
(137, 67, 'Golf Course', 'public', '2014-04-29', '2024-04-28', '05:00:00', '20:00:00', '05:00:00', 5, 'Golf Course stretched at a distance of 7.5 km.', 'Opposite World Trade Center', '', 'Bangalore', '560096', 400, 99, '9889765531', 'open'),
(138, 73, 'Kidney Transplant Centre', 'public', '2014-04-29', '2024-04-28', '00:00:00', '13:55:00', '10:00:00', 9, 'Kidney transplant center with all modern equipments.', 'JP Nagar 6th Phase', '', 'Bangalore', '560078', 400, 99, '9881234355', 'open'),
(139, 73, 'Trauma Centre', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '10:00:00', 8, 'Provide comprehensive emergency medical services to patients suffering traumatic injuries.', 'JP Nagar 6th Phase', '', 'Bangalore', '560078', 400, 99, '9786659822', 'open'),
(131, 71, 'Manicure and Pedicure', 'public', '2014-04-29', '2022-04-28', '09:00:00', '21:00:00', '16:00:00', 5, 'Manicure and Pedicure at reasonable rate.', 'MG Road ', '', 'Bangalore', '560032', 400, 99, '9199188723', 'open'),
(141, 69, 'Physical Medicine and Rehabilitation', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '08:00:00', 4, 'Rehabilitation Center for Juvenile.', 'Near Jayadeva Flyover,JP Nagar ', '', 'Bangalore', '560067', 400, 99, '9199184811', 'open'),
(142, 69, 'Child Specialist', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '10:00:00', 10, 'Child specialists with well trained doctors.', 'Near Jayadeva Flyover,JP Nagar ', '', 'Bangalore', '560067', 400, 99, '7900981128', 'open'),
(143, 68, 'Dental facility', 'public', '2014-04-29', '2024-04-28', '00:00:00', '23:55:00', '10:00:00', 6, 'An experienced Dental surgeon provides procedures like Dental Extractions, RCT, Scaling /Cleaning, Fillings, Local curettage.', 'BTM  100 Feet Road ', 'Opposite to AXA Building', 'Bangalore', '560068', 400, 99, '9878892322', 'open'),
(125, 65, 'Lawn Tennis Court', 'public', '2007-04-12', '2027-04-29', '06:00:00', '22:00:00', '06:25:00', 5, 'Lawn Tennis court on the terrace ', 'MICO Layout', '', 'Bangalore', '560068', 400, 99, '9940654321', 'open'),
(126, 66, 'Cricket Club', 'public', '2014-04-29', '2034-04-28', '18:00:00', '18:00:00', '13:25:00', 5, 'Cricket Club with a professional coach.', 'JP Nagar 6th Main ', '', 'Bangalore', '560076', 400, 99, '9886543231', 'open'),
(127, 67, 'Swimming Pool ', 'public', '2014-04-29', '2021-04-28', '05:00:00', '18:00:00', '06:00:00', 5, 'A 7 feet swimming pool with a shallow and a deep end and with world class trainers', 'Opposite World Trade Center', '', 'Bangalore', '560096', 400, 99, '9972567890', 'open'),
(128, 69, 'Emergency Ward ', 'public', '2014-04-29', '2034-04-28', '00:00:00', '23:55:00', '15:00:00', 5, 'An emergency ward to treat patients in case of any emergency service.', 'Near Jayadeva Flyover,JP Nagar ', '', 'Bangalore', '560067', 400, 99, '9789912311', 'open'),
(129, 68, 'General Wards', 'public', '2014-04-29', '2034-04-28', '00:00:00', '23:55:00', '05:00:00', 5, 'General Wards for Ordinary people', 'BTM  100 Feet Road ', 'Opposite to AXA Building', 'Bangalore', '560068', 400, 99, '9994567674', 'open'),
(130, 70, 'Hair Cutting With hair wash', 'public', '2014-04-29', '2022-04-28', '09:00:00', '21:00:00', '12:00:00', 5, 'Hair washing and cutting at a reasonable price.', 'Forum Mall Koramangala', '', 'Bangalore', '560066', 400, 99, '9834577898', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `tb_functions`
--

CREATE TABLE IF NOT EXISTS `tb_functions` (
  `function_id` int(3) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tb_functions`
--

INSERT INTO `tb_functions` (`function_id`, `function_name`) VALUES
(1, 'create_facility'),
(2, 'update_facility'),
(3, 'view_facilitylist'),
(4, 'delete_facility'),
(22, 'delete_business_owner'),
(21, 'activate_business'),
(20, 'update_owner_profile'),
(19, 'create_business_owner'),
(18, 'delete_business_user'),
(17, 'change_account_status'),
(16, 'update_user_profile'),
(15, 'create_business_user'),
(14, 'send_invites'),
(13, 'search_appointments'),
(12, 'search_business'),
(11, 'update_subscription'),
(10, 'delete_subscription'),
(9, 'view_subscriptionlist'),
(8, 'create_subscription'),
(7, 'change_appointment_status'),
(6, 'cancel_appointment'),
(5, 'create_appointment'),
(23, 'global_settings');

-- --------------------------------------------------------

--
-- Table structure for table `tb_function_permissions`
--

CREATE TABLE IF NOT EXISTS `tb_function_permissions` (
  `permission_id` int(3) NOT NULL AUTO_INCREMENT,
  `function_id` int(3) NOT NULL,
  `role_id` int(3) NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `function_id` (`function_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tb_function_permissions`
--

INSERT INTO `tb_function_permissions` (`permission_id`, `function_id`, `role_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(24, 22, 1),
(23, 21, 1),
(22, 20, 2),
(21, 19, 2),
(20, 18, 2),
(19, 17, 2),
(18, 16, 3),
(17, 15, 3),
(16, 14, 3),
(15, 13, 2),
(14, 7, 2),
(13, 12, 3),
(12, 12, 2),
(11, 12, 1),
(10, 6, 3),
(9, 5, 3),
(8, 11, 1),
(7, 10, 1),
(6, 9, 1),
(5, 8, 1),
(25, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_global_settings`
--

CREATE TABLE IF NOT EXISTS `tb_global_settings` (
  `setting_id` int(3) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(64) DEFAULT NULL,
  `param_value` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_global_settings`
--

INSERT INTO `tb_global_settings` (`setting_id`, `param_name`, `param_value`) VALUES
(1, 'default_country', '99'),
(2, 'default_currency', '1'),
(3, 'default_country_by_bo', '99');

-- --------------------------------------------------------

--
-- Table structure for table `tb_role`
--

CREATE TABLE IF NOT EXISTS `tb_role` (
  `role_id` int(3) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_role`
--

INSERT INTO `tb_role` (`role_id`, `role_name`) VALUES
(1, 'SuperAdministrator'),
(2, 'Administrator'),
(3, 'BusinessUsers');

-- --------------------------------------------------------

--
-- Table structure for table `tb_states`
--

CREATE TABLE IF NOT EXISTS `tb_states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=417 ;

--
-- Dumping data for table `tb_states`
--

INSERT INTO `tb_states` (`state_id`, `country_id`, `state_name`) VALUES
(1, 223, 'Alabama'),
(2, 223, 'Alaska'),
(3, 223, 'Arizona'),
(4, 223, 'Arkansas'),
(5, 223, 'California'),
(6, 223, 'Colorado'),
(7, 223, 'Connecticut'),
(8, 223, 'Delaware'),
(9, 223, 'District Of Columbia'),
(10, 223, 'Florida'),
(11, 223, 'Georgia'),
(12, 223, 'Hawaii'),
(13, 223, 'Idaho'),
(14, 223, 'Illinois'),
(15, 223, 'Indiana'),
(16, 223, 'Iowa'),
(17, 223, 'Kansas'),
(18, 223, 'Kentucky'),
(19, 223, 'Louisiana'),
(20, 223, 'Maine'),
(21, 223, 'Maryland'),
(22, 223, 'Massachusetts'),
(23, 223, 'Michigan'),
(24, 223, 'Minnesota'),
(25, 223, 'Mississippi'),
(26, 223, 'Missouri'),
(27, 223, 'Montana'),
(28, 223, 'Nebraska'),
(29, 223, 'Nevada'),
(30, 223, 'New Hampshire'),
(31, 223, 'New Jersey'),
(32, 223, 'New Mexico'),
(33, 223, 'New York'),
(34, 223, 'North Carolina'),
(35, 223, 'North Dakota'),
(36, 223, 'Ohio'),
(37, 223, 'Oklahoma'),
(38, 223, 'Oregon'),
(39, 223, 'Pennsylvania'),
(40, 223, 'Rhode Island'),
(41, 223, 'South Carolina'),
(42, 223, 'South Dakota'),
(43, 223, 'Tennessee'),
(44, 223, 'Texas'),
(45, 223, 'Utah'),
(46, 223, 'Vermont'),
(47, 223, 'Virginia'),
(48, 223, 'Washington'),
(49, 223, 'West Virginia'),
(50, 223, 'Wisconsin'),
(51, 223, 'Wyoming'),
(52, 38, 'Alberta'),
(53, 38, 'British Columbia'),
(54, 38, 'Manitoba'),
(55, 38, 'New Brunswick'),
(56, 38, 'Newfoundland and Labrador'),
(57, 38, 'Northwest Territories'),
(58, 38, 'Nova Scotia'),
(59, 38, 'Nunavut'),
(60, 38, 'Ontario'),
(61, 38, 'Prince Edward Island'),
(62, 38, 'Quebec'),
(63, 38, 'Saskatchewan'),
(64, 38, 'Yukon'),
(65, 222, 'England'),
(66, 222, 'Northern Ireland'),
(67, 222, 'Scotland'),
(68, 222, 'Wales'),
(69, 13, 'Australian Capital Territory'),
(70, 13, 'New South Wales'),
(71, 13, 'Northern Territory'),
(72, 13, 'Queensland'),
(73, 13, 'South Australia'),
(74, 13, 'Tasmania'),
(75, 13, 'Victoria'),
(76, 13, 'Western Australia'),
(77, 138, 'Aguascalientes'),
(78, 138, 'Baja California Norte'),
(79, 138, 'Baja California Sur'),
(80, 138, 'Campeche'),
(81, 138, 'Chiapas'),
(82, 138, 'Chihuahua'),
(83, 138, 'Coahuila'),
(84, 138, 'Colima'),
(85, 138, 'Distrito Federal'),
(86, 138, 'Durango'),
(87, 138, 'Guanajuato'),
(88, 138, 'Guerrero'),
(89, 138, 'Hidalgo'),
(90, 138, 'Jalisco'),
(91, 138, 'M'),
(92, 138, 'Michoac'),
(93, 138, 'Morelos'),
(94, 138, 'Nayarit'),
(95, 138, 'Nuevo Le'),
(96, 138, 'Oaxaca'),
(97, 138, 'Puebla'),
(98, 138, 'Quer'),
(99, 138, 'Quintana Roo'),
(100, 138, 'San Luis Potos'),
(101, 138, 'Sinaloa'),
(102, 138, 'Sonora'),
(103, 138, 'Tabasco'),
(104, 138, 'Tamaulipas'),
(105, 138, 'Tlaxcala'),
(106, 138, 'Veracruz'),
(107, 138, 'Yucat'),
(108, 138, 'Zacatecas'),
(109, 30, 'Acre'),
(110, 30, 'Alagoas'),
(111, 30, 'Amap'),
(112, 30, 'Amazonas'),
(113, 30, 'Bah'),
(114, 30, 'Cear'),
(115, 30, 'Distrito Federal'),
(116, 30, 'Espirito Santo'),
(117, 30, 'Goi'),
(118, 30, 'Maranh'),
(119, 30, 'Mato Grosso'),
(120, 30, 'Mato Grosso do Sul'),
(121, 30, 'Minas Gera'),
(122, 30, 'Paran'),
(123, 30, 'Para'),
(124, 30, 'Par'),
(125, 30, 'Pernambuco'),
(126, 30, 'Piau'),
(127, 30, 'Rio Grande do Norte'),
(128, 30, 'Rio Grande do Sul'),
(129, 30, 'Rio de Janeiro'),
(130, 30, 'Rond'),
(131, 30, 'Roraima'),
(132, 30, 'Santa Catarina'),
(133, 30, 'Sergipe'),
(134, 30, 'S'),
(135, 30, 'Tocantins'),
(136, 44, 'Anhui'),
(137, 44, 'Beijing'),
(138, 44, 'Chongqing'),
(139, 44, 'Fujian'),
(140, 44, 'Gansu'),
(141, 44, 'Guangdong'),
(142, 44, 'Guangxi Zhuang'),
(143, 44, 'Guizhou'),
(144, 44, 'Hainan'),
(145, 44, 'Hebei'),
(146, 44, 'Heilongjiang'),
(147, 44, 'Henan'),
(148, 44, 'Hubei'),
(149, 44, 'Hunan'),
(150, 44, 'Jiangsu'),
(151, 44, 'Jiangxi'),
(152, 44, 'Jilin'),
(153, 44, 'Liaoning'),
(154, 44, 'Nei Mongol'),
(155, 44, 'Ningxia Hui'),
(156, 44, 'Qinghai'),
(157, 44, 'Shandong'),
(158, 44, 'Shanghai'),
(159, 44, 'Shaanxi'),
(160, 44, 'Sichuan'),
(161, 44, 'Tianjin'),
(162, 44, 'Xinjiang Uygur'),
(163, 44, 'Xizang'),
(164, 44, 'Yunnan'),
(165, 44, 'Zhejiang'),
(166, 104, 'Gaza Strip'),
(167, 104, 'West Bank'),
(168, 104, 'Other'),
(169, 151, 'St. Maarten'),
(170, 151, 'Bonaire'),
(171, 151, 'Curacao'),
(172, 175, 'Alba'),
(173, 175, 'Arad'),
(174, 175, 'Arges'),
(175, 175, 'Bacau'),
(176, 175, 'Bihor'),
(177, 175, 'Bistrita-Nasaud'),
(178, 175, 'Botosani'),
(179, 175, 'Braila'),
(180, 175, 'Brasov'),
(181, 175, 'Bucuresti'),
(182, 175, 'Buzau'),
(183, 175, 'Calarasi'),
(184, 175, 'Caras Severin'),
(185, 175, 'Cluj'),
(186, 175, 'Constanta'),
(187, 175, 'Covasna'),
(188, 175, 'Dambovita'),
(189, 175, 'Dolj'),
(190, 175, 'Galati'),
(191, 175, 'Giurgiu'),
(192, 175, 'Gorj'),
(193, 175, 'Hargita'),
(194, 175, 'Hunedoara'),
(195, 175, 'Ialomita'),
(196, 175, 'Iasi'),
(197, 175, 'Ilfov'),
(198, 175, 'Maramures'),
(199, 175, 'Mehedinti'),
(200, 175, 'Mures'),
(201, 175, 'Neamt'),
(202, 175, 'Olt'),
(203, 175, 'Prahova'),
(204, 175, 'Salaj'),
(205, 175, 'Satu Mare'),
(206, 175, 'Sibiu'),
(207, 175, 'Suceava'),
(208, 175, 'Teleorman'),
(209, 175, 'Timis'),
(210, 175, 'Tulcea'),
(211, 175, 'Valcea'),
(212, 175, 'Vaslui'),
(213, 175, 'Vreancea'),
(214, 105, 'Agrigento'),
(215, 105, 'Alessandria'),
(216, 105, 'Ancona'),
(217, 105, 'Aosta'),
(218, 105, 'Arezzo'),
(219, 105, 'Ascoli Piceno'),
(220, 105, 'Asti'),
(221, 105, 'Avellino'),
(222, 105, 'Bari'),
(223, 105, 'Belluno'),
(224, 105, 'Benevento'),
(225, 105, 'Bergamo'),
(226, 105, 'Biella'),
(227, 105, 'Bologna'),
(228, 105, 'Bolzano'),
(229, 105, 'Brescia'),
(230, 105, 'Brindisi'),
(231, 105, 'Cagliari'),
(232, 105, 'Caltanissetta'),
(233, 105, 'Campobasso'),
(234, 105, 'Carbonia-Iglesias'),
(235, 105, 'Caserta'),
(236, 105, 'Catania'),
(237, 105, 'Catanzaro'),
(238, 105, 'Chieti'),
(239, 105, 'Como'),
(240, 105, 'Cosenza'),
(241, 105, 'Cremona'),
(242, 105, 'Crotone'),
(243, 105, 'Cuneo'),
(244, 105, 'Enna'),
(245, 105, 'Ferrara'),
(246, 105, 'Firenze'),
(247, 105, 'Foggia'),
(248, 105, 'Forli-Cesena'),
(249, 105, 'Frosinone'),
(250, 105, 'Genova'),
(251, 105, 'Gorizia'),
(252, 105, 'Grosseto'),
(253, 105, 'Imperia'),
(254, 105, 'Isernia'),
(255, 105, 'L''Aquila'),
(256, 105, 'La Spezia'),
(257, 105, 'Latina'),
(258, 105, 'Lecce'),
(259, 105, 'Lecco'),
(260, 105, 'Livorno'),
(261, 105, 'Lodi'),
(262, 105, 'Lucca'),
(263, 105, 'Macerata'),
(264, 105, 'Mantova'),
(265, 105, 'Massa-Carrara'),
(266, 105, 'Matera'),
(267, 105, 'Medio Campidano'),
(268, 105, 'Messina'),
(269, 105, 'Milano'),
(270, 105, 'Modena'),
(271, 105, 'Napoli'),
(272, 105, 'Novara'),
(273, 105, 'Nuoro'),
(274, 105, 'Ogliastra'),
(275, 105, 'Olbia-Tempio'),
(276, 105, 'Oristano'),
(277, 105, 'Padova'),
(278, 105, 'Palermo'),
(279, 105, 'Parma'),
(280, 105, 'Pavia'),
(281, 105, 'Perugia'),
(282, 105, 'Pesaro e Urbino'),
(283, 105, 'Pescara'),
(284, 105, 'Piacenza'),
(285, 105, 'Pisa'),
(286, 105, 'Pistoia'),
(287, 105, 'Pordenone'),
(288, 105, 'Potenza'),
(289, 105, 'Prato'),
(290, 105, 'Ragusa'),
(291, 105, 'Ravenna'),
(292, 105, 'Reggio Calabria'),
(293, 105, 'Reggio Emilia'),
(294, 105, 'Rieti'),
(295, 105, 'Rimini'),
(296, 105, 'Roma'),
(297, 105, 'Rovigo'),
(298, 105, 'Salerno'),
(299, 105, 'Sassari'),
(300, 105, 'Savona'),
(301, 105, 'Siena'),
(302, 105, 'Siracusa'),
(303, 105, 'Sondrio'),
(304, 105, 'Taranto'),
(305, 105, 'Teramo'),
(306, 105, 'Terni'),
(307, 105, 'Torino'),
(308, 105, 'Trapani'),
(309, 105, 'Trento'),
(310, 105, 'Treviso'),
(311, 105, 'Trieste'),
(312, 105, 'Udine'),
(313, 105, 'Varese'),
(314, 105, 'Venezia'),
(315, 105, 'Verbano Cusio Ossola'),
(316, 105, 'Vercelli'),
(317, 105, 'Verona'),
(318, 105, 'Vibo Valenzia'),
(319, 105, 'Vicenza'),
(320, 105, 'Viterbo'),
(321, 195, 'A Coru'),
(322, 195, 'Alava'),
(323, 195, 'Albacete'),
(324, 195, 'Alicante'),
(325, 195, 'Almeria'),
(326, 195, 'Asturias'),
(327, 195, 'Avila'),
(328, 195, 'Badajoz'),
(329, 195, 'Baleares'),
(330, 195, 'Barcelona'),
(331, 195, 'Burgos'),
(332, 195, 'Caceres'),
(333, 195, 'Cadiz'),
(334, 195, 'Cantabria'),
(335, 195, 'Castellon'),
(336, 195, 'Ceuta'),
(337, 195, 'Ciudad Real'),
(338, 195, 'Cordoba'),
(339, 195, 'Cuenca'),
(340, 195, 'Girona'),
(341, 195, 'Granada'),
(342, 195, 'Guadalajara'),
(343, 195, 'Guipuzcoa'),
(344, 195, 'Huelva'),
(345, 195, 'Huesca'),
(346, 195, 'Jaen'),
(347, 195, 'La Rioja'),
(348, 195, 'Las Palmas'),
(349, 195, 'Leon'),
(350, 195, 'Lleida'),
(351, 195, 'Lugo'),
(352, 195, 'Madrid'),
(353, 195, 'Malaga'),
(354, 195, 'Melilla'),
(355, 195, 'Murcia'),
(356, 195, 'Navarra'),
(357, 195, 'Ourense'),
(358, 195, 'Palencia'),
(359, 195, 'Pontevedra'),
(360, 195, 'Salamanca'),
(361, 195, 'Santa Cruz de Tenerife'),
(362, 195, 'Segovia'),
(363, 195, 'Sevilla'),
(364, 195, 'Soria'),
(365, 195, 'Tarragona'),
(366, 195, 'Teruel'),
(367, 195, 'Toledo'),
(368, 195, 'Valencia'),
(369, 195, 'Valladolid'),
(370, 195, 'Vizcaya'),
(371, 195, 'Zamora'),
(372, 195, 'Zaragoza'),
(373, 11, 'Aragatsotn'),
(374, 11, 'Ararat'),
(375, 11, 'Armavir'),
(376, 11, 'Gegharkunik'),
(377, 11, 'Kotayk'),
(378, 11, 'Lori'),
(379, 11, 'Shirak'),
(380, 11, 'Syunik'),
(381, 11, 'Tavush'),
(382, 11, 'Vayots-Dzor'),
(383, 11, 'Yerevan'),
(384, 99, 'Andaman & Nicobar Islands'),
(385, 99, 'Andhra Pradesh'),
(386, 99, 'Arunachal Pradesh'),
(387, 99, 'Assam'),
(388, 99, 'Bihar'),
(389, 99, 'Chandigarh'),
(390, 99, 'Chhatisgarh'),
(391, 99, 'Dadra & Nagar Haveli'),
(392, 99, 'Daman & Diu'),
(393, 99, 'Delhi'),
(394, 99, 'Goa'),
(395, 99, 'Gujarat'),
(396, 99, 'Haryana'),
(397, 99, 'Himachal Pradesh'),
(398, 99, 'Jammu and Kashmir'),
(399, 99, 'Jharkhand'),
(400, 99, 'Karnataka'),
(401, 99, 'Kerala'),
(402, 99, 'Madhya Pradesh'),
(403, 99, 'Maharashtra'),
(404, 99, 'Manipur'),
(405, 99, 'Meghalaya'),
(406, 99, 'Mizoram'),
(407, 99, 'Nagaland'),
(408, 99, 'Orissa'),
(409, 99, 'Punjab'),
(410, 99, 'Rajasthan'),
(411, 99, 'Sikkim'),
(412, 99, 'Tamil Nadu'),
(413, 99, 'Tripura'),
(414, 99, 'Uttar Pradesh'),
(415, 99, 'Uttarakhand'),
(416, 99, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subscription`
--

CREATE TABLE IF NOT EXISTS `tb_subscription` (
  `subs_id` int(3) NOT NULL AUTO_INCREMENT,
  `subs_name` varchar(50) NOT NULL,
  `subs_description` text,
  `subs_amount` float(7,2) DEFAULT NULL,
  `subs_duration` int(3) DEFAULT NULL,
  PRIMARY KEY (`subs_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `tb_subscription`
--

INSERT INTO `tb_subscription` (`subs_id`, `subs_name`, `subs_description`, `subs_amount`, `subs_duration`) VALUES
(1, 'Monthly', 'Monthly', 500.00, 1),
(2, 'Six Months', 'Six Months', 2500.00, 6),
(5, 'One Year', 'One Year', 4500.00, 12),
(59, 'Short Term ', 'Short Term Subscriptions', 1200.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_userrole`
--

CREATE TABLE IF NOT EXISTS `tb_userrole` (
  `user_id` int(10) NOT NULL,
  `role_id` int(3) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_userrole`
--

INSERT INTO `tb_userrole` (`user_id`, `role_id`) VALUES
(22, 2),
(23, 3),
(24, 3),
(25, 3),
(26, 1),
(27, 2),
(28, 3),
(29, 2),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(49, 2),
(50, 2),
(51, 3),
(52, 3),
(53, 2),
(54, 2),
(55, 3),
(56, 2),
(58, 2),
(59, 3),
(60, 3),
(61, 2),
(62, 3),
(63, 2),
(64, 2),
(65, 2),
(66, 3),
(67, 2),
(69, 2),
(70, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 3),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(84, 3),
(85, 2),
(86, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 3),
(93, 2),
(108, 2),
(95, 2),
(96, 3),
(97, 2),
(98, 2),
(99, 3),
(100, 2),
(101, 2),
(102, 2),
(103, 3),
(104, 3),
(105, 3),
(106, 2),
(109, 2),
(110, 3),
(111, 3),
(112, 2),
(113, 3),
(114, 3),
(115, 2),
(116, 3),
(120, 2),
(118, 3),
(119, 3),
(121, 3),
(122, 3),
(123, 2),
(124, 3),
(125, 2),
(126, 2),
(127, 3),
(128, 3),
(129, 2),
(130, 3),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(136, 2),
(137, 2),
(138, 3),
(139, 3),
(140, 2),
(141, 2),
(142, 2),
(143, 3),
(144, 2),
(145, 3),
(146, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE IF NOT EXISTS `tb_users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `passward` varchar(30) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `middle_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email_id` varchar(60) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip_code` varchar(32) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `membership_id` varchar(64) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `user_name`, `passward`, `first_name`, `middle_name`, `last_name`, `email_id`, `phone_no`, `address_line1`, `address_line2`, `city`, `zip_code`, `state_id`, `country_id`, `membership_id`, `status`) VALUES
(26, 'superadmin', 'J¹¶¦êe$6 !æÔvn', 'admin', 'admin', 'admin', 'kkk@gmail.com', '9876543210', 'Whitefield', 'Near ITPL', 'Bangalore', '560058', 1, 99, '', 'Active'),
(134, 'anujkumar', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Anuj ', '', 'Kumar', 'anujkaumar@gmail.com', '9886543231', 'MRA Hostels, Silk Board', '', 'Bangalore', '560068', 400, 99, '1170910101', 'Active'),
(135, 'pranav', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Pranav', '', 'Kumar', 'pranavkr@gmail.com', '9742567674', 'Kundanhalli Gate ,Whitefield', '', 'Bangalore', '560097', 384, 99, '1170910102', 'Active'),
(136, 'abhishek', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Abhishek', '', ' Krishna', 'abhishek@gmail.com', '9934108509', 'MICO Layout,Near Arekere Signal', '', 'Bangalore', '560071', 400, 99, '1170910119', 'Active'),
(137, 'phaneesh', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Phaneesh ', '', 'Hegde', 'phaneesh@gmail.com', '8883276200', 'Bankers Colony,ISRO Layout', '', 'Bangalore', '560104', 400, 99, '1170910117', 'Active'),
(138, 'abhineet', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Abhineet ', '', 'Singh', 'abhineet@gmail.com', '9723466482', 'BTM 2nd Stage,Near SUBWAY', '', 'Bangalore', '560068', 400, 99, '', 'Active'),
(139, 'ramesh', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Ramesh ', '', 'Kumar', 'ramesh@gmail.com', '9566052377', '16th Main ,BTM Water Tank', '', 'Bangalore', '560068', 400, 99, '', 'Active'),
(142, 'ramanjha', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Raman', '', 'Jha', 'raman@gmail.com', '9431109876', 'BTM Near Gangotri Circle', '', 'Bangalore', '560068', 400, 99, '1170910021', 'Active'),
(143, 'abhinav', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Abhinav', '', 'Kumar', 'abhinav@gmail.com', '9884467556', 'Near Central Mall,Marathalli ', '', 'Bangalore', '560107', 400, 99, '', 'Active'),
(144, 'amankumar', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Aman', '', 'Kumar', 'amankumar@gmail.com', '9993544672', 'Silk Board', '', 'Bangalore', '560069', 400, 99, '1170910011', 'Active'),
(145, 'abhimanyu', 'öDð%¦üŒAºñ#šÓ', 'Abhimanyu', '', 'Singh', 'abhi@gmail.com', '9878876565', 'BTM', '', 'Bangalore', '560068', 400, 99, '', 'Active'),
(133, 'harshawardhana', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Harshawardhana', '', 'KP', 'harshwardhan@gmail.com', '9164375647', '10th Main 4th Cross BTM 1st Stage', '', 'Bangalore', '560068', 400, 99, '1170910120', 'Active'),
(132, 'vsvikas', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Vikas', '', 'Singh', 'vsvikas07@gmail.com', '9972566892', '20th Main 11th Cross,BTM Stage 1', '', 'Bangalore', '560068', 400, 99, '1170910118', 'Active'),
(141, 'pratap', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Pratap', '', 'Reddy', 'pratap@gmail.com', '7760556436', 'BTM Near Gangotri Circle', '', 'Bangalore', '560068', 400, 99, '1170910123', 'Active'),
(140, 'vikassingh', 'á¶©ÝÓÔÌe3scÝ¢Øì', 'Vikas', '', 'Singh', 'vikas@gmail.com', '8754561245', 'MRA Hostels,Silk Board', '', 'Bangalore', '560068', 400, 99, '1170910100', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_subscription`
--

CREATE TABLE IF NOT EXISTS `tb_user_subscription` (
  `user_id` int(10) NOT NULL,
  `subs_id` int(3) NOT NULL,
  KEY `subs_id` (`subs_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user_subscription`
--

INSERT INTO `tb_user_subscription` (`user_id`, `subs_id`) VALUES
(22, 1),
(27, 2),
(29, 3),
(49, 5),
(50, 1),
(53, 1),
(54, 1),
(56, 2),
(58, 1),
(61, 1),
(63, 2),
(64, 1),
(65, 1),
(67, 1),
(69, 1),
(70, 5),
(73, 1),
(74, 1),
(75, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(85, 1),
(86, 1),
(89, 2),
(90, 1),
(91, 1),
(93, 2),
(108, 1),
(95, 1),
(97, 1),
(98, 1),
(100, 1),
(101, 5),
(102, 5),
(106, 1),
(109, 1),
(112, 1),
(115, 2),
(120, 59),
(123, 5),
(125, 1),
(126, 1),
(129, 1),
(131, 5),
(132, 5),
(133, 5),
(134, 5),
(135, 5),
(136, 5),
(137, 5),
(140, 5),
(141, 5),
(142, 5),
(144, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user_to_business_map`
--

CREATE TABLE IF NOT EXISTS `tb_user_to_business_map` (
  `user_business_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `business_id` int(3) NOT NULL,
  PRIMARY KEY (`user_business_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `tb_user_to_business_map`
--

INSERT INTO `tb_user_to_business_map` (`user_business_id`, `user_id`, `business_id`) VALUES
(6, 23, 13),
(7, 24, 13),
(8, 25, 13),
(9, 28, 13),
(10, 30, 13),
(11, 31, 13),
(12, 32, 16),
(13, 33, 17),
(14, 34, 17),
(15, 35, 17),
(16, 37, 17),
(17, 38, 17),
(18, 39, 17),
(19, 40, 17),
(20, 41, 17),
(21, 42, 16),
(22, 43, 16),
(23, 44, 16),
(24, 45, 16),
(25, 46, 16),
(26, 47, 16),
(27, 51, 16),
(28, 52, 16),
(29, 55, 16),
(30, 59, 16),
(31, 60, 18),
(32, 62, 13),
(33, 66, 27),
(34, 76, 30),
(35, 84, 18),
(36, 92, 42),
(37, 96, 47),
(38, 99, 49),
(39, 103, 52),
(40, 104, 52),
(41, 105, 13),
(42, 110, 13),
(43, 111, 49),
(44, 113, 57),
(45, 114, 57),
(46, 116, 58),
(47, 118, 58),
(48, 119, 58),
(49, 121, 60),
(50, 122, 60),
(51, 124, 61),
(52, 127, 61),
(53, 128, 60),
(54, 129, 61),
(55, 130, 53),
(56, 130, 65),
(57, 129, 65),
(58, 131, 61),
(59, 138, 66),
(60, 139, 69),
(61, 138, 67),
(62, 138, 68),
(63, 139, 70),
(64, 143, 70),
(65, 132, 67),
(66, 134, 73),
(67, 134, 73),
(68, 134, 73),
(69, 138, 70),
(70, 138, 69),
(71, 138, 73),
(72, 138, 72),
(73, 138, 74),
(74, 138, 71),
(75, 143, 74),
(76, 143, 71),
(77, 143, 72),
(78, 143, 67),
(79, 143, 66),
(80, 143, 73),
(81, 143, 68),
(82, 143, 69),
(83, 139, 74),
(84, 139, 71),
(85, 139, 72),
(86, 139, 67),
(87, 139, 66),
(88, 139, 73),
(89, 139, 68),
(90, 132, 74),
(91, 132, 70),
(92, 132, 71),
(93, 145, 72),
(94, 146, 71);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
