-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 22-11-25 04:11
-- 서버 버전: 10.4.25-MariaDB
-- PHP 버전: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `mydb`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `drama_info`
--

CREATE TABLE `drama_info` (
  `idx` int(6) UNSIGNED NOT NULL,
  `dname` varchar(100) NOT NULL,
  `actors` varchar(100) NOT NULL,
  `broad` varchar(50) NOT NULL,
  `gubun` varchar(10) NOT NULL,
  `stime` varchar(50) NOT NULL,
  `total` varchar(20) NOT NULL,
  `idate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `drama_info`
--

INSERT INTO `drama_info` (`idx`, `dname`, `actors`, `broad`, `gubun`, `stime`, `total`, `idate`) VALUES
(1, '타인은 지옥이다', '임시완,이동욱', 'OCN', '토,일', '10:30', '10부작', '2022-11-11 06:51:51'),
(2, '열여덟의 순간', '옹성우,김향기', 'JTBC', '월,화', '09:30', '16부작', '2022-11-11 06:51:52'),
(3, '펜트하우스2', '유진,김소연', 'SBS', '금,토', '10:00', '20부작', '2022-11-11 06:51:52'),
(4, '선배, 그 립스틱 바르지 마요', '로운,원진아', 'JTBC', '월,화', '09:00', '16부작', '2022-11-11 06:51:52'),
(5, '시지프스 : the myth', '조승우,박신혜', 'JTBC', '수,목', '09:00', '20부작', '2022-11-11 06:51:52'),
(6, 'kosi', 'skoi', 'ksio', '?,?', '10?', '16??', '2022-11-23 02:47:58');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `drama_info`
--
ALTER TABLE `drama_info`
  ADD PRIMARY KEY (`idx`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `drama_info`
--
ALTER TABLE `drama_info`
  MODIFY `idx` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
