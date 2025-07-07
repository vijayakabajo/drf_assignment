-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2025 at 02:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add order item', 8, 'add_orderitem'),
(30, 'Can change order item', 8, 'change_orderitem'),
(31, 'Can delete order item', 8, 'delete_orderitem'),
(32, 'Can view order item', 8, 'view_orderitem'),
(33, 'Can add order', 9, 'add_order'),
(34, 'Can change order', 9, 'change_order'),
(35, 'Can delete order', 9, 'delete_order'),
(36, 'Can view order', 9, 'view_order');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(9, 'orders', 'order'),
(8, 'orders', 'orderitem'),
(7, 'product', 'product'),
(5, 'sessions', 'session'),
(6, 'users', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-07-03 18:15:46.296967'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-07-03 18:15:46.327986'),
(3, 'auth', '0001_initial', '2025-07-03 18:15:46.466828'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-07-03 18:15:46.526329'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-07-03 18:15:46.534342'),
(6, 'auth', '0004_alter_user_username_opts', '2025-07-03 18:15:46.542546'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-07-03 18:15:46.548765'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-07-03 18:15:46.552753'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-07-03 18:15:46.552753'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-07-03 18:15:46.565593'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-07-03 18:15:46.571354'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-07-03 18:15:46.582306'),
(13, 'auth', '0011_update_proxy_permissions', '2025-07-03 18:15:46.587543'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-07-03 18:15:46.589781'),
(15, 'users', '0001_initial', '2025-07-03 18:15:46.751368'),
(16, 'admin', '0001_initial', '2025-07-03 18:15:46.834047'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-07-03 18:15:46.845073'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-03 18:15:46.850617'),
(19, 'sessions', '0001_initial', '2025-07-03 18:15:46.878921'),
(20, 'product', '0001_initial', '2025-07-05 02:13:56.485132'),
(21, 'orders', '0001_initial', '2025-07-05 03:26:29.714193'),
(22, 'orders', '0002_remove_order_notes', '2025-07-05 04:31:35.361223'),
(23, 'product', '0002_remove_product_image_url', '2025-07-05 04:31:35.378284');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_order`
--

CREATE TABLE `orders_order` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `shipping_address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `buyer_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_order`
--

INSERT INTO `orders_order` (`id`, `status`, `total_amount`, `shipping_address`, `created_at`, `updated_at`, `is_active`, `buyer_id`) VALUES
(2, 'pending', 139998.00, '456 updated address 2', '2025-07-07 07:57:53.031855', '2025-07-07 09:53:28.841221', 1, 'c4b84bb2f11149e4bf3436541601318a'),
(3, 'pending', 209997.00, '123 ranchi jharkhand', '2025-07-07 09:16:05.523423', '2025-07-07 09:16:05.536066', 1, 'c4b84bb2f11149e4bf3436541601318a');

-- --------------------------------------------------------

--
-- Table structure for table `orders_orderitem`
--

CREATE TABLE `orders_orderitem` (
  `id` int(11) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_orderitem`
--

INSERT INTO `orders_orderitem` (`id`, `quantity`, `price`, `created_at`, `is_active`, `order_id`, `product_id`) VALUES
(1, 2, 69999.00, '2025-07-07 07:57:53.034855', 1, 2, '5901bb0a434f454c9633a813a3aae1e5'),
(2, 3, 69999.00, '2025-07-07 09:16:05.529416', 1, 3, '5901bb0a434f454c9633a813a3aae1e5');

-- --------------------------------------------------------

--
-- Table structure for table `product_product`
--

CREATE TABLE `product_product` (
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL CHECK (`stock` >= 0),
  `category` varchar(100) NOT NULL,
  `seller_id` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_product`
--

INSERT INTO `product_product` (`id`, `created_at`, `updated_at`, `is_active`, `name`, `description`, `price`, `stock`, `category`, `seller_id`) VALUES
('17ee8b16c2444b479462230b43125527', '2025-07-05 02:27:02.478973', '2025-07-05 02:27:02.478973', 1, 'Test Product', 'This is a test product', 99.99, 10, 'Electronics', 'e6fb223fbd994ecab8c467e7cf7a6485'),
('5901bb0a434f454c9633a813a3aae1e5', '2025-07-06 18:54:02.873697', '2025-07-07 09:16:05.530415', 1, 'Samsung123', 'Android', 69999.00, 10, 'Mobile', 'e6fb223fbd994ecab8c467e7cf7a6485'),
('f5ddae2b11bd41f0ab141ac4bf41aee3', '2025-07-05 02:56:40.826313', '2025-07-05 02:56:40.826313', 1, 'Test Product 2', 'This is a test product', 500.00, 50, 'Food', 'e6fb223fbd994ecab8c467e7cf7a6485');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `id`, `created_at`, `updated_at`, `email`, `user_type`, `phone`, `address`) VALUES
('pbkdf2_sha256$600000$evp1Z7qj8mSq4pnpgkMJot$9kBPSVOgOmTrdZ4DNG3KTKXPPTxI9flD36R4W4UL4Wc=', NULL, 0, 'buyer99', '', '', 0, 1, '2025-07-06 14:56:13.312789', '16db4daf4c564dc181add68e92f614bc', '2025-07-06 14:56:13.531619', '2025-07-06 14:56:13.531619', 'buyer11@gmail.com', 'buyer', '', ''),
('pbkdf2_sha256$600000$k5pK2DUcvGdvbCscb988bp$4/z3wVuiB05T4VxlHJk/tveF2mGtBTTAEBH7goQaIZY=', NULL, 0, 'vijayakabajo', '', '', 0, 1, '2025-07-04 04:12:20.423594', '433539cc73ca4dd1abaea1be10aaeb0c', '2025-07-04 04:12:20.648866', '2025-07-04 04:12:20.648866', 'vijayakabajo@example.com', 'buyer', '', ''),
('pbkdf2_sha256$600000$eDBBplttv6aiMALompYiZM$5ZrI2Pd37hDBi6jn2AXaSvYtAmwC4nRAELmIF0/OWkg=', NULL, 0, 'seller0', '', '', 0, 1, '2025-07-06 14:54:53.223744', '925186a04ab045f3af4e1c9a5a3ca7d5', '2025-07-06 14:54:53.436219', '2025-07-06 14:54:53.436219', 'selle2@gmail.com', 'seller', '', ''),
('pbkdf2_sha256$600000$D0vr9z6EJIuqoxWvTshiUN$1w538xskrsNnYb2Zw3Kx2S1OkxJSnZBJagYg72j3GtA=', NULL, 0, 'seller2', '', '', 0, 1, '2025-07-06 14:53:56.907022', '9e6a677f52c74c11bf10414158e1472e', '2025-07-06 14:53:57.166011', '2025-07-06 14:53:57.166011', 'seller2@gmail.com', 'seller', '', ''),
('pbkdf2_sha256$600000$mRciLDLNdwpf8qs2WVYghh$CV/tWzfrQwj47slCmHFTsefEI/1MB2Kli4NRbgyvBl8=', NULL, 0, 'testuser', '', '', 0, 1, '2025-07-04 04:08:27.628007', 'bcd873b9070b4b44b1e98bf0853e2f98', '2025-07-04 04:08:28.121008', '2025-07-04 04:08:28.121008', 'test@example.com', 'buyer', '', ''),
('pbkdf2_sha256$600000$Ypo2ZViGukq2bm9eOzt9Wv$R7Kgxx2jQCqY+bl//QSj/1rX/cEknCxUqBd3ojEZudA=', NULL, 0, 'buyer111', '', '', 0, 1, '2025-07-07 07:39:18.855783', 'c4b84bb2f11149e4bf3436541601318a', '2025-07-07 07:39:21.371778', '2025-07-07 07:39:21.371778', 'buyer111@gmail.com', 'buyer', '', ''),
('pbkdf2_sha256$600000$iuiB3zJYTs4D7ohbn23gFY$GI1J8LDex2+h8u80N46kl6t5/6p3SqxiNAmrV+ztCdg=', NULL, 0, 'seller1', '', '', 0, 1, '2025-07-05 02:16:33.054332', 'e6fb223fbd994ecab8c467e7cf7a6485', '2025-07-05 02:16:33.665212', '2025-07-05 02:16:33.665212', 'seller@gmail.com', 'seller', '', ''),
('pbkdf2_sha256$600000$9wsiVdt7JdZkjPx9tcRk3a$blBQ93YvKE24DfXnUCb+IYWgjlQREHa0U08twgjT5tY=', NULL, 0, 'buyer88', '', '', 0, 1, '2025-07-06 14:56:59.777483', 'f5cffe26abc14bb1876e0fc98f681988', '2025-07-06 14:56:59.988468', '2025-07-06 14:56:59.988468', 'buyer88@gmail.com', 'buyer', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_user_groups`
--

CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` char(32) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_user_user_permissions`
--

CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` char(32) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_order_buyer_id_26195532_fk_users_user_id` (`buyer_id`);

--
-- Indexes for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  ADD KEY `orders_orderitem_product_id_afe4254a_fk_product_product_id` (`product_id`);

--
-- Indexes for table `product_product`
--
ALTER TABLE `product_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_product_seller_id_7f1925e5_fk_users_user_id` (`seller_id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  ADD KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders_order`
--
ALTER TABLE `orders_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `orders_order`
--
ALTER TABLE `orders_order`
  ADD CONSTRAINT `orders_order_buyer_id_26195532_fk_users_user_id` FOREIGN KEY (`buyer_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `orders_orderitem`
--
ALTER TABLE `orders_orderitem`
  ADD CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  ADD CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_product`
--
ALTER TABLE `product_product`
  ADD CONSTRAINT `product_product_seller_id_7f1925e5_fk_users_user_id` FOREIGN KEY (`seller_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
