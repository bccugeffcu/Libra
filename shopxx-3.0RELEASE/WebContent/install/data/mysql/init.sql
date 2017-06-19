-- SHOP++ INIT SQL
-- Copyright 2005-2013 shopxx.net. All rights reserved.
-- Support: http://www.shopxx.net
-- License: http://www.shopxx.net/license

-- 初始化数据库表结构 --

DROP TABLE IF EXISTS `xx_ad`;
CREATE TABLE `xx_ad` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `begin_date` datetime DEFAULT NULL,
 `content` longtext,
 `end_date` datetime DEFAULT NULL,
 `path` varchar(255) DEFAULT NULL,
 `title` varchar(255) NOT NULL,
 `type` int(11) NOT NULL,
 `url` varchar(255) DEFAULT NULL,
 `ad_position` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK6D301C2E947C2F5` (`ad_position`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_ad_position`;
CREATE TABLE `xx_ad_position` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `description` varchar(255) DEFAULT NULL,
 `height` int(11) NOT NULL,
 `name` varchar(255) NOT NULL,
 `template` longtext NOT NULL,
 `width` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_admin`;
CREATE TABLE `xx_admin` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `department` varchar(255) DEFAULT NULL,
 `email` varchar(255) NOT NULL,
 `is_enabled` bit(1) NOT NULL,
 `is_locked` bit(1) NOT NULL,
 `locked_date` datetime DEFAULT NULL,
 `login_date` datetime DEFAULT NULL,
 `login_failure_count` int(11) NOT NULL,
 `login_ip` varchar(255) DEFAULT NULL,
 `name` varchar(255) DEFAULT NULL,
 `password` varchar(255) NOT NULL,
 `username` varchar(255) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `username` (`username`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_admin_role`;
CREATE TABLE `xx_admin_role` (
 `admins` bigint(20) NOT NULL,
 `roles` bigint(20) NOT NULL,
 PRIMARY KEY (`admins`,`roles`),
 KEY `FKD291D6053FF548F7` (`roles`),
 KEY `FKD291D605A022690F` (`admins`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_area`;
CREATE TABLE `xx_area` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `full_name` longtext NOT NULL,
 `name` varchar(100) NOT NULL,
 `tree_path` varchar(255) NOT NULL,
 `parent` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK9E19DA6CFE1E12FB` (`parent`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_article`;
CREATE TABLE `xx_article` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `author` varchar(255) DEFAULT NULL,
 `content` longtext,
 `hits` bigint(20) NOT NULL,
 `is_publication` bit(1) NOT NULL,
 `is_top` bit(1) NOT NULL,
 `seo_description` varchar(255) DEFAULT NULL,
 `seo_keywords` varchar(255) DEFAULT NULL,
 `seo_title` varchar(255) DEFAULT NULL,
 `title` varchar(255) NOT NULL,
 `article_category` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK636982B7CA3B1F7` (`article_category`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_article_category`;
CREATE TABLE `xx_article_category` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `grade` int(11) NOT NULL,
 `name` varchar(255) NOT NULL,
 `seo_description` varchar(255) DEFAULT NULL,
 `seo_keywords` varchar(255) DEFAULT NULL,
 `seo_title` varchar(255) DEFAULT NULL,
 `tree_path` varchar(255) NOT NULL,
 `parent` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK57108986F587647A` (`parent`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_article_tag`;
CREATE TABLE `xx_article_tag` (
 `articles` bigint(20) NOT NULL,
 `tags` bigint(20) NOT NULL,
 PRIMARY KEY (`articles`,`tags`),
 KEY `FKB9183E12C842716F` (`tags`),
 KEY `FKB9183E1229F6DEEF` (`articles`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_attribute`;
CREATE TABLE `xx_attribute` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `property_index` int(11) NOT NULL,
 `product_category` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FKE81F41DD7629117` (`product_category`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_attribute_option`;
CREATE TABLE `xx_attribute_option` (
 `attribute` bigint(20) NOT NULL,
 `options` varchar(255) DEFAULT NULL,
 KEY `FK96E026D75E1B95F4` (`attribute`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_brand`;
CREATE TABLE `xx_brand` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `introduction` longtext,
 `logo` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `type` int(11) NOT NULL,
 `url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_cart`;
CREATE TABLE `xx_cart` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `cart_key` varchar(255) NOT NULL,
 `member` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK9E1A84FF7C62EDF8` (`member`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_cart_item`;
CREATE TABLE `xx_cart_item` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `quantity` int(11) NOT NULL,
 `cart` bigint(20) NOT NULL,
 `product` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK1A67F65339A23004` (`cart`),
 KEY `FK1A67F65379F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_consultation`;
CREATE TABLE `xx_consultation` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `content` varchar(255) NOT NULL,
 `ip` varchar(255) NOT NULL,
 `is_show` bit(1) NOT NULL,
 `for_consultation` bigint(20) DEFAULT NULL,
 `member` bigint(20) DEFAULT NULL,
 `product` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK33228D687C62EDF8` (`member`),
 KEY `FK33228D68366B868C` (`for_consultation`),
 KEY `FK33228D6879F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_coupon`;
CREATE TABLE `xx_coupon` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `begin_date` datetime DEFAULT NULL,
 `end_date` datetime DEFAULT NULL,
 `end_price` decimal(21,6) DEFAULT NULL,
 `introduction` longtext,
 `is_enabled` bit(1) NOT NULL,
 `is_exchange` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 `point` int(11) DEFAULT NULL,
 `prefix` varchar(255) NOT NULL,
 `price_operator` int(11) NOT NULL,
 `price_value` decimal(21,6) DEFAULT NULL,
 `start_price` decimal(21,6) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_coupon_code`;
CREATE TABLE `xx_coupon_code` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `code` varchar(255) NOT NULL,
 `is_used` bit(1) NOT NULL,
 `used_date` datetime DEFAULT NULL,
 `coupon` bigint(20) NOT NULL,
 `member` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `code` (`code`),
 KEY `FKEF53A3A77C62EDF8` (`member`),
 KEY `FKEF53A3A75B638910` (`coupon`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_delivery_center`;
CREATE TABLE `xx_delivery_center` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `address` varchar(255) NOT NULL,
 `area_name` varchar(255) NOT NULL,
 `contact` varchar(255) NOT NULL,
 `is_default` bit(1) NOT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `mobile` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `phone` varchar(255) DEFAULT NULL,
 `zip_code` varchar(255) DEFAULT NULL,
 `area` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK18EB77C139A0DADE` (`area`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_delivery_corp`;
CREATE TABLE `xx_delivery_corp` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `code` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `url` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_delivery_template`;
CREATE TABLE `xx_delivery_template` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `background` varchar(255) DEFAULT NULL,
 `content` longtext NOT NULL,
 `height` int(11) NOT NULL,
 `is_default` bit(1) NOT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `offsetx` int(11) NOT NULL,
 `offsety` int(11) NOT NULL,
 `width` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_deposit`;
CREATE TABLE `xx_deposit` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `balance` decimal(21,6) NOT NULL,
 `credit` decimal(21,6) NOT NULL,
 `debit` decimal(21,6) NOT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `operator` varchar(255) DEFAULT NULL,
 `type` int(11) NOT NULL,
 `member` bigint(20) NOT NULL,
 `orders` bigint(20) DEFAULT NULL,
 `payment` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FKEBB7CC5F7C62EDF8` (`member`),
 KEY `FKEBB7CC5F4115A3C8` (`payment`),
 KEY `FKEBB7CC5FB992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_friend_link`;
CREATE TABLE `xx_friend_link` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `logo` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `type` int(11) NOT NULL,
 `url` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_gift_item`;
CREATE TABLE `xx_gift_item` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `quantity` int(11) NOT NULL,
 `gift` bigint(20) NOT NULL,
 `promotion` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `gift` (`gift`,`promotion`),
 KEY `FK2FB85243FD463A02` (`promotion`),
 KEY `FK2FB852438C9B75DB` (`gift`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_goods`;
CREATE TABLE `xx_goods` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_log`;
CREATE TABLE `xx_log` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `content` longtext,
 `ip` varchar(255) NOT NULL,
 `operation` varchar(255) NOT NULL,
 `operator` varchar(255) DEFAULT NULL,
 `parameter` longtext,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_member`;
CREATE TABLE `xx_member` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `address` varchar(255) DEFAULT NULL,
 `amount` decimal(27,12) NOT NULL,
 `attribute_value0` varchar(255) DEFAULT NULL,
 `attribute_value1` varchar(255) DEFAULT NULL,
 `attribute_value2` varchar(255) DEFAULT NULL,
 `attribute_value3` varchar(255) DEFAULT NULL,
 `attribute_value4` varchar(255) DEFAULT NULL,
 `attribute_value5` varchar(255) DEFAULT NULL,
 `attribute_value6` varchar(255) DEFAULT NULL,
 `attribute_value7` varchar(255) DEFAULT NULL,
 `attribute_value8` varchar(255) DEFAULT NULL,
 `attribute_value9` varchar(255) DEFAULT NULL,
 `balance` decimal(27,12) NOT NULL,
 `birth` datetime DEFAULT NULL,
 `email` varchar(255) NOT NULL,
 `gender` int(11) DEFAULT NULL,
 `is_enabled` bit(1) NOT NULL,
 `is_locked` bit(1) NOT NULL,
 `locked_date` datetime DEFAULT NULL,
 `login_date` datetime DEFAULT NULL,
 `login_failure_count` int(11) NOT NULL,
 `login_ip` varchar(255) DEFAULT NULL,
 `mobile` varchar(255) DEFAULT NULL,
 `name` varchar(255) DEFAULT NULL,
 `password` varchar(255) NOT NULL,
 `phone` varchar(255) DEFAULT NULL,
 `point` bigint(20) NOT NULL,
 `register_ip` varchar(255) NOT NULL,
 `safe_key_expire` datetime DEFAULT NULL,
 `safe_key_value` varchar(255) DEFAULT NULL,
 `username` varchar(255) NOT NULL,
 `zip_code` varchar(255) DEFAULT NULL,
 `area` bigint(20) DEFAULT NULL,
 `member_rank` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `username` (`username`),
 KEY `FK92D398B939A0DADE` (`area`),
 KEY `FK92D398B937884F5B` (`member_rank`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_member_attribute`;
CREATE TABLE `xx_member_attribute` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `is_enabled` bit(1) NOT NULL,
 `is_required` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 `property_index` int(11) DEFAULT NULL,
 `type` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_member_attribute_option`;
CREATE TABLE `xx_member_attribute_option` (
 `member_attribute` bigint(20) NOT NULL,
 `options` varchar(255) DEFAULT NULL,
 KEY `FKC3DC263E8A8815` (`member_attribute`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_member_favorite_product`;
CREATE TABLE `xx_member_favorite_product` (
 `favorite_members` bigint(20) NOT NULL,
 `favorite_products` bigint(20) NOT NULL,
 PRIMARY KEY (`favorite_members`,`favorite_products`),
 KEY `FK44DF1412A43B40D4` (`favorite_members`),
 KEY `FK44DF1412830D5552` (`favorite_products`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_member_rank`;
CREATE TABLE `xx_member_rank` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `amount` decimal(21,6) DEFAULT NULL,
 `is_default` bit(1) NOT NULL,
 `is_special` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 `scale` double NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `name` (`name`),
 UNIQUE KEY `amount` (`amount`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_message`;
CREATE TABLE `xx_message` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `content` longtext NOT NULL,
 `ip` varchar(255) NOT NULL,
 `is_draft` bit(1) NOT NULL,
 `receiver_delete` bit(1) NOT NULL,
 `receiver_read` bit(1) NOT NULL,
 `sender_delete` bit(1) NOT NULL,
 `sender_read` bit(1) NOT NULL,
 `title` varchar(255) NOT NULL,
 `for_message` bigint(20) DEFAULT NULL,
 `receiver` bigint(20) DEFAULT NULL,
 `sender` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FKC7FBB5C886A07D93` (`sender`),
 KEY `FKC7FBB5C8E2B39A54` (`for_message`),
 KEY `FKC7FBB5C88C6C4D4D` (`receiver`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_navigation`;
CREATE TABLE `xx_navigation` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `is_blank_target` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 `position` int(11) NOT NULL,
 `url` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_order`;
CREATE TABLE `xx_order` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `address` varchar(255) NOT NULL,
 `amount_paid` decimal(21,6) NOT NULL,
 `area_name` varchar(255) NOT NULL,
 `consignee` varchar(255) NOT NULL,
 `discount` decimal(21,6) NOT NULL,
 `expire` datetime DEFAULT NULL,
 `fee` decimal(21,6) NOT NULL,
 `freight` decimal(21,6) NOT NULL,
 `invoice_title` varchar(255) DEFAULT NULL,
 `is_allocated_stock` bit(1) NOT NULL,
 `is_invoice` bit(1) NOT NULL,
 `lock_expire` datetime DEFAULT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `order_status` int(11) NOT NULL,
 `payment_method_name` varchar(255) NOT NULL,
 `payment_status` int(11) NOT NULL,
 `phone` varchar(255) NOT NULL,
 `point` int(11) NOT NULL,
 `promotion` varchar(255) DEFAULT NULL,
 `shipping_method_name` varchar(255) NOT NULL,
 `shipping_status` int(11) NOT NULL,
 `sn` varchar(255) NOT NULL,
 `tax` decimal(21,6) NOT NULL,
 `zip_code` varchar(255) NOT NULL,
 `area` bigint(20) DEFAULT NULL,
 `coupon_code` bigint(20) DEFAULT NULL,
 `member` bigint(20) NOT NULL,
 `operator` bigint(20) DEFAULT NULL,
 `payment_method` bigint(20) DEFAULT NULL,
 `shipping_method` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sn` (`sn`),
 KEY `FK25E6B94F67F7C585` (`shipping_method`),
 KEY `FK25E6B94F39A0DADE` (`area`),
 KEY `FK25E6B94F7C62EDF8` (`member`),
 KEY `FK25E6B94FC050045D` (`coupon_code`),
 KEY `FK25E6B94FD7122AAF` (`operator`),
 KEY `FK25E6B94FD3A8BE7D` (`payment_method`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_order_coupon`;
CREATE TABLE `xx_order_coupon` (
 `orders` bigint(20) NOT NULL,
 `coupons` bigint(20) NOT NULL,
 KEY `FKA3F6D516E538DDF7` (`coupons`),
 KEY `FKA3F6D516B992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_order_item`;
CREATE TABLE `xx_order_item` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `full_name` varchar(255) NOT NULL,
 `is_gift` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 `price` decimal(21,6) NOT NULL,
 `quantity` int(11) NOT NULL,
 `return_quantity` int(11) NOT NULL,
 `shipped_quantity` int(11) NOT NULL,
 `sn` varchar(255) NOT NULL,
 `thumbnail` varchar(255) DEFAULT NULL,
 `weight` int(11) DEFAULT NULL,
 `orders` bigint(20) NOT NULL,
 `product` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FKD69FF403B992E8EF` (`orders`),
 KEY `FKD69FF40379F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_order_log`;
CREATE TABLE `xx_order_log` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `content` varchar(255) DEFAULT NULL,
 `operator` varchar(255) DEFAULT NULL,
 `type` int(11) NOT NULL,
 `orders` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FKF6684C54B992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_parameter`;
CREATE TABLE `xx_parameter` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `parameter_group` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK8238FD2A818BF383` (`parameter_group`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_parameter_group`;
CREATE TABLE `xx_parameter_group` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `product_category` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FKD68A4F2AD7629117` (`product_category`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_payment`;
CREATE TABLE `xx_payment` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `account` varchar(255) DEFAULT NULL,
 `amount` decimal(21,6) NOT NULL,
 `bank` varchar(255) DEFAULT NULL,
 `expire` datetime DEFAULT NULL,
 `fee` decimal(21,6) NOT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `operator` varchar(255) DEFAULT NULL,
 `payer` varchar(255) DEFAULT NULL,
 `payment_date` datetime DEFAULT NULL,
 `payment_method` varchar(255) DEFAULT NULL,
 `payment_plugin_id` varchar(255) DEFAULT NULL,
 `sn` varchar(255) NOT NULL,
 `status` int(11) NOT NULL,
 `type` int(11) NOT NULL,
 `member` bigint(20) DEFAULT NULL,
 `orders` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sn` (`sn`),
 KEY `FK602CE7C77C62EDF8` (`member`),
 KEY `FK602CE7C7B992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_payment_method`;
CREATE TABLE `xx_payment_method` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `content` longtext,
 `description` varchar(255) DEFAULT NULL,
 `icon` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `timeout` int(11) DEFAULT NULL,
 `type` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_payment_shipping_method`;
CREATE TABLE `xx_payment_shipping_method` (
 `payment_methods` bigint(20) NOT NULL,
 `shipping_methods` bigint(20) NOT NULL,
 PRIMARY KEY (`payment_methods`,`shipping_methods`),
 KEY `FKC1F53CAC85883714` (`shipping_methods`),
 KEY `FKC1F53CACA2ED13BC` (`payment_methods`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_plugin_config`;
CREATE TABLE `xx_plugin_config` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `is_enabled` bit(1) NOT NULL,
 `plugin_id` varchar(255) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `plugin_id` (`plugin_id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_plugin_config_attribute`;
CREATE TABLE `xx_plugin_config_attribute` (
 `plugin_config` bigint(20) NOT NULL,
 `attributes` varchar(255) DEFAULT NULL,
 `attributes_key` varchar(255) NOT NULL DEFAULT '',
 PRIMARY KEY (`plugin_config`,`attributes_key`),
 KEY `FK42CB712CE174C3E7` (`plugin_config`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product`;
CREATE TABLE `xx_product` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `allocated_stock` int(11) NOT NULL,
 `attribute_value0` varchar(255) DEFAULT NULL,
 `attribute_value1` varchar(255) DEFAULT NULL,
 `attribute_value10` varchar(255) DEFAULT NULL,
 `attribute_value11` varchar(255) DEFAULT NULL,
 `attribute_value12` varchar(255) DEFAULT NULL,
 `attribute_value13` varchar(255) DEFAULT NULL,
 `attribute_value14` varchar(255) DEFAULT NULL,
 `attribute_value15` varchar(255) DEFAULT NULL,
 `attribute_value16` varchar(255) DEFAULT NULL,
 `attribute_value17` varchar(255) DEFAULT NULL,
 `attribute_value18` varchar(255) DEFAULT NULL,
 `attribute_value19` varchar(255) DEFAULT NULL,
 `attribute_value2` varchar(255) DEFAULT NULL,
 `attribute_value3` varchar(255) DEFAULT NULL,
 `attribute_value4` varchar(255) DEFAULT NULL,
 `attribute_value5` varchar(255) DEFAULT NULL,
 `attribute_value6` varchar(255) DEFAULT NULL,
 `attribute_value7` varchar(255) DEFAULT NULL,
 `attribute_value8` varchar(255) DEFAULT NULL,
 `attribute_value9` varchar(255) DEFAULT NULL,
 `cost` decimal(21,6) DEFAULT NULL,
 `full_name` varchar(255) NOT NULL,
 `hits` bigint(20) NOT NULL,
 `image` varchar(255) DEFAULT NULL,
 `introduction` longtext,
 `is_gift` bit(1) NOT NULL,
 `is_list` bit(1) NOT NULL,
 `is_marketable` bit(1) NOT NULL,
 `is_top` bit(1) NOT NULL,
 `keyword` varchar(255) DEFAULT NULL,
 `market_price` decimal(21,6) NOT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `month_hits` bigint(20) NOT NULL,
 `month_hits_date` datetime NOT NULL,
 `month_sales` bigint(20) NOT NULL,
 `month_sales_date` datetime NOT NULL,
 `name` varchar(255) NOT NULL,
 `point` bigint(20) NOT NULL,
 `price` decimal(21,6) NOT NULL,
 `sales` bigint(20) NOT NULL,
 `score` float NOT NULL,
 `score_count` bigint(20) NOT NULL,
 `seo_description` varchar(255) DEFAULT NULL,
 `seo_keywords` varchar(255) DEFAULT NULL,
 `seo_title` varchar(255) DEFAULT NULL,
 `sn` varchar(255) NOT NULL,
 `stock` int(11) DEFAULT NULL,
 `stock_memo` varchar(255) DEFAULT NULL,
 `total_score` bigint(20) NOT NULL,
 `unit` varchar(255) DEFAULT NULL,
 `week_hits` bigint(20) NOT NULL,
 `week_hits_date` datetime NOT NULL,
 `week_sales` bigint(20) NOT NULL,
 `week_sales_date` datetime NOT NULL,
 `weight` int(11) DEFAULT NULL,
 `brand` bigint(20) DEFAULT NULL,
 `goods` bigint(20) NOT NULL,
 `product_category` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sn` (`sn`),
 KEY `FK7C9E82B0D7629117` (`product_category`),
 KEY `FK7C9E82B0FB212D68` (`goods`),
 KEY `FK7C9E82B0FA9695CA` (`brand`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_category`;
CREATE TABLE `xx_product_category` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `grade` int(11) NOT NULL,
 `name` varchar(255) NOT NULL,
 `seo_description` varchar(255) DEFAULT NULL,
 `seo_keywords` varchar(255) DEFAULT NULL,
 `seo_title` varchar(255) DEFAULT NULL,
 `tree_path` varchar(255) NOT NULL,
 `parent` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK1B7971ADFBDD5B73` (`parent`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_category_brand`;
CREATE TABLE `xx_product_category_brand` (
 `product_categories` bigint(20) NOT NULL,
 `brands` bigint(20) NOT NULL,
 PRIMARY KEY (`product_categories`,`brands`),
 KEY `FKE42D6A75A2AB700F` (`brands`),
 KEY `FKE42D6A758C4C0635` (`product_categories`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_member_price`;
CREATE TABLE `xx_product_member_price` (
 `product` bigint(20) NOT NULL,
 `member_price` decimal(19,2) DEFAULT NULL,
 `member_price_key` bigint(20) NOT NULL,
 PRIMARY KEY (`product`,`member_price_key`),
 KEY `FKDCCD88935CCD83AE` (`member_price_key`),
 KEY `FKDCCD889379F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_notify`;
CREATE TABLE `xx_product_notify` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `email` varchar(255) NOT NULL,
 `has_sent` bit(1) NOT NULL,
 `member` bigint(20) DEFAULT NULL,
 `product` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FKDCB1ABB87C62EDF8` (`member`),
 KEY `FKDCB1ABB879F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_parameter_value`;
CREATE TABLE `xx_product_parameter_value` (
 `product` bigint(20) NOT NULL,
 `parameter_value` varchar(255) DEFAULT NULL,
 `parameter_value_key` bigint(20) NOT NULL,
 PRIMARY KEY (`product`,`parameter_value_key`),
 KEY `FK1B76FDCCEDA221E0` (`parameter_value_key`),
 KEY `FK1B76FDCC79F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_product_image`;
CREATE TABLE `xx_product_product_image` (
 `product` bigint(20) NOT NULL,
 `large` varchar(255) DEFAULT NULL,
 `medium` varchar(255) DEFAULT NULL,
 `orders` int(11) DEFAULT NULL,
 `source` varchar(255) DEFAULT NULL,
 `thumbnail` varchar(255) DEFAULT NULL,
 `title` varchar(255) DEFAULT NULL,
 KEY `FK66470ABC79F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_specification`;
CREATE TABLE `xx_product_specification` (
 `products` bigint(20) NOT NULL,
 `specifications` bigint(20) NOT NULL,
 PRIMARY KEY (`products`,`specifications`),
 KEY `FK622421B45096DE0F` (`products`),
 KEY `FK622421B4840DA38F` (`specifications`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_specification_value`;
CREATE TABLE `xx_product_specification_value` (
 `products` bigint(20) NOT NULL,
 `specification_values` bigint(20) NOT NULL,
 PRIMARY KEY (`products`,`specification_values`),
 KEY `FKBF71FF265096DE0F` (`products`),
 KEY `FKBF71FF2677BD1CD0` (`specification_values`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_product_tag`;
CREATE TABLE `xx_product_tag` (
 `products` bigint(20) NOT NULL,
 `tags` bigint(20) NOT NULL,
 PRIMARY KEY (`products`,`tags`),
 KEY `FK2F6A998B5096DE0F` (`products`),
 KEY `FK2F6A998BC842716F` (`tags`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_promotion`;
CREATE TABLE `xx_promotion` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `begin_date` datetime DEFAULT NULL,
 `end_date` datetime DEFAULT NULL,
 `end_price` decimal(21,6) DEFAULT NULL,
 `introduction` longtext,
 `is_coupon_allowed` bit(1) NOT NULL,
 `is_free_shipping` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 `point_operator` int(11) NOT NULL,
 `point_value` decimal(19,2) DEFAULT NULL,
 `price_operator` int(11) NOT NULL,
 `price_value` decimal(21,6) DEFAULT NULL,
 `start_price` decimal(21,6) DEFAULT NULL,
 `title` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_promotion_brand`;
CREATE TABLE `xx_promotion_brand` (
 `promotions` bigint(20) NOT NULL,
 `brands` bigint(20) NOT NULL,
 PRIMARY KEY (`promotions`,`brands`),
 KEY `FKBD21C9ACA2AB700F` (`brands`),
 KEY `FKBD21C9AC682BD58F` (`promotions`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_promotion_coupon`;
CREATE TABLE `xx_promotion_coupon` (
 `promotions` bigint(20) NOT NULL,
 `coupons` bigint(20) NOT NULL,
 PRIMARY KEY (`promotions`,`coupons`),
 KEY `FKE8AB1EA1E538DDF7` (`coupons`),
 KEY `FKE8AB1EA1682BD58F` (`promotions`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_promotion_member_rank`;
CREATE TABLE `xx_promotion_member_rank` (
 `promotions` bigint(20) NOT NULL,
 `member_ranks` bigint(20) NOT NULL,
 PRIMARY KEY (`promotions`,`member_ranks`),
 KEY `FKFF359916E24D908C` (`member_ranks`),
 KEY `FKFF359916682BD58F` (`promotions`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_promotion_product`;
CREATE TABLE `xx_promotion_product` (
 `promotions` bigint(20) NOT NULL,
 `products` bigint(20) NOT NULL,
 PRIMARY KEY (`promotions`,`products`),
 KEY `FKE12E55D45096DE0F` (`products`),
 KEY `FKE12E55D4682BD58F` (`promotions`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_promotion_product_category`;
CREATE TABLE `xx_promotion_product_category` (
 `promotions` bigint(20) NOT NULL,
 `product_categories` bigint(20) NOT NULL,
 PRIMARY KEY (`promotions`,`product_categories`),
 KEY `FK4A5AE7098C4C0635` (`product_categories`),
 KEY `FK4A5AE709682BD58F` (`promotions`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_receiver`;
CREATE TABLE `xx_receiver` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `address` varchar(255) NOT NULL,
 `area_name` varchar(255) NOT NULL,
 `consignee` varchar(255) NOT NULL,
 `is_default` bit(1) NOT NULL,
 `phone` varchar(255) NOT NULL,
 `zip_code` varchar(255) NOT NULL,
 `area` bigint(20) DEFAULT NULL,
 `member` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK22D1EC4E39A0DADE` (`area`),
 KEY `FK22D1EC4E7C62EDF8` (`member`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_refunds`;
CREATE TABLE `xx_refunds` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `account` varchar(255) DEFAULT NULL,
 `amount` decimal(21,6) NOT NULL,
 `bank` varchar(255) DEFAULT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `operator` varchar(255) NOT NULL,
 `payee` varchar(255) DEFAULT NULL,
 `payment_method` varchar(255) DEFAULT NULL,
 `sn` varchar(255) NOT NULL,
 `type` int(11) NOT NULL,
 `orders` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sn` (`sn`),
 KEY `FKCFC4C5BCB992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_returns`;
CREATE TABLE `xx_returns` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `address` varchar(255) NOT NULL,
 `area` varchar(255) NOT NULL,
 `delivery_corp` varchar(255) DEFAULT NULL,
 `freight` decimal(21,6) DEFAULT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `operator` varchar(255) NOT NULL,
 `phone` varchar(255) NOT NULL,
 `shipper` varchar(255) NOT NULL,
 `shipping_method` varchar(255) DEFAULT NULL,
 `sn` varchar(255) NOT NULL,
 `tracking_no` varchar(255) DEFAULT NULL,
 `zip_code` varchar(255) NOT NULL,
 `orders` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sn` (`sn`),
 KEY `FKD08A1F04B992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_returns_item`;
CREATE TABLE `xx_returns_item` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `name` varchar(255) NOT NULL,
 `quantity` int(11) NOT NULL,
 `sn` varchar(255) NOT NULL,
 `returns` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FKE830D76E21D01242` (`returns`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_review`;
CREATE TABLE `xx_review` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `content` varchar(255) NOT NULL,
 `ip` varchar(255) NOT NULL,
 `is_show` bit(1) NOT NULL,
 `score` int(11) NOT NULL,
 `member` bigint(20) DEFAULT NULL,
 `product` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK9B6005777C62EDF8` (`member`),
 KEY `FK9B60057779F8D99A` (`product`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_role`;
CREATE TABLE `xx_role` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `description` varchar(255) DEFAULT NULL,
 `is_system` bit(1) NOT NULL,
 `name` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_role_authority`;
CREATE TABLE `xx_role_authority` (
 `role` bigint(20) NOT NULL,
 `authorities` varchar(255) DEFAULT NULL,
 KEY `FKE06165D939B03AB0` (`role`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_seo`;
CREATE TABLE `xx_seo` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `description` varchar(255) DEFAULT NULL,
 `keywords` varchar(255) DEFAULT NULL,
 `title` varchar(255) DEFAULT NULL,
 `type` int(11) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `type` (`type`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_shipping`;
CREATE TABLE `xx_shipping` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `address` varchar(255) NOT NULL,
 `area` varchar(255) NOT NULL,
 `consignee` varchar(255) NOT NULL,
 `delivery_corp` varchar(255) NOT NULL,
 `delivery_corp_code` varchar(255) DEFAULT NULL,
 `delivery_corp_url` varchar(255) DEFAULT NULL,
 `freight` decimal(21,6) DEFAULT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `operator` varchar(255) NOT NULL,
 `phone` varchar(255) NOT NULL,
 `shipping_method` varchar(255) NOT NULL,
 `sn` varchar(255) NOT NULL,
 `tracking_no` varchar(255) DEFAULT NULL,
 `zip_code` varchar(255) NOT NULL,
 `orders` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `sn` (`sn`),
 KEY `FK3440E00DB992E8EF` (`orders`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_shipping_item`;
CREATE TABLE `xx_shipping_item` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `name` varchar(255) NOT NULL,
 `quantity` int(11) NOT NULL,
 `sn` varchar(255) NOT NULL,
 `shipping` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FKCCE65405FF407320` (`shipping`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_shipping_method`;
CREATE TABLE `xx_shipping_method` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `continue_price` decimal(21,6) NOT NULL,
 `continue_weight` int(11) NOT NULL,
 `description` longtext,
 `first_price` decimal(21,6) NOT NULL,
 `first_weight` int(11) NOT NULL,
 `icon` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `default_delivery_corp` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `FK32A8355346542319` (`default_delivery_corp`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_sn`;
CREATE TABLE `xx_sn` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `last_value` bigint(20) NOT NULL,
 `type` int(11) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `type` (`type`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_specification`;
CREATE TABLE `xx_specification` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `type` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_specification_value`;
CREATE TABLE `xx_specification_value` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `image` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `specification` bigint(20) NOT NULL,
 PRIMARY KEY (`id`),
 KEY `FK5E624376629A04C2` (`specification`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

DROP TABLE IF EXISTS `xx_tag`;
CREATE TABLE `xx_tag` (
 `id` bigint(20) NOT NULL AUTO_INCREMENT,
 `create_date` datetime NOT NULL,
 `modify_date` datetime NOT NULL,
 `orders` int(11) DEFAULT NULL,
 `icon` varchar(255) DEFAULT NULL,
 `memo` varchar(255) DEFAULT NULL,
 `name` varchar(255) NOT NULL,
 `type` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=${mysqlEngine} DEFAULT CHARSET=${tableCharset};

ALTER TABLE `xx_ad`
 ADD CONSTRAINT `FK6D301C2E947C2F5` FOREIGN KEY (`ad_position`) REFERENCES `xx_ad_position` (`id`);

ALTER TABLE `xx_admin_role`
 ADD CONSTRAINT `FKD291D6053FF548F7` FOREIGN KEY (`roles`) REFERENCES `xx_role` (`id`),
 ADD CONSTRAINT `FKD291D605A022690F` FOREIGN KEY (`admins`) REFERENCES `xx_admin` (`id`);

ALTER TABLE `xx_area`
 ADD CONSTRAINT `FK9E19DA6CFE1E12FB` FOREIGN KEY (`parent`) REFERENCES `xx_area` (`id`);

ALTER TABLE `xx_article`
 ADD CONSTRAINT `FK636982B7CA3B1F7` FOREIGN KEY (`article_category`) REFERENCES `xx_article_category` (`id`);

ALTER TABLE `xx_article_category`
 ADD CONSTRAINT `FK57108986F587647A` FOREIGN KEY (`parent`) REFERENCES `xx_article_category` (`id`);

ALTER TABLE `xx_article_tag`
 ADD CONSTRAINT `FKB9183E1229F6DEEF` FOREIGN KEY (`articles`) REFERENCES `xx_article` (`id`),
 ADD CONSTRAINT `FKB9183E12C842716F` FOREIGN KEY (`tags`) REFERENCES `xx_tag` (`id`);

ALTER TABLE `xx_attribute`
 ADD CONSTRAINT `FKE81F41DD7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`);

ALTER TABLE `xx_attribute_option`
 ADD CONSTRAINT `FK96E026D75E1B95F4` FOREIGN KEY (`attribute`) REFERENCES `xx_attribute` (`id`);

ALTER TABLE `xx_cart`
 ADD CONSTRAINT `FK9E1A84FF7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_cart_item`
 ADD CONSTRAINT `FK1A67F65339A23004` FOREIGN KEY (`cart`) REFERENCES `xx_cart` (`id`),
 ADD CONSTRAINT `FK1A67F65379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`);

ALTER TABLE `xx_consultation`
 ADD CONSTRAINT `FK33228D68366B868C` FOREIGN KEY (`for_consultation`) REFERENCES `xx_consultation` (`id`),
 ADD CONSTRAINT `FK33228D6879F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK33228D687C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_coupon_code`
 ADD CONSTRAINT `FKEF53A3A75B638910` FOREIGN KEY (`coupon`) REFERENCES `xx_coupon` (`id`),
 ADD CONSTRAINT `FKEF53A3A77C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_delivery_center`
 ADD CONSTRAINT `FK18EB77C139A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`);

ALTER TABLE `xx_deposit`
 ADD CONSTRAINT `FKEBB7CC5F4115A3C8` FOREIGN KEY (`payment`) REFERENCES `xx_payment` (`id`),
 ADD CONSTRAINT `FKEBB7CC5F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
 ADD CONSTRAINT `FKEBB7CC5FB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_gift_item`
 ADD CONSTRAINT `FK2FB852438C9B75DB` FOREIGN KEY (`gift`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK2FB85243FD463A02` FOREIGN KEY (`promotion`) REFERENCES `xx_promotion` (`id`);

ALTER TABLE `xx_member`
 ADD CONSTRAINT `FK92D398B937884F5B` FOREIGN KEY (`member_rank`) REFERENCES `xx_member_rank` (`id`),
 ADD CONSTRAINT `FK92D398B939A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`);

ALTER TABLE `xx_member_attribute_option`
 ADD CONSTRAINT `FKC3DC263E8A8815` FOREIGN KEY (`member_attribute`) REFERENCES `xx_member_attribute` (`id`);

ALTER TABLE `xx_member_favorite_product`
 ADD CONSTRAINT `FK44DF1412830D5552` FOREIGN KEY (`favorite_products`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK44DF1412A43B40D4` FOREIGN KEY (`favorite_members`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_message`
 ADD CONSTRAINT `FKC7FBB5C886A07D93` FOREIGN KEY (`sender`) REFERENCES `xx_member` (`id`),
 ADD CONSTRAINT `FKC7FBB5C88C6C4D4D` FOREIGN KEY (`receiver`) REFERENCES `xx_member` (`id`),
 ADD CONSTRAINT `FKC7FBB5C8E2B39A54` FOREIGN KEY (`for_message`) REFERENCES `xx_message` (`id`);

ALTER TABLE `xx_order`
 ADD CONSTRAINT `FK25E6B94F39A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`),
 ADD CONSTRAINT `FK25E6B94F67F7C585` FOREIGN KEY (`shipping_method`) REFERENCES `xx_shipping_method` (`id`),
 ADD CONSTRAINT `FK25E6B94F7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
 ADD CONSTRAINT `FK25E6B94FC050045D` FOREIGN KEY (`coupon_code`) REFERENCES `xx_coupon_code` (`id`),
 ADD CONSTRAINT `FK25E6B94FD3A8BE7D` FOREIGN KEY (`payment_method`) REFERENCES `xx_payment_method` (`id`),
 ADD CONSTRAINT `FK25E6B94FD7122AAF` FOREIGN KEY (`operator`) REFERENCES `xx_admin` (`id`);

ALTER TABLE `xx_order_coupon`
 ADD CONSTRAINT `FKA3F6D516B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`),
 ADD CONSTRAINT `FKA3F6D516E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `xx_coupon` (`id`);

ALTER TABLE `xx_order_item`
 ADD CONSTRAINT `FKD69FF40379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FKD69FF403B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_order_log`
 ADD CONSTRAINT `FKF6684C54B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_parameter`
 ADD CONSTRAINT `FK8238FD2A818BF383` FOREIGN KEY (`parameter_group`) REFERENCES `xx_parameter_group` (`id`);

ALTER TABLE `xx_parameter_group`
 ADD CONSTRAINT `FKD68A4F2AD7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`);

ALTER TABLE `xx_payment`
 ADD CONSTRAINT `FK602CE7C77C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`),
 ADD CONSTRAINT `FK602CE7C7B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_payment_shipping_method`
 ADD CONSTRAINT `FKC1F53CAC85883714` FOREIGN KEY (`shipping_methods`) REFERENCES `xx_shipping_method` (`id`),
 ADD CONSTRAINT `FKC1F53CACA2ED13BC` FOREIGN KEY (`payment_methods`) REFERENCES `xx_payment_method` (`id`);

ALTER TABLE `xx_plugin_config_attribute`
 ADD CONSTRAINT `FK42CB712CE174C3E7` FOREIGN KEY (`plugin_config`) REFERENCES `xx_plugin_config` (`id`);

ALTER TABLE `xx_product`
 ADD CONSTRAINT `FK7C9E82B0D7629117` FOREIGN KEY (`product_category`) REFERENCES `xx_product_category` (`id`),
 ADD CONSTRAINT `FK7C9E82B0FA9695CA` FOREIGN KEY (`brand`) REFERENCES `xx_brand` (`id`),
 ADD CONSTRAINT `FK7C9E82B0FB212D68` FOREIGN KEY (`goods`) REFERENCES `xx_goods` (`id`);

ALTER TABLE `xx_product_category`
 ADD CONSTRAINT `FK1B7971ADFBDD5B73` FOREIGN KEY (`parent`) REFERENCES `xx_product_category` (`id`);

ALTER TABLE `xx_product_category_brand`
 ADD CONSTRAINT `FKE42D6A758C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `xx_product_category` (`id`),
 ADD CONSTRAINT `FKE42D6A75A2AB700F` FOREIGN KEY (`brands`) REFERENCES `xx_brand` (`id`);

ALTER TABLE `xx_product_member_price`
 ADD CONSTRAINT `FKDCCD88935CCD83AE` FOREIGN KEY (`member_price_key`) REFERENCES `xx_member_rank` (`id`),
 ADD CONSTRAINT `FKDCCD889379F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`);

ALTER TABLE `xx_product_notify`
 ADD CONSTRAINT `FKDCB1ABB879F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FKDCB1ABB87C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_product_parameter_value`
 ADD CONSTRAINT `FK1B76FDCC79F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK1B76FDCCEDA221E0` FOREIGN KEY (`parameter_value_key`) REFERENCES `xx_parameter` (`id`);

ALTER TABLE `xx_product_product_image`
 ADD CONSTRAINT `FK66470ABC79F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`);

ALTER TABLE `xx_product_specification`
 ADD CONSTRAINT `FK622421B45096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK622421B4840DA38F` FOREIGN KEY (`specifications`) REFERENCES `xx_specification` (`id`);

ALTER TABLE `xx_product_specification_value`
 ADD CONSTRAINT `FKBF71FF265096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FKBF71FF2677BD1CD0` FOREIGN KEY (`specification_values`) REFERENCES `xx_specification_value` (`id`);

ALTER TABLE `xx_product_tag`
 ADD CONSTRAINT `FK2F6A998B5096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK2F6A998BC842716F` FOREIGN KEY (`tags`) REFERENCES `xx_tag` (`id`);

ALTER TABLE `xx_promotion_brand`
 ADD CONSTRAINT `FKBD21C9AC682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
 ADD CONSTRAINT `FKBD21C9ACA2AB700F` FOREIGN KEY (`brands`) REFERENCES `xx_brand` (`id`);

ALTER TABLE `xx_promotion_coupon`
 ADD CONSTRAINT `FKE8AB1EA1682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
 ADD CONSTRAINT `FKE8AB1EA1E538DDF7` FOREIGN KEY (`coupons`) REFERENCES `xx_coupon` (`id`);

ALTER TABLE `xx_promotion_member_rank`
 ADD CONSTRAINT `FKFF359916682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
 ADD CONSTRAINT `FKFF359916E24D908C` FOREIGN KEY (`member_ranks`) REFERENCES `xx_member_rank` (`id`);

ALTER TABLE `xx_promotion_product`
 ADD CONSTRAINT `FKE12E55D45096DE0F` FOREIGN KEY (`products`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FKE12E55D4682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`);

ALTER TABLE `xx_promotion_product_category`
 ADD CONSTRAINT `FK4A5AE709682BD58F` FOREIGN KEY (`promotions`) REFERENCES `xx_promotion` (`id`),
 ADD CONSTRAINT `FK4A5AE7098C4C0635` FOREIGN KEY (`product_categories`) REFERENCES `xx_product_category` (`id`);

ALTER TABLE `xx_receiver`
 ADD CONSTRAINT `FK22D1EC4E39A0DADE` FOREIGN KEY (`area`) REFERENCES `xx_area` (`id`),
 ADD CONSTRAINT `FK22D1EC4E7C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_refunds`
 ADD CONSTRAINT `FKCFC4C5BCB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_returns`
 ADD CONSTRAINT `FKD08A1F04B992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_returns_item`
 ADD CONSTRAINT `FKE830D76E21D01242` FOREIGN KEY (`returns`) REFERENCES `xx_returns` (`id`);

ALTER TABLE `xx_review`
 ADD CONSTRAINT `FK9B60057779F8D99A` FOREIGN KEY (`product`) REFERENCES `xx_product` (`id`),
 ADD CONSTRAINT `FK9B6005777C62EDF8` FOREIGN KEY (`member`) REFERENCES `xx_member` (`id`);

ALTER TABLE `xx_role_authority`
 ADD CONSTRAINT `FKE06165D939B03AB0` FOREIGN KEY (`role`) REFERENCES `xx_role` (`id`);

ALTER TABLE `xx_shipping`
 ADD CONSTRAINT `FK3440E00DB992E8EF` FOREIGN KEY (`orders`) REFERENCES `xx_order` (`id`);

ALTER TABLE `xx_shipping_item`
 ADD CONSTRAINT `FKCCE65405FF407320` FOREIGN KEY (`shipping`) REFERENCES `xx_shipping` (`id`);

ALTER TABLE `xx_shipping_method`
 ADD CONSTRAINT `FK32A8355346542319` FOREIGN KEY (`default_delivery_corp`) REFERENCES `xx_delivery_corp` (`id`);

ALTER TABLE `xx_specification_value`
 ADD CONSTRAINT `FK5E624376629A04C2` FOREIGN KEY (`specification`) REFERENCES `xx_specification` (`id`);

INSERT INTO `xx_role` (`id`, `create_date`, `modify_date`, `description`, `is_system`, `name`) VALUES(1, '2013-01-01 10:49:19', '2013-01-01 10:49:23', '拥有管理后台最高权限', ${bit1}, '超级管理员');

INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:product');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:productCategory');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:parameterGroup');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:attribute');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:specification');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:brand');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:productNotify');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:order');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:print');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:payment');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:refunds');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:shipping');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:returns');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:deliveryCenter');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:deliveryTemplate');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:member');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:memberRank');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:memberAttribute');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:review');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:consultation');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:navigation');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:article');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:articleCategory');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:tag');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:friendLink');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:adPosition');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:ad');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:template');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:cache');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:static');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:index');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:promotion');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:coupon');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:seo');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:sitemap');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:statistics');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:sales');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:salesRanking');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:purchaseRanking');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:deposit');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:setting');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:area');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:paymentMethod');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:shippingMethod');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:deliveryCorp');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:paymentPlugin');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:storagePlugin');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:admin');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:role');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:message');
INSERT INTO `xx_role_authority` (`role`, `authorities`) VALUES(1, 'admin:log');

INSERT INTO `xx_admin` (`id`, `create_date`, `modify_date`, `department`, `email`, `is_enabled`, `is_locked`, `locked_date`, `login_date`, `login_failure_count`, `login_ip`, `name`, `password`, `username`) VALUES(1, '2013-01-01 13:24:32', '2013-01-01 14:37:48', '技术部', 'admin@shopxx.net', ${bit1}, ${bit0}, NULL, '2013-01-01 14:37:48', 0, NULL, '管理员', '${adminPassword}', '${adminUsername}');

INSERT INTO `xx_admin_role` (`admins`, `roles`) VALUES(1, 1);

INSERT INTO `xx_member_rank` (`id`, `create_date`, `modify_date`, `amount`, `is_default`, `is_special`, `name`, `scale`) VALUES(1, '2013-01-01 12:43:30', '2013-01-01 12:43:30', 0.000000, ${bit1}, ${bit0}, '普通会员', 1);
INSERT INTO `xx_member_rank` (`id`, `create_date`, `modify_date`, `amount`, `is_default`, `is_special`, `name`, `scale`) VALUES(2, '2013-01-01 12:43:53', '2013-01-01 12:43:53', 1000.000000, ${bit0}, ${bit0}, '银牌会员', 1);
INSERT INTO `xx_member_rank` (`id`, `create_date`, `modify_date`, `amount`, `is_default`, `is_special`, `name`, `scale`) VALUES(3, '2013-01-01 12:44:06', '2013-01-01 12:44:06', 10000.000000, ${bit0}, ${bit0}, '金牌会员', 1);
INSERT INTO `xx_member_rank` (`id`, `create_date`, `modify_date`, `amount`, `is_default`, `is_special`, `name`, `scale`) VALUES(4, '2013-01-01 12:44:26', '2013-01-01 12:44:26', 100000.000000, ${bit0}, ${bit0}, '白金会员', 0.99);
INSERT INTO `xx_member_rank` (`id`, `create_date`, `modify_date`, `amount`, `is_default`, `is_special`, `name`, `scale`) VALUES(5, '2013-01-01 23:19:51', '2013-01-01 23:19:51', NULL, ${bit0}, ${bit1}, '贵宾会员', 0.95);

INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(1, '2013-01-01 12:44:57', '2013-01-01 11:50:50', 1, ${bit1}, ${bit0}, '姓名', NULL, 0);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(2, '2013-01-01 12:45:19', '2013-01-01 11:50:53', 2, ${bit1}, ${bit0}, '性别', NULL, 1);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(3, '2013-01-01 12:45:25', '2013-01-01 11:50:55', 3, ${bit1}, ${bit0}, '出生日期', NULL, 2);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(4, '2013-01-01 12:45:40', '2013-01-01 11:50:58', 4, ${bit1}, ${bit0}, '地区', NULL, 3);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(5, '2013-01-01 12:45:46', '2013-01-01 11:51:03', 5, ${bit1}, ${bit0}, '地址', NULL, 4);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(6, '2013-01-01 12:45:51', '2013-01-01 16:02:36', 6, ${bit0}, ${bit0}, '邮编', NULL, 5);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(7, '2013-01-01 12:45:57', '2013-01-01 16:02:38', 7, ${bit0}, ${bit0}, '电话', NULL, 6);
INSERT INTO `xx_member_attribute` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `is_required`, `name`, `property_index`, `type`) VALUES(8, '2013-01-01 12:46:02', '2013-01-01 16:02:40', 8, ${bit0}, ${bit0}, '手机', NULL, 7);

INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市', '北京市', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市东城区', '东城区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市西城区', '西城区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(4, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市朝阳区', '朝阳区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(5, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市丰台区', '丰台区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(6, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市石景山区', '石景山区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(7, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市海淀区', '海淀区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(8, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市门头沟区', '门头沟区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(9, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市房山区', '房山区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(10, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市通州区', '通州区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(11, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市顺义区', '顺义区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(12, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市昌平区', '昌平区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(13, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市大兴区', '大兴区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(14, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市怀柔区', '怀柔区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(15, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市平谷区', '平谷区', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(16, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市密云县', '密云县', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(17, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '北京市延庆县', '延庆县', ',1,', 1);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(18, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市', '天津市', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(19, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市和平区', '和平区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(20, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市河东区', '河东区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(21, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市河西区', '河西区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(22, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市南开区', '南开区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(23, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市河北区', '河北区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(24, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市红桥区', '红桥区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(25, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市东丽区', '东丽区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(26, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市西青区', '西青区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(27, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市津南区', '津南区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(28, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市北辰区', '北辰区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(29, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市武清区', '武清区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(30, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市宝坻区', '宝坻区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(31, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市滨海新区', '滨海新区', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(32, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市宁河县', '宁河县', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(33, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市静海县', '静海县', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(34, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '天津市蓟县', '蓟县', ',18,', 18);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(35, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省', '河北省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(36, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市', '石家庄市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(37, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市长安区', '长安区', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(38, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市桥东区', '桥东区', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(39, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市桥西区', '桥西区', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(40, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市新华区', '新华区', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(41, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市井陉矿区', '井陉矿区', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(42, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市裕华区', '裕华区', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(43, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市井陉县', '井陉县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(44, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市正定县', '正定县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(45, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市栾城县', '栾城县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(46, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市行唐县', '行唐县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(47, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市灵寿县', '灵寿县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(48, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市高邑县', '高邑县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(49, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市深泽县', '深泽县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(50, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市赞皇县', '赞皇县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(51, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市无极县', '无极县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(52, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市平山县', '平山县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(53, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市元氏县', '元氏县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(54, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市赵县', '赵县', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(55, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市辛集市', '辛集市', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(56, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市藁城市', '藁城市', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(57, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市晋州市', '晋州市', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(58, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市新乐市', '新乐市', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(59, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省石家庄市鹿泉市', '鹿泉市', ',35,36,', 36);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(60, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市', '唐山市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(61, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市路南区', '路南区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(62, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市路北区', '路北区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(63, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市古冶区', '古冶区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(64, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市开平区', '开平区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(65, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市丰南区', '丰南区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(66, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市丰润区', '丰润区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(67, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市曹妃甸区', '曹妃甸区', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(68, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市滦县', '滦县', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(69, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市滦南县', '滦南县', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(70, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市乐亭县', '乐亭县', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(71, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市迁西县', '迁西县', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(72, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市玉田县', '玉田县', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(73, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市遵化市', '遵化市', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(74, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省唐山市迁安市', '迁安市', ',35,60,', 60);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(75, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市', '秦皇岛市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(76, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市海港区', '海港区', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(77, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市山海关区', '山海关区', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(78, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市北戴河区', '北戴河区', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(79, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市青龙满族自治县', '青龙满族自治县', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(80, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市昌黎县', '昌黎县', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(81, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市抚宁县', '抚宁县', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(82, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省秦皇岛市卢龙县', '卢龙县', ',35,75,', 75);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(83, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市', '邯郸市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(84, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市邯山区', '邯山区', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(85, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市丛台区', '丛台区', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(86, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市复兴区', '复兴区', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(87, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市峰峰矿区', '峰峰矿区', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(88, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市邯郸县', '邯郸县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(89, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市临漳县', '临漳县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(90, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市成安县', '成安县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(91, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市大名县', '大名县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(92, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市涉县', '涉县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(93, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市磁县', '磁县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(94, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市肥乡县', '肥乡县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(95, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市永年县', '永年县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(96, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市邱县', '邱县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(97, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市鸡泽县', '鸡泽县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(98, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市广平县', '广平县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(99, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市馆陶县', '馆陶县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(100, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市魏县', '魏县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(101, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市曲周县', '曲周县', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(102, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邯郸市武安市', '武安市', ',35,83,', 83);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(103, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市', '邢台市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(104, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市桥东区', '桥东区', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(105, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市桥西区', '桥西区', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(106, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市邢台县', '邢台县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(107, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市临城县', '临城县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(108, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市内丘县', '内丘县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(109, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市柏乡县', '柏乡县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(110, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市隆尧县', '隆尧县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(111, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市任县', '任县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(112, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市南和县', '南和县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(113, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市宁晋县', '宁晋县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(114, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市巨鹿县', '巨鹿县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(115, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市新河县', '新河县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(116, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市广宗县', '广宗县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(117, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市平乡县', '平乡县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(118, '2013-01-01 09:01:59', '2013-01-01 09:01:59', NULL, '河北省邢台市威县', '威县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(119, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省邢台市清河县', '清河县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(120, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省邢台市临西县', '临西县', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(121, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省邢台市南宫市', '南宫市', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(122, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省邢台市沙河市', '沙河市', ',35,103,', 103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(123, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市', '保定市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(124, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市新市区', '新市区', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(125, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市北市区', '北市区', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(126, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市南市区', '南市区', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(127, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市满城县', '满城县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(128, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市清苑县', '清苑县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(129, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市涞水县', '涞水县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(130, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市阜平县', '阜平县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(131, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市徐水县', '徐水县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(132, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市定兴县', '定兴县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(133, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市唐县', '唐县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(134, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市高阳县', '高阳县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(135, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市容城县', '容城县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(136, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市涞源县', '涞源县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(137, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市望都县', '望都县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(138, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市安新县', '安新县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(139, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市易县', '易县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(140, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市曲阳县', '曲阳县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(141, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市蠡县', '蠡县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(142, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市顺平县', '顺平县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(143, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市博野县', '博野县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(144, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市雄县', '雄县', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(145, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市涿州市', '涿州市', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(146, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市定州市', '定州市', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(147, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市安国市', '安国市', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(148, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省保定市高碑店市', '高碑店市', ',35,123,', 123);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(149, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市', '张家口市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(150, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市桥东区', '桥东区', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(151, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市桥西区', '桥西区', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(152, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市宣化区', '宣化区', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(153, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市下花园区', '下花园区', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(154, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市宣化县', '宣化县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(155, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市张北县', '张北县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(156, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市康保县', '康保县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(157, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市沽源县', '沽源县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(158, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市尚义县', '尚义县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(159, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市蔚县', '蔚县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(160, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市阳原县', '阳原县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(161, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市怀安县', '怀安县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(162, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市万全县', '万全县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(163, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市怀来县', '怀来县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(164, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市涿鹿县', '涿鹿县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(165, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市赤城县', '赤城县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(166, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省张家口市崇礼县', '崇礼县', ',35,149,', 149);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(167, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市', '承德市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(168, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市双桥区', '双桥区', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(169, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市双滦区', '双滦区', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(170, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市鹰手营子矿区', '鹰手营子矿区', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(171, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市承德县', '承德县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(172, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市兴隆县', '兴隆县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(173, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市平泉县', '平泉县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(174, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市滦平县', '滦平县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(175, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市隆化县', '隆化县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(176, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市丰宁满族自治县', '丰宁满族自治县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(177, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市宽城满族自治县', '宽城满族自治县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(178, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省承德市围场满族蒙古族自治县', '围场满族蒙古族自治县', ',35,167,', 167);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(179, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市', '沧州市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(180, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市新华区', '新华区', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(181, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市运河区', '运河区', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(182, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市沧县', '沧县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(183, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市青县', '青县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(184, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市东光县', '东光县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(185, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市海兴县', '海兴县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(186, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市盐山县', '盐山县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(187, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市肃宁县', '肃宁县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(188, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市南皮县', '南皮县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(189, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市吴桥县', '吴桥县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(190, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市献县', '献县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(191, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市孟村回族自治县', '孟村回族自治县', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(192, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市泊头市', '泊头市', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(193, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市任丘市', '任丘市', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(194, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市黄骅市', '黄骅市', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(195, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省沧州市河间市', '河间市', ',35,179,', 179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(196, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市', '廊坊市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(197, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市安次区', '安次区', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(198, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市广阳区', '广阳区', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(199, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市固安县', '固安县', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(200, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市永清县', '永清县', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(201, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市香河县', '香河县', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(202, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市大城县', '大城县', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(203, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市文安县', '文安县', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(204, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市大厂回族自治县', '大厂回族自治县', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(205, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市霸州市', '霸州市', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(206, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省廊坊市三河市', '三河市', ',35,196,', 196);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(207, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市', '衡水市', ',35,', 35);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(208, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市桃城区', '桃城区', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(209, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市枣强县', '枣强县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(210, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市武邑县', '武邑县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(211, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市武强县', '武强县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(212, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市饶阳县', '饶阳县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(213, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市安平县', '安平县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(214, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市故城县', '故城县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(215, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市景县', '景县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(216, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市阜城县', '阜城县', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(217, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市冀州市', '冀州市', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(218, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '河北省衡水市深州市', '深州市', ',35,207,', 207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(219, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省', '山西省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(220, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市', '太原市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(221, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市小店区', '小店区', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(222, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市迎泽区', '迎泽区', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(223, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市杏花岭区', '杏花岭区', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(224, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市尖草坪区', '尖草坪区', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(225, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市万柏林区', '万柏林区', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(226, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市晋源区', '晋源区', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(227, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市清徐县', '清徐县', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(228, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市阳曲县', '阳曲县', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(229, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市娄烦县', '娄烦县', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(230, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省太原市古交市', '古交市', ',219,220,', 220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(231, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市', '大同市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(232, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市城区', '城区', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(233, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市矿区', '矿区', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(234, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市南郊区', '南郊区', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(235, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市新荣区', '新荣区', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(236, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市阳高县', '阳高县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(237, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市天镇县', '天镇县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(238, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市广灵县', '广灵县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(239, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市灵丘县', '灵丘县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(240, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市浑源县', '浑源县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(241, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市左云县', '左云县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(242, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省大同市大同县', '大同县', ',219,231,', 231);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(243, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省阳泉市', '阳泉市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(244, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省阳泉市城区', '城区', ',219,243,', 243);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(245, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省阳泉市矿区', '矿区', ',219,243,', 243);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(246, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省阳泉市郊区', '郊区', ',219,243,', 243);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(247, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省阳泉市平定县', '平定县', ',219,243,', 243);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(248, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省阳泉市盂县', '盂县', ',219,243,', 243);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(249, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市', '长治市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(250, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市城区', '城区', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(251, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市郊区', '郊区', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(252, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市长治县', '长治县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(253, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市襄垣县', '襄垣县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(254, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市屯留县', '屯留县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(255, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市平顺县', '平顺县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(256, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市黎城县', '黎城县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(257, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市壶关县', '壶关县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(258, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市长子县', '长子县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(259, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市武乡县', '武乡县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(260, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市沁县', '沁县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(261, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市沁源县', '沁源县', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(262, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省长治市潞城市', '潞城市', ',219,249,', 249);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(263, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市', '晋城市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(264, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市晋城市市辖区', '晋城市市辖区', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(265, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市城区', '城区', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(266, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市沁水县', '沁水县', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(267, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市阳城县', '阳城县', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(268, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市陵川县', '陵川县', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(269, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市泽州县', '泽州县', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(270, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋城市高平市', '高平市', ',219,263,', 263);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(271, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市', '朔州市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(272, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市朔城区', '朔城区', ',219,271,', 271);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(273, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市平鲁区', '平鲁区', ',219,271,', 271);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(274, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市山阴县', '山阴县', ',219,271,', 271);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(275, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市应县', '应县', ',219,271,', 271);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(276, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市右玉县', '右玉县', ',219,271,', 271);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(277, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省朔州市怀仁县', '怀仁县', ',219,271,', 271);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(278, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市', '晋中市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(279, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市榆次区', '榆次区', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(280, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市榆社县', '榆社县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(281, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市左权县', '左权县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(282, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市和顺县', '和顺县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(283, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市昔阳县', '昔阳县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(284, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市寿阳县', '寿阳县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(285, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市太谷县', '太谷县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(286, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市祁县', '祁县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(287, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市平遥县', '平遥县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(288, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市灵石县', '灵石县', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(289, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省晋中市介休市', '介休市', ',219,278,', 278);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(290, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市', '运城市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(291, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市盐湖区', '盐湖区', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(292, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市临猗县', '临猗县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(293, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市万荣县', '万荣县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(294, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市闻喜县', '闻喜县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(295, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市稷山县', '稷山县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(296, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市新绛县', '新绛县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(297, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市绛县', '绛县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(298, '2013-01-01 09:02:00', '2013-01-01 09:02:00', NULL, '山西省运城市垣曲县', '垣曲县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(299, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省运城市夏县', '夏县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(300, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省运城市平陆县', '平陆县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(301, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省运城市芮城县', '芮城县', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(302, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省运城市永济市', '永济市', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(303, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省运城市河津市', '河津市', ',219,290,', 290);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(304, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市', '忻州市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(305, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市忻府区', '忻府区', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(306, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市定襄县', '定襄县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(307, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市五台县', '五台县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(308, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市代县', '代县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(309, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市繁峙县', '繁峙县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(310, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市宁武县', '宁武县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(311, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市静乐县', '静乐县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(312, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市神池县', '神池县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(313, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市五寨县', '五寨县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(314, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市岢岚县', '岢岚县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(315, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市河曲县', '河曲县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(316, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市保德县', '保德县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(317, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市偏关县', '偏关县', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(318, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省忻州市原平市', '原平市', ',219,304,', 304);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(319, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市', '临汾市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(320, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市尧都区', '尧都区', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(321, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市曲沃县', '曲沃县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(322, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市翼城县', '翼城县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(323, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市襄汾县', '襄汾县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(324, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市洪洞县', '洪洞县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(325, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市古县', '古县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(326, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市安泽县', '安泽县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(327, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市浮山县', '浮山县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(328, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市吉县', '吉县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(329, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市乡宁县', '乡宁县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(330, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市大宁县', '大宁县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(331, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市隰县', '隰县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(332, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市永和县', '永和县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(333, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市蒲县', '蒲县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(334, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市汾西县', '汾西县', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(335, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市侯马市', '侯马市', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(336, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省临汾市霍州市', '霍州市', ',219,319,', 319);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(337, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市', '吕梁市', ',219,', 219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(338, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市离石区', '离石区', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(339, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市文水县', '文水县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(340, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市交城县', '交城县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(341, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市兴县', '兴县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(342, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市临县', '临县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(343, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市柳林县', '柳林县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(344, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市石楼县', '石楼县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(345, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市岚县', '岚县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(346, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市方山县', '方山县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(347, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市中阳县', '中阳县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(348, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市交口县', '交口县', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(349, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市孝义市', '孝义市', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(350, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '山西省吕梁市汾阳市', '汾阳市', ',219,337,', 337);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(351, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区', '内蒙古自治区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(352, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市', '呼和浩特市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(353, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市新城区', '新城区', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(354, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市回民区', '回民区', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(355, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市玉泉区', '玉泉区', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(356, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市赛罕区', '赛罕区', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(357, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市土默特左旗', '土默特左旗', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(358, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市托克托县', '托克托县', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(359, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市和林格尔县', '和林格尔县', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(360, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市清水河县', '清水河县', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(361, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼和浩特市武川县', '武川县', ',351,352,', 352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(362, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市', '包头市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(363, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市东河区', '东河区', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(364, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市昆都仑区', '昆都仑区', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(365, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市青山区', '青山区', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(366, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市石拐区', '石拐区', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(367, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市白云鄂博矿区', '白云鄂博矿区', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(368, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市九原区', '九原区', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(369, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市土默特右旗', '土默特右旗', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(370, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市固阳县', '固阳县', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(371, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区包头市达尔罕茂明安联合旗', '达尔罕茂明安联合旗', ',351,362,', 362);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(372, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区乌海市', '乌海市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(373, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区乌海市海勃湾区', '海勃湾区', ',351,372,', 372);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(374, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区乌海市海南区', '海南区', ',351,372,', 372);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(375, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区乌海市乌达区', '乌达区', ',351,372,', 372);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(376, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市', '赤峰市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(377, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市红山区', '红山区', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(378, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市元宝山区', '元宝山区', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(379, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市松山区', '松山区', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(380, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市阿鲁科尔沁旗', '阿鲁科尔沁旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(381, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市巴林左旗', '巴林左旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(382, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市巴林右旗', '巴林右旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(383, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市林西县', '林西县', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(384, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市克什克腾旗', '克什克腾旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(385, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市翁牛特旗', '翁牛特旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(386, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市喀喇沁旗', '喀喇沁旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(387, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市宁城县', '宁城县', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(388, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区赤峰市敖汉旗', '敖汉旗', ',351,376,', 376);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(389, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市', '通辽市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(390, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市科尔沁区', '科尔沁区', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(391, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市科尔沁左翼中旗', '科尔沁左翼中旗', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(392, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市科尔沁左翼后旗', '科尔沁左翼后旗', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(393, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市开鲁县', '开鲁县', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(394, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市库伦旗', '库伦旗', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(395, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市奈曼旗', '奈曼旗', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(396, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市扎鲁特旗', '扎鲁特旗', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(397, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区通辽市霍林郭勒市', '霍林郭勒市', ',351,389,', 389);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(398, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市', '鄂尔多斯市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(399, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市东胜区', '东胜区', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(400, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市达拉特旗', '达拉特旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(401, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市准格尔旗', '准格尔旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(402, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市鄂托克前旗', '鄂托克前旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(403, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市鄂托克旗', '鄂托克旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(404, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市杭锦旗', '杭锦旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(405, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市乌审旗', '乌审旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(406, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区鄂尔多斯市伊金霍洛旗', '伊金霍洛旗', ',351,398,', 398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(407, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市', '呼伦贝尔市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(408, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市海拉尔区', '海拉尔区', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(409, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市阿荣旗', '阿荣旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(410, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗', '莫力达瓦达斡尔族自治旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(411, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市鄂伦春自治旗', '鄂伦春自治旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(412, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市鄂温克族自治旗', '鄂温克族自治旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(413, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市陈巴尔虎旗', '陈巴尔虎旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(414, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市新巴尔虎左旗', '新巴尔虎左旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(415, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市新巴尔虎右旗', '新巴尔虎右旗', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(416, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市满洲里市', '满洲里市', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(417, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市牙克石市', '牙克石市', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(418, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市扎兰屯市', '扎兰屯市', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(419, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市额尔古纳市', '额尔古纳市', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(420, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区呼伦贝尔市根河市', '根河市', ',351,407,', 407);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(421, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区巴彦淖尔市', '巴彦淖尔市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(422, '2013-01-01 09:02:01', '2013-01-01 09:02:01', NULL, '内蒙古自治区巴彦淖尔市临河区', '临河区', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(423, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区巴彦淖尔市五原县', '五原县', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(424, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区巴彦淖尔市磴口县', '磴口县', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(425, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区巴彦淖尔市乌拉特前旗', '乌拉特前旗', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(426, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区巴彦淖尔市乌拉特中旗', '乌拉特中旗', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(427, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区巴彦淖尔市乌拉特后旗', '乌拉特后旗', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(428, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区巴彦淖尔市杭锦后旗', '杭锦后旗', ',351,421,', 421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(429, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市', '乌兰察布市', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(430, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市集宁区', '集宁区', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(431, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市卓资县', '卓资县', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(432, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市化德县', '化德县', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(433, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市商都县', '商都县', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(434, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市兴和县', '兴和县', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(435, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市凉城县', '凉城县', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(436, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市察哈尔右翼前旗', '察哈尔右翼前旗', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(437, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市察哈尔右翼中旗', '察哈尔右翼中旗', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(438, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市察哈尔右翼后旗', '察哈尔右翼后旗', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(439, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市四子王旗', '四子王旗', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(440, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区乌兰察布市丰镇市', '丰镇市', ',351,429,', 429);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(441, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟', '兴安盟', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(442, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟乌兰浩特市', '乌兰浩特市', ',351,441,', 441);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(443, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟阿尔山市', '阿尔山市', ',351,441,', 441);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(444, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟科尔沁右翼前旗', '科尔沁右翼前旗', ',351,441,', 441);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(445, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟科尔沁右翼中旗', '科尔沁右翼中旗', ',351,441,', 441);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(446, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟扎赉特旗', '扎赉特旗', ',351,441,', 441);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(447, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区兴安盟突泉县', '突泉县', ',351,441,', 441);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(448, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟', '锡林郭勒盟', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(449, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟二连浩特市', '二连浩特市', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(450, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟锡林浩特市', '锡林浩特市', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(451, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟阿巴嘎旗', '阿巴嘎旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(452, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟苏尼特左旗', '苏尼特左旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(453, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟苏尼特右旗', '苏尼特右旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(454, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟东乌珠穆沁旗', '东乌珠穆沁旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(455, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟西乌珠穆沁旗', '西乌珠穆沁旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(456, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟太仆寺旗', '太仆寺旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(457, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟镶黄旗', '镶黄旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(458, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟正镶白旗', '正镶白旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(459, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟正蓝旗', '正蓝旗', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(460, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区锡林郭勒盟多伦县', '多伦县', ',351,448,', 448);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(461, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区阿拉善盟', '阿拉善盟', ',351,', 351);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(462, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区阿拉善盟阿拉善左旗', '阿拉善左旗', ',351,461,', 461);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(463, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区阿拉善盟阿拉善右旗', '阿拉善右旗', ',351,461,', 461);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(464, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '内蒙古自治区阿拉善盟额济纳旗', '额济纳旗', ',351,461,', 461);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(465, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省', '辽宁省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(466, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市', '沈阳市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(467, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市和平区', '和平区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(468, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市沈河区', '沈河区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(469, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市大东区', '大东区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(470, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市皇姑区', '皇姑区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(471, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市铁西区', '铁西区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(472, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市苏家屯区', '苏家屯区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(473, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市东陵区', '东陵区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(474, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市沈北新区', '沈北新区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(475, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市于洪区', '于洪区', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(476, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市辽中县', '辽中县', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(477, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市康平县', '康平县', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(478, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市法库县', '法库县', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(479, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省沈阳市新民市', '新民市', ',465,466,', 466);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(480, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市', '大连市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(481, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市中山区', '中山区', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(482, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市西岗区', '西岗区', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(483, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市沙河口区', '沙河口区', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(484, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市甘井子区', '甘井子区', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(485, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市旅顺口区', '旅顺口区', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(486, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市金州区', '金州区', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(487, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市长海县', '长海县', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(488, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市瓦房店市', '瓦房店市', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(489, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市普兰店市', '普兰店市', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(490, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省大连市庄河市', '庄河市', ',465,480,', 480);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(491, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市', '鞍山市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(492, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市铁东区', '铁东区', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(493, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市铁西区', '铁西区', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(494, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市立山区', '立山区', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(495, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市千山区', '千山区', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(496, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市台安县', '台安县', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(497, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市岫岩满族自治县', '岫岩满族自治县', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(498, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省鞍山市海城市', '海城市', ',465,491,', 491);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(499, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市', '抚顺市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(500, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市新抚区', '新抚区', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(501, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市东洲区', '东洲区', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(502, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市望花区', '望花区', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(503, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市顺城区', '顺城区', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(504, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市抚顺县', '抚顺县', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(505, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市新宾满族自治县', '新宾满族自治县', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(506, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省抚顺市清原满族自治县', '清原满族自治县', ',465,499,', 499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(507, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市', '本溪市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(508, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市平山区', '平山区', ',465,507,', 507);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(509, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市溪湖区', '溪湖区', ',465,507,', 507);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(510, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市明山区', '明山区', ',465,507,', 507);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(511, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市南芬区', '南芬区', ',465,507,', 507);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(512, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市本溪满族自治县', '本溪满族自治县', ',465,507,', 507);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(513, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省本溪市桓仁满族自治县', '桓仁满族自治县', ',465,507,', 507);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(514, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省丹东市', '丹东市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(515, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省丹东市元宝区', '元宝区', ',465,514,', 514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(516, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省丹东市振兴区', '振兴区', ',465,514,', 514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(517, '2013-01-01 09:02:02', '2013-01-01 09:02:02', NULL, '辽宁省丹东市振安区', '振安区', ',465,514,', 514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(518, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省丹东市宽甸满族自治县', '宽甸满族自治县', ',465,514,', 514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(519, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省丹东市东港市', '东港市', ',465,514,', 514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(520, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省丹东市凤城市', '凤城市', ',465,514,', 514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(521, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市', '锦州市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(522, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市古塔区', '古塔区', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(523, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市凌河区', '凌河区', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(524, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市太和区', '太和区', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(525, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市黑山县', '黑山县', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(526, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市义县', '义县', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(527, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市凌海市', '凌海市', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(528, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省锦州市北镇市', '北镇市', ',465,521,', 521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(529, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市', '营口市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(530, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市站前区', '站前区', ',465,529,', 529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(531, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市西市区', '西市区', ',465,529,', 529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(532, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市鲅鱼圈区', '鲅鱼圈区', ',465,529,', 529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(533, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市老边区', '老边区', ',465,529,', 529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(534, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市盖州市', '盖州市', ',465,529,', 529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(535, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省营口市大石桥市', '大石桥市', ',465,529,', 529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(536, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市', '阜新市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(537, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市海州区', '海州区', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(538, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市新邱区', '新邱区', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(539, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市太平区', '太平区', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(540, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市清河门区', '清河门区', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(541, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市细河区', '细河区', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(542, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市阜新蒙古族自治县', '阜新蒙古族自治县', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(543, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省阜新市彰武县', '彰武县', ',465,536,', 536);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(544, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市', '辽阳市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(545, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市白塔区', '白塔区', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(546, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市文圣区', '文圣区', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(547, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市宏伟区', '宏伟区', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(548, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市弓长岭区', '弓长岭区', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(549, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市太子河区', '太子河区', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(550, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市辽阳县', '辽阳县', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(551, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省辽阳市灯塔市', '灯塔市', ',465,544,', 544);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(552, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省盘锦市', '盘锦市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(553, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省盘锦市双台子区', '双台子区', ',465,552,', 552);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(554, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省盘锦市兴隆台区', '兴隆台区', ',465,552,', 552);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(555, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省盘锦市大洼县', '大洼县', ',465,552,', 552);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(556, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省盘锦市盘山县', '盘山县', ',465,552,', 552);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(557, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市', '铁岭市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(558, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市银州区', '银州区', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(559, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市清河区', '清河区', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(560, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市铁岭县', '铁岭县', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(561, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市西丰县', '西丰县', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(562, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市昌图县', '昌图县', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(563, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市调兵山市', '调兵山市', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(564, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省铁岭市开原市', '开原市', ',465,557,', 557);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(565, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市', '朝阳市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(566, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市双塔区', '双塔区', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(567, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市龙城区', '龙城区', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(568, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市朝阳县', '朝阳县', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(569, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市建平县', '建平县', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(570, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市喀喇沁左翼蒙古族自治县', '喀喇沁左翼蒙古族自治县', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(571, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市北票市', '北票市', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(572, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省朝阳市凌源市', '凌源市', ',465,565,', 565);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(573, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市', '葫芦岛市', ',465,', 465);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(574, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市连山区', '连山区', ',465,573,', 573);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(575, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市龙港区', '龙港区', ',465,573,', 573);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(576, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市南票区', '南票区', ',465,573,', 573);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(577, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市绥中县', '绥中县', ',465,573,', 573);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(578, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市建昌县', '建昌县', ',465,573,', 573);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(579, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '辽宁省葫芦岛市兴城市', '兴城市', ',465,573,', 573);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(580, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省', '吉林省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(581, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市', '长春市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(582, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市南关区', '南关区', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(583, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市宽城区', '宽城区', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(584, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市朝阳区', '朝阳区', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(585, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市二道区', '二道区', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(586, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市绿园区', '绿园区', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(587, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市双阳区', '双阳区', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(588, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市农安县', '农安县', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(589, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市九台市', '九台市', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(590, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市榆树市', '榆树市', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(591, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省长春市德惠市', '德惠市', ',580,581,', 581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(592, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市', '吉林市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(593, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市昌邑区', '昌邑区', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(594, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市龙潭区', '龙潭区', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(595, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市船营区', '船营区', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(596, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市丰满区', '丰满区', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(597, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市永吉县', '永吉县', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(598, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市蛟河市', '蛟河市', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(599, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市桦甸市', '桦甸市', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(600, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市舒兰市', '舒兰市', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(601, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省吉林市磐石市', '磐石市', ',580,592,', 592);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(602, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省四平市', '四平市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(603, '2013-01-01 09:02:03', '2013-01-01 09:02:03', NULL, '吉林省四平市铁西区', '铁西区', ',580,602,', 602);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(604, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省四平市铁东区', '铁东区', ',580,602,', 602);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(605, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省四平市梨树县', '梨树县', ',580,602,', 602);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(606, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省四平市伊通满族自治县', '伊通满族自治县', ',580,602,', 602);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(607, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省四平市公主岭市', '公主岭市', ',580,602,', 602);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(608, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省四平市双辽市', '双辽市', ',580,602,', 602);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(609, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省辽源市', '辽源市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(610, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省辽源市龙山区', '龙山区', ',580,609,', 609);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(611, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省辽源市西安区', '西安区', ',580,609,', 609);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(612, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省辽源市东丰县', '东丰县', ',580,609,', 609);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(613, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省辽源市东辽县', '东辽县', ',580,609,', 609);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(614, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市', '通化市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(615, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市东昌区', '东昌区', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(616, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市二道江区', '二道江区', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(617, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市通化县', '通化县', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(618, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市辉南县', '辉南县', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(619, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市柳河县', '柳河县', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(620, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市梅河口市', '梅河口市', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(621, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省通化市集安市', '集安市', ',580,614,', 614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(622, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市', '白山市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(623, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市浑江区', '浑江区', ',580,622,', 622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(624, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市江源区', '江源区', ',580,622,', 622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(625, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市抚松县', '抚松县', ',580,622,', 622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(626, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市靖宇县', '靖宇县', ',580,622,', 622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(627, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市长白朝鲜族自治县', '长白朝鲜族自治县', ',580,622,', 622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(628, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白山市临江市', '临江市', ',580,622,', 622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(629, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省松原市', '松原市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(630, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省松原市宁江区', '宁江区', ',580,629,', 629);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(631, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省松原市前郭尔罗斯蒙古族自治县', '前郭尔罗斯蒙古族自治县', ',580,629,', 629);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(632, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省松原市长岭县', '长岭县', ',580,629,', 629);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(633, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省松原市乾安县', '乾安县', ',580,629,', 629);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(634, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省松原市扶余县', '扶余县', ',580,629,', 629);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(635, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白城市', '白城市', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(636, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白城市洮北区', '洮北区', ',580,635,', 635);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(637, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白城市镇赉县', '镇赉县', ',580,635,', 635);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(638, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白城市通榆县', '通榆县', ',580,635,', 635);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(639, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白城市洮南市', '洮南市', ',580,635,', 635);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(640, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省白城市大安市', '大安市', ',580,635,', 635);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(641, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州', '延边朝鲜族自治州', ',580,', 580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(642, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州延吉市', '延吉市', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(643, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州图们市', '图们市', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(644, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州敦化市', '敦化市', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(645, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州珲春市', '珲春市', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(646, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州龙井市', '龙井市', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(647, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州和龙市', '和龙市', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(648, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州汪清县', '汪清县', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(649, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '吉林省延边朝鲜族自治州安图县', '安图县', ',580,641,', 641);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(650, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省', '黑龙江省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(651, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市', '哈尔滨市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(652, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市道里区', '道里区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(653, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市南岗区', '南岗区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(654, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市道外区', '道外区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(655, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市平房区', '平房区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(656, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市松北区', '松北区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(657, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市香坊区', '香坊区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(658, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市呼兰区', '呼兰区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(659, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市阿城区', '阿城区', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(660, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市依兰县', '依兰县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(661, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市方正县', '方正县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(662, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市宾县', '宾县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(663, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市巴彦县', '巴彦县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(664, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市木兰县', '木兰县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(665, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市通河县', '通河县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(666, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市延寿县', '延寿县', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(667, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市双城市', '双城市', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(668, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市尚志市', '尚志市', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(669, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省哈尔滨市五常市', '五常市', ',650,651,', 651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(670, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市', '齐齐哈尔市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(671, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市龙沙区', '龙沙区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(672, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市建华区', '建华区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(673, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市铁锋区', '铁锋区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(674, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市昂昂溪区', '昂昂溪区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(675, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市富拉尔基区', '富拉尔基区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(676, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市碾子山区', '碾子山区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(677, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市梅里斯达斡尔族区', '梅里斯达斡尔族区', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(678, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市龙江县', '龙江县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(679, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市依安县', '依安县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(680, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市泰来县', '泰来县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(681, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市甘南县', '甘南县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(682, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市富裕县', '富裕县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(683, '2013-01-01 09:02:04', '2013-01-01 09:02:04', NULL, '黑龙江省齐齐哈尔市克山县', '克山县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(684, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省齐齐哈尔市克东县', '克东县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(685, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省齐齐哈尔市拜泉县', '拜泉县', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(686, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省齐齐哈尔市讷河市', '讷河市', ',650,670,', 670);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(687, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市', '鸡西市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(688, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市鸡冠区', '鸡冠区', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(689, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市恒山区', '恒山区', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(690, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市滴道区', '滴道区', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(691, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市梨树区', '梨树区', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(692, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市城子河区', '城子河区', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(693, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市麻山区', '麻山区', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(694, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市鸡东县', '鸡东县', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(695, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市虎林市', '虎林市', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(696, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鸡西市密山市', '密山市', ',650,687,', 687);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(697, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市', '鹤岗市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(698, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市向阳区', '向阳区', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(699, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市工农区', '工农区', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(700, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市南山区', '南山区', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(701, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市兴安区', '兴安区', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(702, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市东山区', '东山区', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(703, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市兴山区', '兴山区', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(704, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市萝北县', '萝北县', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(705, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省鹤岗市绥滨县', '绥滨县', ',650,697,', 697);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(706, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市', '双鸭山市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(707, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市尖山区', '尖山区', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(708, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市岭东区', '岭东区', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(709, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市四方台区', '四方台区', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(710, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市宝山区', '宝山区', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(711, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市集贤县', '集贤县', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(712, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市友谊县', '友谊县', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(713, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市宝清县', '宝清县', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(714, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省双鸭山市饶河县', '饶河县', ',650,706,', 706);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(715, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市', '大庆市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(716, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市萨尔图区', '萨尔图区', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(717, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市龙凤区', '龙凤区', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(718, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市让胡路区', '让胡路区', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(719, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市红岗区', '红岗区', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(720, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市大同区', '大同区', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(721, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市肇州县', '肇州县', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(722, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市肇源县', '肇源县', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(723, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市林甸县', '林甸县', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(724, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省大庆市杜尔伯特蒙古族自治县', '杜尔伯特蒙古族自治县', ',650,715,', 715);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(725, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市', '伊春市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(726, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市伊春区', '伊春区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(727, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市南岔区', '南岔区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(728, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市友好区', '友好区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(729, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市西林区', '西林区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(730, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市翠峦区', '翠峦区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(731, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市新青区', '新青区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(732, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市美溪区', '美溪区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(733, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市金山屯区', '金山屯区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(734, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市五营区', '五营区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(735, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市乌马河区', '乌马河区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(736, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市汤旺河区', '汤旺河区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(737, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市带岭区', '带岭区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(738, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市乌伊岭区', '乌伊岭区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(739, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市红星区', '红星区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(740, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市上甘岭区', '上甘岭区', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(741, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市嘉荫县', '嘉荫县', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(742, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省伊春市铁力市', '铁力市', ',650,725,', 725);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(743, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市', '佳木斯市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(744, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市向阳区', '向阳区', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(745, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市前进区', '前进区', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(746, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市东风区', '东风区', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(747, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市郊区', '郊区', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(748, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市桦南县', '桦南县', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(749, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市桦川县', '桦川县', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(750, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市汤原县', '汤原县', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(751, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市抚远县', '抚远县', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(752, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市同江市', '同江市', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(753, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省佳木斯市富锦市', '富锦市', ',650,743,', 743);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(754, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省七台河市', '七台河市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(755, '2013-01-01 09:02:05', '2013-01-01 09:02:05', NULL, '黑龙江省七台河市新兴区', '新兴区', ',650,754,', 754);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(756, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省七台河市桃山区', '桃山区', ',650,754,', 754);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(757, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省七台河市茄子河区', '茄子河区', ',650,754,', 754);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(758, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省七台河市勃利县', '勃利县', ',650,754,', 754);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(759, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市', '牡丹江市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(760, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市东安区', '东安区', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(761, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市阳明区', '阳明区', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(762, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市爱民区', '爱民区', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(763, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市西安区', '西安区', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(764, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市东宁县', '东宁县', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(765, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市林口县', '林口县', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(766, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市绥芬河市', '绥芬河市', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(767, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市海林市', '海林市', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(768, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市宁安市', '宁安市', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(769, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省牡丹江市穆棱市', '穆棱市', ',650,759,', 759);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(770, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市', '黑河市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(771, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市爱辉区', '爱辉区', ',650,770,', 770);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(772, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市嫩江县', '嫩江县', ',650,770,', 770);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(773, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市逊克县', '逊克县', ',650,770,', 770);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(774, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市孙吴县', '孙吴县', ',650,770,', 770);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(775, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市北安市', '北安市', ',650,770,', 770);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(776, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省黑河市五大连池市', '五大连池市', ',650,770,', 770);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(777, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市', '绥化市', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(778, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市北林区', '北林区', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(779, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市望奎县', '望奎县', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(780, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市兰西县', '兰西县', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(781, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市青冈县', '青冈县', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(782, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市庆安县', '庆安县', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(783, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市明水县', '明水县', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(784, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市绥棱县', '绥棱县', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(785, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市安达市', '安达市', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(786, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市肇东市', '肇东市', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(787, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省绥化市海伦市', '海伦市', ',650,777,', 777);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(788, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省大兴安岭地区', '大兴安岭地区', ',650,', 650);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(789, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省大兴安岭地区呼玛县', '呼玛县', ',650,788,', 788);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(790, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省大兴安岭地区塔河县', '塔河县', ',650,788,', 788);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(791, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '黑龙江省大兴安岭地区漠河县', '漠河县', ',650,788,', 788);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(792, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市', '上海市', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(793, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市黄浦区', '黄浦区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(794, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市徐汇区', '徐汇区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(795, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市长宁区', '长宁区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(796, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市静安区', '静安区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(797, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市普陀区', '普陀区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(798, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市闸北区', '闸北区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(799, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市虹口区', '虹口区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(800, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市杨浦区', '杨浦区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(801, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市闵行区', '闵行区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(802, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市宝山区', '宝山区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(803, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市嘉定区', '嘉定区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(804, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市浦东新区', '浦东新区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(805, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市金山区', '金山区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(806, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市松江区', '松江区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(807, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市青浦区', '青浦区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(808, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市奉贤区', '奉贤区', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(809, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '上海市崇明县', '崇明县', ',792,', 792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(810, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省', '江苏省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(811, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市', '南京市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(812, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市玄武区', '玄武区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(813, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市白下区', '白下区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(814, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市秦淮区', '秦淮区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(815, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市建邺区', '建邺区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(816, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市鼓楼区', '鼓楼区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(817, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市下关区', '下关区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(818, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市浦口区', '浦口区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(819, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市栖霞区', '栖霞区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(820, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市雨花台区', '雨花台区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(821, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市江宁区', '江宁区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(822, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市六合区', '六合区', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(823, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市溧水县', '溧水县', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(824, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省南京市高淳县', '高淳县', ',810,811,', 811);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(825, '2013-01-01 09:02:06', '2013-01-01 09:02:06', NULL, '江苏省无锡市', '无锡市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(826, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市崇安区', '崇安区', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(827, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市南长区', '南长区', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(828, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市北塘区', '北塘区', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(829, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市锡山区', '锡山区', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(830, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市惠山区', '惠山区', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(831, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市滨湖区', '滨湖区', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(832, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市江阴市', '江阴市', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(833, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省无锡市宜兴市', '宜兴市', ',810,825,', 825);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(834, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市', '徐州市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(835, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市鼓楼区', '鼓楼区', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(836, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市云龙区', '云龙区', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(837, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市贾汪区', '贾汪区', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(838, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市泉山区', '泉山区', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(839, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市铜山区', '铜山区', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(840, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市丰县', '丰县', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(841, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市沛县', '沛县', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(842, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市睢宁县', '睢宁县', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(843, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市新沂市', '新沂市', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(844, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省徐州市邳州市', '邳州市', ',810,834,', 834);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(845, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市', '常州市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(846, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市天宁区', '天宁区', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(847, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市钟楼区', '钟楼区', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(848, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市戚墅堰区', '戚墅堰区', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(849, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市新北区', '新北区', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(850, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市武进区', '武进区', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(851, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市溧阳市', '溧阳市', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(852, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省常州市金坛市', '金坛市', ',810,845,', 845);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(853, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市', '苏州市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(854, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市虎丘区', '虎丘区', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(855, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市吴中区', '吴中区', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(856, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市相城区', '相城区', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(857, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市姑苏区', '姑苏区', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(858, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市吴江区', '吴江区', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(859, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市常熟市', '常熟市', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(860, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市张家港市', '张家港市', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(861, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市昆山市', '昆山市', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(862, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省苏州市太仓市', '太仓市', ',810,853,', 853);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(863, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市', '南通市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(864, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市崇川区', '崇川区', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(865, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市港闸区', '港闸区', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(866, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市通州区', '通州区', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(867, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市海安县', '海安县', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(868, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市如东县', '如东县', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(869, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市启东市', '启东市', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(870, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市如皋市', '如皋市', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(871, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省南通市海门市', '海门市', ',810,863,', 863);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(872, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市', '连云港市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(873, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市连云区', '连云区', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(874, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市新浦区', '新浦区', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(875, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市海州区', '海州区', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(876, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市赣榆县', '赣榆县', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(877, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市东海县', '东海县', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(878, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市灌云县', '灌云县', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(879, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省连云港市灌南县', '灌南县', ',810,872,', 872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(880, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市', '淮安市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(881, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市清河区', '清河区', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(882, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市淮安区', '淮安区', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(883, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市淮阴区', '淮阴区', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(884, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市清浦区', '清浦区', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(885, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市涟水县', '涟水县', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(886, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市洪泽县', '洪泽县', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(887, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市盱眙县', '盱眙县', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(888, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省淮安市金湖县', '金湖县', ',810,880,', 880);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(889, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省盐城市', '盐城市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(890, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省盐城市亭湖区', '亭湖区', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(891, '2013-01-01 09:02:07', '2013-01-01 09:02:07', NULL, '江苏省盐城市盐都区', '盐都区', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(892, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市响水县', '响水县', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(893, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市滨海县', '滨海县', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(894, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市阜宁县', '阜宁县', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(895, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市射阳县', '射阳县', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(896, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市建湖县', '建湖县', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(897, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市东台市', '东台市', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(898, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省盐城市大丰市', '大丰市', ',810,889,', 889);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(899, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市', '扬州市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(900, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市广陵区', '广陵区', ',810,899,', 899);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(901, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市邗江区', '邗江区', ',810,899,', 899);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(902, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市江都区', '江都区', ',810,899,', 899);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(903, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市宝应县', '宝应县', ',810,899,', 899);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(904, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市仪征市', '仪征市', ',810,899,', 899);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(905, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省扬州市高邮市', '高邮市', ',810,899,', 899);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(906, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市', '镇江市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(907, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市京口区', '京口区', ',810,906,', 906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(908, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市润州区', '润州区', ',810,906,', 906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(909, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市丹徒区', '丹徒区', ',810,906,', 906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(910, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市丹阳市', '丹阳市', ',810,906,', 906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(911, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市扬中市', '扬中市', ',810,906,', 906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(912, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省镇江市句容市', '句容市', ',810,906,', 906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(913, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市', '泰州市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(914, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市海陵区', '海陵区', ',810,913,', 913);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(915, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市高港区', '高港区', ',810,913,', 913);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(916, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市兴化市', '兴化市', ',810,913,', 913);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(917, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市靖江市', '靖江市', ',810,913,', 913);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(918, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市泰兴市', '泰兴市', ',810,913,', 913);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(919, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省泰州市姜堰市', '姜堰市', ',810,913,', 913);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(920, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省宿迁市', '宿迁市', ',810,', 810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(921, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省宿迁市宿城区', '宿城区', ',810,920,', 920);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(922, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省宿迁市宿豫区', '宿豫区', ',810,920,', 920);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(923, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省宿迁市沭阳县', '沭阳县', ',810,920,', 920);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(924, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省宿迁市泗阳县', '泗阳县', ',810,920,', 920);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(925, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '江苏省宿迁市泗洪县', '泗洪县', ',810,920,', 920);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(926, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省', '浙江省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(927, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市', '杭州市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(928, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市上城区', '上城区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(929, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市下城区', '下城区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(930, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市江干区', '江干区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(931, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市拱墅区', '拱墅区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(932, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市西湖区', '西湖区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(933, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市滨江区', '滨江区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(934, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市萧山区', '萧山区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(935, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市余杭区', '余杭区', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(936, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市桐庐县', '桐庐县', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(937, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市淳安县', '淳安县', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(938, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市建德市', '建德市', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(939, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市富阳市', '富阳市', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(940, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省杭州市临安市', '临安市', ',926,927,', 927);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(941, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市', '宁波市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(942, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市海曙区', '海曙区', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(943, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市江东区', '江东区', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(944, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市江北区', '江北区', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(945, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市北仑区', '北仑区', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(946, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市镇海区', '镇海区', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(947, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市鄞州区', '鄞州区', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(948, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市象山县', '象山县', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(949, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市宁海县', '宁海县', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(950, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市余姚市', '余姚市', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(951, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市慈溪市', '慈溪市', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(952, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省宁波市奉化市', '奉化市', ',926,941,', 941);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(953, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省温州市', '温州市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(954, '2013-01-01 09:02:08', '2013-01-01 09:02:08', NULL, '浙江省温州市鹿城区', '鹿城区', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(955, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市龙湾区', '龙湾区', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(956, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市瓯海区', '瓯海区', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(957, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市洞头县', '洞头县', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(958, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市永嘉县', '永嘉县', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(959, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市平阳县', '平阳县', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(960, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市苍南县', '苍南县', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(961, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市文成县', '文成县', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(962, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市泰顺县', '泰顺县', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(963, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市瑞安市', '瑞安市', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(964, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省温州市乐清市', '乐清市', ',926,953,', 953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(965, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市', '嘉兴市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(966, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市南湖区', '南湖区', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(967, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市秀洲区', '秀洲区', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(968, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市嘉善县', '嘉善县', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(969, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市海盐县', '海盐县', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(970, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市海宁市', '海宁市', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(971, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市平湖市', '平湖市', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(972, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省嘉兴市桐乡市', '桐乡市', ',926,965,', 965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(973, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省湖州市', '湖州市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(974, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省湖州市吴兴区', '吴兴区', ',926,973,', 973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(975, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省湖州市南浔区', '南浔区', ',926,973,', 973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(976, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省湖州市德清县', '德清县', ',926,973,', 973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(977, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省湖州市长兴县', '长兴县', ',926,973,', 973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(978, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省湖州市安吉县', '安吉县', ',926,973,', 973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(979, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市', '绍兴市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(980, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市越城区', '越城区', ',926,979,', 979);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(981, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市绍兴县', '绍兴县', ',926,979,', 979);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(982, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市新昌县', '新昌县', ',926,979,', 979);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(983, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市诸暨市', '诸暨市', ',926,979,', 979);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(984, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市上虞市', '上虞市', ',926,979,', 979);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(985, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省绍兴市嵊州市', '嵊州市', ',926,979,', 979);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(986, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市', '金华市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(987, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市婺城区', '婺城区', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(988, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市金东区', '金东区', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(989, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市武义县', '武义县', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(990, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市浦江县', '浦江县', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(991, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市磐安县', '磐安县', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(992, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市兰溪市', '兰溪市', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(993, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市义乌市', '义乌市', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(994, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市东阳市', '东阳市', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(995, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省金华市永康市', '永康市', ',926,986,', 986);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(996, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市', '衢州市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(997, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市柯城区', '柯城区', ',926,996,', 996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(998, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市衢江区', '衢江区', ',926,996,', 996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(999, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市常山县', '常山县', ',926,996,', 996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1000, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市开化县', '开化县', ',926,996,', 996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1001, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市龙游县', '龙游县', ',926,996,', 996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1002, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省衢州市江山市', '江山市', ',926,996,', 996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1003, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省舟山市', '舟山市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1004, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省舟山市定海区', '定海区', ',926,1003,', 1003);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1005, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省舟山市普陀区', '普陀区', ',926,1003,', 1003);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1006, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省舟山市岱山县', '岱山县', ',926,1003,', 1003);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1007, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省舟山市嵊泗县', '嵊泗县', ',926,1003,', 1003);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1008, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省台州市', '台州市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1009, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省台州市椒江区', '椒江区', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1010, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省台州市黄岩区', '黄岩区', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1011, '2013-01-01 09:02:09', '2013-01-01 09:02:09', NULL, '浙江省台州市路桥区', '路桥区', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1012, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省台州市玉环县', '玉环县', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1013, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省台州市三门县', '三门县', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1014, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省台州市天台县', '天台县', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1015, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省台州市仙居县', '仙居县', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1016, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省台州市温岭市', '温岭市', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1017, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省台州市临海市', '临海市', ',926,1008,', 1008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1018, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市', '丽水市', ',926,', 926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1019, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市莲都区', '莲都区', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1020, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市青田县', '青田县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1021, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市缙云县', '缙云县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1022, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市遂昌县', '遂昌县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1023, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市松阳县', '松阳县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1024, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市云和县', '云和县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1025, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市庆元县', '庆元县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1026, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市景宁畲族自治县', '景宁畲族自治县', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1027, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '浙江省丽水市龙泉市', '龙泉市', ',926,1018,', 1018);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1028, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省', '安徽省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1029, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市', '合肥市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1030, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市瑶海区', '瑶海区', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1031, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市庐阳区', '庐阳区', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1032, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市蜀山区', '蜀山区', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1033, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市包河区', '包河区', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1034, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市长丰县', '长丰县', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1035, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市肥东县', '肥东县', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1036, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市肥西县', '肥西县', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1037, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市庐江县', '庐江县', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1038, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省合肥市巢湖市', '巢湖市', ',1028,1029,', 1029);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1039, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市', '芜湖市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1040, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市镜湖区', '镜湖区', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1041, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市弋江区', '弋江区', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1042, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市鸠江区', '鸠江区', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1043, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市三山区', '三山区', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1044, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市芜湖县', '芜湖县', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1045, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市繁昌县', '繁昌县', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1046, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市南陵县', '南陵县', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1047, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省芜湖市无为县', '无为县', ',1028,1039,', 1039);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1048, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市', '蚌埠市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1049, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市龙子湖区', '龙子湖区', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1050, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市蚌山区', '蚌山区', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1051, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市禹会区', '禹会区', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1052, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市淮上区', '淮上区', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1053, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市怀远县', '怀远县', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1054, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市五河县', '五河县', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1055, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省蚌埠市固镇县', '固镇县', ',1028,1048,', 1048);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1056, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市', '淮南市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1057, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市大通区', '大通区', ',1028,1056,', 1056);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1058, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市田家庵区', '田家庵区', ',1028,1056,', 1056);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1059, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市谢家集区', '谢家集区', ',1028,1056,', 1056);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1060, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市八公山区', '八公山区', ',1028,1056,', 1056);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1061, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市潘集区', '潘集区', ',1028,1056,', 1056);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1062, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省淮南市凤台县', '凤台县', ',1028,1056,', 1056);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1063, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省马鞍山市', '马鞍山市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1064, '2013-01-01 09:02:10', '2013-01-01 09:02:10', NULL, '安徽省马鞍山市花山区', '花山区', ',1028,1063,', 1063);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1065, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省马鞍山市雨山区', '雨山区', ',1028,1063,', 1063);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1066, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省马鞍山市博望区', '博望区', ',1028,1063,', 1063);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1067, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省马鞍山市当涂县', '当涂县', ',1028,1063,', 1063);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1068, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省马鞍山市含山县', '含山县', ',1028,1063,', 1063);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1069, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省马鞍山市和县', '和县', ',1028,1063,', 1063);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1070, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省淮北市', '淮北市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1071, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省淮北市杜集区', '杜集区', ',1028,1070,', 1070);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1072, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省淮北市相山区', '相山区', ',1028,1070,', 1070);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1073, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省淮北市烈山区', '烈山区', ',1028,1070,', 1070);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1074, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省淮北市濉溪县', '濉溪县', ',1028,1070,', 1070);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1075, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省铜陵市', '铜陵市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1076, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省铜陵市铜官山区', '铜官山区', ',1028,1075,', 1075);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1077, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省铜陵市狮子山区', '狮子山区', ',1028,1075,', 1075);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1078, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省铜陵市郊区', '郊区', ',1028,1075,', 1075);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1079, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省铜陵市铜陵县', '铜陵县', ',1028,1075,', 1075);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1080, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市', '安庆市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1081, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市迎江区', '迎江区', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1082, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市大观区', '大观区', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1083, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市宜秀区', '宜秀区', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1084, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市怀宁县', '怀宁县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1085, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市枞阳县', '枞阳县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1086, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市潜山县', '潜山县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1087, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市太湖县', '太湖县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1088, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市宿松县', '宿松县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1089, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市望江县', '望江县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1090, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市岳西县', '岳西县', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1091, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省安庆市桐城市', '桐城市', ',1028,1080,', 1080);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1092, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市', '黄山市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1093, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市屯溪区', '屯溪区', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1094, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市黄山区', '黄山区', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1095, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市徽州区', '徽州区', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1096, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市歙县', '歙县', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1097, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市休宁县', '休宁县', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1098, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市黟县', '黟县', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1099, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省黄山市祁门县', '祁门县', ',1028,1092,', 1092);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1100, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市', '滁州市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1101, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市琅琊区', '琅琊区', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1102, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市南谯区', '南谯区', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1103, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市来安县', '来安县', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1104, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市全椒县', '全椒县', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1105, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市定远县', '定远县', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1106, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市凤阳县', '凤阳县', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1107, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市天长市', '天长市', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1108, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省滁州市明光市', '明光市', ',1028,1100,', 1100);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1109, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市', '阜阳市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1110, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市颍州区', '颍州区', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1111, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市颍东区', '颍东区', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1112, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市颍泉区', '颍泉区', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1113, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市临泉县', '临泉县', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1114, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市太和县', '太和县', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1115, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市阜南县', '阜南县', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1116, '2013-01-01 09:02:11', '2013-01-01 09:02:11', NULL, '安徽省阜阳市颍上县', '颍上县', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1117, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省阜阳市界首市', '界首市', ',1028,1109,', 1109);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1118, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宿州市', '宿州市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1119, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宿州市埇桥区', '埇桥区', ',1028,1118,', 1118);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1120, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宿州市砀山县', '砀山县', ',1028,1118,', 1118);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1121, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宿州市萧县', '萧县', ',1028,1118,', 1118);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1122, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宿州市灵璧县', '灵璧县', ',1028,1118,', 1118);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1123, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宿州市泗县', '泗县', ',1028,1118,', 1118);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1124, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市', '六安市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1125, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市金安区', '金安区', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1126, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市裕安区', '裕安区', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1127, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市寿县', '寿县', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1128, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市霍邱县', '霍邱县', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1129, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市舒城县', '舒城县', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1130, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市金寨县', '金寨县', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1131, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省六安市霍山县', '霍山县', ',1028,1124,', 1124);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1132, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省亳州市', '亳州市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1133, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省亳州市谯城区', '谯城区', ',1028,1132,', 1132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1134, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省亳州市涡阳县', '涡阳县', ',1028,1132,', 1132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1135, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省亳州市蒙城县', '蒙城县', ',1028,1132,', 1132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1136, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省亳州市利辛县', '利辛县', ',1028,1132,', 1132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1137, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省池州市', '池州市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1138, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省池州市贵池区', '贵池区', ',1028,1137,', 1137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1139, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省池州市东至县', '东至县', ',1028,1137,', 1137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1140, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省池州市石台县', '石台县', ',1028,1137,', 1137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1141, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省池州市青阳县', '青阳县', ',1028,1137,', 1137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1142, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市', '宣城市', ',1028,', 1028);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1143, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市宣州区', '宣州区', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1144, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市郎溪县', '郎溪县', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1145, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市广德县', '广德县', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1146, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市泾县', '泾县', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1147, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市绩溪县', '绩溪县', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1148, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市旌德县', '旌德县', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1149, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '安徽省宣城市宁国市', '宁国市', ',1028,1142,', 1142);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1150, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省', '福建省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1151, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市', '福州市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1152, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市鼓楼区', '鼓楼区', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1153, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市台江区', '台江区', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1154, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市仓山区', '仓山区', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1155, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市马尾区', '马尾区', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1156, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市晋安区', '晋安区', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1157, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市闽侯县', '闽侯县', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1158, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市连江县', '连江县', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1159, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市罗源县', '罗源县', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1160, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市闽清县', '闽清县', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1161, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市永泰县', '永泰县', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1162, '2013-01-01 09:02:12', '2013-01-01 09:02:12', NULL, '福建省福州市平潭县', '平潭县', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1163, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省福州市福清市', '福清市', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1164, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省福州市长乐市', '长乐市', ',1150,1151,', 1151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1165, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市', '厦门市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1166, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市思明区', '思明区', ',1150,1165,', 1165);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1167, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市海沧区', '海沧区', ',1150,1165,', 1165);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1168, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市湖里区', '湖里区', ',1150,1165,', 1165);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1169, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市集美区', '集美区', ',1150,1165,', 1165);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1170, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市同安区', '同安区', ',1150,1165,', 1165);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1171, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省厦门市翔安区', '翔安区', ',1150,1165,', 1165);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1172, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省莆田市', '莆田市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1173, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省莆田市城厢区', '城厢区', ',1150,1172,', 1172);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1174, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省莆田市涵江区', '涵江区', ',1150,1172,', 1172);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1175, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省莆田市荔城区', '荔城区', ',1150,1172,', 1172);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1176, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省莆田市秀屿区', '秀屿区', ',1150,1172,', 1172);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1177, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省莆田市仙游县', '仙游县', ',1150,1172,', 1172);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1178, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市', '三明市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1179, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市梅列区', '梅列区', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1180, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市三元区', '三元区', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1181, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市明溪县', '明溪县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1182, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市清流县', '清流县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1183, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市宁化县', '宁化县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1184, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市大田县', '大田县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1185, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市尤溪县', '尤溪县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1186, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市沙县', '沙县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1187, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市将乐县', '将乐县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1188, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市泰宁县', '泰宁县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1189, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市建宁县', '建宁县', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1190, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省三明市永安市', '永安市', ',1150,1178,', 1178);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1191, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市', '泉州市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1192, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市鲤城区', '鲤城区', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1193, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市丰泽区', '丰泽区', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1194, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市洛江区', '洛江区', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1195, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市泉港区', '泉港区', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1196, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市惠安县', '惠安县', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1197, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市安溪县', '安溪县', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1198, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市永春县', '永春县', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1199, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市德化县', '德化县', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1200, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市金门县', '金门县', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1201, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市石狮市', '石狮市', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1202, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市晋江市', '晋江市', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1203, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省泉州市南安市', '南安市', ',1150,1191,', 1191);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1204, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省漳州市', '漳州市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1205, '2013-01-01 09:02:13', '2013-01-01 09:02:13', NULL, '福建省漳州市芗城区', '芗城区', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1206, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市龙文区', '龙文区', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1207, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市云霄县', '云霄县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1208, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市漳浦县', '漳浦县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1209, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市诏安县', '诏安县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1210, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市长泰县', '长泰县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1211, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市东山县', '东山县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1212, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市南靖县', '南靖县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1213, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市平和县', '平和县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1214, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市华安县', '华安县', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1215, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省漳州市龙海市', '龙海市', ',1150,1204,', 1204);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1216, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市', '南平市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1217, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市延平区', '延平区', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1218, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市顺昌县', '顺昌县', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1219, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市浦城县', '浦城县', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1220, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市光泽县', '光泽县', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1221, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市松溪县', '松溪县', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1222, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市政和县', '政和县', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1223, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市邵武市', '邵武市', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1224, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市武夷山市', '武夷山市', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1225, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市建瓯市', '建瓯市', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1226, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省南平市建阳市', '建阳市', ',1150,1216,', 1216);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1227, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市', '龙岩市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1228, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市新罗区', '新罗区', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1229, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市长汀县', '长汀县', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1230, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市永定县', '永定县', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1231, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市上杭县', '上杭县', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1232, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市武平县', '武平县', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1233, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市连城县', '连城县', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1234, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省龙岩市漳平市', '漳平市', ',1150,1227,', 1227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1235, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市', '宁德市', ',1150,', 1150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1236, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市蕉城区', '蕉城区', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1237, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市霞浦县', '霞浦县', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1238, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市古田县', '古田县', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1239, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市屏南县', '屏南县', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1240, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市寿宁县', '寿宁县', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1241, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市周宁县', '周宁县', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1242, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市柘荣县', '柘荣县', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1243, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市福安市', '福安市', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1244, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '福建省宁德市福鼎市', '福鼎市', ',1150,1235,', 1235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1245, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '江西省', '江西省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1246, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '江西省南昌市', '南昌市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1247, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '江西省南昌市东湖区', '东湖区', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1248, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '江西省南昌市西湖区', '西湖区', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1249, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '江西省南昌市青云谱区', '青云谱区', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1250, '2013-01-01 09:02:14', '2013-01-01 09:02:14', NULL, '江西省南昌市湾里区', '湾里区', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1251, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省南昌市青山湖区', '青山湖区', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1252, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省南昌市南昌县', '南昌县', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1253, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省南昌市新建县', '新建县', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1254, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省南昌市安义县', '安义县', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1255, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省南昌市进贤县', '进贤县', ',1245,1246,', 1246);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1256, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省景德镇市', '景德镇市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1257, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省景德镇市昌江区', '昌江区', ',1245,1256,', 1256);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1258, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省景德镇市珠山区', '珠山区', ',1245,1256,', 1256);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1259, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省景德镇市浮梁县', '浮梁县', ',1245,1256,', 1256);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1260, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省景德镇市乐平市', '乐平市', ',1245,1256,', 1256);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1261, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省萍乡市', '萍乡市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1262, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省萍乡市安源区', '安源区', ',1245,1261,', 1261);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1263, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省萍乡市湘东区', '湘东区', ',1245,1261,', 1261);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1264, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省萍乡市莲花县', '莲花县', ',1245,1261,', 1261);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1265, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省萍乡市上栗县', '上栗县', ',1245,1261,', 1261);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1266, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省萍乡市芦溪县', '芦溪县', ',1245,1261,', 1261);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1267, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市', '九江市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1268, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市庐山区', '庐山区', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1269, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市浔阳区', '浔阳区', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1270, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市九江县', '九江县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1271, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市武宁县', '武宁县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1272, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市修水县', '修水县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1273, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市永修县', '永修县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1274, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市德安县', '德安县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1275, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市星子县', '星子县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1276, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市都昌县', '都昌县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1277, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市湖口县', '湖口县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1278, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市彭泽县', '彭泽县', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1279, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市瑞昌市', '瑞昌市', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1280, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省九江市共青城市', '共青城市', ',1245,1267,', 1267);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1281, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省新余市', '新余市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1282, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省新余市渝水区', '渝水区', ',1245,1281,', 1281);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1283, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省新余市分宜县', '分宜县', ',1245,1281,', 1281);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1284, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省鹰潭市', '鹰潭市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1285, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省鹰潭市月湖区', '月湖区', ',1245,1284,', 1284);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1286, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省鹰潭市余江县', '余江县', ',1245,1284,', 1284);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1287, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省鹰潭市贵溪市', '贵溪市', ',1245,1284,', 1284);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1288, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省赣州市', '赣州市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1289, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省赣州市章贡区', '章贡区', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1290, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省赣州市赣县', '赣县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1291, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省赣州市信丰县', '信丰县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1292, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省赣州市大余县', '大余县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1293, '2013-01-01 09:02:15', '2013-01-01 09:02:15', NULL, '江西省赣州市上犹县', '上犹县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1294, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市崇义县', '崇义县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1295, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市安远县', '安远县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1296, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市龙南县', '龙南县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1297, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市定南县', '定南县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1298, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市全南县', '全南县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1299, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市宁都县', '宁都县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1300, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市于都县', '于都县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1301, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市兴国县', '兴国县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1302, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市会昌县', '会昌县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1303, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市寻乌县', '寻乌县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1304, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市石城县', '石城县', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1305, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市瑞金市', '瑞金市', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1306, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省赣州市南康市', '南康市', ',1245,1288,', 1288);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1307, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市', '吉安市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1308, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市吉州区', '吉州区', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1309, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市青原区', '青原区', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1310, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市吉安县', '吉安县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1311, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市吉水县', '吉水县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1312, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市峡江县', '峡江县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1313, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市新干县', '新干县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1314, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市永丰县', '永丰县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1315, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市泰和县', '泰和县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1316, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市遂川县', '遂川县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1317, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市万安县', '万安县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1318, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市安福县', '安福县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1319, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市永新县', '永新县', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1320, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省吉安市井冈山市', '井冈山市', ',1245,1307,', 1307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1321, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市', '宜春市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1322, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市袁州区', '袁州区', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1323, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市奉新县', '奉新县', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1324, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市万载县', '万载县', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1325, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市上高县', '上高县', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1326, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市宜丰县', '宜丰县', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1327, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市靖安县', '靖安县', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1328, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市铜鼓县', '铜鼓县', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1329, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市丰城市', '丰城市', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1330, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市樟树市', '樟树市', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1331, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省宜春市高安市', '高安市', ',1245,1321,', 1321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1332, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省抚州市', '抚州市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1333, '2013-01-01 09:02:16', '2013-01-01 09:02:16', NULL, '江西省抚州市临川区', '临川区', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1334, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市南城县', '南城县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1335, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市黎川县', '黎川县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1336, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市南丰县', '南丰县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1337, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市崇仁县', '崇仁县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1338, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市乐安县', '乐安县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1339, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市宜黄县', '宜黄县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1340, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市金溪县', '金溪县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1341, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市资溪县', '资溪县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1342, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市东乡县', '东乡县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1343, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省抚州市广昌县', '广昌县', ',1245,1332,', 1332);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1344, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市', '上饶市', ',1245,', 1245);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1345, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市信州区', '信州区', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1346, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市上饶县', '上饶县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1347, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市广丰县', '广丰县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1348, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市玉山县', '玉山县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1349, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市铅山县', '铅山县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1350, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市横峰县', '横峰县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1351, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市弋阳县', '弋阳县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1352, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市余干县', '余干县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1353, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市鄱阳县', '鄱阳县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1354, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市万年县', '万年县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1355, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市婺源县', '婺源县', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1356, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '江西省上饶市德兴市', '德兴市', ',1245,1344,', 1344);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1357, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省', '山东省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1358, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市', '济南市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1359, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市历下区', '历下区', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1360, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市市中区', '市中区', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1361, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市槐荫区', '槐荫区', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1362, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市天桥区', '天桥区', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1363, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市历城区', '历城区', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1364, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市长清区', '长清区', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1365, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市平阴县', '平阴县', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1366, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市济阳县', '济阳县', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1367, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市商河县', '商河县', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1368, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省济南市章丘市', '章丘市', ',1357,1358,', 1358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1369, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省青岛市', '青岛市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1370, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省青岛市市南区', '市南区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1371, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省青岛市市北区', '市北区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1372, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省青岛市四方区', '四方区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1373, '2013-01-01 09:02:17', '2013-01-01 09:02:17', NULL, '山东省青岛市黄岛区', '黄岛区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1374, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市崂山区', '崂山区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1375, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市李沧区', '李沧区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1376, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市城阳区', '城阳区', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1377, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市胶州市', '胶州市', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1378, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市即墨市', '即墨市', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1379, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市平度市', '平度市', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1380, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市胶南市', '胶南市', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1381, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省青岛市莱西市', '莱西市', ',1357,1369,', 1369);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1382, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市', '淄博市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1383, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市淄川区', '淄川区', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1384, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市张店区', '张店区', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1385, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市博山区', '博山区', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1386, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市临淄区', '临淄区', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1387, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市周村区', '周村区', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1388, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市桓台县', '桓台县', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1389, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市高青县', '高青县', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1390, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省淄博市沂源县', '沂源县', ',1357,1382,', 1382);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1391, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市', '枣庄市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1392, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市市中区', '市中区', ',1357,1391,', 1391);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1393, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市薛城区', '薛城区', ',1357,1391,', 1391);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1394, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市峄城区', '峄城区', ',1357,1391,', 1391);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1395, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市台儿庄区', '台儿庄区', ',1357,1391,', 1391);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1396, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市山亭区', '山亭区', ',1357,1391,', 1391);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1397, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省枣庄市滕州市', '滕州市', ',1357,1391,', 1391);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1398, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省东营市', '东营市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1399, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省东营市东营区', '东营区', ',1357,1398,', 1398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1400, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省东营市河口区', '河口区', ',1357,1398,', 1398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1401, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省东营市垦利县', '垦利县', ',1357,1398,', 1398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1402, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省东营市利津县', '利津县', ',1357,1398,', 1398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1403, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省东营市广饶县', '广饶县', ',1357,1398,', 1398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1404, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省烟台市', '烟台市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1405, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省烟台市芝罘区', '芝罘区', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1406, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省烟台市福山区', '福山区', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1407, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省烟台市牟平区', '牟平区', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1408, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省烟台市莱山区', '莱山区', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1409, '2013-01-01 09:02:18', '2013-01-01 09:02:18', NULL, '山东省烟台市长岛县', '长岛县', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1410, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市龙口市', '龙口市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1411, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市莱阳市', '莱阳市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1412, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市莱州市', '莱州市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1413, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市蓬莱市', '蓬莱市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1414, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市招远市', '招远市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1415, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市栖霞市', '栖霞市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1416, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省烟台市海阳市', '海阳市', ',1357,1404,', 1404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1417, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市', '潍坊市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1418, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市潍城区', '潍城区', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1419, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市寒亭区', '寒亭区', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1420, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市坊子区', '坊子区', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1421, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市奎文区', '奎文区', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1422, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市临朐县', '临朐县', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1423, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市昌乐县', '昌乐县', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1424, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市青州市', '青州市', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1425, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市诸城市', '诸城市', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1426, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市寿光市', '寿光市', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1427, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市安丘市', '安丘市', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1428, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市高密市', '高密市', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1429, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省潍坊市昌邑市', '昌邑市', ',1357,1417,', 1417);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1430, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市', '济宁市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1431, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市市中区', '市中区', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1432, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市任城区', '任城区', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1433, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市微山县', '微山县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1434, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市鱼台县', '鱼台县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1435, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市金乡县', '金乡县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1436, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市嘉祥县', '嘉祥县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1437, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市汶上县', '汶上县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1438, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市泗水县', '泗水县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1439, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市梁山县', '梁山县', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1440, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市曲阜市', '曲阜市', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1441, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市兖州市', '兖州市', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1442, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省济宁市邹城市', '邹城市', ',1357,1430,', 1430);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1443, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省泰安市', '泰安市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1444, '2013-01-01 09:02:19', '2013-01-01 09:02:19', NULL, '山东省泰安市泰山区', '泰山区', ',1357,1443,', 1443);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1445, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省泰安市岱岳区', '岱岳区', ',1357,1443,', 1443);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1446, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省泰安市宁阳县', '宁阳县', ',1357,1443,', 1443);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1447, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省泰安市东平县', '东平县', ',1357,1443,', 1443);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1448, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省泰安市新泰市', '新泰市', ',1357,1443,', 1443);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1449, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省泰安市肥城市', '肥城市', ',1357,1443,', 1443);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1450, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省威海市', '威海市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1451, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省威海市环翠区', '环翠区', ',1357,1450,', 1450);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1452, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省威海市文登市', '文登市', ',1357,1450,', 1450);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1453, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省威海市荣成市', '荣成市', ',1357,1450,', 1450);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1454, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省威海市乳山市', '乳山市', ',1357,1450,', 1450);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1455, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省日照市', '日照市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1456, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省日照市东港区', '东港区', ',1357,1455,', 1455);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1457, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省日照市岚山区', '岚山区', ',1357,1455,', 1455);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1458, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省日照市五莲县', '五莲县', ',1357,1455,', 1455);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1459, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省日照市莒县', '莒县', ',1357,1455,', 1455);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1460, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省莱芜市', '莱芜市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1461, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省莱芜市莱城区', '莱城区', ',1357,1460,', 1460);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1462, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省莱芜市钢城区', '钢城区', ',1357,1460,', 1460);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1463, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市', '临沂市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1464, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市兰山区', '兰山区', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1465, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市罗庄区', '罗庄区', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1466, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市河东区', '河东区', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1467, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市沂南县', '沂南县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1468, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市郯城县', '郯城县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1469, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市沂水县', '沂水县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1470, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市苍山县', '苍山县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1471, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市费县', '费县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1472, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市平邑县', '平邑县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1473, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市莒南县', '莒南县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1474, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市蒙阴县', '蒙阴县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1475, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省临沂市临沭县', '临沭县', ',1357,1463,', 1463);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1476, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省德州市', '德州市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1477, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省德州市德城区', '德城区', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1478, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省德州市陵县', '陵县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1479, '2013-01-01 09:02:20', '2013-01-01 09:02:20', NULL, '山东省德州市宁津县', '宁津县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1480, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市庆云县', '庆云县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1481, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市临邑县', '临邑县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1482, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市齐河县', '齐河县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1483, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市平原县', '平原县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1484, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市夏津县', '夏津县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1485, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市武城县', '武城县', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1486, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市乐陵市', '乐陵市', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1487, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省德州市禹城市', '禹城市', ',1357,1476,', 1476);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1488, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市', '聊城市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1489, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市东昌府区', '东昌府区', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1490, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市阳谷县', '阳谷县', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1491, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市莘县', '莘县', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1492, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市茌平县', '茌平县', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1493, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市东阿县', '东阿县', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1494, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市冠县', '冠县', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1495, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市高唐县', '高唐县', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1496, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省聊城市临清市', '临清市', ',1357,1488,', 1488);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1497, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市', '滨州市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1498, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市滨城区', '滨城区', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1499, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市惠民县', '惠民县', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1500, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市阳信县', '阳信县', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1501, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市无棣县', '无棣县', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1502, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市沾化县', '沾化县', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1503, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市博兴县', '博兴县', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1504, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省滨州市邹平县', '邹平县', ',1357,1497,', 1497);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1505, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市', '菏泽市', ',1357,', 1357);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1506, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市牡丹区', '牡丹区', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1507, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市曹县', '曹县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1508, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市单县', '单县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1509, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市成武县', '成武县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1510, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市巨野县', '巨野县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1511, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市郓城县', '郓城县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1512, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市鄄城县', '鄄城县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1513, '2013-01-01 09:02:21', '2013-01-01 09:02:21', NULL, '山东省菏泽市定陶县', '定陶县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1514, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '山东省菏泽市东明县', '东明县', ',1357,1505,', 1505);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1515, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省', '河南省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1516, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市', '郑州市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1517, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市中原区', '中原区', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1518, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市二七区', '二七区', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1519, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市管城回族区', '管城回族区', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1520, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市金水区', '金水区', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1521, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市上街区', '上街区', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1522, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市惠济区', '惠济区', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1523, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市中牟县', '中牟县', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1524, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市巩义市', '巩义市', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1525, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市荥阳市', '荥阳市', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1526, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市新密市', '新密市', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1527, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市新郑市', '新郑市', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1528, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省郑州市登封市', '登封市', ',1515,1516,', 1516);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1529, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市', '开封市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1530, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市龙亭区', '龙亭区', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1531, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市顺河回族区', '顺河回族区', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1532, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市鼓楼区', '鼓楼区', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1533, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市禹王台区', '禹王台区', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1534, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市金明区', '金明区', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1535, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市杞县', '杞县', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1536, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市通许县', '通许县', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1537, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市尉氏县', '尉氏县', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1538, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市开封县', '开封县', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1539, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省开封市兰考县', '兰考县', ',1515,1529,', 1529);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1540, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市', '洛阳市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1541, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市老城区', '老城区', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1542, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市西工区', '西工区', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1543, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市瀍河回族区', '瀍河回族区', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1544, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市涧西区', '涧西区', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1545, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市吉利区', '吉利区', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1546, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市洛龙区', '洛龙区', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1547, '2013-01-01 09:02:22', '2013-01-01 09:02:22', NULL, '河南省洛阳市孟津县', '孟津县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1548, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市新安县', '新安县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1549, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市栾川县', '栾川县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1550, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市嵩县', '嵩县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1551, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市汝阳县', '汝阳县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1552, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市宜阳县', '宜阳县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1553, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市洛宁县', '洛宁县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1554, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市伊川县', '伊川县', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1555, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省洛阳市偃师市', '偃师市', ',1515,1540,', 1540);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1556, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市', '平顶山市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1557, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市新华区', '新华区', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1558, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市卫东区', '卫东区', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1559, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市石龙区', '石龙区', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1560, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市湛河区', '湛河区', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1561, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市宝丰县', '宝丰县', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1562, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市叶县', '叶县', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1563, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市鲁山县', '鲁山县', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1564, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市郏县', '郏县', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1565, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市舞钢市', '舞钢市', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1566, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省平顶山市汝州市', '汝州市', ',1515,1556,', 1556);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1567, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市', '安阳市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1568, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市文峰区', '文峰区', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1569, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市北关区', '北关区', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1570, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市殷都区', '殷都区', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1571, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市龙安区', '龙安区', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1572, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市安阳县', '安阳县', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1573, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市汤阴县', '汤阴县', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1574, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市滑县', '滑县', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1575, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市内黄县', '内黄县', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1576, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省安阳市林州市', '林州市', ',1515,1567,', 1567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1577, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省鹤壁市', '鹤壁市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1578, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省鹤壁市鹤山区', '鹤山区', ',1515,1577,', 1577);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1579, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省鹤壁市山城区', '山城区', ',1515,1577,', 1577);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1580, '2013-01-01 09:02:23', '2013-01-01 09:02:23', NULL, '河南省鹤壁市淇滨区', '淇滨区', ',1515,1577,', 1577);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1581, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省鹤壁市浚县', '浚县', ',1515,1577,', 1577);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1582, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省鹤壁市淇县', '淇县', ',1515,1577,', 1577);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1583, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市', '新乡市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1584, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市红旗区', '红旗区', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1585, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市卫滨区', '卫滨区', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1586, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市凤泉区', '凤泉区', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1587, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市牧野区', '牧野区', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1588, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市新乡县', '新乡县', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1589, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市获嘉县', '获嘉县', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1590, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市原阳县', '原阳县', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1591, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市延津县', '延津县', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1592, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市封丘县', '封丘县', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1593, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市长垣县', '长垣县', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1594, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市卫辉市', '卫辉市', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1595, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省新乡市辉县市', '辉县市', ',1515,1583,', 1583);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1596, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市', '焦作市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1597, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市解放区', '解放区', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1598, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市中站区', '中站区', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1599, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市马村区', '马村区', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1600, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市山阳区', '山阳区', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1601, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市修武县', '修武县', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1602, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市博爱县', '博爱县', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1603, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市武陟县', '武陟县', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1604, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市温县', '温县', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1605, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市沁阳市', '沁阳市', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1606, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省焦作市孟州市', '孟州市', ',1515,1596,', 1596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1607, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市', '濮阳市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1608, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市华龙区', '华龙区', ',1515,1607,', 1607);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1609, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市清丰县', '清丰县', ',1515,1607,', 1607);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1610, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市南乐县', '南乐县', ',1515,1607,', 1607);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1611, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市范县', '范县', ',1515,1607,', 1607);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1612, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市台前县', '台前县', ',1515,1607,', 1607);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1613, '2013-01-01 09:02:24', '2013-01-01 09:02:24', NULL, '河南省濮阳市濮阳县', '濮阳县', ',1515,1607,', 1607);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1614, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市', '许昌市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1615, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市魏都区', '魏都区', ',1515,1614,', 1614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1616, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市许昌县', '许昌县', ',1515,1614,', 1614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1617, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市鄢陵县', '鄢陵县', ',1515,1614,', 1614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1618, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市襄城县', '襄城县', ',1515,1614,', 1614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1619, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市禹州市', '禹州市', ',1515,1614,', 1614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1620, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省许昌市长葛市', '长葛市', ',1515,1614,', 1614);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1621, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省漯河市', '漯河市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1622, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省漯河市源汇区', '源汇区', ',1515,1621,', 1621);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1623, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省漯河市郾城区', '郾城区', ',1515,1621,', 1621);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1624, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省漯河市召陵区', '召陵区', ',1515,1621,', 1621);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1625, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省漯河市舞阳县', '舞阳县', ',1515,1621,', 1621);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1626, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省漯河市临颍县', '临颍县', ',1515,1621,', 1621);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1627, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市', '三门峡市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1628, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市湖滨区', '湖滨区', ',1515,1627,', 1627);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1629, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市渑池县', '渑池县', ',1515,1627,', 1627);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1630, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市陕县', '陕县', ',1515,1627,', 1627);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1631, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市卢氏县', '卢氏县', ',1515,1627,', 1627);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1632, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市义马市', '义马市', ',1515,1627,', 1627);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1633, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省三门峡市灵宝市', '灵宝市', ',1515,1627,', 1627);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1634, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市', '南阳市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1635, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市宛城区', '宛城区', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1636, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市卧龙区', '卧龙区', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1637, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市南召县', '南召县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1638, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市方城县', '方城县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1639, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市西峡县', '西峡县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1640, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市镇平县', '镇平县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1641, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市内乡县', '内乡县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1642, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市淅川县', '淅川县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1643, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市社旗县', '社旗县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1644, '2013-01-01 09:02:25', '2013-01-01 09:02:25', NULL, '河南省南阳市唐河县', '唐河县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1645, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省南阳市新野县', '新野县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1646, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省南阳市桐柏县', '桐柏县', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1647, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省南阳市邓州市', '邓州市', ',1515,1634,', 1634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1648, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市', '商丘市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1649, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市梁园区', '梁园区', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1650, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市睢阳区', '睢阳区', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1651, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市民权县', '民权县', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1652, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市睢县', '睢县', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1653, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市宁陵县', '宁陵县', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1654, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市柘城县', '柘城县', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1655, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市虞城县', '虞城县', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1656, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市夏邑县', '夏邑县', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1657, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省商丘市永城市', '永城市', ',1515,1648,', 1648);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1658, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市', '信阳市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1659, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市浉河区', '浉河区', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1660, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市平桥区', '平桥区', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1661, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市罗山县', '罗山县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1662, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市光山县', '光山县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1663, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市新县', '新县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1664, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市商城县', '商城县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1665, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市固始县', '固始县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1666, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市潢川县', '潢川县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1667, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市淮滨县', '淮滨县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1668, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省信阳市息县', '息县', ',1515,1658,', 1658);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1669, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市', '周口市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1670, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市川汇区', '川汇区', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1671, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市扶沟县', '扶沟县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1672, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市西华县', '西华县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1673, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市商水县', '商水县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1674, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市沈丘县', '沈丘县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1675, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市郸城县', '郸城县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1676, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市淮阳县', '淮阳县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1677, '2013-01-01 09:02:26', '2013-01-01 09:02:26', NULL, '河南省周口市太康县', '太康县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1678, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省周口市鹿邑县', '鹿邑县', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1679, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省周口市项城市', '项城市', ',1515,1669,', 1669);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1680, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市', '驻马店市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1681, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市驿城区', '驿城区', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1682, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市西平县', '西平县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1683, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市上蔡县', '上蔡县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1684, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市平舆县', '平舆县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1685, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市正阳县', '正阳县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1686, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市确山县', '确山县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1687, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市泌阳县', '泌阳县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1688, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市汝南县', '汝南县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1689, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市遂平县', '遂平县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1690, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省驻马店市新蔡县', '新蔡县', ',1515,1680,', 1680);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1691, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '河南省济源市', '济源市', ',1515,', 1515);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1692, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省', '湖北省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1693, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市', '武汉市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1694, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市江岸区', '江岸区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1695, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市江汉区', '江汉区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1696, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市硚口区', '硚口区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1697, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市汉阳区', '汉阳区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1698, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市武昌区', '武昌区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1699, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市青山区', '青山区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1700, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市洪山区', '洪山区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1701, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市东西湖区', '东西湖区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1702, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市汉南区', '汉南区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1703, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市蔡甸区', '蔡甸区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1704, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市江夏区', '江夏区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1705, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市黄陂区', '黄陂区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1706, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省武汉市新洲区', '新洲区', ',1692,1693,', 1693);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1707, '2013-01-01 09:02:27', '2013-01-01 09:02:27', NULL, '湖北省黄石市', '黄石市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1708, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省黄石市黄石港区', '黄石港区', ',1692,1707,', 1707);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1709, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省黄石市西塞山区', '西塞山区', ',1692,1707,', 1707);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1710, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省黄石市下陆区', '下陆区', ',1692,1707,', 1707);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1711, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省黄石市铁山区', '铁山区', ',1692,1707,', 1707);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1712, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省黄石市阳新县', '阳新县', ',1692,1707,', 1707);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1713, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省黄石市大冶市', '大冶市', ',1692,1707,', 1707);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1714, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市', '十堰市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1715, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市茅箭区', '茅箭区', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1716, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市张湾区', '张湾区', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1717, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市郧县', '郧县', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1718, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市郧西县', '郧西县', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1719, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市竹山县', '竹山县', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1720, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市竹溪县', '竹溪县', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1721, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市房县', '房县', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1722, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省十堰市丹江口市', '丹江口市', ',1692,1714,', 1714);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1723, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市', '宜昌市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1724, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市西陵区', '西陵区', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1725, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市伍家岗区', '伍家岗区', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1726, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市点军区', '点军区', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1727, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市猇亭区', '猇亭区', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1728, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市夷陵区', '夷陵区', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1729, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市远安县', '远安县', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1730, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市兴山县', '兴山县', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1731, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市秭归县', '秭归县', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1732, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市长阳土家族自治县', '长阳土家族自治县', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1733, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市五峰土家族自治县', '五峰土家族自治县', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1734, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市宜都市', '宜都市', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1735, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市当阳市', '当阳市', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1736, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省宜昌市枝江市', '枝江市', ',1692,1723,', 1723);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1737, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省襄阳市', '襄阳市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1738, '2013-01-01 09:02:28', '2013-01-01 09:02:28', NULL, '湖北省襄阳市襄城区', '襄城区', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1739, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市樊城区', '樊城区', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1740, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市襄州区', '襄州区', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1741, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市南漳县', '南漳县', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1742, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市谷城县', '谷城县', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1743, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市保康县', '保康县', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1744, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市老河口市', '老河口市', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1745, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市枣阳市', '枣阳市', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1746, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省襄阳市宜城市', '宜城市', ',1692,1737,', 1737);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1747, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省鄂州市', '鄂州市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1748, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省鄂州市梁子湖区', '梁子湖区', ',1692,1747,', 1747);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1749, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省鄂州市华容区', '华容区', ',1692,1747,', 1747);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1750, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省鄂州市鄂城区', '鄂城区', ',1692,1747,', 1747);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1751, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆门市', '荆门市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1752, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆门市东宝区', '东宝区', ',1692,1751,', 1751);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1753, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆门市掇刀区', '掇刀区', ',1692,1751,', 1751);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1754, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆门市京山县', '京山县', ',1692,1751,', 1751);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1755, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆门市沙洋县', '沙洋县', ',1692,1751,', 1751);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1756, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆门市钟祥市', '钟祥市', ',1692,1751,', 1751);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1757, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市', '孝感市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1758, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市孝南区', '孝南区', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1759, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市孝昌县', '孝昌县', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1760, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市大悟县', '大悟县', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1761, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市云梦县', '云梦县', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1762, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市应城市', '应城市', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1763, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市安陆市', '安陆市', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1764, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省孝感市汉川市', '汉川市', ',1692,1757,', 1757);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1765, '2013-01-01 09:02:29', '2013-01-01 09:02:29', NULL, '湖北省荆州市', '荆州市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1766, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市沙市区', '沙市区', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1767, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市荆州区', '荆州区', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1768, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市公安县', '公安县', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1769, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市监利县', '监利县', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1770, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市江陵县', '江陵县', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1771, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市石首市', '石首市', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1772, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市洪湖市', '洪湖市', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1773, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省荆州市松滋市', '松滋市', ',1692,1765,', 1765);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1774, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市', '黄冈市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1775, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市黄州区', '黄州区', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1776, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市团风县', '团风县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1777, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市红安县', '红安县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1778, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市罗田县', '罗田县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1779, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市英山县', '英山县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1780, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市浠水县', '浠水县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1781, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市蕲春县', '蕲春县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1782, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市黄梅县', '黄梅县', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1783, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市麻城市', '麻城市', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1784, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省黄冈市武穴市', '武穴市', ',1692,1774,', 1774);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1785, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市', '咸宁市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1786, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市咸安区', '咸安区', ',1692,1785,', 1785);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1787, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市嘉鱼县', '嘉鱼县', ',1692,1785,', 1785);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1788, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市通城县', '通城县', ',1692,1785,', 1785);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1789, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市崇阳县', '崇阳县', ',1692,1785,', 1785);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1790, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市通山县', '通山县', ',1692,1785,', 1785);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1791, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省咸宁市赤壁市', '赤壁市', ',1692,1785,', 1785);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1792, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省随州市', '随州市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1793, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省随州市曾都区', '曾都区', ',1692,1792,', 1792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1794, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省随州市随县', '随县', ',1692,1792,', 1792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1795, '2013-01-01 09:02:30', '2013-01-01 09:02:30', NULL, '湖北省随州市广水市', '广水市', ',1692,1792,', 1792);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1796, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州', '恩施土家族苗族自治州', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1797, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州恩施市', '恩施市', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1798, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州利川市', '利川市', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1799, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州建始县', '建始县', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1800, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州巴东县', '巴东县', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1801, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州宣恩县', '宣恩县', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1802, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州咸丰县', '咸丰县', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1803, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州来凤县', '来凤县', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1804, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省恩施土家族苗族自治州鹤峰县', '鹤峰县', ',1692,1796,', 1796);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1805, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省仙桃市', '仙桃市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1806, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省潜江市', '潜江市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1807, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省天门市', '天门市', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1808, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖北省神农架林区', '神农架林区', ',1692,', 1692);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1809, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省', '湖南省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1810, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市', '长沙市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1811, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市芙蓉区', '芙蓉区', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1812, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市天心区', '天心区', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1813, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市岳麓区', '岳麓区', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1814, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市开福区', '开福区', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1815, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市雨花区', '雨花区', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1816, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市望城区', '望城区', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1817, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市长沙县', '长沙县', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1818, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市宁乡县', '宁乡县', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1819, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省长沙市浏阳市', '浏阳市', ',1809,1810,', 1810);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1820, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市', '株洲市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1821, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市荷塘区', '荷塘区', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1822, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市芦淞区', '芦淞区', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1823, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市石峰区', '石峰区', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1824, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市天元区', '天元区', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1825, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市株洲县', '株洲县', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1826, '2013-01-01 09:02:31', '2013-01-01 09:02:31', NULL, '湖南省株洲市攸县', '攸县', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1827, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省株洲市茶陵县', '茶陵县', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1828, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省株洲市炎陵县', '炎陵县', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1829, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省株洲市醴陵市', '醴陵市', ',1809,1820,', 1820);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1830, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省湘潭市', '湘潭市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1831, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省湘潭市雨湖区', '雨湖区', ',1809,1830,', 1830);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1832, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省湘潭市岳塘区', '岳塘区', ',1809,1830,', 1830);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1833, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省湘潭市湘潭县', '湘潭县', ',1809,1830,', 1830);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1834, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省湘潭市湘乡市', '湘乡市', ',1809,1830,', 1830);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1835, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省湘潭市韶山市', '韶山市', ',1809,1830,', 1830);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1836, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市', '衡阳市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1837, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市珠晖区', '珠晖区', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1838, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市雁峰区', '雁峰区', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1839, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市石鼓区', '石鼓区', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1840, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市蒸湘区', '蒸湘区', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1841, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市南岳区', '南岳区', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1842, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市衡阳县', '衡阳县', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1843, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市衡南县', '衡南县', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1844, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市衡山县', '衡山县', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1845, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市衡东县', '衡东县', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1846, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市祁东县', '祁东县', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1847, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市耒阳市', '耒阳市', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1848, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省衡阳市常宁市', '常宁市', ',1809,1836,', 1836);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1849, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市', '邵阳市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1850, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市双清区', '双清区', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1851, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市大祥区', '大祥区', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1852, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市北塔区', '北塔区', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1853, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市邵东县', '邵东县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1854, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市新邵县', '新邵县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1855, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市邵阳县', '邵阳县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1856, '2013-01-01 09:02:32', '2013-01-01 09:02:32', NULL, '湖南省邵阳市隆回县', '隆回县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1857, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省邵阳市洞口县', '洞口县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1858, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省邵阳市绥宁县', '绥宁县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1859, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省邵阳市新宁县', '新宁县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1860, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省邵阳市城步苗族自治县', '城步苗族自治县', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1861, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省邵阳市武冈市', '武冈市', ',1809,1849,', 1849);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1862, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市', '岳阳市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1863, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市岳阳楼区', '岳阳楼区', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1864, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市云溪区', '云溪区', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1865, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市君山区', '君山区', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1866, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市岳阳县', '岳阳县', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1867, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市华容县', '华容县', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1868, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市湘阴县', '湘阴县', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1869, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市平江县', '平江县', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1870, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市汨罗市', '汨罗市', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1871, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省岳阳市临湘市', '临湘市', ',1809,1862,', 1862);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1872, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市', '常德市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1873, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市武陵区', '武陵区', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1874, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市鼎城区', '鼎城区', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1875, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市安乡县', '安乡县', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1876, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市汉寿县', '汉寿县', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1877, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市澧县', '澧县', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1878, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市临澧县', '临澧县', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1879, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市桃源县', '桃源县', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1880, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市石门县', '石门县', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1881, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省常德市津市市', '津市市', ',1809,1872,', 1872);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1882, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省张家界市', '张家界市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1883, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省张家界市永定区', '永定区', ',1809,1882,', 1882);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1884, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省张家界市武陵源区', '武陵源区', ',1809,1882,', 1882);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1885, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省张家界市慈利县', '慈利县', ',1809,1882,', 1882);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1886, '2013-01-01 09:02:33', '2013-01-01 09:02:33', NULL, '湖南省张家界市桑植县', '桑植县', ',1809,1882,', 1882);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1887, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市', '益阳市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1888, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市资阳区', '资阳区', ',1809,1887,', 1887);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1889, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市赫山区', '赫山区', ',1809,1887,', 1887);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1890, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市南县', '南县', ',1809,1887,', 1887);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1891, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市桃江县', '桃江县', ',1809,1887,', 1887);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1892, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市安化县', '安化县', ',1809,1887,', 1887);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1893, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省益阳市沅江市', '沅江市', ',1809,1887,', 1887);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1894, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市', '郴州市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1895, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市北湖区', '北湖区', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1896, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市苏仙区', '苏仙区', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1897, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市桂阳县', '桂阳县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1898, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市宜章县', '宜章县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1899, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市永兴县', '永兴县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1900, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市嘉禾县', '嘉禾县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1901, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市临武县', '临武县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1902, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市汝城县', '汝城县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1903, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市桂东县', '桂东县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1904, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市安仁县', '安仁县', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1905, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省郴州市资兴市', '资兴市', ',1809,1894,', 1894);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1906, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市', '永州市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1907, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市零陵区', '零陵区', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1908, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市冷水滩区', '冷水滩区', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1909, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市祁阳县', '祁阳县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1910, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市东安县', '东安县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1911, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市双牌县', '双牌县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1912, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市道县', '道县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1913, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市江永县', '江永县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1914, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市宁远县', '宁远县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1915, '2013-01-01 09:02:34', '2013-01-01 09:02:34', NULL, '湖南省永州市蓝山县', '蓝山县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1916, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省永州市新田县', '新田县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1917, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省永州市江华瑶族自治县', '江华瑶族自治县', ',1809,1906,', 1906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1918, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市', '怀化市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1919, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市鹤城区', '鹤城区', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1920, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市中方县', '中方县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1921, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市沅陵县', '沅陵县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1922, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市辰溪县', '辰溪县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1923, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市溆浦县', '溆浦县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1924, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市会同县', '会同县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1925, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市麻阳苗族自治县', '麻阳苗族自治县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1926, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市新晃侗族自治县', '新晃侗族自治县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1927, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市芷江侗族自治县', '芷江侗族自治县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1928, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市靖州苗族侗族自治县', '靖州苗族侗族自治县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1929, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市通道侗族自治县', '通道侗族自治县', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1930, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省怀化市洪江市', '洪江市', ',1809,1918,', 1918);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1931, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省娄底市', '娄底市', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1932, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省娄底市娄星区', '娄星区', ',1809,1931,', 1931);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1933, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省娄底市双峰县', '双峰县', ',1809,1931,', 1931);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1934, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省娄底市新化县', '新化县', ',1809,1931,', 1931);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1935, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省娄底市冷水江市', '冷水江市', ',1809,1931,', 1931);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1936, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省娄底市涟源市', '涟源市', ',1809,1931,', 1931);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1937, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州', '湘西土家族苗族自治州', ',1809,', 1809);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1938, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州吉首市', '吉首市', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1939, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州泸溪县', '泸溪县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1940, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州凤凰县', '凤凰县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1941, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州花垣县', '花垣县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1942, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州保靖县', '保靖县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1943, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州古丈县', '古丈县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1944, '2013-01-01 09:02:35', '2013-01-01 09:02:35', NULL, '湖南省湘西土家族苗族自治州永顺县', '永顺县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1945, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '湖南省湘西土家族苗族自治州龙山县', '龙山县', ',1809,1937,', 1937);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1946, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省', '广东省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1947, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市', '广州市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1948, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市荔湾区', '荔湾区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1949, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市越秀区', '越秀区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1950, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市海珠区', '海珠区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1951, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市天河区', '天河区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1952, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市白云区', '白云区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1953, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市黄埔区', '黄埔区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1954, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市番禺区', '番禺区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1955, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市花都区', '花都区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1956, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市南沙区', '南沙区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1957, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市萝岗区', '萝岗区', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1958, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市增城市', '增城市', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1959, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省广州市从化市', '从化市', ',1946,1947,', 1947);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1960, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市', '韶关市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1961, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市武江区', '武江区', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1962, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市浈江区', '浈江区', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1963, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市曲江区', '曲江区', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1964, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市始兴县', '始兴县', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1965, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市仁化县', '仁化县', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1966, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市翁源县', '翁源县', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1967, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市乳源瑶族自治县', '乳源瑶族自治县', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1968, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市新丰县', '新丰县', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1969, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市乐昌市', '乐昌市', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1970, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省韶关市南雄市', '南雄市', ',1946,1960,', 1960);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1971, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省深圳市', '深圳市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1972, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省深圳市罗湖区', '罗湖区', ',1946,1971,', 1971);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1973, '2013-01-01 09:02:36', '2013-01-01 09:02:36', NULL, '广东省深圳市福田区', '福田区', ',1946,1971,', 1971);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1974, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省深圳市南山区', '南山区', ',1946,1971,', 1971);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1975, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省深圳市宝安区', '宝安区', ',1946,1971,', 1971);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1976, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省深圳市龙岗区', '龙岗区', ',1946,1971,', 1971);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1977, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省深圳市盐田区', '盐田区', ',1946,1971,', 1971);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1978, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省珠海市', '珠海市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1979, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省珠海市香洲区', '香洲区', ',1946,1978,', 1978);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1980, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省珠海市斗门区', '斗门区', ',1946,1978,', 1978);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1981, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省珠海市金湾区', '金湾区', ',1946,1978,', 1978);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1982, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市', '汕头市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1983, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市龙湖区', '龙湖区', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1984, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市金平区', '金平区', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1985, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市濠江区', '濠江区', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1986, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市潮阳区', '潮阳区', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1987, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市潮南区', '潮南区', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1988, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市澄海区', '澄海区', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1989, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省汕头市南澳县', '南澳县', ',1946,1982,', 1982);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1990, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省佛山市', '佛山市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1991, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省佛山市禅城区', '禅城区', ',1946,1990,', 1990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1992, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省佛山市南海区', '南海区', ',1946,1990,', 1990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1993, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省佛山市顺德区', '顺德区', ',1946,1990,', 1990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1994, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省佛山市三水区', '三水区', ',1946,1990,', 1990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1995, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省佛山市高明区', '高明区', ',1946,1990,', 1990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1996, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省江门市', '江门市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1997, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省江门市蓬江区', '蓬江区', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1998, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省江门市江海区', '江海区', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(1999, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省江门市新会区', '新会区', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2000, '2013-01-01 09:02:37', '2013-01-01 09:02:37', NULL, '广东省江门市台山市', '台山市', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2001, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省江门市开平市', '开平市', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2002, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省江门市鹤山市', '鹤山市', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2003, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省江门市恩平市', '恩平市', ',1946,1996,', 1996);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2004, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市', '湛江市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2005, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市赤坎区', '赤坎区', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2006, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市霞山区', '霞山区', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2007, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市坡头区', '坡头区', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2008, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市麻章区', '麻章区', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2009, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市遂溪县', '遂溪县', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2010, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市徐闻县', '徐闻县', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2011, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市廉江市', '廉江市', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2012, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市雷州市', '雷州市', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2013, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省湛江市吴川市', '吴川市', ',1946,2004,', 2004);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2014, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市', '茂名市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2015, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市茂南区', '茂南区', ',1946,2014,', 2014);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2016, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市茂港区', '茂港区', ',1946,2014,', 2014);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2017, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市电白县', '电白县', ',1946,2014,', 2014);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2018, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市高州市', '高州市', ',1946,2014,', 2014);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2019, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市化州市', '化州市', ',1946,2014,', 2014);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2020, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省茂名市信宜市', '信宜市', ',1946,2014,', 2014);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2021, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市', '肇庆市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2022, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市端州区', '端州区', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2023, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市鼎湖区', '鼎湖区', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2024, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市广宁县', '广宁县', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2025, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市怀集县', '怀集县', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2026, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市封开县', '封开县', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2027, '2013-01-01 09:02:38', '2013-01-01 09:02:38', NULL, '广东省肇庆市德庆县', '德庆县', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2028, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省肇庆市高要市', '高要市', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2029, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省肇庆市四会市', '四会市', ',1946,2021,', 2021);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2030, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省惠州市', '惠州市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2031, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省惠州市惠城区', '惠城区', ',1946,2030,', 2030);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2032, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省惠州市惠阳区', '惠阳区', ',1946,2030,', 2030);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2033, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省惠州市博罗县', '博罗县', ',1946,2030,', 2030);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2034, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省惠州市惠东县', '惠东县', ',1946,2030,', 2030);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2035, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省惠州市龙门县', '龙门县', ',1946,2030,', 2030);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2036, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市', '梅州市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2037, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市梅江区', '梅江区', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2038, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市梅县', '梅县', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2039, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市大埔县', '大埔县', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2040, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市丰顺县', '丰顺县', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2041, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市五华县', '五华县', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2042, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市平远县', '平远县', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2043, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市蕉岭县', '蕉岭县', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2044, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省梅州市兴宁市', '兴宁市', ',1946,2036,', 2036);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2045, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省汕尾市', '汕尾市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2046, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省汕尾市城区', '城区', ',1946,2045,', 2045);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2047, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省汕尾市海丰县', '海丰县', ',1946,2045,', 2045);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2048, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省汕尾市陆河县', '陆河县', ',1946,2045,', 2045);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2049, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省汕尾市陆丰市', '陆丰市', ',1946,2045,', 2045);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2050, '2013-01-01 09:02:39', '2013-01-01 09:02:39', NULL, '广东省河源市', '河源市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2051, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省河源市源城区', '源城区', ',1946,2050,', 2050);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2052, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省河源市紫金县', '紫金县', ',1946,2050,', 2050);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2053, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省河源市龙川县', '龙川县', ',1946,2050,', 2050);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2054, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省河源市连平县', '连平县', ',1946,2050,', 2050);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2055, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省河源市和平县', '和平县', ',1946,2050,', 2050);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2056, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省河源市东源县', '东源县', ',1946,2050,', 2050);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2057, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省阳江市', '阳江市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2058, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省阳江市江城区', '江城区', ',1946,2057,', 2057);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2059, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省阳江市阳西县', '阳西县', ',1946,2057,', 2057);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2060, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省阳江市阳东县', '阳东县', ',1946,2057,', 2057);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2061, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省阳江市阳春市', '阳春市', ',1946,2057,', 2057);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2062, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市', '清远市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2063, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市清城区', '清城区', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2064, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市佛冈县', '佛冈县', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2065, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市阳山县', '阳山县', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2066, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市连山壮族瑶族自治县', '连山壮族瑶族自治县', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2067, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市连南瑶族自治县', '连南瑶族自治县', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2068, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市清新县', '清新县', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2069, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市英德市', '英德市', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2070, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省清远市连州市', '连州市', ',1946,2062,', 2062);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2071, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省东莞市', '东莞市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2072, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省中山市', '中山市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2073, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省潮州市', '潮州市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2074, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省潮州市湘桥区', '湘桥区', ',1946,2073,', 2073);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2075, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省潮州市潮安县', '潮安县', ',1946,2073,', 2073);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2076, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省潮州市饶平县', '饶平县', ',1946,2073,', 2073);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2077, '2013-01-01 09:02:40', '2013-01-01 09:02:40', NULL, '广东省揭阳市', '揭阳市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2078, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省揭阳市榕城区', '榕城区', ',1946,2077,', 2077);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2079, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省揭阳市揭东县', '揭东县', ',1946,2077,', 2077);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2080, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省揭阳市揭西县', '揭西县', ',1946,2077,', 2077);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2081, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省揭阳市惠来县', '惠来县', ',1946,2077,', 2077);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2082, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省揭阳市普宁市', '普宁市', ',1946,2077,', 2077);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2083, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省云浮市', '云浮市', ',1946,', 1946);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2084, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省云浮市云城区', '云城区', ',1946,2083,', 2083);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2085, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省云浮市新兴县', '新兴县', ',1946,2083,', 2083);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2086, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省云浮市郁南县', '郁南县', ',1946,2083,', 2083);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2087, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省云浮市云安县', '云安县', ',1946,2083,', 2083);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2088, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广东省云浮市罗定市', '罗定市', ',1946,2083,', 2083);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2089, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区', '广西壮族自治区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2090, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市', '南宁市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2091, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市兴宁区', '兴宁区', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2092, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市青秀区', '青秀区', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2093, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市江南区', '江南区', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2094, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市西乡塘区', '西乡塘区', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2095, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市良庆区', '良庆区', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2096, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市邕宁区', '邕宁区', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2097, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市武鸣县', '武鸣县', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2098, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市隆安县', '隆安县', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2099, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市马山县', '马山县', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2100, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市上林县', '上林县', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2101, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市宾阳县', '宾阳县', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2102, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区南宁市横县', '横县', ',2089,2090,', 2090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2103, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区柳州市', '柳州市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2104, '2013-01-01 09:02:41', '2013-01-01 09:02:41', NULL, '广西壮族自治区柳州市城中区', '城中区', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2105, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市鱼峰区', '鱼峰区', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2106, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市柳南区', '柳南区', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2107, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市柳北区', '柳北区', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2108, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市柳江县', '柳江县', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2109, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市柳城县', '柳城县', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2110, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市鹿寨县', '鹿寨县', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2111, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市融安县', '融安县', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2112, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市融水苗族自治县', '融水苗族自治县', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2113, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区柳州市三江侗族自治县', '三江侗族自治县', ',2089,2103,', 2103);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2114, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市', '桂林市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2115, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市秀峰区', '秀峰区', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2116, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市叠彩区', '叠彩区', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2117, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市象山区', '象山区', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2118, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市七星区', '七星区', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2119, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市雁山区', '雁山区', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2120, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市阳朔县', '阳朔县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2121, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市临桂县', '临桂县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2122, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市灵川县', '灵川县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2123, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市全州县', '全州县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2124, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市兴安县', '兴安县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2125, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市永福县', '永福县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2126, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市灌阳县', '灌阳县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2127, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市龙胜各族自治县', '龙胜各族自治县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2128, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市资源县', '资源县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2129, '2013-01-01 09:02:42', '2013-01-01 09:02:42', NULL, '广西壮族自治区桂林市平乐县', '平乐县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2130, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区桂林市荔浦县', '荔浦县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2131, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区桂林市恭城瑶族自治县', '恭城瑶族自治县', ',2089,2114,', 2114);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2132, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市', '梧州市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2133, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市万秀区', '万秀区', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2134, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市蝶山区', '蝶山区', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2135, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市长洲区', '长洲区', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2136, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市苍梧县', '苍梧县', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2137, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市藤县', '藤县', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2138, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市蒙山县', '蒙山县', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2139, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区梧州市岑溪市', '岑溪市', ',2089,2132,', 2132);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2140, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区北海市', '北海市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2141, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区北海市海城区', '海城区', ',2089,2140,', 2140);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2142, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区北海市银海区', '银海区', ',2089,2140,', 2140);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2143, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区北海市铁山港区', '铁山港区', ',2089,2140,', 2140);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2144, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区北海市合浦县', '合浦县', ',2089,2140,', 2140);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2145, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区防城港市', '防城港市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2146, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区防城港市港口区', '港口区', ',2089,2145,', 2145);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2147, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区防城港市防城区', '防城区', ',2089,2145,', 2145);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2148, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区防城港市上思县', '上思县', ',2089,2145,', 2145);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2149, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区防城港市东兴市', '东兴市', ',2089,2145,', 2145);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2150, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区钦州市', '钦州市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2151, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区钦州市钦南区', '钦南区', ',2089,2150,', 2150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2152, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区钦州市钦北区', '钦北区', ',2089,2150,', 2150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2153, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区钦州市灵山县', '灵山县', ',2089,2150,', 2150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2154, '2013-01-01 09:02:43', '2013-01-01 09:02:43', NULL, '广西壮族自治区钦州市浦北县', '浦北县', ',2089,2150,', 2150);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2155, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区贵港市', '贵港市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2156, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区贵港市港北区', '港北区', ',2089,2155,', 2155);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2157, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区贵港市港南区', '港南区', ',2089,2155,', 2155);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2158, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区贵港市覃塘区', '覃塘区', ',2089,2155,', 2155);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2159, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区贵港市平南县', '平南县', ',2089,2155,', 2155);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2160, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区贵港市桂平市', '桂平市', ',2089,2155,', 2155);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2161, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市', '玉林市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2162, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市玉州区', '玉州区', ',2089,2161,', 2161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2163, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市容县', '容县', ',2089,2161,', 2161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2164, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市陆川县', '陆川县', ',2089,2161,', 2161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2165, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市博白县', '博白县', ',2089,2161,', 2161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2166, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市兴业县', '兴业县', ',2089,2161,', 2161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2167, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区玉林市北流市', '北流市', ',2089,2161,', 2161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2168, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市', '百色市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2169, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市右江区', '右江区', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2170, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市田阳县', '田阳县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2171, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市田东县', '田东县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2172, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市平果县', '平果县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2173, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市德保县', '德保县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2174, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市靖西县', '靖西县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2175, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市那坡县', '那坡县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2176, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市凌云县', '凌云县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2177, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市乐业县', '乐业县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2178, '2013-01-01 09:02:44', '2013-01-01 09:02:44', NULL, '广西壮族自治区百色市田林县', '田林县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2179, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区百色市西林县', '西林县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2180, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区百色市隆林各族自治县', '隆林各族自治县', ',2089,2168,', 2168);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2181, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区贺州市', '贺州市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2182, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区贺州市八步区', '八步区', ',2089,2181,', 2181);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2183, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区贺州市昭平县', '昭平县', ',2089,2181,', 2181);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2184, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区贺州市钟山县', '钟山县', ',2089,2181,', 2181);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2185, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区贺州市富川瑶族自治县', '富川瑶族自治县', ',2089,2181,', 2181);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2186, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市', '河池市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2187, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市金城江区', '金城江区', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2188, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市南丹县', '南丹县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2189, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市天峨县', '天峨县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2190, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市凤山县', '凤山县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2191, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市东兰县', '东兰县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2192, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市罗城仫佬族自治县', '罗城仫佬族自治县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2193, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市环江毛南族自治县', '环江毛南族自治县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2194, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市巴马瑶族自治县', '巴马瑶族自治县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2195, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市都安瑶族自治县', '都安瑶族自治县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2196, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市大化瑶族自治县', '大化瑶族自治县', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2197, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区河池市宜州市', '宜州市', ',2089,2186,', 2186);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2198, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区来宾市', '来宾市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2199, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区来宾市兴宾区', '兴宾区', ',2089,2198,', 2198);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2200, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区来宾市忻城县', '忻城县', ',2089,2198,', 2198);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2201, '2013-01-01 09:02:45', '2013-01-01 09:02:45', NULL, '广西壮族自治区来宾市象州县', '象州县', ',2089,2198,', 2198);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2202, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区来宾市武宣县', '武宣县', ',2089,2198,', 2198);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2203, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区来宾市金秀瑶族自治县', '金秀瑶族自治县', ',2089,2198,', 2198);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2204, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区来宾市合山市', '合山市', ',2089,2198,', 2198);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2205, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市', '崇左市', ',2089,', 2089);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2206, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市江洲区', '江洲区', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2207, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市扶绥县', '扶绥县', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2208, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市宁明县', '宁明县', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2209, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市龙州县', '龙州县', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2210, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市大新县', '大新县', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2211, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市天等县', '天等县', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2212, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '广西壮族自治区崇左市凭祥市', '凭祥市', ',2089,2205,', 2205);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2213, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省', '海南省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2214, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省海口市', '海口市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2215, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省海口市秀英区', '秀英区', ',2213,2214,', 2214);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2216, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省海口市龙华区', '龙华区', ',2213,2214,', 2214);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2217, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省海口市琼山区', '琼山区', ',2213,2214,', 2214);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2218, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省海口市美兰区', '美兰区', ',2213,2214,', 2214);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2219, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省三亚市', '三亚市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2220, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省三沙市', '三沙市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2221, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省三沙市西沙群岛', '西沙群岛', ',2213,2220,', 2220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2222, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省三沙市南沙群岛', '南沙群岛', ',2213,2220,', 2220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2223, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省三沙市中沙群岛的岛礁及其海域', '中沙群岛的岛礁及其海域', ',2213,2220,', 2220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2224, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省五指山市', '五指山市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2225, '2013-01-01 09:02:46', '2013-01-01 09:02:46', NULL, '海南省琼海市', '琼海市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2226, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省儋州市', '儋州市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2227, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省文昌市', '文昌市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2228, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省万宁市', '万宁市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2229, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省东方市', '东方市', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2230, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省定安县', '定安县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2231, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省屯昌县', '屯昌县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2232, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省澄迈县', '澄迈县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2233, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省临高县', '临高县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2234, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省白沙黎族自治县', '白沙黎族自治县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2235, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省昌江黎族自治县', '昌江黎族自治县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2236, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省乐东黎族自治县', '乐东黎族自治县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2237, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省陵水黎族自治县', '陵水黎族自治县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2238, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省保亭黎族苗族自治县', '保亭黎族苗族自治县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2239, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '海南省琼中黎族苗族自治县', '琼中黎族苗族自治县', ',2213,', 2213);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2240, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市', '重庆市', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2241, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市万州区', '万州区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2242, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市涪陵区', '涪陵区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2243, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市渝中区', '渝中区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2244, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市大渡口区', '大渡口区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2245, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市江北区', '江北区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2246, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市沙坪坝区', '沙坪坝区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2247, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市九龙坡区', '九龙坡区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2248, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市南岸区', '南岸区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2249, '2013-01-01 09:02:47', '2013-01-01 09:02:47', NULL, '重庆市北碚区', '北碚区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2250, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市綦江区', '綦江区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2251, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市大足区', '大足区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2252, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市渝北区', '渝北区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2253, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市巴南区', '巴南区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2254, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市黔江区', '黔江区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2255, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市长寿区', '长寿区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2256, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市江津区', '江津区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2257, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市合川区', '合川区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2258, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市永川区', '永川区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2259, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市南川区', '南川区', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2260, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市潼南县', '潼南县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2261, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市铜梁县', '铜梁县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2262, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市荣昌县', '荣昌县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2263, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市璧山县', '璧山县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2264, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市梁平县', '梁平县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2265, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市城口县', '城口县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2266, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市丰都县', '丰都县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2267, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市垫江县', '垫江县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2268, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市武隆县', '武隆县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2269, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市忠县', '忠县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2270, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市开县', '开县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2271, '2013-01-01 09:02:48', '2013-01-01 09:02:48', NULL, '重庆市云阳县', '云阳县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2272, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市奉节县', '奉节县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2273, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市巫山县', '巫山县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2274, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市巫溪县', '巫溪县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2275, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市石柱土家族自治县', '石柱土家族自治县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2276, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市秀山土家族苗族自治县', '秀山土家族苗族自治县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2277, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市酉阳土家族苗族自治县', '酉阳土家族苗族自治县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2278, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '重庆市彭水苗族土家族自治县', '彭水苗族土家族自治县', ',2240,', 2240);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2279, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省', '四川省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2280, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市', '成都市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2281, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市锦江区', '锦江区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2282, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市青羊区', '青羊区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2283, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市金牛区', '金牛区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2284, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市武侯区', '武侯区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2285, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市成华区', '成华区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2286, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市龙泉驿区', '龙泉驿区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2287, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市青白江区', '青白江区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2288, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市新都区', '新都区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2289, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市温江区', '温江区', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2290, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市金堂县', '金堂县', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2291, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市双流县', '双流县', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2292, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市郫县', '郫县', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2293, '2013-01-01 09:02:49', '2013-01-01 09:02:49', NULL, '四川省成都市大邑县', '大邑县', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2294, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省成都市蒲江县', '蒲江县', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2295, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省成都市新津县', '新津县', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2296, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省成都市都江堰市', '都江堰市', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2297, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省成都市彭州市', '彭州市', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2298, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省成都市邛崃市', '邛崃市', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2299, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省成都市崇州市', '崇州市', ',2279,2280,', 2280);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2300, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市', '自贡市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2301, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市自流井区', '自流井区', ',2279,2300,', 2300);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2302, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市贡井区', '贡井区', ',2279,2300,', 2300);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2303, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市大安区', '大安区', ',2279,2300,', 2300);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2304, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市沿滩区', '沿滩区', ',2279,2300,', 2300);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2305, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市荣县', '荣县', ',2279,2300,', 2300);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2306, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省自贡市富顺县', '富顺县', ',2279,2300,', 2300);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2307, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省攀枝花市', '攀枝花市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2308, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省攀枝花市东区', '东区', ',2279,2307,', 2307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2309, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省攀枝花市西区', '西区', ',2279,2307,', 2307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2310, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省攀枝花市仁和区', '仁和区', ',2279,2307,', 2307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2311, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省攀枝花市米易县', '米易县', ',2279,2307,', 2307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2312, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省攀枝花市盐边县', '盐边县', ',2279,2307,', 2307);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2313, '2013-01-01 09:02:50', '2013-01-01 09:02:50', NULL, '四川省泸州市', '泸州市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2314, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市江阳区', '江阳区', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2315, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市纳溪区', '纳溪区', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2316, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市龙马潭区', '龙马潭区', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2317, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市泸县', '泸县', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2318, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市合江县', '合江县', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2319, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市叙永县', '叙永县', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2320, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省泸州市古蔺县', '古蔺县', ',2279,2313,', 2313);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2321, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市', '德阳市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2322, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市旌阳区', '旌阳区', ',2279,2321,', 2321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2323, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市中江县', '中江县', ',2279,2321,', 2321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2324, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市罗江县', '罗江县', ',2279,2321,', 2321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2325, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市广汉市', '广汉市', ',2279,2321,', 2321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2326, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市什邡市', '什邡市', ',2279,2321,', 2321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2327, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省德阳市绵竹市', '绵竹市', ',2279,2321,', 2321);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2328, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市', '绵阳市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2329, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市涪城区', '涪城区', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2330, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市游仙区', '游仙区', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2331, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市三台县', '三台县', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2332, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市盐亭县', '盐亭县', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2333, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市安县', '安县', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2334, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市梓潼县', '梓潼县', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2335, '2013-01-01 09:02:51', '2013-01-01 09:02:51', NULL, '四川省绵阳市北川羌族自治县', '北川羌族自治县', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2336, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省绵阳市平武县', '平武县', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2337, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省绵阳市江油市', '江油市', ',2279,2328,', 2328);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2338, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市', '广元市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2339, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市利州区', '利州区', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2340, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市元坝区', '元坝区', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2341, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市朝天区', '朝天区', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2342, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市旺苍县', '旺苍县', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2343, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市青川县', '青川县', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2344, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市剑阁县', '剑阁县', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2345, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省广元市苍溪县', '苍溪县', ',2279,2338,', 2338);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2346, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省遂宁市', '遂宁市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2347, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省遂宁市船山区', '船山区', ',2279,2346,', 2346);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2348, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省遂宁市安居区', '安居区', ',2279,2346,', 2346);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2349, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省遂宁市蓬溪县', '蓬溪县', ',2279,2346,', 2346);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2350, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省遂宁市射洪县', '射洪县', ',2279,2346,', 2346);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2351, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省遂宁市大英县', '大英县', ',2279,2346,', 2346);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2352, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省内江市', '内江市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2353, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省内江市市中区', '市中区', ',2279,2352,', 2352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2354, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省内江市东兴区', '东兴区', ',2279,2352,', 2352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2355, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省内江市威远县', '威远县', ',2279,2352,', 2352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2356, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省内江市资中县', '资中县', ',2279,2352,', 2352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2357, '2013-01-01 09:02:52', '2013-01-01 09:02:52', NULL, '四川省内江市隆昌县', '隆昌县', ',2279,2352,', 2352);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2358, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市', '乐山市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2359, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市市中区', '市中区', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2360, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市沙湾区', '沙湾区', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2361, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市五通桥区', '五通桥区', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2362, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市金口河区', '金口河区', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2363, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市犍为县', '犍为县', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2364, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市井研县', '井研县', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2365, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市夹江县', '夹江县', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2366, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市沐川县', '沐川县', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2367, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市峨边彝族自治县', '峨边彝族自治县', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2368, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市马边彝族自治县', '马边彝族自治县', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2369, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省乐山市峨眉山市', '峨眉山市', ',2279,2358,', 2358);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2370, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市', '南充市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2371, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市顺庆区', '顺庆区', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2372, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市高坪区', '高坪区', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2373, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市嘉陵区', '嘉陵区', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2374, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市南部县', '南部县', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2375, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市营山县', '营山县', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2376, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市蓬安县', '蓬安县', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2377, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市仪陇县', '仪陇县', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2378, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市西充县', '西充县', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2379, '2013-01-01 09:02:53', '2013-01-01 09:02:53', NULL, '四川省南充市阆中市', '阆中市', ',2279,2370,', 2370);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2380, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市', '眉山市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2381, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市东坡区', '东坡区', ',2279,2380,', 2380);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2382, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市仁寿县', '仁寿县', ',2279,2380,', 2380);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2383, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市彭山县', '彭山县', ',2279,2380,', 2380);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2384, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市洪雅县', '洪雅县', ',2279,2380,', 2380);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2385, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市丹棱县', '丹棱县', ',2279,2380,', 2380);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2386, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省眉山市青神县', '青神县', ',2279,2380,', 2380);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2387, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市', '宜宾市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2388, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市翠屏区', '翠屏区', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2389, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市南溪区', '南溪区', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2390, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市宜宾县', '宜宾县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2391, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市江安县', '江安县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2392, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市长宁县', '长宁县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2393, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市高县', '高县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2394, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市珙县', '珙县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2395, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市筠连县', '筠连县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2396, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市兴文县', '兴文县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2397, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省宜宾市屏山县', '屏山县', ',2279,2387,', 2387);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2398, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省广安市', '广安市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2399, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省广安市广安区', '广安区', ',2279,2398,', 2398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2400, '2013-01-01 09:02:54', '2013-01-01 09:02:54', NULL, '四川省广安市岳池县', '岳池县', ',2279,2398,', 2398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2401, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省广安市武胜县', '武胜县', ',2279,2398,', 2398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2402, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省广安市邻水县', '邻水县', ',2279,2398,', 2398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2403, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省广安市华蓥市', '华蓥市', ',2279,2398,', 2398);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2404, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市', '达州市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2405, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市通川区', '通川区', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2406, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市达县', '达县', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2407, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市宣汉县', '宣汉县', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2408, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市开江县', '开江县', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2409, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市大竹县', '大竹县', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2410, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市渠县', '渠县', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2411, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省达州市万源市', '万源市', ',2279,2404,', 2404);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2412, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市', '雅安市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2413, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市雨城区', '雨城区', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2414, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市名山区', '名山区', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2415, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市荥经县', '荥经县', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2416, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市汉源县', '汉源县', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2417, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市石棉县', '石棉县', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2418, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市天全县', '天全县', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2419, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市芦山县', '芦山县', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2420, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省雅安市宝兴县', '宝兴县', ',2279,2412,', 2412);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2421, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省巴中市', '巴中市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2422, '2013-01-01 09:02:55', '2013-01-01 09:02:55', NULL, '四川省巴中市巴州区', '巴州区', ',2279,2421,', 2421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2423, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省巴中市通江县', '通江县', ',2279,2421,', 2421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2424, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省巴中市南江县', '南江县', ',2279,2421,', 2421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2425, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省巴中市平昌县', '平昌县', ',2279,2421,', 2421);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2426, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省资阳市', '资阳市', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2427, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省资阳市雁江区', '雁江区', ',2279,2426,', 2426);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2428, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省资阳市安岳县', '安岳县', ',2279,2426,', 2426);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2429, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省资阳市乐至县', '乐至县', ',2279,2426,', 2426);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2430, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省资阳市简阳市', '简阳市', ',2279,2426,', 2426);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2431, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州', '阿坝藏族羌族自治州', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2432, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州汶川县', '汶川县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2433, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州理县', '理县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2434, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州茂县', '茂县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2435, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州松潘县', '松潘县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2436, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州九寨沟县', '九寨沟县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2437, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州金川县', '金川县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2438, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州小金县', '小金县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2439, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州黑水县', '黑水县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2440, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州马尔康县', '马尔康县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2441, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州壤塘县', '壤塘县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2442, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州阿坝县', '阿坝县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2443, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州若尔盖县', '若尔盖县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2444, '2013-01-01 09:02:56', '2013-01-01 09:02:56', NULL, '四川省阿坝藏族羌族自治州红原县', '红原县', ',2279,2431,', 2431);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2445, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州', '甘孜藏族自治州', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2446, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州康定县', '康定县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2447, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州泸定县', '泸定县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2448, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州丹巴县', '丹巴县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2449, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州九龙县', '九龙县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2450, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州雅江县', '雅江县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2451, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州道孚县', '道孚县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2452, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州炉霍县', '炉霍县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2453, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州甘孜县', '甘孜县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2454, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州新龙县', '新龙县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2455, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州德格县', '德格县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2456, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州白玉县', '白玉县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2457, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州石渠县', '石渠县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2458, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州色达县', '色达县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2459, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州理塘县', '理塘县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2460, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州巴塘县', '巴塘县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2461, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州乡城县', '乡城县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2462, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州稻城县', '稻城县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2463, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省甘孜藏族自治州得荣县', '得荣县', ',2279,2445,', 2445);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2464, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省凉山彝族自治州', '凉山彝族自治州', ',2279,', 2279);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2465, '2013-01-01 09:02:57', '2013-01-01 09:02:57', NULL, '四川省凉山彝族自治州西昌市', '西昌市', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2466, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州木里藏族自治县', '木里藏族自治县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2467, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州盐源县', '盐源县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2468, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州德昌县', '德昌县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2469, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州会理县', '会理县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2470, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州会东县', '会东县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2471, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州宁南县', '宁南县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2472, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州普格县', '普格县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2473, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州布拖县', '布拖县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2474, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州金阳县', '金阳县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2475, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州昭觉县', '昭觉县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2476, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州喜德县', '喜德县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2477, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州冕宁县', '冕宁县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2478, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州越西县', '越西县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2479, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州甘洛县', '甘洛县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2480, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州美姑县', '美姑县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2481, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '四川省凉山彝族自治州雷波县', '雷波县', ',2279,2464,', 2464);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2482, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '贵州省', '贵州省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2483, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '贵州省贵阳市', '贵阳市', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2484, '2013-01-01 09:02:58', '2013-01-01 09:02:58', NULL, '贵州省贵阳市南明区', '南明区', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2485, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市云岩区', '云岩区', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2486, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市花溪区', '花溪区', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2487, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市乌当区', '乌当区', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2488, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市白云区', '白云区', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2489, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市小河区', '小河区', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2490, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市开阳县', '开阳县', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2491, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市息烽县', '息烽县', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2492, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市修文县', '修文县', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2493, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省贵阳市清镇市', '清镇市', ',2482,2483,', 2483);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2494, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省六盘水市', '六盘水市', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2495, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省六盘水市钟山区', '钟山区', ',2482,2494,', 2494);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2496, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省六盘水市六枝特区', '六枝特区', ',2482,2494,', 2494);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2497, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省六盘水市水城县', '水城县', ',2482,2494,', 2494);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2498, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省六盘水市盘县', '盘县', ',2482,2494,', 2494);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2499, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省遵义市', '遵义市', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2500, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省遵义市红花岗区', '红花岗区', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2501, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省遵义市汇川区', '汇川区', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2502, '2013-01-01 09:02:59', '2013-01-01 09:02:59', NULL, '贵州省遵义市遵义县', '遵义县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2503, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市桐梓县', '桐梓县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2504, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市绥阳县', '绥阳县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2505, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市正安县', '正安县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2506, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市道真仡佬族苗族自治县', '道真仡佬族苗族自治县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2507, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市务川仡佬族苗族自治县', '务川仡佬族苗族自治县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2508, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市凤冈县', '凤冈县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2509, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市湄潭县', '湄潭县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2510, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市余庆县', '余庆县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2511, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市习水县', '习水县', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2512, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市赤水市', '赤水市', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2513, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省遵义市仁怀市', '仁怀市', ',2482,2499,', 2499);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2514, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市', '安顺市', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2515, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市西秀区', '西秀区', ',2482,2514,', 2514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2516, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市平坝县', '平坝县', ',2482,2514,', 2514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2517, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市普定县', '普定县', ',2482,2514,', 2514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2518, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市镇宁布依族苗族自治县', '镇宁布依族苗族自治县', ',2482,2514,', 2514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2519, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市关岭布依族苗族自治县', '关岭布依族苗族自治县', ',2482,2514,', 2514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2520, '2013-01-01 09:03:00', '2013-01-01 09:03:00', NULL, '贵州省安顺市紫云苗族布依族自治县', '紫云苗族布依族自治县', ',2482,2514,', 2514);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2521, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市', '毕节市', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2522, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市七星关区', '七星关区', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2523, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市大方县', '大方县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2524, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市黔西县', '黔西县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2525, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市金沙县', '金沙县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2526, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市织金县', '织金县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2527, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市纳雍县', '纳雍县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2528, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市威宁彝族回族苗族自治县', '威宁彝族回族苗族自治县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2529, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省毕节市赫章县', '赫章县', ',2482,2521,', 2521);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2530, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市', '铜仁市', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2531, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市碧江区', '碧江区', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2532, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市万山区', '万山区', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2533, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市江口县', '江口县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2534, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市玉屏侗族自治县', '玉屏侗族自治县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2535, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市石阡县', '石阡县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2536, '2013-01-01 09:03:01', '2013-01-01 09:03:01', NULL, '贵州省铜仁市思南县', '思南县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2537, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省铜仁市印江土家族苗族自治县', '印江土家族苗族自治县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2538, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省铜仁市德江县', '德江县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2539, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省铜仁市沿河土家族自治县', '沿河土家族自治县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2540, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省铜仁市松桃苗族自治县', '松桃苗族自治县', ',2482,2530,', 2530);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2541, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州', '黔西南布依族苗族自治州', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2542, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州兴义市', '兴义市', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2543, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州兴仁县', '兴仁县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2544, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州普安县', '普安县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2545, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州晴隆县', '晴隆县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2546, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州贞丰县', '贞丰县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2547, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州望谟县', '望谟县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2548, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州册亨县', '册亨县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2549, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔西南布依族苗族自治州安龙县', '安龙县', ',2482,2541,', 2541);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2550, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔东南苗族侗族自治州', '黔东南苗族侗族自治州', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2551, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔东南苗族侗族自治州凯里市', '凯里市', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2552, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔东南苗族侗族自治州黄平县', '黄平县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2553, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔东南苗族侗族自治州施秉县', '施秉县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2554, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔东南苗族侗族自治州三穗县', '三穗县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2555, '2013-01-01 09:03:02', '2013-01-01 09:03:02', NULL, '贵州省黔东南苗族侗族自治州镇远县', '镇远县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2556, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州岑巩县', '岑巩县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2557, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州天柱县', '天柱县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2558, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州锦屏县', '锦屏县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2559, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州剑河县', '剑河县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2560, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州台江县', '台江县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2561, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州黎平县', '黎平县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2562, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州榕江县', '榕江县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2563, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州从江县', '从江县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2564, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州雷山县', '雷山县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2565, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州麻江县', '麻江县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2566, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔东南苗族侗族自治州丹寨县', '丹寨县', ',2482,2550,', 2550);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2567, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州', '黔南布依族苗族自治州', ',2482,', 2482);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2568, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州都匀市', '都匀市', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2569, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州福泉市', '福泉市', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2570, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州荔波县', '荔波县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2571, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州贵定县', '贵定县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2572, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州瓮安县', '瓮安县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2573, '2013-01-01 09:03:03', '2013-01-01 09:03:03', NULL, '贵州省黔南布依族苗族自治州独山县', '独山县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2574, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '贵州省黔南布依族苗族自治州平塘县', '平塘县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2575, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '贵州省黔南布依族苗族自治州罗甸县', '罗甸县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2576, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '贵州省黔南布依族苗族自治州长顺县', '长顺县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2577, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '贵州省黔南布依族苗族自治州龙里县', '龙里县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2578, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '贵州省黔南布依族苗族自治州惠水县', '惠水县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2579, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '贵州省黔南布依族苗族自治州三都水族自治县', '三都水族自治县', ',2482,2567,', 2567);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2580, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省', '云南省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2581, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市', '昆明市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2582, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市五华区', '五华区', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2583, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市盘龙区', '盘龙区', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2584, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市官渡区', '官渡区', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2585, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市西山区', '西山区', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2586, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市东川区', '东川区', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2587, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市呈贡区', '呈贡区', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2588, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市晋宁县', '晋宁县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2589, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市富民县', '富民县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2590, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市宜良县', '宜良县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2591, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市石林彝族自治县', '石林彝族自治县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2592, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市嵩明县', '嵩明县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2593, '2013-01-01 09:03:04', '2013-01-01 09:03:04', NULL, '云南省昆明市禄劝彝族苗族自治县', '禄劝彝族苗族自治县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2594, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省昆明市寻甸回族彝族自治县', '寻甸回族彝族自治县', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2595, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省昆明市安宁市', '安宁市', ',2580,2581,', 2581);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2596, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市', '曲靖市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2597, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市麒麟区', '麒麟区', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2598, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市马龙县', '马龙县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2599, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市陆良县', '陆良县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2600, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市师宗县', '师宗县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2601, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市罗平县', '罗平县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2602, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市富源县', '富源县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2603, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市会泽县', '会泽县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2604, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市沾益县', '沾益县', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2605, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省曲靖市宣威市', '宣威市', ',2580,2596,', 2596);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2606, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市', '玉溪市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2607, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市红塔区', '红塔区', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2608, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市江川县', '江川县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2609, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市澄江县', '澄江县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2610, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市通海县', '通海县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2611, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市华宁县', '华宁县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2612, '2013-01-01 09:03:05', '2013-01-01 09:03:05', NULL, '云南省玉溪市易门县', '易门县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2613, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省玉溪市峨山彝族自治县', '峨山彝族自治县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2614, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省玉溪市新平彝族傣族自治县', '新平彝族傣族自治县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2615, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省玉溪市元江哈尼族彝族傣族自治县', '元江哈尼族彝族傣族自治县', ',2580,2606,', 2606);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2616, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省保山市', '保山市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2617, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省保山市隆阳区', '隆阳区', ',2580,2616,', 2616);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2618, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省保山市施甸县', '施甸县', ',2580,2616,', 2616);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2619, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省保山市腾冲县', '腾冲县', ',2580,2616,', 2616);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2620, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省保山市龙陵县', '龙陵县', ',2580,2616,', 2616);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2621, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省保山市昌宁县', '昌宁县', ',2580,2616,', 2616);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2622, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市', '昭通市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2623, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市昭阳区', '昭阳区', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2624, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市鲁甸县', '鲁甸县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2625, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市巧家县', '巧家县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2626, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市盐津县', '盐津县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2627, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市大关县', '大关县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2628, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市永善县', '永善县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2629, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市绥江县', '绥江县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2630, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市镇雄县', '镇雄县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2631, '2013-01-01 09:03:06', '2013-01-01 09:03:06', NULL, '云南省昭通市彝良县', '彝良县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2632, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省昭通市威信县', '威信县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2633, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省昭通市水富县', '水富县', ',2580,2622,', 2622);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2634, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省丽江市', '丽江市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2635, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省丽江市古城区', '古城区', ',2580,2634,', 2634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2636, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省丽江市玉龙纳西族自治县', '玉龙纳西族自治县', ',2580,2634,', 2634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2637, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省丽江市永胜县', '永胜县', ',2580,2634,', 2634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2638, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省丽江市华坪县', '华坪县', ',2580,2634,', 2634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2639, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省丽江市宁蒗彝族自治县', '宁蒗彝族自治县', ',2580,2634,', 2634);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2640, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市', '普洱市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2641, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市思茅区', '思茅区', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2642, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市宁洱哈尼族彝族自治县', '宁洱哈尼族彝族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2643, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市墨江哈尼族自治县', '墨江哈尼族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2644, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市景东彝族自治县', '景东彝族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2645, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市景谷傣族彝族自治县', '景谷傣族彝族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2646, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市镇沅彝族哈尼族拉祜族自治县', '镇沅彝族哈尼族拉祜族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2647, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市江城哈尼族彝族自治县', '江城哈尼族彝族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2648, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市孟连傣族拉祜族佤族自治县', '孟连傣族拉祜族佤族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2649, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市澜沧拉祜族自治县', '澜沧拉祜族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2650, '2013-01-01 09:03:07', '2013-01-01 09:03:07', NULL, '云南省普洱市西盟佤族自治县', '西盟佤族自治县', ',2580,2640,', 2640);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2651, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市', '临沧市', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2652, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市临翔区', '临翔区', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2653, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市凤庆县', '凤庆县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2654, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市云县', '云县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2655, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市永德县', '永德县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2656, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市镇康县', '镇康县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2657, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市双江拉祜族佤族布朗族傣族自治县', '双江拉祜族佤族布朗族傣族自治县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2658, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市耿马傣族佤族自治县', '耿马傣族佤族自治县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2659, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省临沧市沧源佤族自治县', '沧源佤族自治县', ',2580,2651,', 2651);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2660, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州', '楚雄彝族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2661, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州楚雄市', '楚雄市', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2662, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州双柏县', '双柏县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2663, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州牟定县', '牟定县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2664, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州南华县', '南华县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2665, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州姚安县', '姚安县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2666, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州大姚县', '大姚县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2667, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州永仁县', '永仁县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2668, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州元谋县', '元谋县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2669, '2013-01-01 09:03:08', '2013-01-01 09:03:08', NULL, '云南省楚雄彝族自治州武定县', '武定县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2670, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省楚雄彝族自治州禄丰县', '禄丰县', ',2580,2660,', 2660);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2671, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州', '红河哈尼族彝族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2672, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州个旧市', '个旧市', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2673, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州开远市', '开远市', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2674, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州蒙自市', '蒙自市', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2675, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州屏边苗族自治县', '屏边苗族自治县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2676, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州建水县', '建水县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2677, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州石屏县', '石屏县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2678, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州弥勒县', '弥勒县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2679, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州泸西县', '泸西县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2680, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州元阳县', '元阳县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2681, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州红河县', '红河县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2682, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县', '金平苗族瑶族傣族自治县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2683, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州绿春县', '绿春县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2684, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省红河哈尼族彝族自治州河口瑶族自治县', '河口瑶族自治县', ',2580,2671,', 2671);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2685, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省文山壮族苗族自治州', '文山壮族苗族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2686, '2013-01-01 09:03:09', '2013-01-01 09:03:09', NULL, '云南省文山壮族苗族自治州文山市', '文山市', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2687, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州砚山县', '砚山县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2688, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州西畴县', '西畴县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2689, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州麻栗坡县', '麻栗坡县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2690, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州马关县', '马关县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2691, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州丘北县', '丘北县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2692, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州广南县', '广南县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2693, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省文山壮族苗族自治州富宁县', '富宁县', ',2580,2685,', 2685);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2694, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省西双版纳傣族自治州', '西双版纳傣族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2695, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省西双版纳傣族自治州景洪市', '景洪市', ',2580,2694,', 2694);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2696, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省西双版纳傣族自治州勐海县', '勐海县', ',2580,2694,', 2694);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2697, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省西双版纳傣族自治州勐腊县', '勐腊县', ',2580,2694,', 2694);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2698, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州', '大理白族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2699, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州大理市', '大理市', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2700, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州漾濞彝族自治县', '漾濞彝族自治县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2701, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州祥云县', '祥云县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2702, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州宾川县', '宾川县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2703, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州弥渡县', '弥渡县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2704, '2013-01-01 09:03:10', '2013-01-01 09:03:10', NULL, '云南省大理白族自治州南涧彝族自治县', '南涧彝族自治县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2705, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省大理白族自治州巍山彝族回族自治县', '巍山彝族回族自治县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2706, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省大理白族自治州永平县', '永平县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2707, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省大理白族自治州云龙县', '云龙县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2708, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省大理白族自治州洱源县', '洱源县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2709, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省大理白族自治州剑川县', '剑川县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2710, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省大理白族自治州鹤庆县', '鹤庆县', ',2580,2698,', 2698);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2711, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省德宏傣族景颇族自治州', '德宏傣族景颇族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2712, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省德宏傣族景颇族自治州瑞丽市', '瑞丽市', ',2580,2711,', 2711);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2713, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省德宏傣族景颇族自治州芒市', '芒市', ',2580,2711,', 2711);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2714, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省德宏傣族景颇族自治州梁河县', '梁河县', ',2580,2711,', 2711);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2715, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省德宏傣族景颇族自治州盈江县', '盈江县', ',2580,2711,', 2711);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2716, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省德宏傣族景颇族自治州陇川县', '陇川县', ',2580,2711,', 2711);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2717, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省怒江傈僳族自治州', '怒江傈僳族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2718, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省怒江傈僳族自治州泸水县', '泸水县', ',2580,2717,', 2717);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2719, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省怒江傈僳族自治州福贡县', '福贡县', ',2580,2717,', 2717);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2720, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省怒江傈僳族自治州贡山独龙族怒族自治县', '贡山独龙族怒族自治县', ',2580,2717,', 2717);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2721, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省怒江傈僳族自治州兰坪白族普米族自治县', '兰坪白族普米族自治县', ',2580,2717,', 2717);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2722, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省迪庆藏族自治州', '迪庆藏族自治州', ',2580,', 2580);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2723, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省迪庆藏族自治州香格里拉县', '香格里拉县', ',2580,2722,', 2722);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2724, '2013-01-01 09:03:11', '2013-01-01 09:03:11', NULL, '云南省迪庆藏族自治州德钦县', '德钦县', ',2580,2722,', 2722);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2725, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '云南省迪庆藏族自治州维西傈僳族自治县', '维西傈僳族自治县', ',2580,2722,', 2722);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2726, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区', '西藏自治区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2727, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市', '拉萨市', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2728, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市城关区', '城关区', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2729, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市林周县', '林周县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2730, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市当雄县', '当雄县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2731, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市尼木县', '尼木县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2732, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市曲水县', '曲水县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2733, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市堆龙德庆县', '堆龙德庆县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2734, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市达孜县', '达孜县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2735, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区拉萨市墨竹工卡县', '墨竹工卡县', ',2726,2727,', 2727);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2736, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区', '昌都地区', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2737, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区昌都县', '昌都县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2738, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区江达县', '江达县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2739, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区贡觉县', '贡觉县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2740, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区类乌齐县', '类乌齐县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2741, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区丁青县', '丁青县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2742, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区察雅县', '察雅县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2743, '2013-01-01 09:03:12', '2013-01-01 09:03:12', NULL, '西藏自治区昌都地区八宿县', '八宿县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2744, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区昌都地区左贡县', '左贡县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2745, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区昌都地区芒康县', '芒康县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2746, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区昌都地区洛隆县', '洛隆县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2747, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区昌都地区边坝县', '边坝县', ',2726,2736,', 2736);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2748, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区', '山南地区', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2749, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区乃东县', '乃东县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2750, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区扎囊县', '扎囊县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2751, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区贡嘎县', '贡嘎县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2752, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区桑日县', '桑日县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2753, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区琼结县', '琼结县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2754, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区曲松县', '曲松县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2755, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区措美县', '措美县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2756, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区洛扎县', '洛扎县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2757, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区加查县', '加查县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2758, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区隆子县', '隆子县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2759, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区错那县', '错那县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2760, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区山南地区浪卡子县', '浪卡子县', ',2726,2748,', 2748);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2761, '2013-01-01 09:03:13', '2013-01-01 09:03:13', NULL, '西藏自治区日喀则地区', '日喀则地区', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2762, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区日喀则市', '日喀则市', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2763, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区南木林县', '南木林县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2764, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区江孜县', '江孜县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2765, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区定日县', '定日县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2766, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区萨迦县', '萨迦县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2767, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区拉孜县', '拉孜县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2768, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区昂仁县', '昂仁县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2769, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区谢通门县', '谢通门县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2770, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区白朗县', '白朗县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2771, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区仁布县', '仁布县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2772, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区康马县', '康马县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2773, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区定结县', '定结县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2774, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区仲巴县', '仲巴县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2775, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区亚东县', '亚东县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2776, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区吉隆县', '吉隆县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2777, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区聂拉木县', '聂拉木县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2778, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区萨嘎县', '萨嘎县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2779, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区日喀则地区岗巴县', '岗巴县', ',2726,2761,', 2761);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2780, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区那曲地区', '那曲地区', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2781, '2013-01-01 09:03:14', '2013-01-01 09:03:14', NULL, '西藏自治区那曲地区那曲县', '那曲县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2782, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区嘉黎县', '嘉黎县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2783, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区比如县', '比如县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2784, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区聂荣县', '聂荣县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2785, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区安多县', '安多县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2786, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区申扎县', '申扎县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2787, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区索县', '索县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2788, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区班戈县', '班戈县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2789, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区巴青县', '巴青县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2790, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区那曲地区尼玛县', '尼玛县', ',2726,2780,', 2780);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2791, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区', '阿里地区', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2792, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区普兰县', '普兰县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2793, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区札达县', '札达县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2794, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区噶尔县', '噶尔县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2795, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区日土县', '日土县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2796, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区革吉县', '革吉县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2797, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区改则县', '改则县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2798, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区阿里地区措勤县', '措勤县', ',2726,2791,', 2791);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2799, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区林芝地区', '林芝地区', ',2726,', 2726);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2800, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区林芝地区林芝县', '林芝县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2801, '2013-01-01 09:03:15', '2013-01-01 09:03:15', NULL, '西藏自治区林芝地区工布江达县', '工布江达县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2802, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '西藏自治区林芝地区米林县', '米林县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2803, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '西藏自治区林芝地区墨脱县', '墨脱县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2804, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '西藏自治区林芝地区波密县', '波密县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2805, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '西藏自治区林芝地区察隅县', '察隅县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2806, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '西藏自治区林芝地区朗县', '朗县', ',2726,2799,', 2799);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2807, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省', '陕西省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2808, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市', '西安市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2809, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市新城区', '新城区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2810, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市碑林区', '碑林区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2811, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市莲湖区', '莲湖区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2812, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市灞桥区', '灞桥区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2813, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市未央区', '未央区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2814, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市雁塔区', '雁塔区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2815, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市阎良区', '阎良区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2816, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市临潼区', '临潼区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2817, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市长安区', '长安区', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2818, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市蓝田县', '蓝田县', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2819, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市周至县', '周至县', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2820, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市户县', '户县', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2821, '2013-01-01 09:03:16', '2013-01-01 09:03:16', NULL, '陕西省西安市高陵县', '高陵县', ',2807,2808,', 2808);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2822, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省铜川市', '铜川市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2823, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省铜川市王益区', '王益区', ',2807,2822,', 2822);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2824, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省铜川市印台区', '印台区', ',2807,2822,', 2822);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2825, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省铜川市耀州区', '耀州区', ',2807,2822,', 2822);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2826, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省铜川市宜君县', '宜君县', ',2807,2822,', 2822);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2827, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市', '宝鸡市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2828, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市渭滨区', '渭滨区', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2829, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市金台区', '金台区', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2830, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市陈仓区', '陈仓区', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2831, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市凤翔县', '凤翔县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2832, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市岐山县', '岐山县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2833, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市扶风县', '扶风县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2834, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市眉县', '眉县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2835, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市陇县', '陇县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2836, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市千阳县', '千阳县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2837, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市麟游县', '麟游县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2838, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市凤县', '凤县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2839, '2013-01-01 09:03:17', '2013-01-01 09:03:17', NULL, '陕西省宝鸡市太白县', '太白县', ',2807,2827,', 2827);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2840, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市', '咸阳市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2841, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市秦都区', '秦都区', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2842, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市杨陵区', '杨陵区', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2843, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市渭城区', '渭城区', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2844, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市三原县', '三原县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2845, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市泾阳县', '泾阳县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2846, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市乾县', '乾县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2847, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市礼泉县', '礼泉县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2848, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市永寿县', '永寿县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2849, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市彬县', '彬县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2850, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市长武县', '长武县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2851, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市旬邑县', '旬邑县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2852, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市淳化县', '淳化县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2853, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市武功县', '武功县', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2854, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省咸阳市兴平市', '兴平市', ',2807,2840,', 2840);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2855, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省渭南市', '渭南市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2856, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省渭南市临渭区', '临渭区', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2857, '2013-01-01 09:03:18', '2013-01-01 09:03:18', NULL, '陕西省渭南市华县', '华县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2858, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市潼关县', '潼关县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2859, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市大荔县', '大荔县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2860, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市合阳县', '合阳县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2861, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市澄城县', '澄城县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2862, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市蒲城县', '蒲城县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2863, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市白水县', '白水县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2864, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市富平县', '富平县', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2865, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市韩城市', '韩城市', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2866, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省渭南市华阴市', '华阴市', ',2807,2855,', 2855);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2867, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市', '延安市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2868, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市宝塔区', '宝塔区', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2869, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市延长县', '延长县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2870, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市延川县', '延川县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2871, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市子长县', '子长县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2872, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市安塞县', '安塞县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2873, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市志丹县', '志丹县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2874, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市吴起县', '吴起县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2875, '2013-01-01 09:03:19', '2013-01-01 09:03:19', NULL, '陕西省延安市甘泉县', '甘泉县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2876, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省延安市富县', '富县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2877, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省延安市洛川县', '洛川县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2878, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省延安市宜川县', '宜川县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2879, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省延安市黄龙县', '黄龙县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2880, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省延安市黄陵县', '黄陵县', ',2807,2867,', 2867);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2881, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市', '汉中市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2882, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市汉台区', '汉台区', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2883, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市南郑县', '南郑县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2884, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市城固县', '城固县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2885, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市洋县', '洋县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2886, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市西乡县', '西乡县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2887, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市勉县', '勉县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2888, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市宁强县', '宁强县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2889, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市略阳县', '略阳县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2890, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市镇巴县', '镇巴县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2891, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市留坝县', '留坝县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2892, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省汉中市佛坪县', '佛坪县', ',2807,2881,', 2881);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2893, '2013-01-01 09:03:20', '2013-01-01 09:03:20', NULL, '陕西省榆林市', '榆林市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2894, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市榆阳区', '榆阳区', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2895, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市神木县', '神木县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2896, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市府谷县', '府谷县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2897, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市横山县', '横山县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2898, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市靖边县', '靖边县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2899, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市定边县', '定边县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2900, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市绥德县', '绥德县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2901, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市米脂县', '米脂县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2902, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市佳县', '佳县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2903, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市吴堡县', '吴堡县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2904, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市清涧县', '清涧县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2905, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省榆林市子洲县', '子洲县', ',2807,2893,', 2893);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2906, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省安康市', '安康市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2907, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省安康市汉滨区', '汉滨区', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2908, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省安康市汉阴县', '汉阴县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2909, '2013-01-01 09:03:21', '2013-01-01 09:03:21', NULL, '陕西省安康市石泉县', '石泉县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2910, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市宁陕县', '宁陕县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2911, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市紫阳县', '紫阳县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2912, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市岚皋县', '岚皋县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2913, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市平利县', '平利县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2914, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市镇坪县', '镇坪县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2915, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市旬阳县', '旬阳县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2916, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省安康市白河县', '白河县', ',2807,2906,', 2906);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2917, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市', '商洛市', ',2807,', 2807);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2918, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市商州区', '商州区', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2919, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市洛南县', '洛南县', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2920, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市丹凤县', '丹凤县', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2921, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市商南县', '商南县', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2922, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市山阳县', '山阳县', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2923, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市镇安县', '镇安县', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2924, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '陕西省商洛市柞水县', '柞水县', ',2807,2917,', 2917);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2925, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '甘肃省', '甘肃省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2926, '2013-01-01 09:03:22', '2013-01-01 09:03:22', NULL, '甘肃省兰州市', '兰州市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2927, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市城关区', '城关区', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2928, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市七里河区', '七里河区', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2929, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市西固区', '西固区', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2930, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市安宁区', '安宁区', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2931, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市红古区', '红古区', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2932, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市永登县', '永登县', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2933, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市皋兰县', '皋兰县', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2934, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省兰州市榆中县', '榆中县', ',2925,2926,', 2926);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2935, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省嘉峪关市', '嘉峪关市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2936, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省金昌市', '金昌市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2937, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省金昌市金川区', '金川区', ',2925,2936,', 2936);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2938, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省金昌市永昌县', '永昌县', ',2925,2936,', 2936);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2939, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省白银市', '白银市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2940, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省白银市白银区', '白银区', ',2925,2939,', 2939);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2941, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省白银市平川区', '平川区', ',2925,2939,', 2939);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2942, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省白银市靖远县', '靖远县', ',2925,2939,', 2939);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2943, '2013-01-01 09:03:23', '2013-01-01 09:03:23', NULL, '甘肃省白银市会宁县', '会宁县', ',2925,2939,', 2939);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2944, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省白银市景泰县', '景泰县', ',2925,2939,', 2939);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2945, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市', '天水市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2946, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市秦州区', '秦州区', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2947, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市麦积区', '麦积区', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2948, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市清水县', '清水县', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2949, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市秦安县', '秦安县', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2950, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市甘谷县', '甘谷县', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2951, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市武山县', '武山县', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2952, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省天水市张家川回族自治县', '张家川回族自治县', ',2925,2945,', 2945);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2953, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省武威市', '武威市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2954, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省武威市凉州区', '凉州区', ',2925,2953,', 2953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2955, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省武威市民勤县', '民勤县', ',2925,2953,', 2953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2956, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省武威市古浪县', '古浪县', ',2925,2953,', 2953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2957, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省武威市天祝藏族自治县', '天祝藏族自治县', ',2925,2953,', 2953);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2958, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省张掖市', '张掖市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2959, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省张掖市甘州区', '甘州区', ',2925,2958,', 2958);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2960, '2013-01-01 09:03:24', '2013-01-01 09:03:24', NULL, '甘肃省张掖市肃南裕固族自治县', '肃南裕固族自治县', ',2925,2958,', 2958);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2961, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省张掖市民乐县', '民乐县', ',2925,2958,', 2958);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2962, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省张掖市临泽县', '临泽县', ',2925,2958,', 2958);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2963, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省张掖市高台县', '高台县', ',2925,2958,', 2958);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2964, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省张掖市山丹县', '山丹县', ',2925,2958,', 2958);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2965, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市', '平凉市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2966, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市崆峒区', '崆峒区', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2967, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市泾川县', '泾川县', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2968, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市灵台县', '灵台县', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2969, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市崇信县', '崇信县', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2970, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市华亭县', '华亭县', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2971, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市庄浪县', '庄浪县', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2972, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省平凉市静宁县', '静宁县', ',2925,2965,', 2965);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2973, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市', '酒泉市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2974, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市肃州区', '肃州区', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2975, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市金塔县', '金塔县', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2976, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市瓜州县', '瓜州县', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2977, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市肃北蒙古族自治县', '肃北蒙古族自治县', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2978, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市阿克塞哈萨克族自治县', '阿克塞哈萨克族自治县', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2979, '2013-01-01 09:03:25', '2013-01-01 09:03:25', NULL, '甘肃省酒泉市玉门市', '玉门市', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2980, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省酒泉市敦煌市', '敦煌市', ',2925,2973,', 2973);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2981, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市', '庆阳市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2982, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市西峰区', '西峰区', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2983, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市庆城县', '庆城县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2984, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市环县', '环县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2985, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市华池县', '华池县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2986, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市合水县', '合水县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2987, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市正宁县', '正宁县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2988, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市宁县', '宁县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2989, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省庆阳市镇原县', '镇原县', ',2925,2981,', 2981);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2990, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市', '定西市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2991, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市安定区', '安定区', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2992, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市通渭县', '通渭县', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2993, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市陇西县', '陇西县', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2994, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市渭源县', '渭源县', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2995, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市临洮县', '临洮县', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2996, '2013-01-01 09:03:26', '2013-01-01 09:03:26', NULL, '甘肃省定西市漳县', '漳县', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2997, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省定西市岷县', '岷县', ',2925,2990,', 2990);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2998, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市', '陇南市', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(2999, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市武都区', '武都区', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3000, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市成县', '成县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3001, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市文县', '文县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3002, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市宕昌县', '宕昌县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3003, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市康县', '康县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3004, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市西和县', '西和县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3005, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市礼县', '礼县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3006, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市徽县', '徽县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3007, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省陇南市两当县', '两当县', ',2925,2998,', 2998);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3008, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州', '临夏回族自治州', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3009, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州临夏市', '临夏市', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3010, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州临夏县', '临夏县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3011, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州康乐县', '康乐县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3012, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州永靖县', '永靖县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3013, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州广河县', '广河县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3014, '2013-01-01 09:03:27', '2013-01-01 09:03:27', NULL, '甘肃省临夏回族自治州和政县', '和政县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3015, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省临夏回族自治州东乡族自治县', '东乡族自治县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3016, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县', '积石山保安族东乡族撒拉族自治县', ',2925,3008,', 3008);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3017, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州', '甘南藏族自治州', ',2925,', 2925);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3018, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州合作市', '合作市', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3019, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州临潭县', '临潭县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3020, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州卓尼县', '卓尼县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3021, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州舟曲县', '舟曲县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3022, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州迭部县', '迭部县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3023, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州玛曲县', '玛曲县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3024, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州碌曲县', '碌曲县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3025, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '甘肃省甘南藏族自治州夏河县', '夏河县', ',2925,3017,', 3017);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3026, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '青海省', '青海省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3027, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '青海省西宁市', '西宁市', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3028, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '青海省西宁市城东区', '城东区', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3029, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '青海省西宁市城中区', '城中区', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3030, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '青海省西宁市城西区', '城西区', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3031, '2013-01-01 09:03:28', '2013-01-01 09:03:28', NULL, '青海省西宁市城北区', '城北区', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3032, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省西宁市大通回族土族自治县', '大通回族土族自治县', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3033, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省西宁市湟中县', '湟中县', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3034, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省西宁市湟源县', '湟源县', ',3026,3027,', 3027);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3035, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区', '海东地区', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3036, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区平安县', '平安县', ',3026,3035,', 3035);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3037, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区民和回族土族自治县', '民和回族土族自治县', ',3026,3035,', 3035);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3038, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区乐都县', '乐都县', ',3026,3035,', 3035);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3039, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区互助土族自治县', '互助土族自治县', ',3026,3035,', 3035);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3040, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区化隆回族自治县', '化隆回族自治县', ',3026,3035,', 3035);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3041, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海东地区循化撒拉族自治县', '循化撒拉族自治县', ',3026,3035,', 3035);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3042, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海北藏族自治州', '海北藏族自治州', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3043, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海北藏族自治州门源回族自治县', '门源回族自治县', ',3026,3042,', 3042);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3044, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海北藏族自治州祁连县', '祁连县', ',3026,3042,', 3042);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3045, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海北藏族自治州海晏县', '海晏县', ',3026,3042,', 3042);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3046, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省海北藏族自治州刚察县', '刚察县', ',3026,3042,', 3042);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3047, '2013-01-01 09:03:29', '2013-01-01 09:03:29', NULL, '青海省黄南藏族自治州', '黄南藏族自治州', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3048, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省黄南藏族自治州同仁县', '同仁县', ',3026,3047,', 3047);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3049, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省黄南藏族自治州尖扎县', '尖扎县', ',3026,3047,', 3047);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3050, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省黄南藏族自治州泽库县', '泽库县', ',3026,3047,', 3047);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3051, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省黄南藏族自治州河南蒙古族自治县', '河南蒙古族自治县', ',3026,3047,', 3047);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3052, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省海南藏族自治州', '海南藏族自治州', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3053, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省海南藏族自治州共和县', '共和县', ',3026,3052,', 3052);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3054, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省海南藏族自治州同德县', '同德县', ',3026,3052,', 3052);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3055, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省海南藏族自治州贵德县', '贵德县', ',3026,3052,', 3052);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3056, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省海南藏族自治州兴海县', '兴海县', ',3026,3052,', 3052);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3057, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省海南藏族自治州贵南县', '贵南县', ',3026,3052,', 3052);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3058, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州', '果洛藏族自治州', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3059, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州玛沁县', '玛沁县', ',3026,3058,', 3058);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3060, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州班玛县', '班玛县', ',3026,3058,', 3058);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3061, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州甘德县', '甘德县', ',3026,3058,', 3058);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3062, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州达日县', '达日县', ',3026,3058,', 3058);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3063, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州久治县', '久治县', ',3026,3058,', 3058);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3064, '2013-01-01 09:03:30', '2013-01-01 09:03:30', NULL, '青海省果洛藏族自治州玛多县', '玛多县', ',3026,3058,', 3058);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3065, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州', '玉树藏族自治州', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3066, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州玉树县', '玉树县', ',3026,3065,', 3065);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3067, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州杂多县', '杂多县', ',3026,3065,', 3065);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3068, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州称多县', '称多县', ',3026,3065,', 3065);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3069, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州治多县', '治多县', ',3026,3065,', 3065);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3070, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州囊谦县', '囊谦县', ',3026,3065,', 3065);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3071, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省玉树藏族自治州曲麻莱县', '曲麻莱县', ',3026,3065,', 3065);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3072, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省海西蒙古族藏族自治州', '海西蒙古族藏族自治州', ',3026,', 3026);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3073, '2013-01-01 09:03:31', '2013-01-01 09:03:31', NULL, '青海省海西蒙古族藏族自治州格尔木市', '格尔木市', ',3026,3072,', 3072);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3074, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '青海省海西蒙古族藏族自治州德令哈市', '德令哈市', ',3026,3072,', 3072);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3075, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '青海省海西蒙古族藏族自治州乌兰县', '乌兰县', ',3026,3072,', 3072);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3076, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '青海省海西蒙古族藏族自治州都兰县', '都兰县', ',3026,3072,', 3072);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3077, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '青海省海西蒙古族藏族自治州天峻县', '天峻县', ',3026,3072,', 3072);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3078, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区', '宁夏回族自治区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3079, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市', '银川市', ',3078,', 3078);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3080, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市兴庆区', '兴庆区', ',3078,3079,', 3079);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3081, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市西夏区', '西夏区', ',3078,3079,', 3079);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3082, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市金凤区', '金凤区', ',3078,3079,', 3079);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3083, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市永宁县', '永宁县', ',3078,3079,', 3079);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3084, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市贺兰县', '贺兰县', ',3078,3079,', 3079);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3085, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区银川市灵武市', '灵武市', ',3078,3079,', 3079);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3086, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区石嘴山市', '石嘴山市', ',3078,', 3078);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3087, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区石嘴山市大武口区', '大武口区', ',3078,3086,', 3086);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3088, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区石嘴山市惠农区', '惠农区', ',3078,3086,', 3086);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3089, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区石嘴山市平罗县', '平罗县', ',3078,3086,', 3086);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3090, '2013-01-01 09:03:32', '2013-01-01 09:03:32', NULL, '宁夏回族自治区吴忠市', '吴忠市', ',3078,', 3078);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3091, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区吴忠市利通区', '利通区', ',3078,3090,', 3090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3092, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区吴忠市红寺堡区', '红寺堡区', ',3078,3090,', 3090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3093, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区吴忠市盐池县', '盐池县', ',3078,3090,', 3090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3094, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区吴忠市同心县', '同心县', ',3078,3090,', 3090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3095, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区吴忠市青铜峡市', '青铜峡市', ',3078,3090,', 3090);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3096, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区固原市', '固原市', ',3078,', 3078);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3097, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区固原市原州区', '原州区', ',3078,3096,', 3096);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3098, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区固原市西吉县', '西吉县', ',3078,3096,', 3096);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3099, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区固原市隆德县', '隆德县', ',3078,3096,', 3096);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3100, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区固原市泾源县', '泾源县', ',3078,3096,', 3096);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3101, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区固原市彭阳县', '彭阳县', ',3078,3096,', 3096);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3102, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区中卫市', '中卫市', ',3078,', 3078);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3103, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区中卫市沙坡头区', '沙坡头区', ',3078,3102,', 3102);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3104, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区中卫市中宁县', '中宁县', ',3078,3102,', 3102);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3105, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '宁夏回族自治区中卫市海原县', '海原县', ',3078,3102,', 3102);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3106, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '新疆维吾尔自治区', '新疆维吾尔自治区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3107, '2013-01-01 09:03:33', '2013-01-01 09:03:33', NULL, '新疆维吾尔自治区乌鲁木齐市', '乌鲁木齐市', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3108, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市天山区', '天山区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3109, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市沙依巴克区', '沙依巴克区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3110, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市新市区', '新市区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3111, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市水磨沟区', '水磨沟区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3112, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市头屯河区', '头屯河区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3113, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市达坂城区', '达坂城区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3114, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市米东区', '米东区', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3115, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区乌鲁木齐市乌鲁木齐县', '乌鲁木齐县', ',3106,3107,', 3107);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3116, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区克拉玛依市', '克拉玛依市', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3117, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区克拉玛依市独山子区', '独山子区', ',3106,3116,', 3116);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3118, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区克拉玛依市克拉玛依区', '克拉玛依区', ',3106,3116,', 3116);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3119, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区克拉玛依市白碱滩区', '白碱滩区', ',3106,3116,', 3116);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3120, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区克拉玛依市乌尔禾区', '乌尔禾区', ',3106,3116,', 3116);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3121, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区吐鲁番地区', '吐鲁番地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3122, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区吐鲁番地区吐鲁番市', '吐鲁番市', ',3106,3121,', 3121);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3123, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区吐鲁番地区鄯善县', '鄯善县', ',3106,3121,', 3121);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3124, '2013-01-01 09:03:34', '2013-01-01 09:03:34', NULL, '新疆维吾尔自治区吐鲁番地区托克逊县', '托克逊县', ',3106,3121,', 3121);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3125, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区哈密地区', '哈密地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3126, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区哈密地区哈密市', '哈密市', ',3106,3125,', 3125);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3127, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区哈密地区巴里坤哈萨克自治县', '巴里坤哈萨克自治县', ',3106,3125,', 3125);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3128, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区哈密地区伊吾县', '伊吾县', ',3106,3125,', 3125);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3129, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州', '昌吉回族自治州', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3130, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州昌吉市', '昌吉市', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3131, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州阜康市', '阜康市', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3132, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州呼图壁县', '呼图壁县', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3133, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州玛纳斯县', '玛纳斯县', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3134, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州奇台县', '奇台县', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3135, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州吉木萨尔县', '吉木萨尔县', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3136, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县', '木垒哈萨克自治县', ',3106,3129,', 3129);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3137, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州', '博尔塔拉蒙古自治州', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3138, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州博乐市', '博乐市', ',3106,3137,', 3137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3139, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州精河县', '精河县', ',3106,3137,', 3137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3140, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区博尔塔拉蒙古自治州温泉县', '温泉县', ',3106,3137,', 3137);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3141, '2013-01-01 09:03:35', '2013-01-01 09:03:35', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州', '巴音郭楞蒙古自治州', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3142, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市', '库尔勒市', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3143, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州轮台县', '轮台县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3144, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县', '尉犁县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3145, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州若羌县', '若羌县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3146, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州且末县', '且末县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3147, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县', '焉耆回族自治县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3148, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州和静县', '和静县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3149, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州和硕县', '和硕县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3150, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区巴音郭楞蒙古自治州博湖县', '博湖县', ',3106,3141,', 3141);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3151, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区', '阿克苏地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3152, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区阿克苏市', '阿克苏市', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3153, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区温宿县', '温宿县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3154, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区库车县', '库车县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3155, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区沙雅县', '沙雅县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3156, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区新和县', '新和县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3157, '2013-01-01 09:03:36', '2013-01-01 09:03:36', NULL, '新疆维吾尔自治区阿克苏地区拜城县', '拜城县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3158, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区阿克苏地区乌什县', '乌什县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3159, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区阿克苏地区阿瓦提县', '阿瓦提县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3160, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区阿克苏地区柯坪县', '柯坪县', ',3106,3151,', 3151);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3161, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州', '克孜勒苏柯尔克孜自治州', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3162, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市', '阿图什市', ',3106,3161,', 3161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3163, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县', '阿克陶县', ',3106,3161,', 3161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3164, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县', '阿合奇县', ',3106,3161,', 3161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3165, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县', '乌恰县', ',3106,3161,', 3161);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3166, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区', '喀什地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3167, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区喀什市', '喀什市', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3168, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区疏附县', '疏附县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3169, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区疏勒县', '疏勒县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3170, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区英吉沙县', '英吉沙县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3171, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区泽普县', '泽普县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3172, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区莎车县', '莎车县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3173, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区叶城县', '叶城县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3174, '2013-01-01 09:03:37', '2013-01-01 09:03:37', NULL, '新疆维吾尔自治区喀什地区麦盖提县', '麦盖提县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3175, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区喀什地区岳普湖县', '岳普湖县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3176, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区喀什地区伽师县', '伽师县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3177, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区喀什地区巴楚县', '巴楚县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3178, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县', '塔什库尔干塔吉克自治县', ',3106,3166,', 3166);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3179, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区', '和田地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3180, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区和田市', '和田市', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3181, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区和田县', '和田县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3182, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区墨玉县', '墨玉县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3183, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区皮山县', '皮山县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3184, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区洛浦县', '洛浦县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3185, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区策勒县', '策勒县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3186, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区于田县', '于田县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3187, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区和田地区民丰县', '民丰县', ',3106,3179,', 3179);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3188, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区伊犁哈萨克自治州', '伊犁哈萨克自治州', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3189, '2013-01-01 09:03:38', '2013-01-01 09:03:38', NULL, '新疆维吾尔自治区伊犁哈萨克自治州伊宁市', '伊宁市', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3190, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州奎屯市', '奎屯市', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3191, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州伊宁县', '伊宁县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3192, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县', '察布查尔锡伯自治县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3193, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州霍城县', '霍城县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3194, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州巩留县', '巩留县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3195, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州新源县', '新源县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3196, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州昭苏县', '昭苏县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3197, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州特克斯县', '特克斯县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3198, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区伊犁哈萨克自治州尼勒克县', '尼勒克县', ',3106,3188,', 3188);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3199, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区塔城地区', '塔城地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3200, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区塔城地区塔城市', '塔城市', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3201, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区塔城地区乌苏市', '乌苏市', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3202, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区塔城地区额敏县', '额敏县', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3203, '2013-01-01 09:03:39', '2013-01-01 09:03:39', NULL, '新疆维吾尔自治区塔城地区沙湾县', '沙湾县', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3204, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区塔城地区托里县', '托里县', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3205, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区塔城地区裕民县', '裕民县', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3206, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县', '和布克赛尔蒙古自治县', ',3106,3199,', 3199);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3207, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区', '阿勒泰地区', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3208, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区阿勒泰市', '阿勒泰市', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3209, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区布尔津县', '布尔津县', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3210, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区富蕴县', '富蕴县', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3211, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区福海县', '福海县', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3212, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区哈巴河县', '哈巴河县', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3213, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区青河县', '青河县', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3214, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿勒泰地区吉木乃县', '吉木乃县', ',3106,3207,', 3207);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3215, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区石河子市', '石河子市', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3216, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区阿拉尔市', '阿拉尔市', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3217, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区图木舒克市', '图木舒克市', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3218, '2013-01-01 09:03:40', '2013-01-01 09:03:40', NULL, '新疆维吾尔自治区五家渠市', '五家渠市', ',3106,', 3106);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3219, '2013-01-01 13:12:54', '2013-01-01 13:12:54', NULL, '台湾省', '台湾省', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3220, '2013-01-01 13:13:21', '2013-01-01 13:13:21', NULL, '台湾省台北市', '台北市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3221, '2013-01-01 13:13:27', '2013-01-01 13:13:27', NULL, '台湾省高雄市', '高雄市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3222, '2013-01-01 13:13:32', '2013-01-01 13:13:32', NULL, '台湾省台南市', '台南市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3223, '2013-01-01 13:13:37', '2013-01-01 13:13:37', NULL, '台湾省台中市', '台中市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3224, '2013-01-01 13:13:43', '2013-01-01 13:13:43', NULL, '台湾省金门县', '金门县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3225, '2013-01-01 13:13:49', '2013-01-01 13:13:49', NULL, '台湾省南投县', '南投县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3226, '2013-01-01 13:13:54', '2013-01-01 13:13:54', NULL, '台湾省基隆市', '基隆市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3227, '2013-01-01 13:14:00', '2013-01-01 13:14:00', NULL, '台湾省新竹市', '新竹市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3228, '2013-01-01 13:14:13', '2013-01-01 13:14:13', NULL, '台湾省嘉义市', '嘉义市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3229, '2013-01-01 13:14:20', '2013-01-01 13:14:20', NULL, '台湾省新北市', '新北市', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3230, '2013-01-01 13:14:25', '2013-01-01 13:14:25', NULL, '台湾省宜兰县', '宜兰县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3231, '2013-01-01 13:14:30', '2013-01-01 13:14:30', NULL, '台湾省新竹县', '新竹县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3232, '2013-01-01 13:14:36', '2013-01-01 13:14:36', NULL, '台湾省桃园县', '桃园县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3233, '2013-01-01 13:14:45', '2013-01-01 13:14:45', NULL, '台湾省苗栗县', '苗栗县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3234, '2013-01-01 13:14:51', '2013-01-01 13:14:51', NULL, '台湾省彰化县', '彰化县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3235, '2013-01-01 13:14:56', '2013-01-01 13:14:56', NULL, '台湾省嘉义县', '嘉义县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3236, '2013-01-01 13:15:01', '2013-01-01 13:15:01', NULL, '台湾省云林县', '云林县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3237, '2013-01-01 13:15:06', '2013-01-01 13:15:06', NULL, '台湾省屏东县', '屏东县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3238, '2013-01-01 13:15:11', '2013-01-01 13:15:11', NULL, '台湾省台东县', '台东县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3239, '2013-01-01 13:15:18', '2013-01-01 13:15:18', NULL, '台湾省花莲县', '花莲县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3240, '2013-01-01 13:15:24', '2013-01-01 13:15:24', NULL, '台湾省澎湖县', '澎湖县', ',3219,', 3219);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3241, '2013-01-01 13:17:28', '2013-01-01 13:17:28', NULL, '台湾省台北市中正区', '中正区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3242, '2013-01-01 13:17:35', '2013-01-01 13:17:35', NULL, '台湾省台北市大同区', '大同区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3243, '2013-01-01 13:17:40', '2013-01-01 13:17:40', NULL, '台湾省台北市中山区', '中山区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3244, '2013-01-01 13:17:46', '2013-01-01 13:17:46', NULL, '台湾省台北市松山区', '松山区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3245, '2013-01-01 13:17:51', '2013-01-01 13:17:51', NULL, '台湾省台北市大安区', '大安区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3246, '2013-01-01 13:17:56', '2013-01-01 13:17:56', NULL, '台湾省台北市万华区', '万华区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3247, '2013-01-01 13:18:02', '2013-01-01 13:18:02', NULL, '台湾省台北市信义区', '信义区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3248, '2013-01-01 13:18:07', '2013-01-01 13:18:07', NULL, '台湾省台北市士林区', '士林区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3249, '2013-01-01 13:18:12', '2013-01-01 13:18:12', NULL, '台湾省台北市北投区', '北投区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3250, '2013-01-01 13:18:23', '2013-01-01 13:18:23', NULL, '台湾省台北市内湖区', '内湖区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3251, '2013-01-01 13:18:28', '2013-01-01 13:18:28', NULL, '台湾省台北市南港区', '南港区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3252, '2013-01-01 13:18:34', '2013-01-01 13:18:34', NULL, '台湾省台北市文山区', '文山区', ',3219,3220,', 3220);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3253, '2013-01-01 13:18:58', '2013-01-01 13:18:58', NULL, '台湾省嘉义县东区', '东区', ',3219,3235,', 3235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3254, '2013-01-01 13:19:03', '2013-01-01 13:19:03', NULL, '台湾省嘉义县西区', '西区', ',3219,3235,', 3235);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3255, '2013-01-01 13:20:02', '2013-01-01 13:20:02', NULL, '台湾省高雄市新兴区', '新兴区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3256, '2013-01-01 13:20:08', '2013-01-01 13:20:08', NULL, '台湾省高雄市前金区', '前金区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3257, '2013-01-01 13:20:13', '2013-01-01 13:20:13', NULL, '台湾省高雄市芩雅区', '芩雅区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3258, '2013-01-01 13:20:18', '2013-01-01 13:20:18', NULL, '台湾省高雄市盐埕区', '盐埕区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3259, '2013-01-01 13:20:24', '2013-01-01 13:20:24', NULL, '台湾省高雄市鼓山区', '鼓山区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3260, '2013-01-01 13:20:31', '2013-01-01 13:20:31', NULL, '台湾省高雄市旗津区', '旗津区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3261, '2013-01-01 13:20:37', '2013-01-01 13:20:37', NULL, '台湾省高雄市前镇区', '前镇区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3262, '2013-01-01 13:20:42', '2013-01-01 13:20:42', NULL, '台湾省高雄市三民区', '三民区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3263, '2013-01-01 13:20:47', '2013-01-01 13:20:47', NULL, '台湾省高雄市左营区', '左营区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3264, '2013-01-01 13:20:55', '2013-01-01 13:20:55', NULL, '台湾省高雄市楠梓区', '楠梓区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3265, '2013-01-01 13:20:59', '2013-01-01 13:20:59', NULL, '台湾省高雄市小港区', '小港区', ',3219,3221,', 3221);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3266, '2013-01-01 13:21:19', '2013-01-01 13:21:19', NULL, '台湾省基隆市仁爱区', '仁爱区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3267, '2013-01-01 13:21:24', '2013-01-01 13:21:24', NULL, '台湾省基隆市信义区', '信义区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3268, '2013-01-01 13:21:31', '2013-01-01 13:21:31', NULL, '台湾省基隆市中正区', '中正区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3269, '2013-01-01 13:21:36', '2013-01-01 13:21:36', NULL, '台湾省基隆市中山区', '中山区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3270, '2013-01-01 13:21:42', '2013-01-01 13:21:42', NULL, '台湾省基隆市安乐区', '安乐区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3271, '2013-01-01 13:21:47', '2013-01-01 13:21:47', NULL, '台湾省基隆市暖暖区', '暖暖区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3272, '2013-01-01 13:21:53', '2013-01-01 13:21:53', NULL, '台湾省基隆市七堵区', '七堵区', ',3219,3226,', 3226);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3273, '2013-01-01 13:22:17', '2013-01-01 13:22:17', NULL, '台湾省台南市中西区', '中西区', ',3219,3222,', 3222);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3274, '2013-01-01 13:22:23', '2013-01-01 13:22:23', NULL, '台湾省台南市东区', '东区', ',3219,3222,', 3222);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3275, '2013-01-01 13:22:28', '2013-01-01 13:22:28', NULL, '台湾省台南市南区', '南区', ',3219,3222,', 3222);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3276, '2013-01-01 13:22:33', '2013-01-01 13:22:33', NULL, '台湾省台南市北区', '北区', ',3219,3222,', 3222);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3277, '2013-01-01 13:22:39', '2013-01-01 13:22:39', NULL, '台湾省台南市安平区', '安平区', ',3219,3222,', 3222);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3278, '2013-01-01 13:22:44', '2013-01-01 13:22:44', NULL, '台湾省台南市安南区', '安南区', ',3219,3222,', 3222);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3279, '2013-01-01 13:22:58', '2013-01-01 13:22:58', NULL, '台湾省新竹市东区', '东区', ',3219,3227,', 3227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3280, '2013-01-01 13:23:03', '2013-01-01 13:23:03', NULL, '台湾省新竹市北区', '北区', ',3219,3227,', 3227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3281, '2013-01-01 13:23:11', '2013-01-01 13:23:11', NULL, '台湾省新竹市香山区', '香山区', ',3219,3227,', 3227);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3282, '2013-01-01 13:23:24', '2013-01-01 13:38:40', NULL, '台湾省台中市中区', '中区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3283, '2013-01-01 13:23:39', '2013-01-01 13:23:39', NULL, '台湾省台中市东区', '东区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3284, '2013-01-01 13:23:47', '2013-01-01 13:23:47', NULL, '台湾省台中市南区', '南区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3285, '2013-01-01 13:23:53', '2013-01-01 13:23:53', NULL, '台湾省台中市西区', '西区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3286, '2013-01-01 13:23:59', '2013-01-01 13:23:59', NULL, '台湾省台中市北区', '北区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3287, '2013-01-01 13:24:15', '2013-01-01 13:24:15', NULL, '台湾省台中市北屯区', '北屯区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3288, '2013-01-01 13:24:20', '2013-01-01 13:24:20', NULL, '台湾省台中市西屯区', '西屯区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3289, '2013-01-01 13:24:26', '2013-01-01 13:24:26', NULL, '台湾省台中市南屯区', '南屯区', ',3219,3223,', 3223);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3290, '2013-01-01 13:24:38', '2013-01-01 13:24:38', NULL, '台湾省嘉义市东区', '东区', ',3219,3228,', 3228);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3291, '2013-01-01 13:24:44', '2013-01-01 13:24:44', NULL, '台湾省嘉义市西区', '西区', ',3219,3228,', 3228);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3292, '2013-01-01 13:29:18', '2013-01-01 13:29:18', NULL, '香港特别行政区', '香港特别行政区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3293, '2013-01-01 13:29:33', '2013-01-01 13:29:33', NULL, '香港特别行政区香港岛', '香港岛', ',3292,', 3292);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3294, '2013-01-01 13:29:38', '2013-01-01 13:29:38', NULL, '香港特别行政区九龙', '九龙', ',3292,', 3292);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3295, '2013-01-01 13:29:42', '2013-01-01 13:29:42', NULL, '香港特别行政区新界', '新界', ',3292,', 3292);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3296, '2013-01-01 13:30:05', '2013-01-01 13:30:05', NULL, '香港特别行政区九龙九龙城区', '九龙城区', ',3292,3294,', 3294);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3297, '2013-01-01 13:30:12', '2013-01-01 13:30:12', NULL, '香港特别行政区九龙油尖旺区', '油尖旺区', ',3292,3294,', 3294);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3298, '2013-01-01 13:30:18', '2013-01-01 13:30:18', NULL, '香港特别行政区九龙深水埗区', '深水埗区', ',3292,3294,', 3294);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3299, '2013-01-01 13:30:24', '2013-01-01 13:30:24', NULL, '香港特别行政区九龙黄大仙区', '黄大仙区', ',3292,3294,', 3294);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3300, '2013-01-01 13:30:33', '2013-01-01 13:30:33', NULL, '香港特别行政区九龙观塘区', '观塘区', ',3292,3294,', 3294);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3301, '2013-01-01 13:30:44', '2013-01-01 13:30:44', NULL, '香港特别行政区香港岛中西区', '中西区', ',3292,3293,', 3293);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3302, '2013-01-01 13:30:49', '2013-01-01 13:30:49', NULL, '香港特别行政区香港岛湾仔', '湾仔', ',3292,3293,', 3293);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3303, '2013-01-01 13:30:54', '2013-01-01 13:30:54', NULL, '香港特别行政区香港岛东区', '东区', ',3292,3293,', 3293);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3304, '2013-01-01 13:30:59', '2013-01-01 13:30:59', NULL, '香港特别行政区香港岛南区', '南区', ',3292,3293,', 3293);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3305, '2013-01-01 13:31:12', '2013-01-01 13:31:12', NULL, '香港特别行政区新界北区', '北区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3306, '2013-01-01 13:31:20', '2013-01-01 13:31:20', NULL, '香港特别行政区新界大埔区', '大埔区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3307, '2013-01-01 13:31:25', '2013-01-01 13:31:25', NULL, '香港特别行政区新界沙田区', '沙田区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3308, '2013-01-01 13:31:30', '2013-01-01 13:31:30', NULL, '香港特别行政区新界西贡区', '西贡区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3309, '2013-01-01 13:31:35', '2013-01-01 13:31:35', NULL, '香港特别行政区新界元朗区', '元朗区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3310, '2013-01-01 13:31:41', '2013-01-01 13:31:41', NULL, '香港特别行政区新界屯门区', '屯门区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3311, '2013-01-01 13:31:46', '2013-01-01 13:31:46', NULL, '香港特别行政区新界荃湾区', '荃湾区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3312, '2013-01-01 13:31:52', '2013-01-01 13:31:52', NULL, '香港特别行政区新界葵青区', '葵青区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3313, '2013-01-01 13:31:57', '2013-01-01 13:31:57', NULL, '香港特别行政区新界离岛区', '离岛区', ',3292,3295,', 3295);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3314, '2013-01-01 13:33:03', '2013-01-01 13:33:03', NULL, '澳门特别行政区', '澳门特别行政区', ',', NULL);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3315, '2013-01-01 13:33:23', '2013-01-01 13:33:23', NULL, '澳门特别行政区澳门半岛', '澳门半岛', ',3314,', 3314);
INSERT INTO `xx_area` (`id`, `create_date`, `modify_date`, `orders`, `full_name`, `name`, `tree_path`, `parent`) VALUES(3316, '2013-01-01 13:33:28', '2013-01-01 13:33:28', NULL, '澳门特别行政区离岛', '离岛', ',3314,', 3314);

INSERT INTO `xx_plugin_config` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `plugin_id`) VALUES(1, '2013-01-01 22:05:27', '2013-01-01 22:06:34', 100, ${bit1}, 'filePlugin');
INSERT INTO `xx_plugin_config` (`id`, `create_date`, `modify_date`, `orders`, `is_enabled`, `plugin_id`) VALUES(2, '2013-01-01 13:31:50', '2013-01-01 14:15:37', 1, ${bit1}, 'alipayDirectPlugin');

INSERT INTO `xx_plugin_config_attribute` (`plugin_config`, `attributes`, `attributes_key`) VALUES(2, '0', 'fee');
INSERT INTO `xx_plugin_config_attribute` (`plugin_config`, `attributes`, `attributes_key`) VALUES(2, 'fixed', 'feeType');
INSERT INTO `xx_plugin_config_attribute` (`plugin_config`, `attributes`, `attributes_key`) VALUES(2, 'abc', 'key');
INSERT INTO `xx_plugin_config_attribute` (`plugin_config`, `attributes`, `attributes_key`) VALUES(2, 'abc', 'partner');
INSERT INTO `xx_plugin_config_attribute` (`plugin_config`, `attributes`, `attributes_key`) VALUES(2, '支付宝即时交易', 'paymentName');
INSERT INTO `xx_plugin_config_attribute` (`plugin_config`, `attributes`, `attributes_key`) VALUES(2, '${demoImageUrl}/payment_plugin/alipay.gif', 'logo');

INSERT INTO `xx_sn` (`id`, `create_date`, `modify_date`, `last_value`, `type`) VALUES(1, '2013-01-01 10:14:13', '2013-01-01 20:19:27', 6, 0);
INSERT INTO `xx_sn` (`id`, `create_date`, `modify_date`, `last_value`, `type`) VALUES(2, '2013-01-01 10:14:31', '2013-01-01 09:03:17', 2, 1);
INSERT INTO `xx_sn` (`id`, `create_date`, `modify_date`, `last_value`, `type`) VALUES(3, '2013-01-01 10:14:44', '2013-01-01 13:09:39', 1, 2);
INSERT INTO `xx_sn` (`id`, `create_date`, `modify_date`, `last_value`, `type`) VALUES(4, '2013-01-01 12:25:31', '2013-01-01 09:59:52', 0, 3);
INSERT INTO `xx_sn` (`id`, `create_date`, `modify_date`, `last_value`, `type`) VALUES(5, '2013-01-01 12:26:10', '2013-01-01 10:01:27', 0, 4);
INSERT INTO `xx_sn` (`id`, `create_date`, `modify_date`, `last_value`, `type`) VALUES(6, '2013-01-01 12:26:55', '2013-01-01 09:34:55', 0, 5);

<#noparse>
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(1, '2013-01-01 13:58:44', '2013-01-01 14:02:04', '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', 0);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(2, '2013-01-01 13:59:33', '2013-01-01 14:02:11', '${productCategory.name}', '${productCategory.name}', '${productCategory.name}', 1);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(3, '2013-01-01 13:59:42', '2013-01-01 14:02:25', '${productKeyword}', '${productKeyword}', '${productKeyword}', 2);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(4, '2013-01-01 14:00:15', '2013-01-01 14:02:45', '${product.name}', '${product.name}', '${product.name}', 3);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(5, '2013-01-01 14:00:36', '2013-01-01 14:02:52', '${articleCategory.name}', '${articleCategory.name}', '${articleCategory.name}', 4);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(6, '2013-01-01 14:00:47', '2013-01-01 14:02:59', '${articleKeyword}', '${articleKeyword}', '${articleKeyword}', 5);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(7, '2013-01-01 14:00:57', '2013-01-01 14:03:05', '${article.title}', '${article.title}', '${article.title}', 6);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(8, '2013-01-01 14:01:08', '2013-01-01 14:03:11', '${setting.siteName}', '${setting.siteName}', '${setting.siteName}', 7);
INSERT INTO `xx_seo` (`id`, `create_date`, `modify_date`, `description`, `keywords`, `title`, `type`) VALUES(9, '2013-01-01 14:01:18', '2013-01-01 14:03:17', '${brand.name}', '${brand.name}', '${brand.name}', 8);
</#noparse>

<#noparse>
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(1, '2013-01-01 14:22:34', '2013-01-01 11:46:29', NULL, 50, '头部广告', '<div class=\"headerAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 320);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(2, '2013-01-01 13:15:22', '2013-01-01 22:30:26', NULL, 52, '底部广告', '<div class=\"footerAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 950);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(3, '2013-01-01 15:51:45', '2013-01-01 11:46:16', NULL, 290, '首页轮播广告', '<div id=\"slider\" class=\"slider\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 770);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(4, '2013-01-01 16:35:14', '2013-01-01 09:08:08', NULL, 106, '首页右侧广告', '<div class=\"rightAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 230);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(5, '2013-01-01 15:48:13', '2013-01-01 08:58:12', NULL, 120, '首页中部广告', '<div class=\"middleAd\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 1000);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(6, '2013-01-01 12:44:32', '2013-01-01 12:54:01', NULL, 343, '首页热门商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n		[#if ad.url??]\r\n			<a href=\"${ad.url}\">\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			</a>\r\n		[#else]\r\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', 260);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(7, '2013-01-01 12:45:43', '2013-01-01 12:53:58', NULL, 343, '首页最新商品左则广告', '[#list adPosition.ads as ad]\r\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n		[#if ad.url??]\r\n			<a href=\"${ad.url}\">\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			</a>\r\n		[#else]\r\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n		[/#if]\r\n	[/#if]\r\n[/#list]', 260);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(8, '2013-01-01 23:53:12', '2013-01-01 00:11:41', NULL, 300, '会员注册右侧广告', '<div class=\"ad\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"text\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					${ad.content}\r\n				</a>\r\n			[#else]\r\n				${ad.content}\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 240);
INSERT INTO `xx_ad_position` (`id`, `create_date`, `modify_date`, `description`, `height`, `name`, `template`, `width`) VALUES(9, '2013-01-01 00:12:44', '2013-01-01 22:42:13', NULL, 330, '会员登录左侧广告', '<div class=\"ad\">\r\n	[#list adPosition.ads as ad]\r\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\r\n			[#if ad.url??]\r\n				<a href=\"${ad.url}\">\r\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n				</a>\r\n			[#else]\r\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\r\n			[/#if]\r\n		[/#if]\r\n	[/#list]\r\n</div>', 500);
</#noparse>

INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(1, '2013-01-01 13:33:15', '2013-01-01 22:32:06', 1, NULL, NULL, NULL, '${demoImageUrl}/ad/header.jpg', '正品保障', 1, NULL, 1);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(2, '2013-01-01 13:36:36', '2013-01-01 22:47:33', 2, NULL, NULL, NULL, '${demoImageUrl}/ad/footer.jpg', '我们的优势', 1, NULL, 2);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(3, '2013-01-01 13:33:40', '2013-01-01 22:46:11', 3, NULL, NULL, NULL, '${demoImageUrl}/ad/index_1.jpg', '享受这一刻的舒适', 1, NULL, 3);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(4, '2013-01-01 13:34:02', '2013-01-01 11:31:50', 4, NULL, NULL, NULL, '${demoImageUrl}/ad/index_2.jpg', '浪漫时尚季', 1, NULL, 3);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(5, '2013-01-01 13:34:19', '2013-01-01 22:46:24', 5, NULL, NULL, NULL, '${demoImageUrl}/ad/index_3.jpg', '伊见清新', 1, NULL, 3);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(6, '2013-01-01 13:35:30', '2013-01-01 22:47:16', 6, NULL, NULL, NULL, '${demoImageUrl}/ad/index_right.jpg', '春季新品', 1, NULL, 4);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(7, '2013-01-01 13:34:35', '2013-01-01 22:47:02', 7, NULL, NULL, NULL, '${demoImageUrl}/ad/index_top.jpg', '特卖会专场', 1, NULL, 5);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(8, '2013-01-01 12:46:56', '2013-01-01 22:47:25', 8, NULL, NULL, NULL, '${demoImageUrl}/ad/index_hot_product.jpg', '热门商品', 1, NULL, 6);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(9, '2013-01-01 12:47:18', '2013-01-01 22:47:28', 9, NULL, NULL, NULL, '${demoImageUrl}/ad/index_new_product.jpg', '最新商品', 1, NULL, 7);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(10, '2013-01-01 13:37:09', '2013-01-01 22:47:21', 10, NULL, '<dl>\r\n	<dt>\r\n		注册即享受\r\n	</dt>\r\n	<dd>\r\n		正品保障、正规发票\r\n	</dd>\r\n	<dd>\r\n		货到付款、会员服务\r\n	</dd>\r\n	<dd>\r\n		自由退换、售后上门\r\n	</dd>\r\n</dl>', NULL, NULL, '会员注册', 0, NULL, 8);
INSERT INTO `xx_ad` (`id`, `create_date`, `modify_date`, `orders`, `begin_date`, `content`, `end_date`, `path`, `title`, `type`, `url`, `ad_position`) VALUES(11, '2013-01-01 13:37:35', '2013-01-01 22:47:37', 11, NULL, NULL, NULL, '${demoImageUrl}/ad/login.jpg', '会员登录', 1, NULL, 9);