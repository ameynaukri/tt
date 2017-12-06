-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2017 at 06:00 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `startdate` varchar(48) NOT NULL,
  `enddate` varchar(48) NOT NULL,
  `allDay` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_addvertisment`
--

CREATE TABLE `tbl_addvertisment` (
  `id` int(11) NOT NULL,
  `Advertisment` varchar(100) NOT NULL,
  `Add_id` varchar(100) NOT NULL,
  `Banner_id` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_addvertisment`
--

INSERT INTO `tbl_addvertisment` (`id`, `Advertisment`, `Add_id`, `Banner_id`, `status`) VALUES
(3, 'Ankit Solanki', '4547845794', '5478', 'ON');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `SenderId` varchar(100) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cat_id`, `contact_id`, `SenderId`, `category`) VALUES
(32, 226, '6a24ee815e19b31c0e314e1e79cd0719', 'b41c48e9714872a4377db4d2f79ebb08'),
(33, 226, '216084a3b4d301445f80a7588f9d372a', 'b41c48e9714872a4377db4d2f79ebb08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contacts`
--

CREATE TABLE `tbl_contacts` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `StartDate` varchar(100) NOT NULL,
  `EndDate` varchar(100) NOT NULL,
  `MessageLimit` varchar(100) NOT NULL,
  `PhoneNumber` varchar(100) NOT NULL,
  `Type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1-web, 2-app',
  `status` int(11) NOT NULL,
  `crypted_auth` varchar(200) NOT NULL,
  `Ad_unitId` varchar(100) NOT NULL,
  `Banner_ad_unitId` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contacts`
--

INSERT INTO `tbl_contacts` (`id`, `FullName`, `LastName`, `StartDate`, `EndDate`, `MessageLimit`, `PhoneNumber`, `Type`, `status`, `crypted_auth`, `Ad_unitId`, `Banner_ad_unitId`) VALUES
(226, '', '', '', '', '', 'f455e1fda06d063044e0828900cc63d7', '2', 0, '0fec659d88d0fa70eea3e0f8af7f4141', '', ''),
(227, 'Ka6dbgxTNVMd2SdrL1c3OQ==', 'kjb1sgIslCDmmUWX70pQQw==', 'VtXJbuPZyaI6CG+Z0hO2gg==', '9FtJ/S7aXePpyR8fyRdB5A==', '400', '6a0439531e41a4720a6bf138d0c3a437', '1', 0, '', '', ''),
(228, 'MVYfycDmPVTo+pGX5Y5vWg==', '3aa20cu0xvkDSMDeIcd8fg==', 'gEN1cJlxU/UlHLk9tuHQMA==', '9cvxod7cgOgA3e1iVdVM2w==', '10000', 'e90c87ca223fb192615245fb64845095', '1', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_excel_message`
--

CREATE TABLE `tbl_excel_message` (
  `msg_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `time` varchar(100) NOT NULL,
  `PhoneNumber` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

CREATE TABLE `tbl_message` (
  `msg_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_message`
--

INSERT INTO `tbl_message` (`msg_id`, `cat_id`, `message`, `time`) VALUES
(13107, 32, 'd2e573cf4891708e6f59a8c8d0664a7f', '5aaf4a04761578171f2bdb414283dcbc'),
(13108, 32, 'c1514b862c526c36a240790764fa79414c49159f39edad2243cf825536969d62', '10c587ee0b056cf3e32495519260c90e'),
(13109, 32, '214d5213452ee6b3a09eb8b5d01ae70704b967f0043cdebc00052f8ddc6edd6b', 'ad58fb100d14fcc55eb6cc90fd9131e3'),
(13110, 32, '55a477cb683ae97257d82405a486d3fb', '050f577291e9e49f36e1df5375fef2f1'),
(13111, 33, 'ec875dba123c17161035483cf3dbb09fc2f4b052410f686e88fe508665b4208777578bdaf79a13f108fef771fcf7dfd324b672ef9cbf55a12f733b9cde8b3de0', '3be1964a3c1a83408fcf14db75e65281'),
(13112, 33, 'bfd372a03d0c755463bad08a57adfb9aef256f90201086950336c46c9f1faaaea0fae3f6d6d3e6ea2c80edc5470b82a8dcf939abe51cac9f8044cb758052bf92504a25ad4744319e92137583f985af24e97b9bb3cce7c434f0e55a2688c9aa15eae39cbb666f3651122088fc8a59e96b50a98bc41a1a665dec0a9ad0965d5c8dcb2c43a4b9e2ed783e53b09b5fb32d7ad21c685e27150c2f078759ade10439328c8d0fa20c18a1827af271a7c4faf36dec7c52e78243003d5404e0f6f15ee702193690c6f8d3f5a82d3d0ef807148765d7058630746abeb6cfa031891efde875a345cdaae735479f108443aaa3bdd78108fdc6aea6fb6ff2b8556b08c133e72972e4742303c2c6d81d31c27e245865e890deabb3faa55dfc0a74dfe4a61b5ce1d1f47466c5ec7af0a6a625125d572be4f2f06028e5a419c93b6aeefd63ad3a1ff90af5674023be4ad595ca34f17cc479b98e3d7b92d6b832757b9583091b736b5f2215cd50fce9e84f0cbbce224d47b67c1f262a96d3273243d777ae539a3e1e6f264df0c196703f6370671c0fe74ce640ad06d8f8afb17a52fc6738d9946e0189337237b74d0e0314a66fc843df4f2babe5a7abbba56ca024f548b33a64508d31696b1531450ead293d100da3f59a67a79dc5c9ceefc52d0b0097d3e850df7b85fc60488dbb9aaad5323b7938ac189ddea34dea4ae1abe612498377bfa1d1c3d2c326fd3f46215c664bdc455d6c276c919dd9a4fe544d76802f93fdc7e0189530bd5be02e3a8a9cd543bd6e318fbcfcdc3c0ec25276c51750d8ca3c6be7207193e0705ce7bec63eb1cb0d7b70d77ccf6430f463c296f7672e6507c3a85dfbca9868cacc65c3ede0ebb60474c11d926a3e02bfc9de5284e508ff12a3445ba6693534ae6ace0c4aae4c02b76f5e072307ab493f2f9959a99c30f588514f4ae685a1a7083fdbd6e140f07b9e2beb91171519827cfc1ce703d96337991186f3bc26321c0f805f70f1c8481a519922830fb94e14526fa4983970e0129620aa78994e1ca676a56d69f581a2bebe61f6f2d32c2650a441c055364c45ca4620a1eb08d4f4235e74a2bb08a0063b6454b9043e043720c1e10b5392b72b410d41fb1619e7bd7e4610094dd0ed4db6c05e9bc13058601e90187955aa5aff330642bb460a72ca05c8a96cf7140396b7b4b92fcac9c67642394925b23f4feff69032e0aa4d3065d1362bf4dcbe30db2c0ddfe33505af855ad939d1e36ca76d75028d75d2bc4976024a0f0d4c41e5180e22a18beef79176b73b06f29d7f5e7a95d5353353412186f3e01e22d4587e261c0bc14d1c7b94dbcc17ab929d88665ca9c4713de78c98f03d95db24bd0f01e4660ad0c6dfea8382d0ca1c6f167763275881f8a9c21e0ace7695f81e964b16e5e6ddd9082bda25931b18d9e2a286bbb4537fd3b4728375588067c64b866d34e6885b8706a24a165b4ae10be5cdc539d60e147ab31341bfc04b6182b7d169f5c79062b4ea0b8d831606655fd449c8aedf838c94bbbf385192e6936749d3d9a80e0439b95c05e6f128a434085cfedf12e6daaf7a96975772d4d2ccf91cf5c980c07e3434129d4b9a12042e7542a348b2cff124eb1a90d893e6557f6e53b4eb587ed151d7d623bc0f02e3d9f69ad52aebb3ec4174379a18b519d9ff44d04ed2401f2de0c80e9fa073e259a20dd367fc804d08d2c7eec70d760b4e2881c463bcb239cacfb7b6df53af', 'cceb52b9f8442478c38a41f54e316684'),
(13113, 33, '948f1ef5014c23852a7d90b4c1caffabbffe3578e00694885d005b263aaf815e', 'a62cf48ba3a858ac224803ffda0a1c35'),
(13114, 33, '7ae4f17adf3f6a0b7016a9f1b9c072dc127364d4d5921db986113b65c30fa6b3007bef7a264c064be6706e244eb4159a', 'e1349277d7a1233410a1109d1cd8a469'),
(13115, 33, '8fec6b07ff9db50f5ecc54b5a0a35989d8814ed25e088d8c42fe74fcb2aa0bc304dafe480c9e2dd18b8f72c48a5d36b3', '33ff62eb6721cb4f416d5d0cec78858d'),
(13116, 33, 'cb9e23a64ab7031458ff57ccce6cf164c24438485af6c5d5a2922cc026c63999', '57664b34f9bad439207b22da26048e3a'),
(13117, 33, 'b9b17d387f011f3f3d2b8ad244fcbf82', '69cc03f34eb45fd6c6f68696c303c0eb'),
(13118, 33, '601b20727d28a96299a6991b76eb3de0de340c7a16bff51d78ad7673c62a4894', '6c8914af3c3839a8c9b57908efb36b68'),
(13119, 33, '9d6e5c4879ae5954fdf5c2331325128d', '00637440a496f7a4ce7a97b129f6d0b7'),
(13120, 33, 'da13cde035edd654a71d60ec6978bee87f1e13c5b8033d031f0d036ffa3a4d98', 'af5f650e2ecfd93ff15aec78442f3190');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otp`
--

CREATE TABLE `tbl_otp` (
  `otp_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `datetimeOld` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_otp`
--

INSERT INTO `tbl_otp` (`otp_id`, `contact_id`, `code`, `datetimeOld`) VALUES
(5, 226, '903880', '2017-09-06 16:46:09.887');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_send_message`
--

CREATE TABLE `tbl_send_message` (
  `id` int(11) NOT NULL,
  `fromnumber` int(11) NOT NULL,
  `tonumber` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `datetimeOld` varchar(100) NOT NULL,
  `server_key` varchar(5000) NOT NULL,
  `token` varchar(5000) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `full_name`, `password`, `contact_no`, `user_type`, `code`, `date`, `datetimeOld`, `server_key`, `token`, `status`) VALUES
(301, 'superadmin@gmail.com', 'Super Admin', '12345678', '1234567888', 'SuperAdmin', '87687', '', '', '0', '0', 0),
(311, 'deepak@gmail.com', 'deepak', '', '+918827007007', 'Customer', '', '2017-07-14', '2017-07-18 15:25:05.757', '', '', 2),
(312, 'aamey.raverkar@gmail.com', 'Amey', '123456', '+919754845046', 'Admin', '7394', '2017-07-14', '2017-07-27 17:37:15.017', '0', '0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tbl_addvertisment`
--
ALTER TABLE `tbl_addvertisment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_excel_message`
--
ALTER TABLE `tbl_excel_message`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD PRIMARY KEY (`msg_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  ADD PRIMARY KEY (`otp_id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `tbl_send_message`
--
ALTER TABLE `tbl_send_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromnumber` (`fromnumber`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_addvertisment`
--
ALTER TABLE `tbl_addvertisment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_contacts`
--
ALTER TABLE `tbl_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `tbl_excel_message`
--
ALTER TABLE `tbl_excel_message`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_message`
--
ALTER TABLE `tbl_message`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13121;

--
-- AUTO_INCREMENT for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  MODIFY `otp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_send_message`
--
ALTER TABLE `tbl_send_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD CONSTRAINT `tbl_contactsFK` FOREIGN KEY (`contact_id`) REFERENCES `tbl_contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD CONSTRAINT `tbl_category_fk` FOREIGN KEY (`cat_id`) REFERENCES `tbl_category` (`cat_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_otp`
--
ALTER TABLE `tbl_otp`
  ADD CONSTRAINT `tbl_otpFK` FOREIGN KEY (`contact_id`) REFERENCES `tbl_contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_send_message`
--
ALTER TABLE `tbl_send_message`
  ADD CONSTRAINT `tbl_send_message_ibfk_1` FOREIGN KEY (`fromnumber`) REFERENCES `tbl_contacts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
