-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 07, 2022 at 07:01 AM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u320983746_dentalclinic`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`u320983746_dentalClinic1`@`127.0.0.1` FUNCTION `getDistance` (`lat1` VARCHAR(200), `lng1` VARCHAR(200), `lat2` VARCHAR(200), `lng2` VARCHAR(200)) RETURNS VARCHAR(10) CHARSET utf8 begin
declare distance varchar(10);

set distance = (select (6371 * acos( 
                cos( radians(lat2) ) 
              * cos( radians( lat1 ) ) 
              * cos( radians( lng1 ) - radians(lng2) ) 
              + sin( radians(lat2) ) 
              * sin( radians( lat1 ) )
                ) ) as distance); 

if(distance is null)
then
 return '';
else 
return distance;
end if;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clients`
--

CREATE TABLE `tbl_clients` (
  `client_id` int(50) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_username` varchar(100) NOT NULL,
  `client_password` varchar(100) NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_contact_no` varchar(100) NOT NULL,
  `client_email` varchar(100) NOT NULL,
  `fcmToken` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clients`
--

INSERT INTO `tbl_clients` (`client_id`, `client_name`, `client_username`, `client_password`, `client_address`, `client_contact_no`, `client_email`, `fcmToken`) VALUES
(1, 'Jhon Doe', 'jhon', 'jhonpass', 'Cagayan De Oro City', '09887863455', 'jhon@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(2, 'Jhon Mark', 'mark', 'markpass', 'Cagayan De Oro City', '09887863455', 'mark@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(7, 'Karina Santos', 'karina', 'santos', 'Cagayan De Oro City', '09887863455', 'Karina@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(10, 'Marky', 'marki', 'markihan', 'Cagayan De Oro', '09784568988', 'markigol@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(11, 'Maria Clarita', 'clear', 'klaru', 'Cagayan De Oro City', '0978456888', 'clara@gmail.com', 'fEjGGJs4T0qp0KEtycE9KE:APA91bHg2wH3qiBbBE4WuHAFvJ1hkN72O8z6iVk4DJ7WCQbs5YDzxd-day8Lwm9doEU--oqFCQEXZftYYYClCoUVraEmOdmDpiFIO5Xht-vHFceJv-Ha8COOh6fNHF7RnAgs7RWwHHH8'),
(12, 'Bunak', 'bunaki', 'bunakko', 'Cagayan De Oro', '09784568988', 'bunak@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(13, 'Estella', 'estes', 'estellases', 'Cagayan De Oro', '09784568988', 'estes@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(15, 'Adrian Benedict S. Tulang', 'kulas', 'kulas', 'Cagayan De Oro City', '9063198116', 'adriantulang@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(16, 'Michael Jordan', 'michael', 'jordan', 'Cagayan De Oro City', '9063198116', 'adriantulang@gmail.com', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM'),
(17, 'George W. Bosh', 'george', 'bosh', 'Cagayan De Oro City', '9669362180', 'georgewbosh@gmail.com', 'fUeAB6r4QjGvAqWYEXyk7i:APA91bGN74TSgBsi00mkIklO31qMNCAfPSGePJkCfY4mo7pKUssO6uePsnq3iqWX_G-3kudtC4-p27__1-yNrc8ckr70fYMn01F3BDw1aqut4u1jN0jWu8hY98CeyFXp0FuKxEfEKBNk'),
(18, 'Mika Amore', 'mika', 'amore', 'Cagayan De Oro City', '9063198116', 'mika@gmail.com', 'ffJ6DpC7QTCiB-OgP9B_ZQ:APA91bHIadKz9ZXZR78jFT8i48DqKg43dZcp_k96NYDEB-dTuLE5rUpRFlgfbp14CC92WH8DU7mKrsvoGefVQuQIMLjIEcqSOO11UyY_jx7R9StK3h2cECqKvFX7ri1tA693Ta_pA8-_'),
(19, 'Dwight', 'dwayteeeee', 'dwayteeeee', 'Km8 Airport Lumbia Cagayan De Oro City', '9199276486', 'felicianodwighty@gmail.com', 'fm1xkQNNSFy7_UUqiMkcH-:APA91bEeBMe7_AbGNvGcEdjGHfqDQLN-eKQseMDZsCTl8OnhBQDQD-Sgfzq-5FD5fjvdrv_-Vyeb8j7Qb5tqj9XjCIVJhShtEu4w3CWDFm-rwMm2YyOn2waN7DU1tC9hBfmpR3fKZMtK'),
(20, 'Grace Alyxis C. Legaspi', 'grace', '123456', 'Zone 4 Lower Bulua CDOC', '9262163851', 'gracealyxislegaspi425@gmail.com', 'd-ViUVLyTwKvm3F2ZsoNbp:APA91bE-2yM0G2Pniak-PeOzOOurPRD7ZNcd72YSeL5NeZ16hu6Rz4N0_lDCgl8SDCQb_BFtt2yXwPPwQUnYP0fKGPrzGhSGnwnxBUAzNtkMPkS8K-FbysjF1JdLw3UpW-3ZxrQJ2S5D'),
(21, 'Dale Ethan A.Yacapin', 'dale', 'dale', '484 Zone 2 Agusan', '9161206850', 'ethanyacapin44@gmail.com', 'd-ViUVLyTwKvm3F2ZsoNbp:APA91bE-2yM0G2Pniak-PeOzOOurPRD7ZNcd72YSeL5NeZ16hu6Rz4N0_lDCgl8SDCQb_BFtt2yXwPPwQUnYP0fKGPrzGhSGnwnxBUAzNtkMPkS8K-FbysjF1JdLw3UpW-3ZxrQJ2S5D');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clinic`
--

CREATE TABLE `tbl_clinic` (
  `clinic_id` int(50) NOT NULL,
  `clinic_name` varchar(100) NOT NULL,
  `clinic_username` varchar(100) NOT NULL,
  `clinic_password` varchar(100) NOT NULL,
  `clinic_address` varchar(100) NOT NULL,
  `clinic_lat` varchar(100) NOT NULL,
  `clinic_long` varchar(100) NOT NULL,
  `clinic_image` varchar(100) NOT NULL,
  `clinic_dentist_name` varchar(100) NOT NULL,
  `clinic_email` varchar(100) NOT NULL,
  `clinic_contact_no` varchar(100) NOT NULL,
  `fcmToken` varchar(250) NOT NULL,
  `clinic_status` varchar(100) NOT NULL,
  `subscription_status` varchar(100) NOT NULL DEFAULT 'Unpaid',
  `subscription_amount` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clinic`
--

INSERT INTO `tbl_clinic` (`clinic_id`, `clinic_name`, `clinic_username`, `clinic_password`, `clinic_address`, `clinic_lat`, `clinic_long`, `clinic_image`, `clinic_dentist_name`, `clinic_email`, `clinic_contact_no`, `fcmToken`, `clinic_status`, `subscription_status`, `subscription_amount`) VALUES
(1, 'Rael Dental Clinic', 'clinics', 'pass', 'Cagayan De Oro City', '8.486371623824773', '124.64690334823318', 'abc.jpg', 'Dr. Rael V. Yap', 'dentalrael@gmail.com', '09167062055', 'fEjGGJs4T0qp0KEtycE9KE:APA91bHg2wH3qiBbBE4WuHAFvJ1hkN72O8z6iVk4DJ7WCQbs5YDzxd-day8Lwm9doEU--oqFCQEXZftYYYClCoUVraEmOdmDpiFIO5Xht-vHFceJv-Ha8COOh6fNHF7RnAgs7RWwHHH8', 'Approved', 'Paid', '1500'),
(2, 'XYZ Dental Clinic', 'susan', 'paredes', 'Carmen Cagayan De Oro City', '8.479277707991871', '124.63797374313073', 'xyz.jpg', 'Dr. Susan Calonia Paredes', 'susan@gmail.com', '09786573455', 'fEjGGJs4T0qp0KEtycE9KE:APA91bHg2wH3qiBbBE4WuHAFvJ1hkN72O8z6iVk4DJ7WCQbs5YDzxd-day8Lwm9doEU--oqFCQEXZftYYYClCoUVraEmOdmDpiFIO5Xht-vHFceJv-Ha8COOh6fNHF7RnAgs7RWwHHH8', 'Pending', 'Unpaid', '0'),
(3, 'RST Dental Clinic', 'luis', 'borja', 'Borja Street Cagayan De Oro City', '8.479462757469793', '124.64346757038135', 'rst.jpg', 'Dr. Luis Borja', 'luis@gmail.com', '09796573455', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Pending', 'Unpaid', '0'),
(4, 'Centro Ciudad Oral Care', 'dwight', 'feliciano', 'Pabayo Street Cagayan De Oro City', '8.476885575806197', '124.64480655075829', 'centrociudad.jpg', 'Dr. Ciudad Centro', 'centro@gmail.com', '09796573466', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Approved', 'Paid', '1500'),
(5, 'Sia Dental Care', 'sia', 'siapass', 'Velez St. Cagayan De Oro City', '8.476562597026623', '124.6439723649376', 'sia.jpg', 'Dr. Sia Roxas', 'sia@gmail.com', '09167964566', 'fUeAB6r4QjGvAqWYEXyk7i:APA91bGN74TSgBsi00mkIklO31qMNCAfPSGePJkCfY4mo7pKUssO6uePsnq3iqWX_G-3kudtC4-p27__1-yNrc8ckr70fYMn01F3BDw1aqut4u1jN0jWu8hY98CeyFXp0FuKxEfEKBNk', 'Approved', 'Paid', '1500'),
(6, 'Joson Dental Care', 'maria', 'maria', 'Abejuela St. Cagayan De Oro City', '8.477417981809495', '124.63792644981194', 'mm.jpg', 'Dr. Maria Mars', 'maria@gmail.com', '09167964588', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Approved', 'Paid', '1500'),
(7, 'Dental Art Care', 'art', 'care', 'Dolores St. Cagayan De Oro City', '8.475021906973872', '124.64265098187695', 'artcare.jpg', 'Dr. Art Care', 'art@gmail.com', '09167963366', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Approved', 'Paid', '1500'),
(8, 'Clinica Dental Care', 'clara', 'ramos', 'Chavez St. Cagayan De Oro City', '8.478732550269768', '124.6449873428072', 'image_picker3660865570990049674.jpg', 'Dr. Clara Ramos', 'clara@gmail.com', '09167555588', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Pending', 'Unpaid', '0'),
(9, 'Uy Dental Care', 'Uy', 'masoy', 'Sotero Daumar St. Cagayan De Oro City', '8.476843004871403', '124.6499089285591', 'uydental.jpg', 'Dr. Uy Masoy', 'uymasoy@gmail.com', '09997963366', 'fEjGGJs4T0qp0KEtycE9KE:APA91bHg2wH3qiBbBE4WuHAFvJ1hkN72O8z6iVk4DJ7WCQbs5YDzxd-day8Lwm9doEU--oqFCQEXZftYYYClCoUVraEmOdmDpiFIO5Xht-vHFceJv-Ha8COOh6fNHF7RnAgs7RWwHHH8', 'Approved', 'Paid', '1500'),
(10, 'RDL Dental Care', 'rdl', 'rdldentalcare', 'Yacapin St, Cagayan de Oro, 9000 Lalawigan ng Misamis Oriental', '8.480037628480527', '124.64532577512769', 'image_picker3660865570990049674.jpg', 'Dr. Rudel Del', 'rudelDel@gmail.com', '09987854544', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Pending', 'Unpaid', '0'),
(11, 'Pajo Dental Care', 'pajo', 'pajobar', 'Yacapin St, Cagayan de Oro, 9000 Lalawigan ng Misamis Oriental', '8.480003761878093', '124.6450382914033', 'image_picker3660865570990049674.jpg', 'Dr. Pajo Bar', 'pajobar@gmail.com', '09987854444', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Pending', 'Unpaid', '0'),
(12, 'ToothAche Dental Clinic', 'tooth', 'ache', 'Bulua Cagayan De Oro City', '8.504375200000002', '124.61920529999999', 'image_picker3660865570990049674.jpg', 'Dr Adrian Benedict S. Tulang', 'adriantulang@gmail.com', '9063198116', 'fEjGGJs4T0qp0KEtycE9KE:APA91bHg2wH3qiBbBE4WuHAFvJ1hkN72O8z6iVk4DJ7WCQbs5YDzxd-day8Lwm9doEU--oqFCQEXZftYYYClCoUVraEmOdmDpiFIO5Xht-vHFceJv-Ha8COOh6fNHF7RnAgs7RWwHHH8', 'Pending', 'Unpaid', '0'),
(17, 'MrTooth Dental Clinic', 'mrtooth', 'toothpass', 'Lapasan Cagayan De Oro City', '8.483481399999999', '124.6616415', 'image_picker5755159175848823837.jpg', 'Dr Adrian Master', 'adriantulang@gmail.com', '9063198116', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Pending', 'Unpaid', '0'),
(22, 'Lina Aboy Dy Dental Clinic', 'fajardo', 'fajardo', 'Initao Misamis Oriental', '8.477364534446174', '124.63773847712086', 'image_picker6033572451891785140.jpg', 'Dr. Lina Aboy', 'Aboy@gmail.com', '9063198116', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Approved', 'Paid', '1500'),
(23, 'Metamorphoteeth Dental Clinic', 'meta', 'photeeth', 'Cugma Cagayan De Oro City', '8.451334899999999', '124.69118040000001', 'image_picker3813092187164687338.jpg', 'Mr Adrian Metamorph', 'metamorphoteeth@gmail.com', '9063198116', 'd94nUF6JQqSkWE-5iObv9K:APA91bGG50m4OMkMU_Bd-M-Vzn8vAV94drsZWYplzYmr3cmMtr7dvQ3GXIj6HU-xyupK_F_ecjhwTFUdaBzkUZ7rP-yEgbdE5TvoMmIROjRUAcxF2cPqKr2CwTIJ0GkwdDArxwqWOeGM', 'Pending', 'Unpaid', '0'),
(24, 'Washington Dental Clinic', 'washington', 'washingtondc', 'Bulua Cagayan De Oro City', '8.50437267940372', '124.61833130568266', 'image_picker8423195552491584907.jpg', 'Dr. Washing DC', 'adriantulang@gmail.com', '9063198116', 'fUeAB6r4QjGvAqWYEXyk7i:APA91bGN74TSgBsi00mkIklO31qMNCAfPSGePJkCfY4mo7pKUssO6uePsnq3iqWX_G-3kudtC4-p27__1-yNrc8ckr70fYMn01F3BDw1aqut4u1jN0jWu8hY98CeyFXp0FuKxEfEKBNk', 'Pending', 'Unpaid', '0'),
(25, 'Esperanza Dental Care Clinic', 'espe', 'ranza', 'Elsalavador Misamis Oriental', '8.5425834912018', '124.45907447487116', 'image_picker6825760580917897208.jpg', 'Dr. Esmeralda Esperanza', 'esperanza@gmail.com', '9063198116', 'fUeAB6r4QjGvAqWYEXyk7i:APA91bGN74TSgBsi00mkIklO31qMNCAfPSGePJkCfY4mo7pKUssO6uePsnq3iqWX_G-3kudtC4-p27__1-yNrc8ckr70fYMn01F3BDw1aqut4u1jN0jWu8hY98CeyFXp0FuKxEfEKBNk', 'Pending', 'Unpaid', '0'),
(26, 'Dental Clinic', 'Dwayt', 'Dwayt', 'Km8 Airport Lumbia Cdo', '8.41916128329829', '124.61358144879341', 'image_picker3268678774965914311.jpg', 'Dr. Dwight', 'felicianodwighty@gmail.com', '9199276486', 'fWvk4fVrTHyvi-G2L_v3sb:APA91bGkcxEgPU5rnd5VJucPR3Xi-BKgPskCgAI0KnPf4cKDg46f2u5n0FEfAocPtQQCEkvEz_M3nalcAK7DFMDOHqkMCGbJoKYuqOr-YpXGBO0Se8x5kRMqm4UNcNRpDOEYbf6ppYlM', 'Pending', 'Unpaid', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clinic_documents`
--

CREATE TABLE `tbl_clinic_documents` (
  `doc_id` int(100) NOT NULL,
  `clinic_id` varchar(100) NOT NULL,
  `clinic_img_document` varchar(300) NOT NULL,
  `clinic_doc_description` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clinic_documents`
--

INSERT INTO `tbl_clinic_documents` (`doc_id`, `clinic_id`, `clinic_img_document`, `clinic_doc_description`) VALUES
(1, '1', 'birpermit.jpg', 'BIR permit'),
(2, '1', 'businesspermit.jpg', 'Business Permit'),
(3, '1', 'dtipermit.png', 'DTI Permit'),
(4, '1', 'certofphgeps.jpg', 'Certificate of PH geps'),
(5, '8', 'birpermit.jpg', 'BIR permit'),
(6, '8', 'businesspermit.jpg', 'Business Permit'),
(7, '8', 'dtipermit.png', 'DTI Permit'),
(8, '8', 'certofphgeps.jpg', 'Certificate of PH geps'),
(9, '9', 'birpermit.jpg', 'BIR permit'),
(10, '9', 'businesspermit.jpg', 'Business Permit'),
(11, '9', 'dtipermit.png', 'DTI Permit'),
(12, '9', 'certofphgeps.jpg', 'Certificate of PH geps'),
(13, '3', 'birpermit.jpg', 'BIR permit'),
(14, '3', 'businesspermit.jpg', 'Business Permit'),
(15, '3', 'dtipermit.png', 'DTI Permit'),
(16, '3', 'certofphgeps.jpg', 'Certificate of PH geps'),
(17, '4', 'birpermit.jpg', 'BIR permit'),
(18, '4', 'businesspermit.jpg', 'Business Permit'),
(19, '4', 'dtipermit.png', 'DTI Permit'),
(20, '4', 'certofphgeps.jpg', 'Certificate of PH geps'),
(21, '22', 'image_picker606233770436216450.png', 'Business Permit'),
(22, '22', 'image_picker8900316187469290025.jpg', 'DTI Permit'),
(23, '22', 'image_picker8759654731791390074.jpg', 'Certificate of PHgeps'),
(24, '22', 'image_picker4556658318998810579.jpg', 'BIR Permit'),
(25, '23', 'image_picker8187208856986213018.png', 'Business Permit'),
(26, '23', 'image_picker5251313303706354399.jpg', 'DTI Permit'),
(27, '23', 'image_picker1123643383257155408.jpg', 'Certificate of PHgeps'),
(28, '23', 'image_picker7838204526484906139.jpg', 'BIR Permit'),
(29, '24', 'image_picker936952307850983274.png', 'Business Permit'),
(30, '24', 'image_picker3692072674085574110.jpg', 'DTI Permit'),
(31, '24', 'image_picker2824114373129994433.jpg', 'Certificate of PHgeps'),
(32, '24', 'image_picker2260046877654828029.jpg', 'BIR Permit'),
(33, '25', 'image_picker5167083842202647753.png', 'Business Permit'),
(34, '25', 'image_picker2807719819410838874.jpg', 'DTI Permit'),
(35, '25', 'image_picker4630229496143012367.jpg', 'Certificate of PHgeps'),
(36, '25', 'image_picker447980531335424119.jpg', 'BIR Permit'),
(37, '26', 'image_picker6735917286607178673.jpg', 'Business Permit'),
(38, '26', 'image_picker7539833973497135692.jpg', 'Business Permit'),
(39, '26', 'image_picker5891219518245064905.jpg', 'DTI Permit'),
(40, '26', 'image_picker5025222026776067167.jpg', 'DTI Permit'),
(41, '26', 'image_picker1681016516157447223.jpg', 'Certificate of PHgeps'),
(42, '26', 'image_picker8042154463348537437.jpg', 'BIR Permit');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clinic_rating`
--

CREATE TABLE `tbl_clinic_rating` (
  `rating_id` int(100) NOT NULL,
  `rating_clinic_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating_client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating_comment` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating_score` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clinic_services`
--

CREATE TABLE `tbl_clinic_services` (
  `services_id` int(100) NOT NULL,
  `services_name` varchar(100) NOT NULL,
  `services_clinic_id` varchar(100) NOT NULL,
  `services_price` varchar(100) NOT NULL,
  `services_description` varchar(250) NOT NULL,
  `services_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_clinic_services`
--

INSERT INTO `tbl_clinic_services` (`services_id`, `services_name`, `services_clinic_id`, `services_price`, `services_description`, `services_status`) VALUES
(1, 'Implants', '1', '10000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(2, 'iTero Dental Impressions', '1', '15000', 'Dental implants provide a comfortable, permanent solution to lost teeth. The dental replacements are attached to titanium posts that actually fuse to your jawbone and', 'Active'),
(3, 'Crowns', '1', '12000', 'A crown is a dental cap that completely covers a severely damaged tooth and restores your tooth\'s appearance and functionality.', 'Active'),
(4, 'Implant-Supported Bridges', '1', '12000', 'A crown is a dental cap that completely covers a severely damaged tooth and restores your tooth\'s appearance and functionality.', 'Active'),
(5, 'Implants', '4', '10000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(6, 'iTero Dental Impressions', '4', '15000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(7, 'Crowns', '4', '12000', 'Dental implants provide a comfortable, permanent solution to lost teethDental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(8, 'Implant-Supported Bridges', '4', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(9, 'Implants', '6', '10000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(10, 'iTero Dental Impressions', '6', '15000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(11, 'Crowns', '6', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(12, 'Implant-Supported Bridges', '6', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(13, 'Implants', '7', '10000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(14, 'iTero Dental Impressions', '7', '15000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(15, 'Crowns', '7', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(16, 'Implant-Supported Bridges', '7', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(17, 'Implants', '5', '10000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(18, 'iTero Dental Impressions', '5', '15000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(19, 'Crowns', '5', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(20, 'Implant-Supported Bridges', '5', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(21, 'Implants', '9', '10000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(22, 'iTero Dental Impressions', '9', '15000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(23, 'Crowns', '9', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(24, 'Implant-Supported Bridges', '9', '12000', 'Dental implants provide a comfortable, permanent solution to lost teeth', 'Active'),
(25, 'Extractions', '1', '8000.50', 'Tooth extraction. pulling tooth. removing tooth', 'Active'),
(26, 'Root canal treatment', '1', '8569.10', 'A dental procedure used to treat infection at the center of a tooth.', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `emp_id` int(50) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_username` varchar(100) NOT NULL,
  `emp_pass` varchar(100) NOT NULL,
  `emp_position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`emp_id`, `emp_name`, `emp_username`, `emp_pass`, `emp_position`) VALUES
(1, 'Feliciano Dwight', 'dwight', 'feliciano', 'Admin'),
(2, 'Grace Alyxis Calam Legaspi', 'grace', 'legaspi', 'Admin'),
(3, 'Lorenzo Miguel Ignacio', 'lorenzo', 'ignacio', 'Admin'),
(4, 'Super Admin Account', 'new_admin', 'new_pass', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reservations`
--

CREATE TABLE `tbl_reservations` (
  `res_id` int(100) NOT NULL,
  `res_service_name` varchar(200) NOT NULL,
  `res_clinic_id` varchar(100) NOT NULL,
  `res_service_price` varchar(100) NOT NULL,
  `res_fee` varchar(100) NOT NULL,
  `res_total_amount` varchar(100) NOT NULL,
  `res_schedule` varchar(100) NOT NULL,
  `res_payment_gateway` varchar(100) NOT NULL,
  `res_client_id` varchar(100) NOT NULL,
  `res_status` varchar(100) NOT NULL,
  `res_remarks` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_reservations`
--

INSERT INTO `tbl_reservations` (`res_id`, `res_service_name`, `res_clinic_id`, `res_service_price`, `res_fee`, `res_total_amount`, `res_schedule`, `res_payment_gateway`, `res_client_id`, `res_status`, `res_remarks`) VALUES
(1, 'Implants', '1', '9500.0', '500.0', '10000', '2022-09-14 00:00:00.000', 'Gcash', '11', 'Rejected', 'Reservations already full. Thanks. '),
(2, 'Implant-Supported Bridges', '1', '11400.0', '600.0', '12000', '2022-09-30 00:00:00.000', 'Paymaya', '11', 'Approved', ''),
(3, 'Implants', '9', '9500.0', '500.0', '10000', '2022-09-28 00:00:00.000', 'Gcash', '11', 'Pending', ''),
(4, 'Crowns', '4', '11400.0', '600.0', '12000', '2022-09-27 00:00:00.000', 'Paymaya', '11', 'Pending', ''),
(5, 'Implant-Supported Bridges', '1', '11400.0', '600.0', '12000', '2022-09-20 00:00:00.000', 'Gcash', '11', 'Pending', ''),
(6, 'Implant-Supported Bridges', '1', '11400.0', '600.0', '12000', '2022-09-20 00:00:00.000', 'Gcash', '11', 'Rejected', 'Already full.'),
(7, 'Implants', '1', '9500.0', '500.0', '10000', '2022-09-14 00:00:00.000', 'Gcash', '11', 'Approved', ''),
(8, 'Implant-Supported Bridges', '1', '11400.0', '600.0', '12000', '2022-09-30 00:00:00.000', 'Paymaya', '11', 'Approved', ''),
(9, 'Implant-Supported Bridges', '1', '11400.0', '600.0', '12000', '2022-09-20 00:00:00.000', 'Gcash', '11', 'Approved', ''),
(10, 'Crowns', '1', '12000', '600.0', '12600.00', '2022-09-30 00:00:00.000', 'Paymaya', '11', 'Pending', ''),
(11, 'Extractions', '1', '8000.50', '400.02500000000003', '8400.52', '2022-09-27 00:00:00.000', 'Gcash', '11', 'Pending', ''),
(12, 'Root canal treatment', '1', '8569.10', '428.45500000000004', '8997.56', '2022-09-25 00:00:00.000', 'Paymaya', '11', 'Pending', ''),
(13, 'Root canal treatment', '1', '8569.10', '428.45500000000004', '8997.56', '2022-09-21 00:00:00.000', 'Gcash', '11', 'Pending', ''),
(14, 'iTero Dental Impressions', '1', '15000', '750.0', '15750.00', '2022-09-29 00:00:00.000', 'Gcash', '20', 'Pending', ''),
(15, 'Implants', '5', '10000', '500.0', '10500.00', '2022-09-07 06:14:58.793043', 'Gcash', '19', 'Pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_useraccount`
--

CREATE TABLE `tbl_useraccount` (
  `account_id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_useraccount`
--

INSERT INTO `tbl_useraccount` (`account_id`, `username`, `password`, `user_id`, `user_type`) VALUES
(1, 'clinics', 'pass', '1', 'Clinic'),
(2, 'dwight', 'feliciano', '4', 'Clinic'),
(3, 'sia', 'siapass', '5', 'Clinic'),
(4, 'maria', 'maria', '6', 'Clinic'),
(5, 'art', 'care', '7', 'Clinic'),
(6, 'Uy', 'masoy', '9', 'Clinic'),
(8, 'mark', 'markpass', '2', 'Client'),
(9, 'karina', 'santos', '7', 'Client'),
(10, 'marki', 'markihan', '10', 'Client'),
(11, 'clear', 'klaru', '11', 'Client'),
(12, 'bunaki', 'bunakko', '12', 'Client'),
(13, 'estes', 'estellases', '13', 'Client'),
(14, 'kulas', 'kulas', '15', 'Client'),
(15, 'tooth', 'ache', '12', 'Clinic'),
(20, 'mrtooth', 'toothpass', '17', 'Clinic'),
(25, 'fajardo', 'fajardo', '22', 'Clinic'),
(26, 'michael', 'jordan', '16', 'Client'),
(27, 'meta', 'photeeth', '23', 'Clinic'),
(28, 'george', 'bosh', '17', 'Client'),
(29, 'washington', 'washingtondc', '24', 'Clinic'),
(30, 'espe', 'ranza', '25', 'Clinic'),
(31, 'mika', 'amore', '18', 'Client'),
(32, 'dwayteeeee', 'dwayteeeee', '19', 'Client'),
(33, 'grace', '123456', '20', 'Client'),
(34, 'susan', 'paredes', '2', 'Clinic'),
(35, 'luis', 'borja', '3', 'Clinic'),
(36, 'rdl', 'rdldentalcare', '10', 'Clinic'),
(37, 'pajo', 'pajobar', '11', 'Clinic'),
(38, 'Dwayt', 'Dwayt', '26', 'Clinic'),
(39, 'dale', 'dale', '21', 'Client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `tbl_clinic`
--
ALTER TABLE `tbl_clinic`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `tbl_clinic_documents`
--
ALTER TABLE `tbl_clinic_documents`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `tbl_clinic_rating`
--
ALTER TABLE `tbl_clinic_rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `tbl_clinic_services`
--
ALTER TABLE `tbl_clinic_services`
  ADD PRIMARY KEY (`services_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tbl_reservations`
--
ALTER TABLE `tbl_reservations`
  ADD PRIMARY KEY (`res_id`);

--
-- Indexes for table `tbl_useraccount`
--
ALTER TABLE `tbl_useraccount`
  ADD PRIMARY KEY (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  MODIFY `client_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_clinic`
--
ALTER TABLE `tbl_clinic`
  MODIFY `clinic_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_clinic_documents`
--
ALTER TABLE `tbl_clinic_documents`
  MODIFY `doc_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_clinic_rating`
--
ALTER TABLE `tbl_clinic_rating`
  MODIFY `rating_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_clinic_services`
--
ALTER TABLE `tbl_clinic_services`
  MODIFY `services_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `emp_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_reservations`
--
ALTER TABLE `tbl_reservations`
  MODIFY `res_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_useraccount`
--
ALTER TABLE `tbl_useraccount`
  MODIFY `account_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
