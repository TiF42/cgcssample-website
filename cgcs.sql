-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 03:31 AM
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
-- Database: `cgcs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`) VALUES
(1, 'ryan_villanueva', 'ryan.villanueva@umak.edu.ph', 'admin123'),
(2, 'aiko_caguioa', 'aiko.caguioa@umak.edu.ph', 'admin123'),
(3, 'gichelle_roxas', 'gichellehanna.roxas@umak.edu.ph', 'admin123'),
(4, 'romanita_deborja', 'mdeborja.a1094518@umak.edu.ph', 'admin123'),
(5, 'carolyn_balsamo', 'carolyn.balsamo@umak.edu.ph', 'admin123'),
(6, 'liezel_mendoza', 'liezel.mendoza@umak.edu.ph', 'admin123'),
(7, 'estella_obnamia', 'estella.obnamia@umak.edu.ph', 'admin123'),
(8, 'admintest', 'mdelrosario.k12257372@umak.edu.ph', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Appointment_Date` date NOT NULL DEFAULT curdate(),
  `Appointment_Time` time NOT NULL DEFAULT current_timestamp(),
  `Appointment_Number` varchar(50) NOT NULL,
  `Availability_Status` varchar(50) NOT NULL DEFAULT '',
  `Department` varchar(50) NOT NULL,
  `status` text NOT NULL,
  `DATE` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `name`, `email`, `Appointment_Date`, `Appointment_Time`, `Appointment_Number`, `Availability_Status`, `Department`, `status`, `DATE`) VALUES
(1, 'test', 'test', '2024-03-09', '08:00:00', 'test', '', 'test', 'Approved', '2024-03-18'),
(2, 'test1', 'test1', '2024-03-12', '10:00:00', 'test1', '', 'test1', 'No Show', '2024-03-18'),
(3, 'test', 'test', '2024-03-16', '00:00:00', 'test', '', 'CITE', 'No Show', '2024-03-18'),
(4, 'test', 'test', '0000-00-00', '00:00:00', 'test', '', 'HSU12', 'Approved', '2024-03-18'),
(5, 'test', 'test', '0000-00-00', '00:00:00', 'test', '', 'ION', '', '2024-03-18'),
(6, 'test', 'test', '0000-00-00', '00:00:00', 'test', '', 'SOL', '', '2024-03-18'),
(7, 'test', 'tes', '0000-00-00', '00:00:00', 'test', '', 'CCSE', 'No Show', '2024-03-18'),
(8, 'test', 'test', '0000-00-00', '00:00:00', 'test ', '', 'HSU11', '', '2024-03-18'),
(9, 'test', 'test', '0000-00-00', '00:00:00', 'test', '', 'IOA', '', '2024-03-18'),
(10, 'Roberto', 'jroberto@umak.edu.ph', '0000-00-00', '00:00:00', 'APTEST', '', 'CCSE', 'No Show', '2024-03-18'),
(12, 'test', 'janire.k12254978@umak.edu.ph', '2024-03-27', '08:00:00', '', '', 'HSU (G12)', '', '2024-03-25'),
(13, 'test 323232', 'janire.k12254978@umak.edu.ph', '2024-03-27', '09:00:00', '', '', 'HSU (G12)', '', '2024-03-25'),
(14, 'john', 'janire.k12254978@umak.edu.ph', '2024-03-26', '08:00:00', '', '', 'HSU (G12)', '', '2024-03-26'),
(15, 'john', 'janire.k12254978@umak.edu.ph', '2024-03-26', '00:00:00', '', '', 'HSU (G12)', '', '2024-03-26'),
(16, 'john', 'janire.k12254978@umak.edu.ph', '2024-03-26', '10:00:00', '', '', 'HSU (G12)', '', '2024-03-26'),
(17, '', 'ryan.villanueva@umak.edu.ph', '2024-03-27', '10:00:00', '', '', 'HSU (G12)', '', '2024-03-26'),
(18, 'john', 'janire.k12254978@umak.edu.ph', '2024-04-25', '00:00:00', '', '', 'HSU (G12)', '', '2024-04-11'),
(23, '', 'janire.k12254978@umak.edu.ph', '2024-04-16', '09:00:00', '01', '', 'IOA', '', '2024-04-16'),
(24, '', 'janire.k12254978@umak.edu.ph', '2024-04-16', '10:00:00', '02', '', 'IOA', '', '2024-04-16');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_Image` varchar(100) NOT NULL,
  `type` text NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_info` varchar(5000) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` time NOT NULL,
  `event_where` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `event_Image`, `type`, `event_name`, `event_info`, `event_date`, `event_time`, `event_where`) VALUES
(40, 'InStyle: Acing your acads.png', 'Event', 'InStyle: Acing your acads', 'In a bid to provide students with crucial skills necessary for academic success, the Center for Guidance and Counseling Services (CGCS) recently organized a webinar titled \"In-Style: Acing your Acads.\" The event, which took place on March 20, 2024, from 2 pm to 4 pm via Webex, attracted a substantial audience eager to glean insights on academic excellence.\r\nEsteemed counselor Jesreel del Espiritu Santo of De La Salle Medical and Health Sciences Institute in Dasmarinas, Cavite, served as the resource speaker for the webinar, sharing a wealth of tips and techniques aimed at enriching students\' academic journey. Del Espiritu Santo\'s presentation encompassed a range of topics, including time management, self-care, goal setting, breathing exercises, overcoming test anxiety, and navigating academic challenges.\r\nRecorded webinars will soon be available for the UMak community to watch at their convenience. Stay tuned! ', '2024-03-20', '14:00:00', 'Zoom Meeting'),
(42, 'Mind Matters: Navigating Anxiety, Depression, And Stress.png', 'Event', 'Mind Matters: Navigating Anxiety, Depression, And Stress', '', '2024-03-06', '14:00:00', 'Webex meeting'),
(43, 'Customer Service Training.jpg', 'Event', 'Customer Service Training', 'For University Drivers, Elevator Operators And Service Providers', '2024-04-17', '12:00:00', ''),
(44, '436234984_829048102583277_7358275426683673975_n.jpg', 'Event', 'Psychological First Aid Training For Faculty Member', 'Coming Soon!', '0000-00-00', '00:00:00', 'Coming Soon'),
(45, 'Amazing Peers 2024.jpg', 'Event', 'Amazing Peers 2024', ' Healthy Body, Healthy Mind', '2024-05-04', '00:00:00', ''),
(46, 'My Future My Choice.jpg', 'Event', 'My Future My Choice', 'Coming soon', '0000-00-00', '00:00:00', 'Coming Soon'),
(47, 'Conflict Crusher.jpg', 'Event', 'Conflict Crusher', 'Mastering Relationship Resilience in College', '0000-00-00', '00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `caption` varchar(5000) NOT NULL,
  `file_name` text NOT NULL,
  `file_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `caption`, `file_name`, `file_type`) VALUES
(17, 'Study Habits Week Tip: Setting the foundation for success starts with planning ahead! Take time to map out your week, jotting down deadlines and assignments.  Then, create your study sanctuary – a quiet space where distractions fade away.  MONDAY:  Setting the Foundation', 'Tips.png', 'Tips'),
(18, 'Your mental health journey speaks volumes about your courage and resilience. Keep shining your light and inspiring others along the way. Remember, your strength is a beacon of hope for those around you.', 'Inspiration.png', 'Inspiration'),
(21, 'Strength isnt just about physical prowess its also about the resilience of your mind Your journey towards better mental health is a testament to your inner strength', 'image_2024-04-15_210615798.png', 'Motivation'),
(22, 'Valor isnt just for the history books  its a daily choice On the Day of Valor lets celebrate not just the heroes of the past but the courage and strength we find within ourselves every day', 'image_2024-04-15_210704005.png', ''),
(23, 'Happy weekend Herons\r\nPlanting Seeds of Hope \r\nAs we end the week lets plant the seeds of hope and renewal in our hearts Just like the tiny seeds that grow into mighty trees our dreams and aspirations have the power to flourish with time and care Nurture your hopes and believe in the potential of new beginnings', 'image_2024-04-15_211012766.png', ''),
(24, 'Yay Its Friday\r\nEmbrace Hope and Resilience \r\nEven in the darkest of times there is always hope This new season celebrate the resilience of the human spirit and the promise of brighter days ahead No matter what challenges you may face know that you have the strength to overcome them', 'image_2024-04-15_211043144.png', ''),
(25, 'Its an amazing Thursday Herons \r\nBloom Where Youre Planted\r\nNo matter where you are in your journey remember that growth is always possible Like a flower pushing through the soil towards the sun you have the power to bloom and thrive This new season embrace your potential and bloom where youre planted\r\n', 'image_2024-04-15_211112443.png', ''),
(26, 'Have a great Wednesday Herons\r\nLet Go of the Past Embrace the Present \r\nRemember that its okay to let go of what no longer serves you Release any burdens or regrets from the past and embrace the present moment with open arms Each day is a new opportunity to create the life you desire', 'image_2024-04-15_211740303.png', ''),
(27, 'Happy Tuesday Herons\r\nCultivate Growth and Renewal \r\nThis Easter season prioritize your mental health by focusing on growth and renewal Take time to nourish your mind body and soul Whether its through meditation selfreflection or simply spending time in nature find what brings you peace and renewal', 'image_2024-04-15_211811699.png', ''),
(28, 'Good morning Herons\r\nMonday is about Believe in Second Chances\r\nEaster is a time of second chances and new beginnings No matter what mistakes youve made in the past believe in your ability to change and grow Embrace forgiveness both for yourself and others and step into the future with confidence and grace', '434535917_1180003676703792_2367938452641351842_n.gif', ''),
(29, 'While religion often involves organized beliefs and practices spirituality is more personal and can be found in various forms Understanding these distinctions helps us appreciate the diverse ways people find meaning and connection \r\nSpirituality can be crucial to mental health for several reasons ', 'image_2024-04-15_212331177.png', ''),
(30, 'LOOK\r\nCGCS remains committed to addressing the mental health of UMak students The survey will continue until the end of the semester as approved by the Universitys Vice President for Student Services and Community Development and Vice President for Academic Affairs Our goal is to assess the mental health status of students and determine how CGCS can provide support Thanks to our interns for facilitating the quick survey From time to time you will see them at the canteen and 5th floor of HPSB', 'Mental.gif', '');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `video_name` varchar(5000) NOT NULL,
  `Link` varchar(50) NOT NULL,
  `video_path` varchar(100) NOT NULL,
  `type_of_video` varchar(50) NOT NULL,
  `kind` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_name`, `Link`, `video_path`, `type_of_video`, `kind`) VALUES
(38, '5 Psychological Tips to Stay Focused in School', 'https://www.youtube.com/embed/YEFriS84ISE', '', 'Academic Performance', 'link'),
(39, 'The Academic Achievement Trap', 'https://www.youtube.com/embed/mc1KsAbNxo8', '', 'Academic Performance', 'link'),
(40, 'From \'D\' Grades To \'A\' Grades', 'https://www.youtube.com/embed/RHHOa879nU0', '', 'Academic Performance', 'link'),
(42, 'Work For Your Dreams', 'https://www.youtube.com/embed/vQzb34h7mtY', '', 'Academic Performance', 'link'),
(44, 'It\'s Hard Getting Good Grades', 'https://www.youtube.com/embed/sRE90qnAlDA', '', 'Academic Performance', 'link'),
(45, 'A+ Student Mentality', 'https://www.youtube.com/embed/g6BtbIiJ_rc', '', 'Academic Performance', 'link'),
(46, 'What is Anxiety?', 'https://www.youtube.com/embed/BVJkf8IuRjE', '', 'Anxiety', 'link'),
(47, 'Rewiring the Anxious Brain', 'https://www.youtube.com/embed/zTuX_ShUrw0', '', 'Anxiety', 'link'),
(48, 'Rewiring the Anxious Brain', 'https://www.youtube.com/embed/zTuX_ShUrw0', '', 'Anxiety', 'link'),
(49, 'Intrusive Thoughts and Overthinking', 'https://www.youtube.com/embed/V3vhXQy48jo', '', 'Anxiety', 'link'),
(50, '7 Signs of Mental Breakdown', 'https://www.youtube.com/embed/kwQPLWBufG4', '', 'Anxiety', 'link'),
(51, '10 Signs of Hidden Anxiety', 'https://www.youtube.com/embed/woJFvy5Jp1Y', '', 'Default', 'link'),
(52, 'Calm-Down Method for Stopping Anxiety Attacks', 'https://www.youtube.com/embed/WGG7MGgptxE', '', 'Anxiety', 'link'),
(54, 'The Science of Body Image', 'https://www.youtube.com/embed/TwTWyCIGblM', '', 'Body Image', 'link'),
(55, 'Girls Ages 6-18 Talk About Body Image', 'https://www.youtube.com/embed/5mP5RveA_tk', '', 'Body Image', 'link'),
(56, 'Body Positivity or Body obsession?', 'https://www.youtube.com/embed/uDowwh0EU4w', '', 'Body Image', 'link'),
(57, 'Body Image Issues, Watch this', 'https://www.youtube.com/embed/qKfdHzSr-eI', '', 'Body Image', 'link'),
(58, 'Revealing Speech About Body Image', 'https://www.youtube.com/embed/-Au62AcSDsw', '', 'Body Image', 'link'),
(59, 'Boys\' Body Image', 'https://www.youtube.com/embed/G1KdiI4UN9g', '', 'Body Image', 'link'),
(60, 'Ending the pursuit of perfection', 'https://www.youtube.com/embed/GR_hq7OVzHU', '', 'Body Image', 'link'),
(61, 'What is Bullying?', 'https://www.youtube.com/embed/KQZ9hDDz704', '', 'Bullying', 'link'),
(62, 'How to safely help someone', 'https://www.youtube.com/embed/LnQ1MdP-Qxc', '', 'Bullying', 'link'),
(63, 'Ways To Stop Bullying', 'https://www.youtube.com/embed/ynTuA_tlZDE', '', 'Bullying', 'link'),
(64, 'How to Stop A Bully', 'https://www.youtube.com/embed/7oKjW1OIjuw', '', 'Bullying', 'link'),
(65, 'Beat Bullying', 'https://www.youtube.com/embed/iFlrCuSyhvU', '', 'Bullying', 'link'),
(66, 'Stop Bullying Now', 'https://www.youtube.com/embed/Jd5IeermWOI', '', 'Bullying', 'link'),
(67, '6 Subtle Signs of Bullying', 'https://www.youtube.com/embed/JKYR9xxF_Hg', '', 'Bullying', 'link'),
(68, 'The Dangers of Youth Vaping', 'https://www.youtube.com/embed/l5Pu-H6YS6Y', '', 'Chemical Abuse', 'link'),
(69, 'Teen Substance Use & Abuse', 'https://www.youtube.com/embed/wQl_4kcE5nw', '', 'Chemical Abuse', 'link'),
(70, 'Exposing the Family Effect of Addiction', 'https://www.youtube.com/embed/1qI-Qn7xass', '', 'Chemical Abuse', 'link'),
(71, 'Understand Addiction (For Teens)', 'https://www.youtube.com/embed/dsTwkX1cdCY', '', 'Chemical Abuse', 'link'),
(72, 'How Addiction Affects The Brain', 'https://www.youtube.com/embed/eVLpnMHHEPU', '', 'Chemical Abuse', 'link'),
(73, 'Does stress affect your memory?', 'https://www.youtube.com/embed/hyg7lcU4g8E', '', 'Coping with Stress', 'link'),
(74, 'Coping With Stress', 'https://www.youtube.com/embed/EM5bCGADQFs', '', 'Coping with Stress', 'link'),
(75, 'How stress affects your body', 'https://www.youtube.com/embed/v-t1Z5-oPtU', '', 'Coping with Stress', 'link'),
(76, 'Reduce Stress in 3 Minutes', 'https://www.youtube.com/embed/grfXR6FAsI8', '', 'Coping with Stress', 'link'),
(77, 'How stress affects your brain', 'https://www.youtube.com/embed/WuyPuH9ojCE', '', 'Coping with Stress', 'link'),
(78, '\"6 Signs of Stress You Shouldn\'t Ignore\"', 'https://www.youtube.com/embed/H-kl36yQN1U', '', 'Coping with Stress', 'link'),
(79, 'How to protect your brain from stress', 'https://www.youtube.com/embed/Nz9eAaXRzGg', '', 'Coping with Stress', 'link'),
(80, 'What is Depression?', 'https://www.youtube.com/embed/z-IR48Mb3W0', '', 'Depression', 'link'),
(81, 'Daily Routine To Fight Off Depression', 'https://www.youtube.com/embed/Y9A5wuTtblw', '', 'Depression', 'link'),
(82, 'How to Get Out of a Despairing Mood', 'https://www.youtube.com/embed/ApccemGnh78', '', 'Depression', 'link'),
(83, '10 Things Depression Makes Us Do', 'https://www.youtube.com/embed/pcmoQinDhJ4', '', 'Depression', 'link'),
(84, 'Fight Depression in 2 Minutes', 'https://www.youtube.com/embed/sWfNosruPPw', '', 'Depression', 'link'),
(85, 'Depression: A Student\'s Perspective', 'https://www.youtube.com/embed/yOx0Q273AsQ', '', 'Depression', 'link'),
(86, '\"I\'m Fine\" - Learning To Live With Depression', 'https://www.youtube.com/embed/IDPDEKtd2yM', '', 'Depression', 'link'),
(87, '8 Ways to Build Stronger Family Relationships', 'https://www.youtube.com/embed/9Rdkdf1A2V4', '', 'Family Relationship', 'link'),
(88, 'Healing Parent and Adult Child Relationships', 'https://www.youtube.com/embed/H8JGCjsDoDk', '', 'Family Relationship', 'link'),
(89, 'You Can\'t Heal Broken Family Relationships', 'https://www.youtube.com/embed/5bFuwNpqRM0', '', 'Family Relationship', 'link'),
(90, '7 Signs of a Toxic Family', 'https://www.youtube.com/embed/-_A67wxucLo', '', 'Family Relationship', 'link'),
(91, 'Families and family relationships for kids', 'https://www.youtube.com/embed/2SkuK8j54UE', '', 'Family Relationship', 'link'),
(92, '\"8 Ways to Improve Parent Child Relationship\"', 'https://www.youtube.com/embed/RDemM6FjcSE', '', 'Family Relationship', 'link'),
(93, 'How to strengthen family relationships', 'https://www.youtube.com/embed/c5tuaUFyQrE', '', 'Family Relationship', 'link'),
(94, 'How to know your life purpose in 5 minutes', 'https://www.youtube.com/embed/vVsXO9brK7M', '', 'Find Purpose', 'link'),
(95, 'How To Find Your Purpose - 9 Types', 'https://www.youtube.com/embed/z7uWYh_kmLw', '', 'Find Purpose', 'link'),
(96, 'Find Your Purpose Today', 'https://www.youtube.com/embed/wYNwaSmBIKs', '', 'Find Purpose', 'link'),
(97, 'Why You Can\'t Find Your Purpose', 'https://www.youtube.com/embed/fMYbD81zZ2s', '', 'Find Purpose', 'link'),
(98, 'Find Your Purpose in Life', 'https://www.youtube.com/embed/ZE-YCwsnc6A', '', 'Find Purpose', 'link'),
(99, '\"8 Questions to Find Your Purpose\"', 'https://www.youtube.com/embed/hZ5Sm-JHzUc', '', 'Find Purpose', 'link'),
(100, 'Find your Purpose', 'https://www.youtube.com/embed/2Ar05F-LnWQ', '', 'Find Purpose', 'link'),
(101, 'Why are friendships important?', 'https://www.youtube.com/embed/bNzFPPMnF1Y', '', 'Friendship', 'link'),
(102, 'How to Win Friends and Influence People', 'https://www.youtube.com/embed/0uMZi1gc0Nc', '', 'Friendship', 'link'),
(103, 'Why You Lose Friends', 'https://www.youtube.com/embed/jQodsxu8z7w', '', 'Friendship', 'link'),
(104, '5 Levels of Friendships', 'https://www.youtube.com/embed/FfiFge1ss5c', '', 'Friendship', 'link'),
(105, 'The Reason You Feel Lonely', 'https://www.youtube.com/embed/I9hJ_Rux9y0', '', 'Friendship', 'link'),
(106, '\"Parkinson\'s Law - Manage Your Time\"', 'https://www.youtube.com/embed/tlddeUri3GM', '', 'Friendship', 'link'),
(107, 'How to Make Friends', 'https://www.youtube.com/embed/D8jMB2KpCN0', '', 'Friendship', 'link'),
(108, 'How to Actually Set Goals', 'https://www.youtube.com/embed/BQbufwSqxpU', '', 'Goal Setting', 'link'),
(109, 'Achieve Your Goal', 'https://www.youtube.com/embed/2HWM75i6WxY', '', 'Goal Setting', 'link'),
(110, 'Setting Goals', 'https://www.youtube.com/embed/LmFdyn648UY', '', 'Goal Setting', 'link'),
(111, 'Accomplish Everything With Mini Habits', 'https://www.youtube.com/embed/aHDvEfiSipo', '', 'Goal Setting', 'link'),
(112, '1% Better Every Day', 'https://www.youtube.com/embed/GeFjP5sMXr0', '', 'Goal Setting', 'link'),
(113, 'Set Goals: 80/20 Rule', 'https://www.youtube.com/embed/cdiApKj3QPg', '', 'Goal Setting', 'link'),
(114, 'How to Keep Going', 'https://www.youtube.com/embed/dLSrqRB7VcY', '', 'Goal Setting', 'link'),
(115, '8 Things Resilient People Do', 'https://www.youtube.com/embed/RJKbr8VvvbY', '', 'Grit and Resilience', 'link'),
(116, 'Grit: Can perseverance by taught?', 'https://www.youtube.com/embed/qaeFnxSfSC4', '', 'Grit and Resilience', 'link'),
(117, 'How to Develop Grit', 'https://www.youtube.com/embed/juLw_8IRukw', '', 'Grit and Resilience', 'link'),
(118, 'The Power of Resilience', 'https://www.youtube.com/embed/_iuPewWbp2U', '', 'Grit and Resilience', 'link'),
(119, 'The three secrets of resilient people', 'https://www.youtube.com/embed/NWH8N-BvhAw', '', 'Grit and Resilience', 'link'),
(120, '10 Ways to Build and Develop Resilience', 'https://www.youtube.com/embed/VNCL1glwyOI', '', 'Grit and Resilience', 'link'),
(121, 'Resilience Mindset', 'https://www.youtube.com/embed/eeRwPgRQmCQ', '', 'Grit and Resilience', 'link'),
(122, 'Growth Mindset vs. Fixed Mindset', 'https://www.youtube.com/embed/KUWn_TJTrnU', '', 'Growth Mindset', 'link'),
(123, '6 Signs You Have a Growth Mindset', 'https://www.youtube.com/embed/15jRpqbJdzk', '', 'Growth Mindset', 'link'),
(124, 'You Can Do More Than You Think', 'https://www.youtube.com/embed/kBWfncYv8DA', '', 'Growth Mindset', 'link'),
(125, 'The Mindset of A Winner', 'https://www.youtube.com/embed/VSceuiPBpxY', '', 'Growth Mindset', 'link'),
(126, 'Develop A Great Growth Mindset', 'https://www.youtube.com/embed/hiiEeMN7vbQ', '', 'Growth Mindset', 'link'),
(127, 'Mindset Is Everything', 'https://www.youtube.com/embed/61drPjOfzNM', '', 'Growth Mindset', 'link'),
(128, 'The Most Powerful Mindset for Success', 'https://www.youtube.com/embed/qjBdcyueom8', '', 'Growth Mindset', 'link'),
(129, 'What is Mindfulness Meditation?', 'https://www.youtube.com/embed/g7yFvd7_KVw', '', 'Mindfulness', 'link'),
(130, '4 Steps to Live Mindfully', 'https://www.youtube.com/embed/fcRANlaqf9c', '', 'Mindfulness', 'link'),
(131, 'Why Mindfulness Is a Superpower', 'https://www.youtube.com/embed/w6T02g5hnT4', '', 'Mindfulness', 'link'),
(132, 'How to Practice Mindfulness', 'https://www.youtube.com/embed/bLpChrgS0AY', '', 'Mindfulness', 'link'),
(133, 'Meditation 101: A Beginner\'s Guide', 'https://www.youtube.com/embed/o-kMJBWk9E0', '', 'Mindfulness', 'link'),
(134, 'Clear Your Mind, 5 Minute Meditation', 'https://www.youtube.com/embed/nlEoLYREbXo', '', 'Mindfulness', 'link'),
(135, 'Self-Acceptance', 'https://www.youtube.com/embed/PFY_ThmPf3k', '', 'Mindfulness', 'link'),
(136, 'Time To Get Up and Get It Done', 'https://www.youtube.com/embed/qpoE3svJAdM', '', 'Motivation', 'link'),
(137, 'When Things Get Hard', 'https://www.youtube.com/embed/K8S8OvPhMDg', '', 'Motivation', 'link'),
(138, 'When You Lose All Hope', 'https://www.youtube.com/embed/nYlXlpg5BdI', '', 'Motivation', 'link'),
(139, 'When You Feel Like Quitting', 'https://www.youtube.com/embed/6QDifGvcFys', '', 'Motivation', 'link'),
(140, 'Kill Your Laziness', 'https://www.youtube.com/embed/Ri2uYyuQgmQ', '', 'Motivation', 'link'),
(141, 'Believe You Can Do It', 'https://www.youtube.com/embed/guZGpB1xBhI', '', 'Motivation', 'link'),
(142, 'Wisdom Of The Ants', 'https://www.youtube.com/embed/FFvRWmIeOQ8', '', 'Motivation', 'link'),
(143, 'Best Version Of Yourself', 'https://www.youtube.com/embed/lkDBImBAmN0', '', 'Self Improvement', 'link'),
(144, 'Focus on Yourself not others', 'https://www.youtube.com/embed/eBSeCp__xhI', '', 'Self Improvement', 'link'),
(145, '8 Simple Self Improvement Principles', 'https://www.youtube.com/embed/0foQiAJ3uHg', '', 'Self Improvement', 'link'),
(146, 'The Dark Side of Self Improvement', 'https://www.youtube.com/embed/wljRiAofFJ8', '', 'Self Improvement', 'link'),
(147, '10 Habits to Become Mentally Stronger', 'https://www.youtube.com/embed/gfmZr88vd_s', '', 'Self Improvement', 'link'),
(148, '20 Self Improvement Tips', 'https://www.youtube.com/embed/De-bLfEUeLE', '', 'Self Improvement', 'link'),
(149, 'Believe in Yourself', 'https://www.youtube.com/embed/4mjRM7sbhFk', '', 'Self Improvement', 'link'),
(150, 'What causes insomnia?', 'https://www.youtube.com/embed/j5Sl8LyI7k8', '', 'Sleep', 'link'),
(151, 'What would happen if you didn’t sleep?', 'https://www.youtube.com/embed/dqONk48l5vY', '', 'Sleep', 'link'),
(152, '5 Tips For Falling Asleep', 'https://www.youtube.com/embed/ZKNQ6gsW45M', '', 'Sleep', 'link'),
(153, 'How To Improve Your Sleep', 'https://www.youtube.com/embed/lRp5AC9W_F8', '', 'Sleep', 'link'),
(154, 'The Importance of Sleep', 'https://www.youtube.com/embed/xxxWv6PM4EM', '', 'Sleep', 'link'),
(155, 'What is sleep paralysis?', 'https://www.youtube.com/embed/2lkkF4hJGUU', '', 'Sleep', 'link'),
(156, 'How Sleep Affects Your Brain', 'https://www.youtube.com/embed/IzQ2siryQrM', '', 'Sleep', 'link'),
(157, 'What is Suicide?', 'https://www.youtube.com/embed/UtRvHv3wujo', '', 'Suicide', 'link'),
(158, 'How to Deal with Suicidal Thoughts', 'https://www.youtube.com/embed/W0x-7El07iw', '', 'Suicide', 'link'),
(159, 'Suicide Prevention: You are not alone', 'https://www.youtube.com/embed/i7eE5G5Baps', '', 'Suicide', 'link'),
(160, 'To Anyone Who Has Lost Hope in Life', 'https://www.youtube.com/embed/CXRxrYBgUIo', '', 'Suicide', 'link'),
(161, 'What are Warning Signs of Suicide?', 'https://www.youtube.com/embed/5uU_KziSBmc', '', 'Suicide', 'link'),
(162, '6 Signs Someone is Suicidal, Not Just Depressed', 'https://www.youtube.com/embed/a2R45LuUB_0', '', 'Suicide', 'link'),
(163, 'How to Help Someone Who is Suicidal', 'https://www.youtube.com/embed/B7dKgg4Z9tg', '', 'Suicide', 'link'),
(164, 'How to Manage Your Time Better', 'https://www.youtube.com/embed/VUk6LXRZMMk', '', 'Time Control', 'link'),
(165, 'The Philosophy of Time Management', 'https://www.youtube.com/embed/WXBA4eWskrc', '', 'Time Control', 'link'),
(166, 'A Simple Way To Take Control Of Your Time', 'https://www.youtube.com/embed/LAXxluS-2mI', '', 'Time Control', 'link'),
(167, 'Time Management for Students', 'https://www.youtube.com/embed/MBdEwK61wR0', '', 'Time Control', 'link'),
(168, 'Time Management for College Students', 'https://www.youtube.com/embed/2g_o-hRBeMA', '', 'Time Control', 'link'),
(169, 'Parkinson\'s Law - Manage Your Time', 'https://www.youtube.com/embed/tlddeUri3GM', '', 'Time Control', 'link'),
(170, '15 Tips To Manage Your Time Better', 'https://www.youtube.com/embed/GBM2k2zp-MQ', '', 'Time Control', 'link'),
(171, 'What is Trauma?', 'https://www.youtube.com/embed/uraDbhfFvsk', '', 'Trauma', 'link'),
(172, '5 Signs You Have Emotional Trauma', 'https://www.youtube.com/embed/SmbIcdJ0Zx8', '', 'Trauma', 'link'),
(173, 'Understanding Trauma', 'https://www.youtube.com/embed/FYx7HWoq7fE', '', 'Trauma', 'link'),
(174, 'Trauma For Kids and Teens', 'https://www.youtube.com/embed/zLVQUk_E2Fs', '', 'Trauma', 'link'),
(175, 'Childhood Trauma and the Brain', 'https://www.youtube.com/embed/xYBUY1kZpf8', '', 'Trauma', 'link'),
(176, 'The ROOT CAUSE Of Trauma', 'https://www.youtube.com/embed/OTQJmkXC2EI', '', 'Trauma', 'link'),
(177, 'Trauma Looks Like ADHD?', 'https://www.youtube.com/embed/pJB0Jq_mYdM', '', 'Trauma', 'link'),
(185, 'CGCS 101: What does the Center for Guidance and Counseling Office do when it comes to mental health concerns especially clinical cases?', '', 'GCrT7Bk1WhXA9NQFAIu5-PdQhFlEbmdjAAAF.mp4', 'CGCS 101', 'Upload'),
(187, 'CGCS 101: Normal Anxiety vs. Anxiety Disorder', '', '4322701429556414021692244458089776858610089n.mp4', 'CGCS 101', 'Upload'),
(188, 'Coming soon...', '', '435720793_1867895880331345_4822112229150180477_n.mp4', 'Soon', 'Upload'),
(190, 'Meet our stellar CGCS Guidance Associates! Ready to navigate the path to success for university students. From academic advice to career direction, we\'re here to empower and guide every step of the way. Let\'s achieve greatness together! ', '', 'Meet.mp4', 'new', 'Upload');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
