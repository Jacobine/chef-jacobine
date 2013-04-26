CREATE DATABASE IF NOT EXISTS `typo3`;

USE `typo3`;

CREATE TABLE IF NOT EXISTS `versions` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`branch` varchar(4) DEFAULT NULL,
	`version` varchar(13) DEFAULT NULL,
	`date` varchar(23) DEFAULT NULL,
	`type` varchar(11) DEFAULT NULL,
	`checksum_tar_md5` varchar(32) DEFAULT NULL,
	`checksum_tar_sha1` varchar(40) DEFAULT NULL,
	`checksum_zip_md5` varchar(32) DEFAULT NULL,
	`checksum_zip_sha1` varchar(40) DEFAULT NULL,
	`url_tar` varchar(40) DEFAULT NULL,
	`url_zip` varchar(40) DEFAULT NULL,
	`downloaded` tinyint(1) DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;