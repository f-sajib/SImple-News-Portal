<?php
require_once __DIR__ . "/../config.php";






/* User Table*/

$sql = "CREATE TABLE IF NOT EXISTS `users` (
		`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		`username` varchar(25) NOT NULL,
		`password` varchar(255) NOT NULL,
		`email` varchar(100) NOT NULL,
		`type` integer(2) NOT NULL,
		`created_at`DateTime,
		PRIMARY KEY (`id`),
		UNIQUE KEY `email` (`email`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1";





/* Category Table*/

$sql = "CREATE TABLE IF NOT EXISTS `categories` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(25) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1";





/* Insert Category into categories Table*/

$sql = "INSERT INTO categories(name) 
		VALUES ('Business'),('Entertainment'),('Politics'),('Religion'),('Science'),('Sports'),('Technology'),('Travel'),('Others')";




/* News Table*/

$sql = "CREATE TABLE IF NOT EXISTS `news` (
		`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		`title` varchar(25) NOT NULL,
		`details` TEXT NOT NULL,
		`image` varchar(255) NOT NULL,
		`user_id` integer(2) NOT NULL,
		`category_id` integer(2) NOT NULL,
		`created_at`DateTime,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1";



/* Comments Table */

$sql = "CREATE TABLE IF NOT EXISTS `comments` (
		`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
		`comment` TEXT NOT NULL,
		`user_id` integer(10) NOT NULL,
		`category_id` integer(10) NOT NULL,
		`created_at`DateTime,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1";




if ($conn->query($sql)) {
    printf("Table created successfully.<br />");
}
    
if ($conn->errno) {
    printf("Could not create table: %s<br />", $conn->error);
}

?>