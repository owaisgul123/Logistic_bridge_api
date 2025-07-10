-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2025 at 09:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logistic_bridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country`, `country_id`) VALUES
(1, 'Karachi', 'Pakistan', 130),
(2, 'Lahore', 'Pakistan', 130),
(3, 'Faisalabad', 'Pakistan', 130),
(4, 'Sialkot', 'Pakistan', 130),
(5, 'Islamabad', 'Pakistan', 130),
(6, 'Peshawar', 'Pakistan', 130),
(7, 'Quetta', 'Pakistan', 130),
(8, 'Kabul', 'Afghanistan', 1),
(9, 'Kandahar', 'Afghanistan', 1),
(10, 'Herat', 'Afghanistan', 1),
(11, 'Mazar-i-Sharif', 'Afghanistan', 1),
(12, 'Jalalabad', 'Afghanistan', 1),
(13, 'Ashgabat', 'Turkmenistan', 178),
(14, 'Turkmenabat', 'Turkmenistan', 178),
(15, 'Mary', 'Turkmenistan', 178),
(16, 'Almaty', 'Kazakhstan', 85),
(17, 'Nur-Sultan', 'Kazakhstan', 85),
(18, 'Shymkent', 'Kazakhstan', 85),
(19, 'Aktau', 'Kazakhstan', 85),
(20, 'Pavlodar', 'Kazakhstan', 85);

-- --------------------------------------------------------

--
-- Table structure for table `commodities`
--

CREATE TABLE `commodities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commodities`
--

INSERT INTO `commodities` (`id`, `name`) VALUES
(1, 'Wheat'),
(2, 'Rice'),
(3, 'Cotton'),
(4, 'Fertilizer'),
(5, 'Petroleum'),
(6, 'Textiles'),
(7, 'Cement'),
(8, 'Steel'),
(9, 'Sugar'),
(10, 'Vegetables'),
(11, 'Fruits'),
(12, 'Electronics'),
(13, 'Machinery'),
(14, 'Pharmaceuticals'),
(15, 'Plastic Products');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `country_code`) VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Albania', 'AL'),
(3, 'Algeria', 'DZ'),
(4, 'Andorra', 'AD'),
(5, 'Angola', 'AO'),
(6, 'Argentina', 'AR'),
(7, 'Armenia', 'AM'),
(8, 'Australia', 'AU'),
(9, 'Austria', 'AT'),
(10, 'Azerbaijan', 'AZ'),
(11, 'Bahamas', 'BS'),
(12, 'Bahrain', 'BH'),
(13, 'Bangladesh', 'BD'),
(14, 'Barbados', 'BB'),
(15, 'Belarus', 'BY'),
(16, 'Belgium', 'BE'),
(17, 'Belize', 'BZ'),
(18, 'Benin', 'BJ'),
(19, 'Bhutan', 'BT'),
(20, 'Bolivia', 'BO'),
(21, 'Bosnia and Herzegovina', 'BA'),
(22, 'Botswana', 'BW'),
(23, 'Brazil', 'BR'),
(24, 'Brunei', 'BN'),
(25, 'Bulgaria', 'BG'),
(26, 'Burkina Faso', 'BF'),
(27, 'Burundi', 'BI'),
(28, 'Cambodia', 'KH'),
(29, 'Cameroon', 'CM'),
(30, 'Canada', 'CA'),
(31, 'Cape Verde', 'CV'),
(32, 'Central African Republic', 'CF'),
(33, 'Chad', 'TD'),
(34, 'Chile', 'CL'),
(35, 'China', 'CN'),
(36, 'Colombia', 'CO'),
(37, 'Comoros', 'KM'),
(38, 'Congo (Brazzaville)', 'CG'),
(39, 'Congo (Kinshasa)', 'CD'),
(40, 'Costa Rica', 'CR'),
(41, 'Croatia', 'HR'),
(42, 'Cuba', 'CU'),
(43, 'Cyprus', 'CY'),
(44, 'Czech Republic', 'CZ'),
(45, 'Denmark', 'DK'),
(46, 'Djibouti', 'DJ'),
(47, 'Dominica', 'DM'),
(48, 'Dominican Republic', 'DO'),
(49, 'Ecuador', 'EC'),
(50, 'Egypt', 'EG'),
(51, 'El Salvador', 'SV'),
(52, 'Equatorial Guinea', 'GQ'),
(53, 'Eritrea', 'ER'),
(54, 'Estonia', 'EE'),
(55, 'Eswatini', 'SZ'),
(56, 'Ethiopia', 'ET'),
(57, 'Fiji', 'FJ'),
(58, 'Finland', 'FI'),
(59, 'France', 'FR'),
(60, 'Gabon', 'GA'),
(61, 'Gambia', 'GM'),
(62, 'Georgia', 'GE'),
(63, 'Germany', 'DE'),
(64, 'Ghana', 'GH'),
(65, 'Greece', 'GR'),
(66, 'Grenada', 'GD'),
(67, 'Guatemala', 'GT'),
(68, 'Guinea', 'GN'),
(69, 'Guinea-Bissau', 'GW'),
(70, 'Guyana', 'GY'),
(71, 'Haiti', 'HT'),
(72, 'Honduras', 'HN'),
(73, 'Hungary', 'HU'),
(74, 'Iceland', 'IS'),
(75, 'India', 'IN'),
(76, 'Indonesia', 'ID'),
(77, 'Iran', 'IR'),
(78, 'Iraq', 'IQ'),
(79, 'Ireland', 'IE'),
(80, 'Israel', 'IL'),
(81, 'Italy', 'IT'),
(82, 'Jamaica', 'JM'),
(83, 'Japan', 'JP'),
(84, 'Jordan', 'JO'),
(85, 'Kazakhstan', 'KZ'),
(86, 'Kenya', 'KE'),
(87, 'Kiribati', 'KI'),
(88, 'Korea, North', 'KP'),
(89, 'Korea, South', 'KR'),
(90, 'Kuwait', 'KW'),
(91, 'Kyrgyzstan', 'KG'),
(92, 'Laos', 'LA'),
(93, 'Latvia', 'LV'),
(94, 'Lebanon', 'LB'),
(95, 'Lesotho', 'LS'),
(96, 'Liberia', 'LR'),
(97, 'Libya', 'LY'),
(98, 'Liechtenstein', 'LI'),
(99, 'Lithuania', 'LT'),
(100, 'Luxembourg', 'LU'),
(101, 'Madagascar', 'MG'),
(102, 'Malawi', 'MW'),
(103, 'Malaysia', 'MY'),
(104, 'Maldives', 'MV'),
(105, 'Mali', 'ML'),
(106, 'Malta', 'MT'),
(107, 'Marshall Islands', 'MH'),
(108, 'Mauritania', 'MR'),
(109, 'Mauritius', 'MU'),
(110, 'Mexico', 'MX'),
(111, 'Micronesia', 'FM'),
(112, 'Moldova', 'MD'),
(113, 'Monaco', 'MC'),
(114, 'Mongolia', 'MN'),
(115, 'Montenegro', 'ME'),
(116, 'Morocco', 'MA'),
(117, 'Mozambique', 'MZ'),
(118, 'Myanmar (Burma)', 'MM'),
(119, 'Namibia', 'NA'),
(120, 'Nauru', 'NR'),
(121, 'Nepal', 'NP'),
(122, 'Netherlands', 'NL'),
(123, 'New Zealand', 'NZ'),
(124, 'Nicaragua', 'NI'),
(125, 'Niger', 'NE'),
(126, 'Nigeria', 'NG'),
(127, 'North Macedonia', 'MK'),
(128, 'Norway', 'NO'),
(129, 'Oman', 'OM'),
(130, 'Pakistan', 'PK'),
(131, 'Palau', 'PW'),
(132, 'Panama', 'PA'),
(133, 'Papua New Guinea', 'PG'),
(134, 'Paraguay', 'PY'),
(135, 'Peru', 'PE'),
(136, 'Philippines', 'PH'),
(137, 'Poland', 'PL'),
(138, 'Portugal', 'PT'),
(139, 'Qatar', 'QA'),
(140, 'Romania', 'RO'),
(141, 'Russia', 'RU'),
(142, 'Rwanda', 'RW'),
(143, 'Saint Kitts and Nevis', 'KN'),
(144, 'Saint Lucia', 'LC'),
(145, 'Saint Vincent and the Grenadines', 'VC'),
(146, 'Samoa', 'WS'),
(147, 'San Marino', 'SM'),
(148, 'Sao Tome and Principe', 'ST'),
(149, 'Saudi Arabia', 'SA'),
(150, 'Senegal', 'SN'),
(151, 'Serbia', 'RS'),
(152, 'Seychelles', 'SC'),
(153, 'Sierra Leone', 'SL'),
(154, 'Singapore', 'SG'),
(155, 'Slovakia', 'SK'),
(156, 'Slovenia', 'SI'),
(157, 'Solomon Islands', 'SB'),
(158, 'Somalia', 'SO'),
(159, 'South Africa', 'ZA'),
(160, 'South Sudan', 'SS'),
(161, 'Spain', 'ES'),
(162, 'Sri Lanka', 'LK'),
(163, 'Sudan', 'SD'),
(164, 'Suriname', 'SR'),
(165, 'Sweden', 'SE'),
(166, 'Switzerland', 'CH'),
(167, 'Syria', 'SY'),
(168, 'Taiwan', 'TW'),
(169, 'Tajikistan', 'TJ'),
(170, 'Tanzania', 'TZ'),
(171, 'Thailand', 'TH'),
(172, 'Timor-Leste', 'TL'),
(173, 'Togo', 'TG'),
(174, 'Tonga', 'TO'),
(175, 'Trinidad and Tobago', 'TT'),
(176, 'Tunisia', 'TN'),
(177, 'Turkey', 'TR'),
(178, 'Turkmenistan', 'TM'),
(179, 'Tuvalu', 'TV'),
(180, 'Uganda', 'UG'),
(181, 'Ukraine', 'UA'),
(182, 'United Arab Emirates', 'AE'),
(183, 'United Kingdom', 'GB'),
(184, 'United States', 'US'),
(185, 'Uruguay', 'UY'),
(186, 'Uzbekistan', 'UZ'),
(187, 'Vanuatu', 'VU'),
(188, 'Vatican City', 'VA'),
(189, 'Venezuela', 'VE'),
(190, 'Vietnam', 'VN'),
(191, 'Yemen', 'YE'),
(192, 'Zambia', 'ZM'),
(193, 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `employee_number` varchar(50) DEFAULT NULL,
  `blood_group` varchar(20) NOT NULL,
  `passport_number` varchar(50) DEFAULT NULL,
  `passport_scan` varchar(255) DEFAULT NULL,
  `national_id_number` varchar(50) DEFAULT NULL,
  `national_id_scan` varchar(255) DEFAULT NULL,
  `group_ins_card` varchar(45) NOT NULL,
  `sec_clearence_cert` varchar(45) NOT NULL,
  `driver_license` varchar(255) NOT NULL,
  `cell_1` varchar(20) DEFAULT NULL,
  `cell_2` varchar(20) DEFAULT NULL,
  `cell_3` varchar(20) DEFAULT NULL,
  `cell_4` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `employee_number`, `blood_group`, `passport_number`, `passport_scan`, `national_id_number`, `national_id_scan`, `group_ins_card`, `sec_clearence_cert`, `driver_license`, `cell_1`, `cell_2`, `cell_3`, `cell_4`, `email`, `parent_id`, `created_at`, `updated_at`) VALUES
(6, 'ahmed', 'ERP-009988', '', '7364736726427-1`', NULL, NULL, NULL, '', '', '', '78654654', '76565446', '54654654', '', 'wa2341733@gmail.com', 5, '2025-05-04 13:24:57', '2025-05-04 13:24:57'),
(7, 'Javed Iqbal', 'ERP-009988', '', '7364736726427-1`', NULL, '43401-434873483-1', NULL, '', '', '', '78654654', '76565446', '54654654', '', 'wa2341733@gmail.com', 5, '2025-05-04 13:26:32', '2025-05-04 13:26:32'),
(9, 'Fawad Irfan', 'EMP-45632', '', '7364736726427-1`', NULL, '43401-434873483-1', NULL, '', '', '', '03001234567  ', '03011234567  ', '03021234567  ', '3031234567', 'fawad@gmail.com', 1, '2025-05-21 11:16:15', '2025-05-21 11:16:37'),
(10, 'Shehzad Ahmed rAFIQ', 'EMP-456745', '', '7364736726427-1', NULL, '43401-434873483-1', NULL, '', '', '', '03001234567  ', '03011234567', '03021234567  ', '3031234567', 'ShehzadAhee@gmail.com', 1, '2025-05-21 12:48:46', '2025-05-21 12:49:16'),
(11, 'Owais Khan', 'ERP-009988', '', '7364736726427-1`', '96650-mercedes230S.jpg', '43401-434873483-1', '46957-mercedes230S.jpg', '', '', '', '03001234567  ', '03011234567  ', '03021234567  ', '03031234567  ', 'owaiskk36@gmail.com', 1, '2025-05-23 19:33:34', '2025-05-23 19:33:34'),
(12, 'Iqbal Jew', 'ERP-0209988', '', '72364736726427-1`', '73700-mercedes230S.jpg', '43401-434873483-1', '80147-mercedes230S.jpg', '', '', '', '03001234567  ', '03011234567  ', '03021234567  ', '03031234567  ', 'iqbalJew@gmail.com', 1, '2025-05-23 19:41:48', '2025-05-23 19:41:48'),
(13, 'Test ', 'Test ERp-009', 'A+', '7364736726427-1`', '14106-pdf-icon.png', '43401-434873483-1', '37482-mercedes230S.jpg', '37414-pdf-icon.png', '69531-mercedes230S.jpg', '', '03001234567  ', '03011234567  ', '03021234567  ', '03031234567  ', 'tets@gmail.com', 1, '2025-05-25 18:50:31', '2025-05-25 18:50:31'),
(14, 'Miiya bhai ', 'ERP-884353', 'B+', '43985379579374', '38886-pdf-icon.png', '12345-6789012-3  ', '89170-mercedes230S.jpg', '9524-mercedes230S.jpg', '2856-pdf-icon.png', '', '03001234567  ', '03011234567  ', '03021234567  ', '03031234567  ', 'admin@gmail.com', 1, '2025-05-27 19:55:55', '2025-05-27 19:55:55'),
(15, 'Muhammad Sohail', 'ERP-009988', 'A+', '7364736726427-1`', '96712-pdf-icon.png', '43401-434873483-1', '59352-pdf-icon.png', '34244-mercedes230S.jpg', '61164-pdf-icon.png', '', '03001234567  ', '03011234567  ', '03021234567  ', '03031234567  ', 'muhammadsohail@gmail.com', 1, '2025-05-30 12:12:49', '2025-05-30 12:12:49'),
(16, 'Jan muhammad', 'ERP-00321', 'A+', '7364736726427-1`', '29916-12.jpg', '43401-434873483-1', '77553-123.jpg', '', '36758-123.jpg', '15617-0edvmz9v.png', '03001234567  ', '03011234567  ', '03021234567  ', '03031234567  ', 'janmuhmmad@gmail.com', 1, '2025-05-31 21:57:45', '2025-06-04 19:06:20'),
(17, 'Umar Khan G', 'ERP-77888', 'B+', 'PK-0099233894-23-1', '7153-25 Best Short Haircuts for Men to Try in 2025.jpg', '43401-434873483-1', '57672-123.jpg', '59074-12.jpg', '91440-123.jpg', '55059-0edvmz9v.png', '78654654', '76565446', '54654654', '03031234567  ', 'umarKhan@gmail.com', 1, '2025-06-04 17:19:08', '2025-06-04 19:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `driver_visas`
--

CREATE TABLE `driver_visas` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `visa_number` varchar(50) DEFAULT NULL,
  `expiry_date` varchar(100) DEFAULT NULL,
  `visa_scan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_visas`
--

INSERT INTO `driver_visas` (`id`, `driver_id`, `country`, `visa_number`, `expiry_date`, `visa_scan`, `created_at`, `updated_at`) VALUES
(1, 1, 'AFRICEA', 'VZ-789123  ', '2025-05-01', NULL, '2025-04-23 15:12:25', '2025-05-04 17:10:53'),
(2, 2, 'UAE  ', 'VZ-789123  ', '2026-12-31  ', NULL, '2025-04-23 15:19:06', '2025-04-23 15:19:06'),
(3, 3, 'Afghanistan', 'EGR-96664', '2025-05-27', '3755-pdf-icon.png', '2025-04-23 18:08:43', '2025-04-23 18:08:43'),
(4, 4, 'UAE  ', 'VZ-789123  ', '2025-05-01', NULL, '2025-04-26 13:00:00', '2025-05-10 21:24:27'),
(5, 5, 'Afghanistan', 'EGR-96664', '2025-05-04', NULL, '2025-05-04 12:59:26', '2025-05-04 12:59:26'),
(6, 6, 'Afghanistan', 'EGR-96664', '2025-05-04', NULL, '2025-05-04 13:24:57', '2025-05-04 13:24:57'),
(7, 7, 'Afghanistan', 'EGR-96664', '2025-05-06', NULL, '2025-05-04 13:26:32', '2025-05-04 13:26:32'),
(8, 8, 'Russia', '84783', '2025-05-06', NULL, '2025-05-04 17:27:35', '2025-05-04 17:27:35'),
(9, 9, 'Russia', 'VZ-789123  ', '2025-08-21', NULL, '2025-05-21 11:16:15', '2025-05-21 11:16:15'),
(13, NULL, 'ABC', 'ABC-001', '2025-05-01', '57151-Scenario 1.pdf', '2025-05-25 17:40:27', '2025-05-25 17:40:27'),
(14, NULL, 'CDE', 'ABC-002', '2025-05-15', '2977-Scenario 1A.pdf', '2025-05-25 17:40:27', '2025-05-25 17:40:27'),
(15, 11, 'ABC', 'ABC-001', '2025-05-01', '56828-Scenario 1.pdf', '2025-05-25 17:51:41', '2025-05-25 17:51:41'),
(16, 11, 'ABC', 'ABC-001', '2025-05-01', NULL, '2025-05-25 17:52:39', '2025-05-25 17:52:39'),
(17, 11, 'CDE', 'ABC-002', '2025-05-20', '23015-Scenario 1A.pdf', '2025-05-25 17:52:39', '2025-05-25 17:52:39'),
(19, 10, 'ABC`', 'ABC-001', '2025-05-06', '34107-Scenario 1.pdf', '2025-05-25 18:00:45', '2025-05-25 18:00:45'),
(20, 10, 'CDE', 'CDE-001', '2025-05-30', '31882-Scenario 1A.pdf', '2025-05-25 18:00:45', '2025-05-25 18:00:45'),
(34, 14, 'United States', 'ABC-001', '2025-11-15', '75764-mercedes230S.jpg', '2025-05-30 11:53:52', '2025-05-30 11:53:52'),
(43, 13, 'United States', 'ABC-001', '2025-08-15', NULL, '2025-06-03 17:46:41', '2025-06-03 17:46:41'),
(44, 13, 'ABC`', 'US-009', '2025-05-15', NULL, '2025-06-03 17:46:41', '2025-06-03 17:46:41'),
(45, 13, 'UK', 'UK-009', '2025-05-01', NULL, '2025-06-03 17:46:41', '2025-06-03 17:46:41'),
(46, 13, 'Tajikistan', 'TK-900', '2025-11-30', NULL, '2025-06-03 17:46:41', '2025-06-03 17:46:41'),
(47, 16, 'ABC', 'ABC-001', '2025-06-16', '97351-123.jpg', '2025-06-03 18:09:10', '2025-06-03 18:09:10'),
(50, 15, 'United Kingdom', 'UK-9900', '2025-05-01', '25070-12.jpg', '2025-06-04 16:50:56', '2025-06-04 16:50:56'),
(54, 17, 'United States', 'UK-9900', '2025-06-25', '2528-123.jpg', '2025-06-05 15:58:19', '2025-06-05 15:58:19'),
(55, 17, 'United Kingdom', 'UK-9900', '2025-12-16', '64245-12.jpg', '2025-06-05 15:58:19', '2025-06-05 15:58:19'),
(56, 17, 'ABC`', 'ABC-001', '2025-05-05', '46556-25 Best Short Haircuts for Men to Try in 2025.jpg', '2025-06-05 15:58:19', '2025-06-05 15:58:19'),
(57, 12, 'United States', 'UK-9900', '2025-06-01', '80486-ChatGPT Image Jun 15, 2025, 08_34_34 PM.png', '2025-06-16 19:52:57', '2025-06-16 19:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_rates`
--

CREATE TABLE `exchange_rates` (
  `currency_code` varchar(10) NOT NULL,
  `rate_to_usd` varchar(10) DEFAULT NULL,
  `usd_to_pkr` varchar(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_rates`
--

INSERT INTO `exchange_rates` (`currency_code`, `rate_to_usd`, `usd_to_pkr`, `updated_at`) VALUES
('AFN', '85.0000', '278.50', '2025-06-18 16:11:40'),
('CNY', '7.2500', '278.50', '2025-06-18 16:11:40'),
('IRR', '42000.0000', '278.50', '2025-06-18 16:11:40'),
('PKR', '1.0000', '278.50', '2025-06-18 16:11:40'),
('RUB', '89.0000', '278.50', '2025-06-18 16:11:40'),
('UZS', '12500.0000', '278.50', '2025-06-18 16:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `job_card_id` int(11) NOT NULL,
  `direction` varchar(50) DEFAULT NULL,
  `country` int(11) DEFAULT 0,
  `location` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `exchange_rate` varchar(10) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `local_expenses` varchar(10) DEFAULT NULL,
  `expense_type` varchar(100) DEFAULT NULL,
  `converted_usd` varchar(10) DEFAULT NULL,
  `converted_pkr` varchar(10) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `job_card_id`, `direction`, `country`, `location`, `description`, `exchange_rate`, `currency`, `local_expenses`, `expense_type`, `converted_usd`, `converted_pkr`, `created_by`, `created_at`) VALUES
(1, 1, 'Outbound', 1, 9, 'ABC', '85.0000', 'AFN', '1450', 'Misc', '17.0588235', '4750.88235', 1, '2025-07-02 07:12:30'),
(2, 1, 'Outbound', 1, 8, 'Toll on pull e khishti', '85.0000', 'AFN', '1342', 'Toll', '15.7882352', '4397.02352', 1, '2025-07-02 07:13:20'),
(3, 1, 'Outbound', 1, 10, 'gATE PASS at herat', '85.0000', 'AFN', '1230', 'Toll', '14.4705882', '4030.05882', 1, '2025-07-05 05:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `job_cards`
--

CREATE TABLE `job_cards` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `job_order_id` int(11) NOT NULL,
  `job_card_number` varchar(20) NOT NULL,
  `truck_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `route` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`route`)),
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tir` varchar(50) DEFAULT NULL,
  `cmr` varchar(50) DEFAULT NULL,
  `gd` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_cards`
--

INSERT INTO `job_cards` (`id`, `purchase_order_id`, `job_order_id`, `job_card_number`, `truck_id`, `driver_id`, `route`, `created_by`, `created_at`, `updated_at`, `tir`, `cmr`, `gd`) VALUES
(1, 1, 1, '001/PO-1', 19, 13, NULL, 1, '2025-05-27 17:40:30', '2025-05-27 17:40:30', NULL, NULL, NULL),
(2, 1, 1, '002/PO-1', 21, 12, NULL, 1, '2025-05-27 17:40:30', '2025-05-27 17:40:30', NULL, NULL, NULL),
(3, 1, 1, '003/PO-1', 23, 6, NULL, 1, '2025-05-27 17:45:11', '2025-05-27 17:45:11', NULL, NULL, NULL),
(4, 1, 1, '004/PO-1', 22, 7, NULL, 1, '2025-05-27 18:41:09', '2025-05-27 19:46:06', '3821-electives.txt', '61451-Thoughts.txt', '3822-timmings.txt'),
(5, 1, 1, '005/PO-1', 22, 11, NULL, 1, '2025-05-27 18:45:18', '2025-05-27 19:19:00', '72217-04GreedyAlgorithms-2x2.pdf', '19159-DSACCP.pdf', '69136-inventoryD.docx'),
(6, 3, 3, '001/PO-3', 19, 14, NULL, 1, '2025-05-28 14:54:05', '2025-05-28 14:54:29', '40262-Updated fee voucher.pdf', '30192-Updated fee voucher.pdf', '47522-Updated fee voucher.pdf'),
(7, 3, 3, '002/PO-3', 21, 13, NULL, 1, '2025-05-28 14:54:05', '2025-05-28 14:54:05', NULL, NULL, NULL),
(8, 3, 3, '003/PO-3', 23, 6, NULL, 1, '2025-05-28 14:54:55', '2025-05-28 14:55:20', '69805-mercedes230S.jpg', '93701-mercedes230S.jpg', '21387-mercedes230S.jpg'),
(9, 4, 4, '001/PO-4', 19, 15, NULL, 1, '2025-05-30 14:58:55', '2025-05-30 14:58:55', NULL, NULL, NULL),
(10, 4, 4, '002/PO-4', 21, 14, NULL, 1, '2025-05-30 14:58:55', '2025-05-30 14:58:55', NULL, NULL, NULL),
(11, 4, 4, '003/PO-4', 22, 13, NULL, 1, '2025-05-30 14:59:55', '2025-05-30 14:59:55', NULL, NULL, NULL),
(12, 2, 2, '001/PO-2', 19, 15, NULL, 1, '2025-05-31 20:58:21', '2025-05-31 20:58:55', '18670-Assignment#3 (1).pdf', '53163-CMR.pdf', '96280-2025   13394  GD ..pdf'),
(13, 5, 5, '001/PO-5', 19, 16, NULL, 1, '2025-05-31 22:30:21', '2025-05-31 22:51:27', '45803-REVISED EPD TLH 370.pdf', '81394-TLH370 PAK EXPORT DOCS SCAN.pdf', '54809-CMR.pdf'),
(14, 5, 5, '002/PO-5', 19, 15, NULL, 1, '2025-05-31 22:30:21', '2025-05-31 22:30:21', NULL, NULL, NULL),
(15, 5, 5, '003/PO-5', 22, 14, NULL, 1, '2025-05-31 22:30:21', '2025-05-31 22:30:21', NULL, NULL, NULL),
(16, 5, 5, '004/PO-5', 19, 7, NULL, 1, '2025-06-11 17:36:34', '2025-06-11 17:36:34', NULL, NULL, NULL),
(17, 1, 1, '006/PO-1', 22, 16, NULL, 1, '2025-07-05 10:33:20', '2025-07-05 10:33:20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_card_documents`
--

CREATE TABLE `job_card_documents` (
  `id` int(11) NOT NULL,
  `job_card_id` int(11) NOT NULL,
  `doc_type` varchar(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_card_documents`
--

INSERT INTO `job_card_documents` (`id`, `job_card_id`, `doc_type`, `file_name`, `remarks`, `uploaded_by`, `created_at`) VALUES
(1, 1, 'tir', '10938-Job Cards         Admin.pdf', NULL, 1, '2025-06-10 19:17:46'),
(2, 1, 'cmr', '69363-CMR.pdf', NULL, 1, '2025-06-10 19:17:46'),
(3, 1, 'gd', '88074-Document1 (1) (1).pdf', NULL, 1, '2025-06-10 19:17:46'),
(4, 14, 'tir', '23593-Job Cards         Admin.pdf', NULL, 1, '2025-06-10 19:26:24'),
(5, 14, 'tir', '67623-Assignment#3 (1).pdf', NULL, 1, '2025-06-10 19:26:24'),
(10, 15, 'tir', '73389-Document1 (1) (1).pdf', 'initial TIR before crossing ', 1, '2025-06-11 12:02:33'),
(11, 15, 'tir', '96993-Assignment#3.pdf', 'TIR  at border crossing ', 1, '2025-06-11 12:02:33'),
(12, 15, 'cmr', '87359-CMR.pdf', 'CMR pakistani variant', 1, '2025-06-11 12:02:33'),
(13, 0, 'tir', '5462-NCassignment02owais_gul_65180.pdf', 'TIR at chaman border', 1, '2025-06-16 20:23:54'),
(14, 0, 'cmr', '95877-CMR.pdf', 'Initial cmr', 1, '2025-06-16 20:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `job_card_logs`
--

CREATE TABLE `job_card_logs` (
  `id` int(11) NOT NULL,
  `job_card_id` int(11) NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `timestamp` datetime DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_card_logs`
--

INSERT INTO `job_card_logs` (`id`, `job_card_id`, `event_type`, `location_name`, `status`, `timestamp`, `remarks`) VALUES
(1, 101, ' milestone_reached  ', ' Chaman Border  ', 0, '2025-05-11 17:15:48', ' Cleared customs at border'),
(2, 6, 'departure', 'Karachi', NULL, '2025-05-28 16:09:52', 'vehicle departed from KHI'),
(3, 6, 'arrival', 'quetta', NULL, '2025-05-28 16:11:04', 'vehicle arived at queeta with minor engine faults'),
(4, 5, 'departure', 'Quetta', NULL, '2025-05-28 17:10:58', 'vehicle departed from queeta'),
(5, 5, 'arrival', 'Chaman', NULL, '2025-05-28 17:11:45', 'vehicle arrived at chaman border'),
(6, 5, 'departure', 'Chaman', NULL, '2025-05-28 17:12:38', 'Border crossing '),
(7, 5, 'arrival', 'Kabul', NULL, '2025-05-28 17:13:18', 'Arrival at kabul '),
(8, 8, 'departure', 'Karachi', NULL, '2025-05-30 12:06:33', 'Vehicle departed from karacchi with 5K cash');

-- --------------------------------------------------------

--
-- Table structure for table `job_orders`
--

CREATE TABLE `job_orders` (
  `id` int(11) NOT NULL,
  `purchase_order_id` varchar(10) NOT NULL,
  `job_order_number` varchar(20) NOT NULL,
  `transporter_id` int(11) NOT NULL,
  `route` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_orders`
--

INSERT INTO `job_orders` (`id`, `purchase_order_id`, `job_order_number`, `transporter_id`, `route`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'JO-001/PO-001', 18, '[{\"type\":\"milestone\",\"name\":\"Quetta\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T01:53:43.491Z\"},{\"type\":\"border_crossing\",\"name\":\"Chaman\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T01:53:43.491Z\"},{\"type\":\"milestone\",\"name\":\"Kabul\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T01:53:43.491Z\"},{\"type\":\"milestone\",\"name\":\"Mazar\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T01:53:43.491Z\"},{\"type\":\"delivery_point\",\"name\":\"Uzbekistan\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T01:53:43.491Z\"}]', 0, 1, '2025-05-21 06:35:14', '2025-05-21 06:53:43'),
(2, '2', 'JO-002/PO-002', 0, NULL, 0, 1, '2025-05-21 11:23:34', '2025-05-21 11:23:34'),
(3, '3', 'JO-003/PO-003', 5, '[{\"type\":\"milestone\",\"name\":\"Karachi\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T07:23:10.250Z\"},{\"type\":\"milestone\",\"name\":\"quetta\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T07:23:10.250Z\"},{\"type\":\"delivery_point\",\"name\":\"Kabul\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T07:23:10.250Z\"},{\"type\":\"milestone\",\"name\":\"Mazar\",\"status\":\"pending\",\"timestamp\":\"2025-05-21T07:23:10.250Z\"}]', 0, 1, '2025-05-21 12:19:27', '2025-05-21 12:23:10'),
(4, '4', 'JO-004/PO-004', 21, '[{\"type\":\"milestone\",\"name\":\"Quetta\",\"status\":\"pending\",\"timestamp\":\"2025-05-30T09:56:04.760Z\"},{\"type\":\"border_crossing\",\"name\":\"Chaman\",\"status\":\"pending\",\"timestamp\":\"2025-05-30T09:56:04.760Z\"},{\"type\":\"milestone\",\"name\":\"Qandahar\",\"status\":\"pending\",\"timestamp\":\"2025-05-30T09:56:04.760Z\"}]', 0, 1, '2025-05-30 14:54:32', '2025-05-30 14:56:04'),
(5, '5', 'JO-005/PO-005', 5, '[{\"type\":\"milestone\",\"name\":\"Quetta\",\"status\":\"pending\",\"timestamp\":\"2025-05-31T17:26:37.286Z\"},{\"type\":\"delivery_point\",\"name\":\"Faislabad\",\"status\":\"pending\",\"timestamp\":\"2025-05-31T17:26:37.286Z\"},{\"type\":\"delivery_point\",\"name\":\"Quetta\",\"status\":\"pending\",\"timestamp\":\"2025-05-31T17:26:37.286Z\"}]', 0, 1, '2025-05-31 22:14:13', '2025-05-31 22:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `po_number` varchar(10) NOT NULL,
  `contracting_party_id` int(11) NOT NULL,
  `contracting_party_role_id` int(11) NOT NULL,
  `shipper_id` int(11) NOT NULL,
  `freight_forwarder_id` int(11) DEFAULT NULL,
  `broker_id` int(11) DEFAULT NULL,
  `pickup_location_id` int(11) NOT NULL,
  `delivery_location_id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `truck_count` int(11) NOT NULL,
  `contract_type` varchar(45) NOT NULL,
  `contract_file` varchar(255) DEFAULT NULL,
  `route_description` text DEFAULT NULL,
  `estimated_transit_days` int(11) DEFAULT 0,
  `is_signed` int(11) DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `po_number`, `contracting_party_id`, `contracting_party_role_id`, `shipper_id`, `freight_forwarder_id`, `broker_id`, `pickup_location_id`, `delivery_location_id`, `commodity_id`, `total_quantity`, `truck_count`, `contract_type`, `contract_file`, `route_description`, `estimated_transit_days`, `is_signed`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'PO-002', 21, 5, 22, 7, 6, 141, 130, 3, 20, 10, '0', '21410-Scenario 1.pdf', NULL, 25, 0, 1, '2025-05-21 11:23:34', '2025-05-21 11:32:40'),
(3, 'PO-003', 21, 5, 22, 20, 6, 90, 130, 8, 20, 10, '0', '44133-Scenario 1.pdf', NULL, 30, 1, 1, '2025-05-21 12:19:27', '2025-05-21 12:20:26'),
(4, 'PO-004', 7, 5, 22, 7, 6, 141, 130, 1, 20, 10, '0', '87999-Document1 (1) (1).pdf', NULL, 30, 1, 1, '2025-05-30 14:54:32', '2025-05-30 14:54:58'),
(5, 'PO-005', 1, 5, 22, 7, 6, 1, 79, 3, 500, 100, '0', '63590-Document1 (1) (1).pdf', NULL, 45, 1, 1, '2025-05-31 22:14:13', '2025-05-31 22:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_logs`
--

CREATE TABLE `purchase_order_logs` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `changed_by` int(11) NOT NULL,
  `change_time` datetime DEFAULT current_timestamp(),
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order_logs`
--

INSERT INTO `purchase_order_logs` (`id`, `purchase_order_id`, `action`, `changed_by`, `change_time`, `remarks`) VALUES
(1, 1, 'approved', 7, '2025-05-19 19:19:10', 'Approved Conditionally logistics terms to be decide'),
(2, 1, 'disapproved', 7, '2025-05-19 19:20:21', 'JUST fun'),
(3, 1, 'approved', 7, '2025-05-19 19:20:51', 'Approved Conditionally'),
(4, 1, 'disapproved', 7, '2025-05-19 19:21:57', 'Conditions not meant'),
(5, 1, 'approved', 1, '2025-05-21 06:44:18', 'Approved Conditionally'),
(6, 1, 'disapproved', 1, '2025-05-21 06:47:29', 'Test Un approved'),
(7, 1, 'approved', 1, '2025-05-21 06:48:01', 'Approved Conditionally TEST'),
(8, 2, 'approved', 1, '2025-05-21 11:28:43', 'Approved Conditionally'),
(9, 2, 'disapproved', 1, '2025-05-21 11:32:40', 'Test Un approved'),
(10, 3, 'approved', 1, '2025-05-21 12:20:26', 'Approved Conditionally'),
(11, 4, 'approved', 1, '2025-05-30 14:54:58', 'Approved Conditionally BY admin (test)'),
(12, 5, 'approved', 1, '2025-05-31 22:20:55', 'Approved Conditionally');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2025-04-01 13:26:38', '2025-04-01 13:26:38'),
(2, 'Trucking Company', '2025-04-01 13:26:38', '2025-04-01 13:26:38'),
(3, 'Clearing Agent', '2025-04-01 13:26:38', '2025-04-01 13:26:38'),
(4, 'Operational Manager', '2025-04-01 13:26:38', '2025-04-01 13:26:38'),
(5, 'Importer', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(6, 'Exporter', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(7, 'Freight Forwarder', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(8, 'Master User', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(9, 'Order Booker', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(10, 'Accounts', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(11, 'Manager', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(12, 'Transport Cordinater', '2025-04-02 05:48:10', '2025-04-02 05:48:10'),
(13, 'Shipper', '2025-05-15 13:56:30', '2025-05-15 13:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `description`, `role_id`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '12345678', 1, NULL, '2025-04-01 05:09:15', '2025-05-21 06:14:01'),
(5, 'Bilal Associates', 'bilalassociates@gmail.com', '21079c913bbec95598e5916e3c332092', '12345678785', 2, NULL, '2025-04-01 10:06:29', '2025-04-01 10:06:29'),
(6, 'Ahmed Enterprise', 'wa2341733@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', 9, 5, '2025-04-01 10:23:43', '2025-05-15 14:09:29'),
(7, 'Fright Solutions', 'frightsol@example.com', '947e38602b72975fadc4f617ddb257a1', '12345678', 7, NULL, '2025-04-01 08:26:02', '2025-05-19 13:56:12'),
(9, ' Hamza', ' hamza@gmail.com', '947e38602b72975fadc4f617ddb257a1', ' 12345678', 12, 5, '2025-04-23 07:06:32', '2025-04-23 07:06:32'),
(13, 'Shehzad Ahmed', 'Yahya_Shahzad_7165@gmail.com', 'df96220fa161767c5cbb95567855c86b', '123456789123', 3, 4, '2025-04-23 07:48:35', '2025-04-23 07:48:35'),
(15, 'Itefaq', 'Itefaq@gmail.com', 'f309a8566c458ac0ce764d6e3b6204f7', '789456123789', 8, 5, '2025-04-23 08:56:31', '2025-04-23 08:57:27'),
(17, 'Pervaiz', 'pervaiz@gmail.com', 'df96220fa161767c5cbb95567855c86b', '123456789123', 8, 4, '2025-04-23 17:02:22', '2025-04-23 17:02:22'),
(18, 'TST Transportation', 'tstadmin123@gmail.com', '87ce3432597aca7aa26d64d6e6f293ba', '12345678789', 2, 1, '2025-04-26 05:46:28', '2025-04-26 05:47:49'),
(19, 'Ifrahim', 'iffi@gmail.com', 'f309a8566c458ac0ce764d6e3b6204f7', '789456123789', 11, 5, '2025-04-26 05:53:42', '2025-04-26 05:53:42'),
(20, 'Freight forawarder Pakistan', 'frightsolpak@gmail.com', 'df96220fa161767c5cbb95567855c86b', '123456789123', 7, NULL, '2025-04-26 06:24:08', '2025-05-21 06:17:34'),
(21, ' Best Transport', ' besttrans@example.com', '947e38602b72975fadc4f617ddb257a1', ' 12345678', 2, NULL, '2025-05-04 09:33:42', '2025-05-21 06:17:40'),
(22, ' ShippiTransport', ' shippi@example.com', '947e38602b72975fadc4f617ddb257a1', ' 12345678', 13, NULL, '2025-05-04 09:34:19', '2025-05-21 06:17:47'),
(23, 'XYZ Broker', 'xyzbroker@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 3, 1, '2025-05-21 07:32:45', '2025-05-21 07:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `address_ho` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `address_3` varchar(255) DEFAULT NULL,
  `ntn_no` varchar(100) DEFAULT NULL,
  `reg_no` varchar(100) DEFAULT NULL,
  `license_no` varchar(100) DEFAULT NULL,
  `validity` varchar(100) DEFAULT NULL,
  `nature_of_business` varchar(255) DEFAULT NULL,
  `sub_role` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone_2` varchar(20) DEFAULT NULL,
  `whatsapp_num` varchar(20) DEFAULT NULL,
  `telegram` varchar(20) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `user_id`, `name`, `country_id`, `address_ho`, `address_1`, `address_2`, `address_3`, `ntn_no`, `reg_no`, `license_no`, `validity`, `nature_of_business`, `sub_role`, `email`, `phone`, `phone_2`, `whatsapp_num`, `telegram`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-01 07:35:31', '2025-05-21 01:38:42'),
(4, 4, 'Fright Solutions', 0, ' Head Office Address', 'Kemari, karachi sindh', 'Kemari, karachi sindh', 'Kemari, karachi sindh', ' 123456-7', ' REG-98765', ' LIC-789456', '2028-01-01', 'Forwarding', ' ', 'frightsol@example.com', ' 03001234567', ' 03101234567', ' 03001234567', 'telegram', ' Karachi, Pakistan', '2025-04-01 08:26:02', '2025-04-23 07:32:03'),
(5, 5, 'Bilal Associates', 0, 'Karachi, sindh', 'karachi, sindh', 'karachi, sindh', 'karachi, sindh', '78541236-REG', 'REG-785412', 'ABC-0099989', '2025-04-09', 'Freight Forwarding', '', 'bilalassociates@gmail.com', '03323490754', '78541263', '741258666', '741258666', 'kemari, karachi sindh', '2025-04-01 10:06:29', '2025-04-01 10:06:29'),
(6, 6, 'ahmed', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wa2341733@gmail.com', NULL, NULL, NULL, NULL, NULL, '2025-04-01 10:23:43', '2025-05-04 11:44:07'),
(9, 9, ' Hamza', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' hamza@gmail.com', ' 03001234567', ' 03101234567', ' 03001234567', ' hamza_telegram', ' Peshawar, Pakistan', '2025-04-23 07:06:32', '2025-04-23 07:06:32'),
(13, 13, 'Shehzad Ahmed', 0, '', '', '', '', '', '', '', '', '', '', 'Yahya_Shahzad_7165@gmail.com', '03001234567', '78541263', ' 03001234567', '78541263', ' Karachi, Pakistan', '2025-04-23 07:48:35', '2025-04-23 07:48:35'),
(15, 15, 'Itefaq', 0, '', '', '', '', '', '', '', '', '', '', 'Itefaq@gmail.com', '0312451878', ' 03101234567', ' 03001234567', '78541263', 'Chaman, balochistan', '2025-04-23 08:56:31', '2025-04-23 08:57:27'),
(17, 17, 'Pervaiz', 0, '', '', '', '', '', '', '', '', '', '', 'pervaiz@gmail.com', '0312451878', '78541263', ' 03001234567', ' owais_telegram', 'Kemari sindh', '2025-04-23 17:02:22', '2025-04-23 17:02:22'),
(18, 18, 'TST Transportation', 0, 'Street 123, City', 'ABC, karachi, sindh', 'ABC, karachi, sindh', 'ABC, karachi, sindh', '785412AC36-REG', ' REG-98765', 'ABC-00AA99989', '2025-04-18', 'Trucking and Transportation', '', 'tstadmin123@gmail.com', '03001234567', ' 03101234567', ' 03001234567', '78541263', '', '2025-04-26 05:46:28', '2025-04-26 05:47:49'),
(19, 19, 'Ifrahim', 0, 'Street 123, City', 'Kemari, karachi sindh', 'SHAREFAISAL111', 'SHAREFAISAL111', '', '', '', '', '', '', 'iffi@gmail.com', '03001234567', '78541263', ' 03001234567', ' owais_telegram', 'Kemari sindh', '2025-04-26 05:53:42', '2025-04-26 05:53:42'),
(20, 20, 'Freight forawarder Pakistan', 0, 'Street 123, City', 'ABC, karachi, sindh', 'ABC, karachi, sindh', 'ABC, karachi, sindh', '785412AC36-REG', 'REG-7CC85412', 'ABC-00AA99989', '2025-04-23', 'Freight Forwarding', '', 'frightsolpak@gmail.com', '0312451878', ' 03101234567', ' 03001234567', '78541263', 'Karachi', '2025-04-26 06:24:08', '2025-04-26 06:25:45'),
(21, 22, ' Best Transport', 1, ' Head Office Address', ' Branch 1 Address', ' Branch 2 Address', ' Branch 3 Address', ' 123456-7', ' REG-98765', ' LIC-789456', ' 2026-12-31', ' Trucking', ' ', ' besttrans@example.com', ' 03001234567', ' 03101234567', ' 03001234567', ' owais_telegram', ' Karachi, Pakistan', '2025-05-04 09:34:19', '2025-05-04 09:34:19'),
(22, 23, 'XYZ Broker', 130, 'Karachi, sindh', 'ABC, karachi, sindh', 'SHAREFAISAL111', 'Kemari, karachi sindh', '785412AC36-REG', 'REG-7CC85412', 'ABC-00AA99989', '2025-05-20', 'Custom Agent/Declerant', '', 'xyzbroker@gmail.com', '0312451878', ' 03101234567', ' 03001234567', '78541263', '', '2025-05-21 07:32:45', '2025-05-21 07:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `prime_mover_reg_no` varchar(50) DEFAULT NULL,
  `trailer_reg_no` varchar(50) DEFAULT NULL,
  `country_of_registration` varchar(50) DEFAULT NULL,
  `registration_document` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `chasis_no` varchar(20) DEFAULT NULL,
  `load_compartment_type` int(11) DEFAULT NULL,
  `cooling_capacity` varchar(50) DEFAULT NULL,
  `carrying_capacity` decimal(10,2) DEFAULT NULL,
  `volume` decimal(10,2) DEFAULT NULL,
  `no_of_axles` int(11) DEFAULT NULL,
  `owned_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `prime_mover_reg_no`, `trailer_reg_no`, `country_of_registration`, `registration_document`, `picture`, `make`, `model`, `chasis_no`, `load_compartment_type`, `cooling_capacity`, `carrying_capacity`, `volume`, `no_of_axles`, `owned_by`, `created_by`, `created_at`, `updated_at`) VALUES
(1, ' PMR-123456  ', ' TR-4432123', ' Pakistan  ', ' reg_doc.pdf  ', ' vehicle_image.jpg  ', ' Toyota  ', ' Hilux  ', NULL, 0, ' Frozen -18 C  ', 20.00, 50.00, 4, 4, 1, '2025-04-03 10:37:55', '2025-05-10 16:25:21'),
(2, ' PMR-123456 ', ' TR-4432', ' Pakistan ', ' reg_doc.pdf ', ' vehicle_image.jpg ', ' Toyota ', 'Hino', NULL, 1, ' Frozen -18 C ', 20.00, 50.00, 5, 4, NULL, '2025-04-03 12:12:17', '2025-05-04 12:29:57'),
(3, ' PMR-123456 ', ' TR-4432', ' Pakistan ', ' reg_doc.pdf ', ' vehicle_image.jpg ', ' Toyota ', 'Nissan', NULL, 1, ' Frozen -20 C ', 200.00, 500.00, 15, 2, 1, '2025-04-03 12:16:54', '2025-05-04 12:29:57'),
(4, ' PMR-123456 ', ' TR-4432', ' Pakistan ', ' reg_doc.pdf ', ' vehicle_image.jpg ', ' Toyota ', 'Nissan', NULL, 1, ' Frozen -20 C ', 200.00, 500.00, 15, 2, 1, '2025-04-03 12:20:24', '2025-05-04 12:29:57'),
(5, ' PMR-123456 ', ' TR-4432', ' Pakistan ', '27747-Users         Admin.pdf', '46212-hunter-newton-BwaUJC81i6M-unsplash(1).jpg', ' Toyota ', 'Corolla', NULL, 1, ' Frozen -20 C ', 20.00, 45.00, 15, 4, 1, '2025-04-03 13:53:01', '2025-05-04 12:29:57'),
(6, ' PMR-123896', ' TR-4432', ' Pakistan ', 'vehicles/21901-Letterhead owais gul (1).pdf', 'vehicles/97458-hunter-newton-BwaUJC81i6M-unsplash(1).jpg', ' Toyota ', 'Nissan', NULL, 1, ' Frozen -20 C ', 200.00, 500.00, 4, 2, 1, '2025-04-03 14:03:32', '2025-05-04 12:29:57'),
(7, ' PMR-123896', ' TR-4432', ' Pakistan ', 'vehicles/5505-Letterhead owais gul (1).pdf', 'vehicles/74796-hunter-newton-BwaUJC81i6M-unsplash(1).jpg', ' Toyota ', 'Nissan', NULL, 1, ' Frozen -20 C ', 200.00, 500.00, 4, 2, 1, '2025-04-03 14:04:45', '2025-05-04 12:29:57'),
(8, ' PMR-123456 45', ' TR-4432', ' Pakistan ', 'vehicles/37131-Letterhead owais gul.pdf', 'vehicles/69106-hunter-newton-BwaUJC81i6M-unsplash(1).jpg', ' Toyota ', 'Hino', NULL, 1, ' Frozen -18 C ', 200.00, 500.00, 15, 2, 1, '2025-04-03 14:06:04', '2025-05-04 12:29:57'),
(9, ' PMR-123456', ' TR-443200', ' Pakistan ', '87956-OwaisUpdatedTem01 (1).pdf', '19768-hunter-newton-BwaUJC81i6M-unsplash(1).jpg', ' Toyota ', ' Hilux ', NULL, 1, ' Frozen -20 C ', 20.00, 500.00, 15, 4, 1, '2025-04-03 14:10:11', '2025-05-10 16:25:08'),
(10, NULL, ' TR-4432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 4, '2025-04-26 08:10:52', '2025-05-04 12:29:57'),
(15, NULL, ' TR-4432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2025-05-04 12:23:46', '2025-05-04 12:29:57'),
(16, NULL, ' TR-4432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2025-05-04 12:24:18', '2025-05-04 12:29:57'),
(19, NULL, ' TR-654320 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-05-21 06:15:00', '2025-05-21 06:15:00'),
(21, NULL, 'JER-990088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-05-21 06:15:22', '2025-05-21 06:15:22'),
(22, NULL, 'abc-009977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-05-21 07:33:23', '2025-05-21 07:33:23'),
(23, NULL, 'JER-990088', NULL, NULL, NULL, 'Nissan', '1441', 'ABC-0099', NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-05-23 14:20:03', '2025-05-23 14:20:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_visas`
--
ALTER TABLE `driver_visas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_rates`
--
ALTER TABLE `exchange_rates`
  ADD PRIMARY KEY (`currency_code`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_cards`
--
ALTER TABLE `job_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_card_number` (`job_card_number`);

--
-- Indexes for table `job_card_documents`
--
ALTER TABLE `job_card_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_card_logs`
--
ALTER TABLE `job_card_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_orders`
--
ALTER TABLE `job_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_order_number` (`job_order_number`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `po_number` (`po_number`);

--
-- Indexes for table `purchase_order_logs`
--
ALTER TABLE `purchase_order_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `commodities`
--
ALTER TABLE `commodities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `driver_visas`
--
ALTER TABLE `driver_visas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_cards`
--
ALTER TABLE `job_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `job_card_documents`
--
ALTER TABLE `job_card_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `job_card_logs`
--
ALTER TABLE `job_card_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `job_orders`
--
ALTER TABLE `job_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_order_logs`
--
ALTER TABLE `purchase_order_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
