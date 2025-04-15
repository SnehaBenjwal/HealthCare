-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2020 at 11:30 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(222) NOT NULL,
  `pic` varchar(111) NOT NULL,
  `details` varchar(333) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `pic`, `details`, `date`) VALUES
(1, 'Capsule', 'cap.png', 'these are capsules whisd some k dsfksd', '2017-11-03 04:58:57'),
(2, 'Tablets', 'tablet.png', 'some of the pic to be modii dfs tablet', '2017-11-03 04:58:57'),
(3, 'Syrup', 'syrup.png', 'these are capsules whisd some k dsfksd', '2017-11-03 04:59:24'),
(4, 'Cream', 'cream.png', 'some of the pic to be modii dfs tablet', '2017-11-03 04:59:24'),
(5, 'Lotion', 'lotion.png', 'these are capsules whisd some k dsfksd', '2017-11-03 04:59:59'),
(6, 'Syrunj', 'syrunj.png', 'some of the pic to be modii dfs tablet', '2017-11-03 04:59:59'),
(7, 'Injection', 'injection.jpg', 'these are capsules whisd some k dsfksd', '2017-11-03 05:00:19'),
(8, 'Other', 'fk.jpg', 'some of the pic to be modii dfs tablet', '2017-11-03 05:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `inventeries`
--

CREATE TABLE `inventeries` (
  `id` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `supplier` varchar(222) NOT NULL,
  `name` text NOT NULL,
  `unit` text NOT NULL,
  `price` text NOT NULL,
  `pic` text NOT NULL,
  `description` text NOT NULL,
  `company` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventeries`
--

INSERT INTO `inventeries` (`id`, `catId`, `supplier`, `name`, `unit`, `price`, `pic`, `description`, `company`, `date`) VALUES
(1, 1, 'John Pharma', 'Paracetamol', '500mg', '10', 'paracetamol.png', 'Effective for fever and mild pain', 'HealthCorp', '2025-04-12 10:30:00'),
(2, 2, 'MediCare', 'Ibuprofen', '200mg', '15', 'ibuprofen.png', 'Anti-inflammatory tablet', 'MediLife', '2025-04-12 10:35:00'),
(3, 3, 'NutriHealth', 'Amoxicillin', '250mg', '20', 'amoxicillin.png', 'Antibiotic capsule', 'NutriCare', '2025-04-12 10:40:00'),
(4, 4, 'CoughRelief', 'Cetirizine', '10mg', '25', 'cetirizine.png', 'Allergy relief tablet', 'CoughCare', '2025-04-12 10:45:00'),
(5, 5, 'SkinGlow', 'Metformin', '500mg', '30', 'metformin.png', 'Diabetes control tablet', 'SkinCare', '2025-04-12 10:50:00'),
(6, 1, 'John Pharma', 'Aspirin', '75mg', '12', 'aspirin.png', 'Blood thinner tablet', 'HealthCorp', '2025-04-12 10:55:00'),
(7, 2, 'MediCare', 'Omeprazole', '20mg', '18', 'omeprazole.png', 'Acid reflux capsule', 'MediLife', '2025-04-12 11:00:00'),
(8, 3, 'NutriHealth', 'Losartan', '50mg', '22', 'losartan.png', 'Blood pressure tablet', 'NutriCare', '2025-04-12 11:05:00'),
(9, 4, 'CoughRelief', 'Atorvastatin', '10mg', '28', 'atorvastatin.png', 'Cholesterol control tablet', 'CoughCare', '2025-04-12 11:10:00'),
(10, 5, 'SkinGlow', 'Clopidogrel', '75mg', '35', 'clopidogrel.png', 'Heart health tablet', 'SkinCare', '2025-04-12 11:15:00'),
(11, 1, 'John Pharma', 'Levothyroxine', '50mcg', '14', 'levothyroxine.png', 'Thyroid hormone tablet', 'HealthCorp', '2025-04-12 11:20:00'),
(12, 2, 'MediCare', 'Hydrochlorothiazide', '25mg', '16', 'hydrochlorothiazide.png', 'Diuretic tablet', 'MediLife', '2025-04-12 11:25:00'),
(13, 3, 'NutriHealth', 'Gabapentin', '300mg', '24', 'gabapentin.png', 'Nerve pain capsule', 'NutriCare', '2025-04-12 11:30:00'),
(14, 4, 'CoughRelief', 'Prednisone', '5mg', '26', 'prednisone.png', 'Steroid tablet', 'CoughCare', '2025-04-12 11:35:00'),
(15, 5, 'SkinGlow', 'Albuterol', '90mcg', '32', 'albuterol.png', 'Asthma inhaler', 'SkinCare', '2025-04-12 11:40:00'),
(16, 1, 'John Pharma', 'Lisinopril', '10mg', '19', 'lisinopril.png', 'ACE inhibitor tablet', 'HealthCorp', '2025-04-12 11:45:00'),
(17, 2, 'MediCare', 'Furosemide', '40mg', '21', 'furosemide.png', 'Loop diuretic tablet', 'MediLife', '2025-04-12 11:50:00'),
(18, 3, 'NutriHealth', 'Ciprofloxacin', '500mg', '23', 'ciprofloxacin.png', 'Antibiotic tablet', 'NutriCare', '2025-04-12 11:55:00'),
(19, 4, 'CoughRelief', 'Doxycycline', '100mg', '27', 'doxycycline.png', 'Antibiotic capsule', 'CoughCare', '2025-04-12 12:00:00'),
(20, 5, 'SkinGlow', 'Fluoxetine', '20mg', '29', 'fluoxetine.png', 'Antidepressant capsule', 'SkinCare', '2025-04-12 12:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `name` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `title`, `name`) VALUES
(1, 'Medical Stores', 'Medical Stores');

-- --------------------------------------------------------

--
-- Table structure for table `sold`
--

CREATE TABLE `sold` (
  `id` int(11) NOT NULL,
  `name` varchar(222) NOT NULL,
  `contact` varchar(222) NOT NULL,
  `discount` varchar(222) NOT NULL,
  `item` varchar(222) NOT NULL,
  `amount` varchar(222) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sold`
--

INSERT INTO `sold` (`id`, `name`, `contact`, `discount`, `item`, `amount`, `userId`, `date`) VALUES
(2, 'khan Shoaib', '03445584686', '10', '2', '3', 1, '2017-11-17 15:44:15'),
(3, 'sdfgsd', 'dsfgsdf', '10', '3', '25', 1, '2017-11-17 16:47:22'),
(4, 'Younis', '03451212345', '21', '4', '35', 1, '2017-11-19 08:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `pic` text NOT NULL,
  `number` text NOT NULL,
  `address` text NOT NULL,
  `cnic` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `pic`, `number`, `address`, `cnic`, `date`) VALUES
(1, 'faisal khan', 'fk.jpg', '2432342342', 'adfasdfasfdasdf', '2342342342423423', '2017-11-03 07:23:49'),
(2, 'faisal khan', 'fk.jpg', '2432342342', 'adfasdfasfdasdf', '2342342342423423', '2017-11-03 07:23:53'),
(3, 'faisal khan', 'fk.jpg', '2432342342', 'adfasdfasfdasdf', '2342342342423423', '2017-11-03 07:23:56'),
(4, 'faisal khan', 'fk.jpg', '2432342342', 'adfasdfasfdasdf', '2342342342423423', '2017-11-03 07:23:59'),
(5, 'faisal khan', 'fk.jpg', '2432342342', 'adfasdfasfdasdf', '2342342342423423', '2017-11-03 07:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `name` varchar(222) NOT NULL,
  `pic` varchar(222) NOT NULL,
  `number` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `pic`, `number`, `date`) VALUES
(1, 'admin@gmail.com', 'admin', 'FK', 'fk.jpg', '03356910260', '2017-11-02 12:34:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventeries`
--
ALTER TABLE `inventeries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sold`
--
ALTER TABLE `sold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventeries`
--
ALTER TABLE `inventeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sold`
--
ALTER TABLE `sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
