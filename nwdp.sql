/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.32 : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hospital`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add doctor',7,'add_doctor'),
(26,'Can change doctor',7,'change_doctor'),
(27,'Can delete doctor',7,'delete_doctor'),
(28,'Can view doctor',7,'view_doctor'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add med',9,'add_med'),
(34,'Can change med',9,'change_med'),
(35,'Can delete med',9,'delete_med'),
(36,'Can view med',9,'view_med'),
(37,'Can add nurse',10,'add_nurse'),
(38,'Can change nurse',10,'change_nurse'),
(39,'Can delete nurse',10,'delete_nurse'),
(40,'Can view nurse',10,'view_nurse'),
(41,'Can add patient',11,'add_patient'),
(42,'Can change patient',11,'change_patient'),
(43,'Can delete patient',11,'delete_patient'),
(44,'Can view patient',11,'view_patient'),
(45,'Can add today pat list',12,'add_todaypatlist'),
(46,'Can change today pat list',12,'change_todaypatlist'),
(47,'Can delete today pat list',12,'delete_todaypatlist'),
(48,'Can view today pat list',12,'view_todaypatlist'),
(49,'Can add test',13,'add_test'),
(50,'Can change test',13,'change_test'),
(51,'Can delete test',13,'delete_test'),
(52,'Can view test',13,'view_test'),
(53,'Can add receptionist',14,'add_receptionist'),
(54,'Can change receptionist',14,'change_receptionist'),
(55,'Can delete receptionist',14,'delete_receptionist'),
(56,'Can view receptionist',14,'view_receptionist'),
(57,'Can add pharm',15,'add_pharm'),
(58,'Can change pharm',15,'change_pharm'),
(59,'Can delete pharm',15,'delete_pharm'),
(60,'Can view pharm',15,'view_pharm'),
(61,'Can add mystatus',16,'add_mystatus'),
(62,'Can change mystatus',16,'change_mystatus'),
(63,'Can delete mystatus',16,'delete_mystatus'),
(64,'Can view mystatus',16,'view_mystatus'),
(65,'Can add medicines',17,'add_medicines'),
(66,'Can change medicines',17,'change_medicines'),
(67,'Can delete medicines',17,'delete_medicines'),
(68,'Can view medicines',17,'view_medicines'),
(69,'Can add booking',18,'add_booking'),
(70,'Can change booking',18,'change_booking'),
(71,'Can delete booking',18,'delete_booking'),
(72,'Can view booking',18,'view_booking');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(18,'Hospital_app','booking'),
(7,'Hospital_app','doctor'),
(8,'Hospital_app','login'),
(9,'Hospital_app','med'),
(17,'Hospital_app','medicines'),
(16,'Hospital_app','mystatus'),
(10,'Hospital_app','nurse'),
(11,'Hospital_app','patient'),
(15,'Hospital_app','pharm'),
(14,'Hospital_app','receptionist'),
(13,'Hospital_app','test'),
(12,'Hospital_app','todaypatlist'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'Hospital_app','0001_initial','2023-02-25 10:02:13.737140'),
(2,'contenttypes','0001_initial','2023-02-25 10:02:13.824698'),
(3,'auth','0001_initial','2023-02-25 10:02:14.370223'),
(4,'admin','0001_initial','2023-02-25 10:02:14.499530'),
(5,'admin','0002_logentry_remove_auto_add','2023-02-25 10:02:14.508506'),
(6,'admin','0003_logentry_add_action_flag_choices','2023-02-25 10:02:14.519663'),
(7,'contenttypes','0002_remove_content_type_name','2023-02-25 10:02:14.628862'),
(8,'auth','0002_alter_permission_name_max_length','2023-02-25 10:02:14.685430'),
(9,'auth','0003_alter_user_email_max_length','2023-02-25 10:02:14.723526'),
(10,'auth','0004_alter_user_username_opts','2023-02-25 10:02:14.735027'),
(11,'auth','0005_alter_user_last_login_null','2023-02-25 10:02:14.786152'),
(12,'auth','0006_require_contenttypes_0002','2023-02-25 10:02:14.790140'),
(13,'auth','0007_alter_validators_add_error_messages','2023-02-25 10:02:14.802394'),
(14,'auth','0008_alter_user_username_max_length','2023-02-25 10:02:14.863905'),
(15,'auth','0009_alter_user_last_name_max_length','2023-02-25 10:02:14.934210'),
(16,'auth','0010_alter_group_name_max_length','2023-02-25 10:02:14.955242'),
(17,'auth','0011_update_proxy_permissions','2023-02-25 10:02:14.974903'),
(18,'auth','0012_alter_user_first_name_max_length','2023-02-25 10:02:15.037164'),
(19,'sessions','0001_initial','2023-02-25 10:02:15.071075');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('1p8zkd84wbby2e7ikol78gh2ja2mkjlw','eyJsaWQiOjJ9:1pe8lg:ijwYppF2PLsVnr2XkCRZRkvN4k19KyHFm7ZpujWVKU4','2023-04-03 06:13:16.116072'),
('3h1mlw9c4zgfetetjllbs9awppsgzim2','eyJsaWQiOjN9:1pVvSE:V3tQebeYNE31kfydjkm4TM0OiYRni_j6YNC9r16vQXc','2023-03-11 14:23:14.673761'),
('3u2agwsvchiyor03qa6d71cco1xhlfnt','eyJsaWQiOjIsIm5pZCI6MX0:1pVw9t:UYzGbMYK2SNhdfA6i0SNjWOZ79iSvVherJKwALI6L34','2023-03-11 15:08:21.343961'),
('6g59yn61u9xipbx633pr5ufd2eybwqe0','eyJsaWQiOjIsInBhdGlkIjoxfQ:1pdOpa:lBTvqDNGkveXOSR7YJpmARpMLpYX3hOY_x16zjqmLxk','2023-04-01 05:10:14.055001'),
('8jo2cixr0m4g0ug99zz2ooh06fjm594f','eyJsaWQiOjQsImJvb2tpZCI6M30:1peW5u:uA9pPeQXUrYCmjoozPAgR2BUNf61JUt8RW-f9aN-Wu8','2023-04-04 07:07:42.403197'),
('9v9i6j4s842ocmjz2lets7a3wajcbuwf','eyJsaWQiOjMsInBhdGlkIjoxfQ:1pdXJ5:3GbgzI0eyPgrSQVhDq39Y98CmaOL1sBmxJv8cK4TGB0','2023-04-01 14:13:15.432460'),
('cvjnojwgr07u8frvswr5zzatt7h5v2y9','eyJsaWQiOjQsImRpZCI6MSwiYm9va2lkIjo0fQ:1phOfv:h61sCOHlN2PTX4jdKEP--q1vAZVfasgQ_zdEnBw2ho4','2023-04-12 05:48:47.520267'),
('glwlne814cbqkg9qmx41uhyttej2rp18','eyJib29raWQiOjQsImxpZCI6NH0:1peaGv:P1Y6NiSJcB7viTztzLroSuaPx4ozNocaiq-v4glYcmM','2023-04-04 11:35:21.194110'),
('h9vfj3t49ealwiikq40b80x40v00v2d3','eyJsaWQiOjIsImJvb2tpZCI6Mn0:1peWif:DRkh2xPUGyBM2bFIkLifygcsYDBGUQxYx-eV4A0QgnY','2023-04-04 07:47:45.946362'),
('i6fbjcralxandoy84g0bc7yma867szr6','eyJsaWQiOjF9:1piBKO:a9qsL9UCkIhSjbr59Ml11hJV9dk2iAIQ3nnHJANzRIg','2023-04-14 09:45:48.342536'),
('ou4zqs2krmnaz0xrm576f3tfikw32xyx','eyJsaWQiOjIsInBhdGlkIjoxfQ:1pdPjH:2uRxl5hTBXo4le7H4fAfmtBPAmp2sssSZ5gELIOKbgU','2023-04-01 06:07:47.857394'),
('rlhuag65fhdn2wf1x675xtb6g4n0cqtg','eyJsaWQiOjYsImJvb2tpZCI6NX0:1peZgX:9HTRQWi15dTN0ACSEQBqq2-NyesGAxn6FWfGQYUts6U','2023-04-04 10:57:45.594761'),
('x9minxvsji4gtwbbsjo3ogvxtsxsad3q','eyJsaWQiOjF9:1pdPFd:Zi1U05bDwlhiCmMxV_7car8pZYxahbr-AJbXpYoIh3I','2023-04-01 05:37:09.894959'),
('xopxwvtnpu2j16gchegh18fyl7utnql2','eyJsaWQiOjIsInBhdGlkIjoyLCJib29raWQiOjJ9:1peHKA:vWUGJctXSWRlcYwg7jO7U05m6Uh6BwNtD7-KbuOlFmY','2023-04-03 15:21:26.176471'),
('zm2agxdm62arecol87ec0rn5jvrnpzbe','eyJsaWQiOjIsImJvb2tpZCI6Mn0:1peTiu:-gHWQdWDsGrRAlu6xX5Gal0h4PojOUfdwRpQY6i3gKE','2023-04-04 04:35:48.567201');

/*Table structure for table `hospital_app_booking` */

DROP TABLE IF EXISTS `hospital_app_booking`;

CREATE TABLE `hospital_app_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reg_date` date NOT NULL,
  `reg_time` time(6) NOT NULL,
  `token_number` int NOT NULL,
  `doctorid_id` bigint NOT NULL,
  `patientid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_booking_doctorid_id_9e3a69af_fk_Hospital_` (`doctorid_id`),
  KEY `Hospital_app_booking_patientid_id_265b1b2b_fk_Hospital_` (`patientid_id`),
  CONSTRAINT `Hospital_app_booking_doctorid_id_9e3a69af_fk_Hospital_` FOREIGN KEY (`doctorid_id`) REFERENCES `hospital_app_doctor` (`id`),
  CONSTRAINT `Hospital_app_booking_patientid_id_265b1b2b_fk_Hospital_` FOREIGN KEY (`patientid_id`) REFERENCES `hospital_app_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_booking` */

insert  into `hospital_app_booking`(`id`,`reg_date`,`reg_time`,`token_number`,`doctorid_id`,`patientid_id`) values 
(2,'2023-03-01','20:35:00.000000',1,2,4),
(3,'2023-03-05','00:34:00.000000',5,2,5),
(4,'2023-03-08','04:24:00.000000',20,1,5),
(5,'2023-03-30','16:29:00.000000',20,2,6);

/*Table structure for table `hospital_app_doctor` */

DROP TABLE IF EXISTS `hospital_app_doctor`;

CREATE TABLE `hospital_app_doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `deptName_id` varchar(50) NOT NULL,
  `contact_no` bigint NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_doctor_lid_id_724bb877_fk_Hospital_app_login_id` (`lid_id`),
  CONSTRAINT `Hospital_app_doctor_lid_id_724bb877_fk_Hospital_app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `hospital_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_doctor` */

insert  into `hospital_app_doctor`(`id`,`Fname`,`Lname`,`qualification`,`deptName_id`,`contact_no`,`email_id`,`place`,`post_office`,`pin_code`,`dob`,`gender`,`lid_id`) values 
(1,'navya','nk','mbbs','general',8798098767,'navya@gmail.com','pang','pookodu',678987,'2023-02-17','female',2),
(2,'hari','jayakrishna','mds','orthogonist',8945972123,'hari@gmail.com','manjeri','pang',675687,'2023-04-07','male',6);

/*Table structure for table `hospital_app_login` */

DROP TABLE IF EXISTS `hospital_app_login`;

CREATE TABLE `hospital_app_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_login` */

insert  into `hospital_app_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'navya','123','doctor'),
(3,'faaiqua','123','receptionist'),
(4,'aiswarya','123','nurse'),
(5,'ashmina','123','pharmasist'),
(6,'hari','123','doctor'),
(7,'anju','123','pharmasist');

/*Table structure for table `hospital_app_med` */

DROP TABLE IF EXISTS `hospital_app_med`;

CREATE TABLE `hospital_app_med` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicine_names` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_med` */

insert  into `hospital_app_med`(`id`,`medicine_names`) values 
(2,'paracitamol'),
(4,'ranitidin');

/*Table structure for table `hospital_app_medicines` */

DROP TABLE IF EXISTS `hospital_app_medicines`;

CREATE TABLE `hospital_app_medicines` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicine` varchar(50) NOT NULL,
  `medicine_dosage` varchar(50) NOT NULL,
  `bill_amount` varchar(50) NOT NULL,
  `doctorid_id` bigint NOT NULL,
  `patientid_id` bigint NOT NULL,
  `pharmasistid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_medicin_doctorid_id_191ce7d9_fk_Hospital_` (`doctorid_id`),
  KEY `Hospital_app_medicin_patientid_id_3d8e6216_fk_Hospital_` (`patientid_id`),
  KEY `Hospital_app_medicin_pharmasistid_id_5ca95443_fk_Hospital_` (`pharmasistid_id`),
  CONSTRAINT `Hospital_app_medicin_doctorid_id_191ce7d9_fk_Hospital_` FOREIGN KEY (`doctorid_id`) REFERENCES `hospital_app_doctor` (`id`),
  CONSTRAINT `Hospital_app_medicin_patientid_id_3d8e6216_fk_Hospital_` FOREIGN KEY (`patientid_id`) REFERENCES `hospital_app_patient` (`id`),
  CONSTRAINT `Hospital_app_medicin_pharmasistid_id_5ca95443_fk_Hospital_` FOREIGN KEY (`pharmasistid_id`) REFERENCES `hospital_app_pharm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_medicines` */

/*Table structure for table `hospital_app_mystatus` */

DROP TABLE IF EXISTS `hospital_app_mystatus`;

CREATE TABLE `hospital_app_mystatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `leave_on` varchar(50) NOT NULL,
  `not_available_at` time(6) NOT NULL,
  `op_time` time(6) NOT NULL,
  `no_patient_fornoon` int NOT NULL,
  `no_patient_afternoon` int NOT NULL,
  `doctorid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_mystatu_doctorid_id_f004f558_fk_Hospital_` (`doctorid_id`),
  CONSTRAINT `Hospital_app_mystatu_doctorid_id_f004f558_fk_Hospital_` FOREIGN KEY (`doctorid_id`) REFERENCES `hospital_app_doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_mystatus` */

insert  into `hospital_app_mystatus`(`id`,`leave_on`,`not_available_at`,`op_time`,`no_patient_fornoon`,`no_patient_afternoon`,`doctorid_id`) values 
(4,'monday','01:46:00.000000','15:46:00.000000',4,11,1),
(5,'thuesday','02:35:00.000000','00:36:00.000000',3,14,2);

/*Table structure for table `hospital_app_nurse` */

DROP TABLE IF EXISTS `hospital_app_nurse`;

CREATE TABLE `hospital_app_nurse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `deptName` varchar(50) NOT NULL,
  `contact_no` bigint NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_nurse_lid_id_1b10e77e_fk_Hospital_app_login_id` (`lid_id`),
  CONSTRAINT `Hospital_app_nurse_lid_id_1b10e77e_fk_Hospital_app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `hospital_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_nurse` */

insert  into `hospital_app_nurse`(`id`,`Fname`,`Lname`,`deptName`,`contact_no`,`email_id`,`place`,`post_office`,`pin_code`,`dob`,`gender`,`lid_id`) values 
(1,'aiswarya','c','x ray',9876543245,'aishu@gmail.com','manjeri','morayoor',678967,'2023-02-06','female',4);

/*Table structure for table `hospital_app_patient` */

DROP TABLE IF EXISTS `hospital_app_patient`;

CREATE TABLE `hospital_app_patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `phone_number` bigint NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `blood_gp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_patient` */

insert  into `hospital_app_patient`(`id`,`Fname`,`date`,`Lname`,`place`,`post_office`,`pin_code`,`phone_number`,`gender`,`dob`,`email_id`,`blood_gp`) values 
(4,'arathy','2023-03-20','daas','manjery','morayoor',678967,9876543245,'female','2023-03-15','karthika@gmail.com','o+'),
(5,'aiswarya','2023-03-21','daas','manjeri','morayoor',632355,9876543210,'female','2023-03-17','navyank001@gmail.com','A-'),
(6,'fahad','2023-03-21','fazil','kannur','manjeri',987654,9234567890,'male','2023-03-17','sdfghjk@gmail.com','A-');

/*Table structure for table `hospital_app_pharm` */

DROP TABLE IF EXISTS `hospital_app_pharm`;

CREATE TABLE `hospital_app_pharm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `phone_number` bigint NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_pharm_lid_id_0c11f691_fk_Hospital_app_login_id` (`lid_id`),
  CONSTRAINT `Hospital_app_pharm_lid_id_0c11f691_fk_Hospital_app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `hospital_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_pharm` */

insert  into `hospital_app_pharm`(`id`,`Fname`,`Lname`,`place`,`post_office`,`pin_code`,`phone_number`,`gender`,`dob`,`email_id`,`lid_id`) values 
(1,'anjana','unni','kannur','manjeri',678972,8943646675,'radiobutton','2023-03-02','anjanaraj@gmail.com',7);

/*Table structure for table `hospital_app_receptionist` */

DROP TABLE IF EXISTS `hospital_app_receptionist`;

CREATE TABLE `hospital_app_receptionist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post_office` varchar(50) NOT NULL,
  `pin_code` int NOT NULL,
  `phone_number` bigint NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hospital_app_recepti_lid_id_22e9d7d3_fk_Hospital_` (`lid_id`),
  CONSTRAINT `Hospital_app_recepti_lid_id_22e9d7d3_fk_Hospital_` FOREIGN KEY (`lid_id`) REFERENCES `hospital_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_receptionist` */

insert  into `hospital_app_receptionist`(`id`,`Fname`,`Lname`,`place`,`post_office`,`pin_code`,`phone_number`,`gender`,`dob`,`email_id`,`lid_id`) values 
(1,'faaiquathu','nayyira','mogam','kondotty',678790,9878765609,'female','2023-02-21','faaiqua@gmail.com',3);

/*Table structure for table `hospital_app_test` */

DROP TABLE IF EXISTS `hospital_app_test`;

CREATE TABLE `hospital_app_test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `testName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hospital_app_test` */

insert  into `hospital_app_test`(`id`,`testName`) values 
(1,'x-ray'),
(2,'blood test');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
