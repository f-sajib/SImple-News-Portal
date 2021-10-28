# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 23.251.156.9 (MySQL 8.0.18-google)
# Database: crowdfundly
# Generation Time: 2021-02-25 10:53:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `currency_id` int(10) unsigned NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `donation_amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'namespace of offline or online contribution',
  `resource_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of offline or online contribution',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table app_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_logs`;

CREATE TABLE `app_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table application_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `application_settings`;

CREATE TABLE `application_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `donation` json DEFAULT NULL,
  `agora` json DEFAULT NULL,
  `youtube` json DEFAULT NULL,
  `google` json DEFAULT NULL,
  `ads` json DEFAULT NULL,
  `storage` json DEFAULT NULL,
  `ads_section_description` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table badges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badges`;

CREATE TABLE `badges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  `based_on` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table business_campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `business_campaigns`;

CREATE TABLE `business_campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `campaign_type_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_campaigns_campaign_id_foreign` (`campaign_id`),
  CONSTRAINT `business_campaigns_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_ads_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_ads_settings`;

CREATE TABLE `campaign_ads_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `settings` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_contact_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_contact_requests`;

CREATE TABLE `campaign_contact_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_donation_reminders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_donation_reminders`;

CREATE TABLE `campaign_donation_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hours_after` int(11) NOT NULL COMMENT 'reminder to be sent after hours of created_at',
  `receiver_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_reminded` tinyint(1) NOT NULL DEFAULT '0',
  `campaign_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_logs`;

CREATE TABLE `campaign_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_offers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_offers`;

CREATE TABLE `campaign_offers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(16,2) DEFAULT NULL,
  `offer_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `stock` int(11) NOT NULL DEFAULT '0',
  `description` json DEFAULT NULL,
  `is_shipping` tinyint(3) unsigned DEFAULT NULL,
  `shipping_info` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign_offers_campaign_id_type_campaign_id_id_index` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_presets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_presets`;

CREATE TABLE `campaign_presets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '1',
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SGD',
  `amount` decimal(16,2) NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S$',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_reports`;

CREATE TABLE `campaign_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `knows_fundraiser` tinyint(1) NOT NULL DEFAULT '0',
  `relationship_explanation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reporter_type` tinyint(4) NOT NULL DEFAULT '4' COMMENT '1=>donor,beneficiary=>2,individual=>3,other=>4',
  `report` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `legal_dispute_to_fundraiser` tinyint(1) NOT NULL DEFAULT '0',
  `violates_rule` tinyint(1) NOT NULL DEFAULT '0',
  `campaign_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_settings`;

CREATE TABLE `campaign_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `settings` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_type_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_type_requests`;

CREATE TABLE `campaign_type_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requested_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_requested` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` int(11) NOT NULL DEFAULT '2' COMMENT '1=>charity, 2=>business',
  `creator_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_types`;

CREATE TABLE `campaign_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint(4) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>charity, 2=>business etc',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'full font awesome icon. eg. fa fa-user',
  `organization_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaign_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_updates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_updates`;

CREATE TABLE `campaign_updates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2',
  `status_updated_by` int(10) unsigned DEFAULT NULL COMMENT 'id of the users table.',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_verification_opinions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_verification_opinions`;

CREATE TABLE `campaign_verification_opinions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_verification_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaign_verifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_verifications`;

CREATE TABLE `campaign_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `is_lawyer_verification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaigns`;

CREATE TABLE `campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_amount` decimal(16,2) NOT NULL,
  `raised_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `offline_raised_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `message_to_donor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `endorsement_count` int(10) unsigned NOT NULL DEFAULT '0',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '1',
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SGD',
  `country_id` int(10) unsigned DEFAULT NULL,
  `organization_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `story` json DEFAULT NULL,
  `gallery_sequence` json DEFAULT NULL,
  `donations_count` int(10) unsigned NOT NULL DEFAULT '0',
  `flyer_summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `conversation_id` int(11) DEFAULT NULL,
  `organization_id` bigint(20) unsigned DEFAULT NULL,
  `currency_symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S$',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'campaign type, eg. charity, business etc',
  `target_date` datetime DEFAULT NULL,
  `is_expired` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = not expired and notification not sent',
  `target_amount_raised` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaigns_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table charity_campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `charity_campaigns`;

CREATE TABLE `charity_campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `campaign_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `charity_campaigns_campaign_id_foreign` (`campaign_id`),
  KEY `charity_campaigns_campaign_type_id_foreign` (`campaign_type_id`),
  CONSTRAINT `charity_campaigns_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`),
  CONSTRAINT `charity_campaigns_campaign_type_id_foreign` FOREIGN KEY (`campaign_type_id`) REFERENCES `campaign_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table chat_presets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chat_presets`;

CREATE TABLE `chat_presets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table conversation_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversation_messages`;

CREATE TABLE `conversation_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversation_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sender_is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `sender_is_fundraiser` tinyint(1) NOT NULL DEFAULT '0',
  `sender_is_lawyer` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table conversations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `conversations`;

CREATE TABLE `conversations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizenship` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_mobile_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table coupon_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupon_codes`;

CREATE TABLE `coupon_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` enum('crowdfundly','appsumo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'crowdfundly',
  `is_percentage_discount` tinyint(1) NOT NULL,
  `discount_amount` int(11) NOT NULL COMMENT 'Amount in cents.',
  `min_purchase` decimal(8,2) DEFAULT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `used_quantity` int(11) NOT NULL DEFAULT '0',
  `monthly_duration` tinyint(4) NOT NULL DEFAULT '1',
  `usage_type` enum('once','forever','repeating') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'once',
  `timestamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_coupon_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lifetime` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency icon image if any',
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_base_currency` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>enabled; 0=>disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supported_gateways` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;

INSERT INTO `currencies` (`id`, `name`, `icon`, `currency_code`, `symbol`, `is_base_currency`, `status`, `created_at`, `updated_at`, `supported_gateways`)
VALUES
	(1,'Afghanistan',NULL,'AFN','؋',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(2,'Albania',NULL,'ALL','Lek',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(3,'Algeria',NULL,'DZD','دج',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(4,'American Samoa',NULL,'USD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(5,'Andorra',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(6,'Angola',NULL,'AOA','Kz',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(7,'Antigua and Barbuda',NULL,'XCD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(8,'Azerbaijan',NULL,'AZN','₼',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(9,'Argentina',NULL,'ARS','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(10,'Australia',NULL,'AUD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(11,'Austria',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(12,'Bahamas',NULL,'BSD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(13,'Bangladesh',NULL,'BDT','৳',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"sslcommerz\", \"aamarpay\"]'),
	(14,'Armenia',NULL,'AMD','֏',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(15,'Barbados',NULL,'BBD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(16,'Belgium',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(17,'Bermuda',NULL,'BMD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(18,'Bolivia, Plurinational State of',NULL,'BOB','$b',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(19,'Bosnia and Herzegovina',NULL,'BAM','KM',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(20,'Botswana',NULL,'BWP','P',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(21,'Brazil',NULL,'BRL','R$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(22,'Belize',NULL,'BZD','BZ$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(23,'British Indian Ocean Territory',NULL,'USD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(24,'Solomon Islands',NULL,'SBD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(25,'Virgin Islands, British',NULL,'USD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(26,'Brunei Darussalam',NULL,'BND','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(27,'Bulgaria',NULL,'BGN','лв',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(28,'Myanmar',NULL,'MMK','K',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(29,'Burundi',NULL,'BIF','FBu',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(30,'Cambodia',NULL,'KHR','៛',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(31,'Cameroon',NULL,'XAF','FCF',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(32,'Canada',NULL,'CAD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(33,'Cape Verde',NULL,'CVE','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(34,'Cayman Islands',NULL,'KYD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(35,'Central African Republic',NULL,'XAF','CFA',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(36,'Sri Lanka',NULL,'LKR','₨',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(37,'Chad',NULL,'XAF','FCFA',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(38,'Chile',NULL,'CLP','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(39,'China',NULL,'CNY','¥',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(40,'Taiwan, Province of China',NULL,'TWD','NT$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(41,'Christmas Island',NULL,'AUD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(42,'Cocos (Keeling) Islands',NULL,'AUD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(43,'Colombia',NULL,'COP','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(44,'Comoros',NULL,'KMF','CF',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(45,'Mayotte',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(46,'Congo',NULL,'XAF','FCF',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(47,'Congo, the Democratic Republic of the',NULL,'CDF','FC',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(48,'Cook Islands',NULL,'NZD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(49,'Costa Rica',NULL,'CRC','₡',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(50,'Croatia',NULL,'HRK','kn',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(51,'Cyprus',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(52,'Czech Republic',NULL,'CZK','Kč',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(53,'Benin',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(54,'Denmark',NULL,'DKK','kr',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(55,'Dominica',NULL,'XCD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(56,'Dominican Republic',NULL,'DOP','RD$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(57,'Ecuador',NULL,'USD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(58,'Equatorial Guinea',NULL,'XAF','FCF',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(59,'Ethiopia',NULL,'ETB','ብር',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(60,'Estonia',NULL,'EEK','kr',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(61,'Faroe Islands',NULL,'DKK','kr',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(62,'Falkland Islands (Malvinas)',NULL,'FKP','£',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(63,'Fiji',NULL,'FJD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(64,'Finland',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(65,'Åland Islands',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(66,'France',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(67,'French Guiana',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(68,'French Polynesia',NULL,'XPF','XPF',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(69,'French Southern Territories',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(70,'Djibouti',NULL,'DJF','Fdj',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(71,'Gabon',NULL,'XAF','FCF',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(72,'Georgia',NULL,'GEL','₾',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(73,'Gambia',NULL,'GMD','D',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(74,'Germany',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(75,'Gibraltar',NULL,'GIP','£',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(76,'Kiribati',NULL,'AUD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(77,'Greece',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(78,'Greenland',NULL,'DKK','kr',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(79,'Grenada',NULL,'XCD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(80,'Guadeloupe',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(81,'Guam',NULL,'USD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(82,'Guatemala',NULL,'GTQ','Q',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(83,'Guinea',NULL,'GNF','FG',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(84,'Guyana',NULL,'GYD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(85,'Haiti',NULL,'HTG','G',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(86,'Holy See (Vatican City State)',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(87,'Honduras',NULL,'HNL','L',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(88,'Hong Kong',NULL,'HKD','$',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(89,'Hungary',NULL,'HUF','Ft',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(90,'Iceland',NULL,'ISK','kr',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(91,'India',NULL,'INR','₹',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(92,'Indonesia',NULL,'IDR','Rp',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\"]'),
	(93,'Ireland',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(94,'Israel',NULL,'ILS','₪',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(95,'Italy',NULL,'EUR','€',0,1,'2021-01-21 14:08:30','2021-01-21 14:08:30','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(96,'Côte d\'Ivoire',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(97,'Jamaica',NULL,'JMD','J$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(98,'Japan',NULL,'JPY','¥',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(99,'Kazakhstan',NULL,'KZT','лв',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(100,'Kenya',NULL,'KES','KSh',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(101,'Korea, Republic of',NULL,'KRW','₩',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(102,'Kyrgyzstan',NULL,'KGS','лв',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(103,'Lao People\'s Democratic Republic',NULL,'LAK','₭',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(104,'Lebanon',NULL,'LBP','£',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(105,'Lesotho',NULL,'LSL','L',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(106,'Latvia',NULL,'LVL','Ls',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(107,'Liberia',NULL,'LRD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(108,'Liechtenstein',NULL,'CHF','CHF',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(109,'Lithuania',NULL,'EUR','Lt',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(110,'Luxembourg',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(111,'Macao',NULL,'MOP','MOP',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(112,'Madagascar',NULL,'MGA','Ar',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(113,'Malawi',NULL,'MWK','MK',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(114,'Malaysia',NULL,'MYR','RM',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(115,'Maldives',NULL,'MVR','Rf',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(116,'Mali',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(117,'Malta',NULL,'MTL','₤',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(118,'Martinique',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(119,'Mauritania',NULL,'MRO','UM',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(120,'Mauritius',NULL,'MUR','₨',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(121,'Mexico',NULL,'MXN','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(122,'Monaco',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(123,'Mongolia',NULL,'MNT','₮',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(124,'Moldova, Republic of',NULL,'MDL','L',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(125,'Montenegro',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(126,'Montserrat',NULL,'XCD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(127,'Morocco',NULL,'MAD','DH',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(128,'Mozambique',NULL,'MZN','MT',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(129,'Namibia',NULL,'NAD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(130,'Nauru',NULL,'AUD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(131,'Nepal',NULL,'NPR','₨',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(132,'Netherlands',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(133,'Curaçao',NULL,'ANG',NULL,0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(134,'Aruba',NULL,'AWG','ƒ',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(135,'Sint Maarten (Dutch part)',NULL,'ANG',NULL,0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(136,'Bonaire, Sint Eustatius and Saba',NULL,'USD',NULL,0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(137,'New Caledonia',NULL,'XPF','XPF',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(138,'Vanuatu',NULL,'VUV','Vt',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(139,'New Zealand',NULL,'NZD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(140,'Nicaragua',NULL,'NIO','C$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(141,'Niger',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(142,'Nigeria',NULL,'NGN','₦',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(143,'Niue',NULL,'NZD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(144,'Norfolk Island',NULL,'AUD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(145,'Norway',NULL,'NOK','kr',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(146,'Northern Mariana Islands',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(147,'United States Minor Outlying Islands',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(148,'Micronesia, Federated States of',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(149,'Marshall Islands',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(150,'Palau',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(151,'Pakistan',NULL,'PKR','₨',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(152,'Panama',NULL,'PAB','B/.',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(153,'Papua New Guinea',NULL,'PGK','K',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(154,'Paraguay',NULL,'PYG','Gs',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(155,'Peru',NULL,'PEN','S/.',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(156,'Philippines',NULL,'PHP','₱',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(157,'Pitcairn',NULL,'NZD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(158,'Poland',NULL,'PLN','zł',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(159,'Portugal',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(160,'Guinea-Bissau',NULL,'XOF','XOF',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(161,'Timor-Leste',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(162,'Puerto Rico',NULL,'USD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(163,'Qatar',NULL,'QAR','﷼',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(164,'Réunion',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(165,'Romania',NULL,'RON','lei',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(166,'Russian Federation',NULL,'RUB','руб',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(167,'Rwanda',NULL,'RWF','FRw',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(168,'Saint Barthélemy',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(169,'Saint Helena, Ascension and Tristan da Cunha',NULL,'SHP','£',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(170,'Saint Kitts and Nevis',NULL,'XCD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(171,'Anguilla',NULL,'XCD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(172,'Saint Lucia',NULL,'XCD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(173,'Saint Martin (French part)',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(174,'Saint Pierre and Miquelon',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(175,'Saint Vincent and the Grenadines',NULL,'XCD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(176,'San Marino',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(177,'Sao Tome and Principe',NULL,'STD','Db',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(178,'Saudi Arabia',NULL,'SAR','﷼',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(179,'Senegal',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(180,'Serbia',NULL,'RSD','дин',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(181,'Seychelles',NULL,'SCR','₨',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(182,'Sierra Leone',NULL,'SLL','Le',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(183,'Singapore',NULL,'SGD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(184,'Slovakia',NULL,'EUR','Sk',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(185,'Viet Nam',NULL,'VND','₫',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(186,'Slovenia',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(187,'Somalia',NULL,'SOS','S',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(188,'South Africa',NULL,'ZAR','R',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(189,'Spain',NULL,'EUR','€',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(190,'Western Sahara',NULL,'MAD','MAD',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(191,'Suriname',NULL,'SRD','$',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(192,'Svalbard and Jan Mayen',NULL,'NOK','kr',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(193,'Swaziland',NULL,'SZL','E',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(194,'Sweden',NULL,'SEK','kr',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(195,'Switzerland',NULL,'CHF','CHF',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(196,'Tajikistan',NULL,'TJS','SM',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(197,'Thailand',NULL,'THB','฿',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(198,'Togo',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:31','2021-01-21 14:08:31','[\"stripe_connect\", \"stripe\"]'),
	(199,'Tokelau',NULL,'NZD','$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(200,'Tonga',NULL,'TOP','T$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(201,'Trinidad and Tobago',NULL,'TTD','TT$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(202,'United Arab Emirates',NULL,'AED','د.إ',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(203,'Turkey',NULL,'TRY','₺',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(204,'Turks and Caicos Islands',NULL,'USD','$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(205,'Tuvalu',NULL,'AUD','$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(206,'Uganda',NULL,'UGX','USh',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(207,'Ukraine',NULL,'UAH','₴',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(208,'Macedonia, the former Yugoslav Republic of',NULL,'MKD','ден',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(209,'Egypt',NULL,'EGP','£',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(210,'United Kingdom',NULL,'GBP','£',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(211,'Tanzania, United Republic of',NULL,'TZS','TZS',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(212,'United States',NULL,'USD','$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(213,'Virgin Islands, U.S.',NULL,'USD','$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\", \"paypal\"]'),
	(214,'Burkina Faso',NULL,'XOF','CFA',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(215,'Uruguay',NULL,'UYU','$U',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(216,'Uzbekistan',NULL,'UZS','лв',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(217,'Wallis and Futuna',NULL,'XPF','XPF',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(218,'Samoa',NULL,'WST','WS$',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(219,'Yemen',NULL,'YER','﷼',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]'),
	(220,'Zambia',NULL,'ZMW','ZK',0,1,'2021-01-21 14:08:32','2021-01-21 14:08:32','[\"stripe_connect\", \"stripe\"]');

/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table default_donation_presets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `default_donation_presets`;

CREATE TABLE `default_donation_presets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(16,2) NOT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table donation_refunds
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donation_refunds`;

CREATE TABLE `donation_refunds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `donation_id` bigint(20) unsigned NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_user_id` bigint(20) unsigned NOT NULL,
  `tracking_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'note by donor while making request',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'admin note while cancel or refund',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>pending, 1=>refunded, 2=>cancelled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table donations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donations`;

CREATE TABLE `donations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `tip_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>success;2=>refund requested,3=>refunded',
  `donation_amount` decimal(16,2) NOT NULL COMMENT 'Amount - tip amount.',
  `receiver_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `organization_fee` decimal(16,2) NOT NULL DEFAULT '0.00',
  `amount_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `tip_amount_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `donation_amount_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `organization_fee_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `usd_exchange_rate` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount` decimal(16,2) DEFAULT NULL,
  `shipping_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_amount_in_cent` decimal(16,2) DEFAULT NULL,
  `offer_info` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table endorsements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `endorsements`;

CREATE TABLE `endorsements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `relation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Relation to fund-raiser/fund-raiser authority.',
  `campaign_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Current status of the endorsement.Whether it is accepted or not.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table featured_brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `featured_brands`;

CREATE TABLE `featured_brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `featured_brands_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table featured_campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `featured_campaigns`;

CREATE TABLE `featured_campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '#ec7070',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table fundraisers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fundraisers`;

CREATE TABLE `fundraisers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `is_co_fundraiser` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `has_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fundraisers_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table home_banners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `home_banners`;

CREATE TABLE `home_banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table lawyer_skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lawyer_skills`;

CREATE TABLE `lawyer_skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lawyer_id` int(10) unsigned NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table lawyers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lawyers`;

CREATE TABLE `lawyers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_status` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `firm_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firm_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table licence_transfer_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `licence_transfer_logs`;

CREATE TABLE `licence_transfer_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `licence_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table licences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `licences`;

CREATE TABLE `licences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `redeemed_at` timestamp NULL DEFAULT NULL,
  `subscription_log_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table medias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medias`;

CREATE TABLE `medias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Model path for polymorphic relationship.',
  `source_id` int(10) unsigned NOT NULL COMMENT 'Row id of the specified model',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename',
  `source_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Absolute path of the uploaded source file.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `media_type` tinyint(4) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT 'The sender id',
  `is_fundraisers` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table offline_donations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offline_donations`;

CREATE TABLE `offline_donations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table organization_contents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organization_contents`;

CREATE TABLE `organization_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'eg. 1=> page',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 =>inactive, 1=>active',
  `organization_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table organization_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organization_settings`;

CREATE TABLE `organization_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `donation` json DEFAULT NULL,
  `organization_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fundraiser` json DEFAULT NULL,
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table organizations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organizations`;

CREATE TABLE `organizations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country_id` int(10) unsigned DEFAULT NULL,
  `contact_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number_code` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `currency_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `currency_symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `sslcom_store_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sslcom_store_passwd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_client_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `paypal_client_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `personal_stripe_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_stripe_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_stripe` tinyint(4) DEFAULT NULL COMMENT 'value between 1,5',
  `aamarpay_store_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `aamarpay_signature_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_subscription_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_user_subscription_id_unique` (`user_subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table packages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `packages`;

CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discounted_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payout_methods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payout_methods`;

CREATE TABLE `payout_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fundraiser_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `beneficiary_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table payouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payouts`;

CREATE TABLE `payouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) NOT NULL,
  `fundraiser_id` bigint(20) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `denial_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_method` tinyint(4) NOT NULL DEFAULT '1',
  `payment_sent_at` timestamp NULL DEFAULT NULL,
  `payment_received_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table rankings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rankings`;

CREATE TABLE `rankings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table rejections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rejections`;

CREATE TABLE `rejections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT 'Rejected by',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_permissions`;

CREATE TABLE `role_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table social_networks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_networks`;

CREATE TABLE `social_networks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table social_profiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_profiles`;

CREATE TABLE `social_profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Model namespace for polymorphic relationship.',
  `resource_id` int(10) unsigned NOT NULL COMMENT 'primary key of of the specified model',
  `social_network_id` int(10) unsigned NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table stripe_invoice_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stripe_invoice_logs`;

CREATE TABLE `stripe_invoice_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `organization_id` bigint(20) unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `invoice_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stripe_invoice_logs_user_id_index` (`user_id`),
  KEY `stripe_invoice_logs_organization_id_index` (`organization_id`),
  CONSTRAINT `stripe_invoice_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subscription_charge_donations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription_charge_donations`;

CREATE TABLE `subscription_charge_donations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_charge_id` bigint(20) unsigned NOT NULL,
  `donation_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subscription_charges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription_charges`;

CREATE TABLE `subscription_charges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `used_price_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charged_amount` bigint(20) NOT NULL COMMENT 'cent',
  `org_received_amount` bigint(20) NOT NULL COMMENT 'cent',
  `base_price` bigint(20) NOT NULL COMMENT 'cent',
  `stripe_subscription_item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subscription_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription_items`;

CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  KEY `subscription_items_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subscription_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription_logs`;

CREATE TABLE `subscription_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_plan_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_plan_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_sumo_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `revoked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `resource` json DEFAULT NULL,
  `stripe_customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `user_subscription_id` bigint(20) unsigned DEFAULT NULL,
  `tnx_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_logs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table suspension_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suspension_requests`;

CREATE TABLE `suspension_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL COMMENT 'User id of the user who requested.',
  `action_taken_by` int(11) DEFAULT NULL COMMENT 'User id of the user who takes action(accepts or rejects)',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table team_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_roles`;

CREATE TABLE `team_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) unsigned NOT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table team_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_users`;

CREATE TABLE `team_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `modules` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NOT NULL,
  `organization_account_id` int(11) NOT NULL,
  `fundraiser_id` int(11) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacted_amount` decimal(16,2) NOT NULL COMMENT 'total transacted amount.',
  `net_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `payment_gateway_processing_fee` decimal(16,2) NOT NULL DEFAULT '0.00',
  `organization_fee` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tip_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `source_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` tinyint(4) NOT NULL COMMENT 'reference: Enums/Action',
  `source` tinyint(4) NOT NULL COMMENT 'reference: Enums/Source',
  `escrow_ends_at` timestamp NOT NULL,
  `availed_at` timestamp NULL DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `source_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'polymorphic reference',
  `source_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'polymorphic id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_gateway_charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payout_id` int(10) unsigned DEFAULT NULL,
  `gateway_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `transaction_type` tinyint(4) NOT NULL COMMENT '1.Subscription. 2.Donation 3.Refund.',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `transacted_amount_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `net_amount_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `payment_gateway_processing_fee_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `organization_fee_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `tip_amount_in_cent` bigint(20) NOT NULL DEFAULT '0',
  `usd_exchange_rate` decimal(16,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount` decimal(16,2) DEFAULT NULL,
  `shipping_amount_in_cent` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_ref_id_unique` (`ref_id`),
  UNIQUE KEY `transactions_source_reference_unique` (`source_reference`),
  KEY `transactions_payout_id_index` (`payout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table transferables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transferables`;

CREATE TABLE `transferables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fundraiser_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `target_date` timestamp NOT NULL,
  `transferred_at` timestamp NULL DEFAULT NULL,
  `transferred` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transferables_transaction_id_unique` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_badges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_badges`;

CREATE TABLE `user_badges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_help_tours
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_help_tours`;

CREATE TABLE `user_help_tours` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `page_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_organization_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_organization_tokens`;

CREATE TABLE `user_organization_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `token` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_shares
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_shares`;

CREATE TABLE `user_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Model path for polymorphic relationship.',
  `source_id` int(10) unsigned NOT NULL COMMENT 'Row id of the specified model',
  `sharer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_subscriptions`;

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `plan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_ends_on` timestamp NULL DEFAULT NULL,
  `subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lifetime_subscription` tinyint(4) NOT NULL DEFAULT '0',
  `subscription_type` tinyint(4) NOT NULL DEFAULT '1',
  `licence_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_profile_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_profile_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` int(10) unsigned NOT NULL DEFAULT '0',
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_signup` tinyint(1) NOT NULL DEFAULT '0',
  `country_id` int(10) unsigned DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `donation_count` int(10) unsigned NOT NULL DEFAULT '0',
  `share_count` int(10) unsigned NOT NULL DEFAULT '0',
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role` tinyint(4) NOT NULL DEFAULT '3',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_count` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `donation_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `stripe_customer_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_ends_on` timestamp NULL DEFAULT NULL,
  `subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lifetime_subscription` tinyint(1) NOT NULL DEFAULT '0',
  `subscription_type` tinyint(4) NOT NULL DEFAULT '1',
  `linkedin_profile_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wallets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wallets`;

CREATE TABLE `wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `currency_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'Total amount that ever transacted.',
  `available_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT 'currency available.',
  `payable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `receivable` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_withdrawn` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_tip_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_organization_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `total_escrow` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_shipping_amount` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table websockets_statistics_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `websockets_statistics_entries`;

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
