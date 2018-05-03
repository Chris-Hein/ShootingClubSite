-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 03, 2018 at 06:50 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staghorn`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
CREATE TABLE IF NOT EXISTS `about` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `content`) VALUES
(1, 'Our winter hours (until April 30th) are 10am - 3pm, closed on sundays and holidays. May 1 - October 1 hours are 8am to 45 minutes before sunset\r\n\r\nThe out door range has a 25 and a 100 yard firing line and will accommodate up to a 303 caliber (50 Cal. black powder) on the 100. Hand guns and 22&#39;s on the 25. We are NOT certified for Holster Shooting at this time.\r\n\r\nThe indoor range will take up to 9mm and 38 Special. No Magnum rounds and no .177.');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `eventdate` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `publishdate` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `location`, `eventdate`, `description`, `publishdate`) VALUES
(1, 'Sheepdog Cookoff', 'Local Dog Park, 123 Fake Street, Vancouver', 'September 16, 2024', 'Its a sheepdog cookoff. Bring plenty of sheepdogs and BBQ supplies', '5/2/2018'),
(2, 'Shooting Club Event', 'Shooting Club New Glasgow', 'June 4, 2019', 'Compete against other shooters at this outdoor event!', '5/2/2018'),
(3, 'Rifle Cleaning Tutorial', 'Gun Range, Truro', 'January 8 2020', 'Join us for a free tutorial on the proper cleaning and maintenance of rifles at our truro range', '5/2/2018'),
(4, 'Handgun Safety Course', 'Gun Range, Halifax', 'October 12, 2018', 'We will be holding a handgun safety course at our halifax gun range on october 12th 2018. Cost is $10 per adult and $8 for minors', '5/2/2018');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `date` varchar(25) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `date`, `title`, `content`) VALUES
(1, '5/2/2018', 'Test News Title', 'This is a test news article. Sheepdogs are rich in vitamins and minerals'),
(2, '5/2/2018', 'New Range Opening', 'This is a test news article. A new range is opening soon! Stay tuned for details!'),
(3, '5/2/2018', 'UFO Sighted Over Shooting Range', 'Bacon ipsum dolor amet buffalo filet mignon andouille spare ribs jerky boudin. Leberkas bacon jerky capicola sausage drumstick venison, short ribs rump strip steak t-bone buffalo flank ribeye pork belly. Short loin rump tail pork filet mignon ball tip. Brisket corned beef porchetta cow chuck leberkas. Chuck ham hock spare ribs short ribs, landjaeger swine ball tip drumstick tongue prosciutto t-bone alcatra. Pastrami burgdoggen filet mignon sausage tail capicola cupim ham boudin buffalo andouille'),
(4, '5/2/2018', 'Cheeseburger BBQ Cookout', 'Bacon ipsum dolor amet leberkas ullamco duis eu, beef reprehenderit strip steak cillum bresaola in magna pork chop t-bone buffalo cupim. Incididunt sunt ea lorem short loin landjaeger. Eu cupidatat labore, beef ribs pariatur elit mollit aliquip pork belly short loin picanha voluptate chuck landjaeger dolor. Eiusmod pork belly ullamco leberkas officia boudin bresaola, laborum et. Quis bresaola boudin, hamburger occaecat shoulder tail anim do.'),
(5, '5/2/2018', 'North Korea Invades Japan', 'The armed forces of North Korea invaded Japan this morning, multiple news outlets are reporting\r\n\r\n beef reprehenderit strip steak cillum bresaola in magna pork chop t-bone buffalo cupim. Incididunt sunt ea lorem short loin landjaeger. Eu cupidatat labore, beef ribs pariatur elit mollit aliquip pork belly short loin picanha voluptate chuck landjaeger dolor. Eiusmod pork belly ullamco leberkas ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
