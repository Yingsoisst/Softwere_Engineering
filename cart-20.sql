-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2023 at 03:53 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `TableC` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cart_id` int(10) NOT NULL,
  `menu_id` int(10) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_price` varchar(255) NOT NULL,
  `menu_image` text NOT NULL,
  `menu_quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `TableC` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cart_id` int(10) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_price` int(3) NOT NULL,
  `menu_quantity` int(2) NOT NULL,
  `menu_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_ad`
--

CREATE TABLE `order_ad` (
  `order_ad_id` int(11) NOT NULL,
  `TableC` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_price` int(3) NOT NULL,
  `menu_quantity` int(2) NOT NULL,
  `menu_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `menu_id` int(10) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_price` int(3) NOT NULL,
  `menu_image` varchar(255) NOT NULL,
  `menu_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`menu_id`, `menu_name`, `menu_price`, `menu_image`, `menu_status`) VALUES
(17, 'สเต็กเนื้อที-โบน', 269, 'ทีโบน.jpg', 1),
(18, 'สเต็กเนื้อสคริปลอยด์', 199, 'visual-studio-code-logo-png-transparent.png', 1),
(19, 'สเต็กเนื้อริบอาย', 189, 'สเต็กเนื้อริบอาย.jpg', 1),
(20, 'สเต็กปลาซาบะ', 79, 'ปลาซาบะ+ข้าว.jpg', 1),
(21, 'สเต็กปลาดอลลี่', 69, 'ปลาดอลลี่.jpg', 0),
(22, 'สเต็กปลาแซลมอล', 149, 'สเต็กปลาแซลมอล.jpg', 1),
(23, 'สเต็กอกไก่', 69, 'ไก่ธรรมดา.jpg', 0),
(24, 'สเต็กไก่พริกไทยดำ', 79, 'ไก่พริกไทยดำ.jpg', 0),
(25, 'สเต็กไก่สไปรซี่', 69, 'ไก่สไปรซี่.jpg', 0),
(26, 'พอร์คซอพ', 199, 'พอร์คชอพ.jpg', 0),
(27, 'สเต็กหมูพริกไทยดำ', 89, 'หมูพริกไทยดำ.jpg', 0),
(28, 'สเต้กหมูนุ่มมากกกกๆ', 89, 'สเต้กหมูนุ่มมากกกกๆ.jpg', 1),
(29, 'สเต็กสันคอหมู', 89, 'สัคนคอ.jpg', 0),
(30, 'สเต็กหมู', 69, 'สเต็กหมู.jpg', 1),
(36, 'เบอร์เกอร์เนื้อ', 109, 'เบอร์เกอร์เนื้อ.jpg', 1),
(37, 'เบอร์เกอร์หมู', 79, 'เบอร์เกอร์หมู.jpg', 0),
(38, 'เบอร์เกอร์ไก่กรอบ', 69, 'เบอร์เกอร์ไก่กรอบ.jpg', 1),
(39, 'เบอร์เกอร์อกไก่', 69, 'เบอร์เกอร์อกไก่.png', 1),
(40, 'เบอร์เกอร์สไปรซี่', 69, 'เบอร์เกอร์สไปรซี่.jpeg', 1),
(44, 'เบอร์เกอร์ไก่กรอบฟิวชั่นไก่สไปซี่', 119, 'เบอร์เกอร์หมูฟิวชั่นไก่กรอบ.jpg', 1),
(45, 'เบอร์เกอร์หมูฟิวชั่นไก่กรอบ', 119, 'เบอร์เกอร์ไก่กรอบฟิวชั่นอกไก่.jpg', 1),
(46, 'เบอร์เกอร์ไก่กรอบฟิวชั่นอกไก่', 119, '', 0),
(47, 'เบอร์เกอร์อกไก่ฟิวชั่นไก่สไปซี่', 119, '', 0),
(48, 'เฟรนช์ฟรายด์ธรรมดา', 59, '', 0),
(49, 'เฟรนช์ฟรายด์ รสซีส', 65, '', 0),
(50, 'เฟรนช์ฟรายด์ ปาปีก้า', 65, '', 0),
(51, 'เฟรนช์ฟรายด์ รสวิ้งแซบ', 65, '', 0),
(52, 'เฟรนช์ฟรายด์  ออส&สไปซี่', 65, '', 0),
(53, 'เฟรนช์ฟรายด์ รสบาบิคิว', 65, '', 0),
(54, 'สปาเก็ตตี้คาโบนาร่า', 79, 'สปาเก็ตตี้คาโบนาร่า.jpg', 0),
(55, 'สปาเก็ตตี้กุ้งซอสพริกขี้หนู', 69, 'สปาเก็ตตี้ กุ้งซอสพริกขี้หนู.jpg', 0),
(56, 'สปาเก็ตตี้ขี้เมาหมู', 69, 'สปาเก็ตตี้จี้เมา.jpg', 0),
(57, 'สลัดอกไก่', 59, 'สลัดอกไก่.jpg', 0),
(58, 'สลัดไก่กรอบ', 59, '', 0),
(59, 'สลัดไก่สไปรซี่', 59, '', 0),
(60, 'สลัดหมูย่างรสเด็ด', 59, 'LINE_ALBUM_SE_๒๓๐๓๐๔_42.jpg', 0),
(61, 'สลัดไข่', 35, 'สลัดไข่.jpg', 0),
(62, 'ไก่คาราโอเกะ 6ชิ้น', 49, '', 0),
(64, 'เต้าหู้ไส้ซีส 7ชิ้น', 49, '', 0),
(65, 'ไก่จ้อ  8ชิ้น', 49, '', 0),
(66, 'ข้าวหมูรวม', 55, '', 0),
(67, 'ข้าวไก่กรอบ', 49, '', 0),
(68, 'นักเก็ต  7 ชิ้น', 49, '', 0),
(69, 'ไก่ป๊อปรสเผ็ด ', 49, '', 0),
(70, 'ไส้กรอกแฮม  2ลูก', 49, '', 0),
(71, 'กุ้งบาบิคิวเนื้อปลา 7 ชิ้น', 49, '', 0),
(72, 'ไข่ดาว', 7, '', 0),
(73, 'ไข่ต้ม', 7, '', 0),
(74, 'ข้าวเปล้า', 7, '', 0),
(75, 'เพิ่มชีส', 10, '', 0),
(76, 'ไส้กรอก 1 ลูก', 25, '', 0),
(77, 'โกโก้โอริโอ้', 35, '', 0),
(78, 'โอริโอเนมสด', 35, '', 0),
(79, 'น้ำเปล่า', 10, '', 0),
(80, 'สตรอเบอร์รี่สมูทตี้', 45, '', 0),
(81, 'บลูเบอร์รี่สมูทตี้', 45, '', 0),
(82, 'สตรอเบอร์รี่โซดา', 30, '', 0),
(83, 'บลูเบอร์รี่โซดา', 30, '', 0),
(84, 'บลูฮาวายโซดา', 30, '', 0),
(85, 'แดงโซดา', 30, '', 0),
(86, 'น้ำอัดลม', 15, '', 0),
(91, 'รสดี', 30, 'user.png', 0),
(92, 'ไก่ทอด', 20, 'ao.jpg', 1),
(93, 'ไก่ทอด', 30, '336558974_527609752851323_4657913021598788681_n.png', 1),
(94, 'หมูทอด', 20, '336558974_527609752851323_4657913021598788681_n.png', 1),
(95, 'รสดีมาก', 30, '336500984_750499983268464_1591573438524817773_n.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `income_id` int(10) NOT NULL,
  `order_ad_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_price` int(3) NOT NULL,
  `menu_quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`income_id`, `order_ad_id`, `menu_name`, `menu_price`, `menu_quantity`) VALUES
(14, 2, 'สเต็กสันคอหมู', 99, 1),
(15, 5, 'ไก่พริกไทยดำ', 150, 2),
(16, 34, 'สเต็กเนื้อที-โบน', 269, 9),
(17, 35, 'สเต็กปลาดอลลี่', 69, 4),
(18, 43, 'สเต็กปลาซาบะ', 79, 9),
(19, 44, 'สเต็กปลาดอลลี่', 69, 3),
(23, 37, 'สเต็กปลาดอลลี่', 69, 1),
(24, 38, 'สเต็กไก่สไปรซี่', 69, 9),
(26, 40, 'สเต็กปลาซาบะ', 79, 2),
(27, 41, 'สเต็กปลาดอลลี่', 69, 9),
(29, 46, 'สเต็กเนื้อริบอาย', 189, 1),
(30, 47, 'สเต็กปลาดอลลี่', 69, 1),
(32, 49, 'สเต็กเนื้อริบอาย', 189, 1),
(33, 50, 'สเต็กไก่สไปรซี่', 69, 1),
(35, 52, 'สเต็กเนื้อที-โบน', 269, 1),
(36, 53, 'สเต็กปลาดอลลี่', 69, 1),
(38, 55, 'สเต็กปลาดอลลี่', 69, 1),
(39, 56, 'สเต็กสันคอหมู', 89, 1),
(41, 64, 'สเต้กหมูนุ่มมากกกกๆ', 89, 2),
(42, 58, 'สลัดไข่', 35, 2),
(43, 59, 'สลัดอกไก่', 59, 2),
(44, 61, 'สเต็กอกไก่', 69, 1),
(48, 3, 'สเต็กเนื้อริบอาย', 189, 10),
(49, 4, 'สเต็กปลาซาบะ', 79, 1),
(50, 5, 'สเต็กปลาแซลมอล', 149, 1),
(51, 6, 'สเต้กหมูนุ่มมากกกกๆ', 89, 1),
(52, 7, 'สเต็กเนื้อริบอาย', 189, 1),
(53, 8, 'สเต็กปลาซาบะ', 79, 2),
(55, 10, 'สเต็กเนื้อสคริปลอยด์', 199, 2),
(56, 11, 'สเต็กปลาซาบะ', 79, 9),
(58, 13, 'สเต็กปลาแซลมอล', 149, 111),
(59, 14, 'สเต็กเนื้อริบอาย', 189, 10),
(60, 15, 'สเต็กเนื้อที-โบน', 269, 10),
(61, 16, 'สเต็กเนื้อริบอาย', 189, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `order_ad`
--
ALTER TABLE `order_ad`
  ADD PRIMARY KEY (`order_ad_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`income_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `order_ad`
--
ALTER TABLE `order_ad`
  MODIFY `order_ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `menu_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `income_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
