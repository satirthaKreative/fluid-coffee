-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2019 at 01:39 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffe`
--

-- --------------------------------------------------------

--
-- Table structure for table `qa_blobs`
--

CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` int(10) UNSIGNED DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_cache`
--

CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_bannedip`
--

CREATE TABLE `qa_campaign_bannedip` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) DEFAULT NULL,
  `added_on` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_bannedip`
--

INSERT INTO `qa_campaign_bannedip` (`id`, `cate_name`, `added_on`, `status`) VALUES
(2, '192.168.0.94', '2019-11-27', 0),
(3, '192.168.0.93', '2019-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_blacklistemails`
--

CREATE TABLE `qa_campaign_blacklistemails` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) DEFAULT NULL,
  `added_on` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_blacklistemails`
--

INSERT INTO `qa_campaign_blacklistemails` (`id`, `cate_name`, `added_on`, `status`) VALUES
(1, 'satirtha63@gmail.com', '2019-11-27', 1),
(2, 'satirtha69@gmail.com', '2019-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_blacklistphones`
--

CREATE TABLE `qa_campaign_blacklistphones` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) DEFAULT NULL,
  `added_on` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_blacklistphones`
--

INSERT INTO `qa_campaign_blacklistphones` (`id`, `cate_name`, `added_on`, `status`) VALUES
(2, '7896321459', '2019-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_category`
--

CREATE TABLE `qa_campaign_category` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) NOT NULL,
  `cate_details` text NOT NULL,
  `cate_image` varchar(255) NOT NULL,
  `on_off_state` int(11) NOT NULL DEFAULT 1,
  `added_on` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_category`
--

INSERT INTO `qa_campaign_category` (`id`, `cate_name`, `cate_details`, `cate_image`, `on_off_state`, `added_on`, `status`) VALUES
(1, 'Happy New Year 2020', 'Happy New Year  Wish Card', 'image5ddfa4image (1).png', 1, '2019-11-29', 3),
(2, 'Christmas 2019', 'Christmas Celebrate Wish', 'image5ddfa3image.png', 0, '2019-11-28', 3);

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_ecard`
--

CREATE TABLE `qa_campaign_ecard` (
  `id` int(11) NOT NULL,
  `campaign_category` int(11) NOT NULL,
  `eCard_title` varchar(255) NOT NULL,
  `eCard_description` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL,
  `u_status` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_ecard`
--

INSERT INTO `qa_campaign_ecard` (`id`, `campaign_category`, `eCard_title`, `eCard_description`, `language_id`, `u_status`, `status`) VALUES
(1, 1, 'grah-thyas', 'grah-thyas', 2, 1, 1),
(2, 1, 'Lorem', 'Lorem', 3, 1, 1),
(3, 1, 'বাঙ্গালী ', 'বাঙ্গালী ', 4, 1, 1),
(4, 1, 'kommahng tahlay voo', 'kommahng tahlay voo', 7, 1, 1),
(5, 1, 'grah-thyas', 'grah-thyas\r\n', 2, 1, 1),
(6, 1, 'Lorem', 'Lorem', 3, 1, 1),
(7, 2, 'বাঙ্গালী ', 'বাঙ্গালী ', 4, 1, 1),
(8, 2, 'kommahng tahlay voo', 'kommahng tahlay voo', 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_image`
--

CREATE TABLE `qa_campaign_image` (
  `id` int(11) NOT NULL,
  `ecard_img` varchar(255) NOT NULL,
  `ecard_path` varchar(255) NOT NULL,
  `update_on` date NOT NULL,
  `campaign_category` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_image`
--

INSERT INTO `qa_campaign_image` (`id`, `ecard_img`, `ecard_path`, `update_on`, `campaign_category`, `status`) VALUES
(1, 'image5de0f62019.jpg', 'Happy New Year 2020', '2019-11-29', 1, 0),
(2, 'image5de0f62020.jpg', 'Happy New Year 2020', '2019-11-29', 1, 1),
(3, 'image5de0f7christmas.jpg', 'Christmas 2019', '2019-11-29', 2, 1),
(6, 'image5de110christmas1.jpg', 'Christmas 2019', '0000-00-00', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_campaign_languages`
--

CREATE TABLE `qa_campaign_languages` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(255) DEFAULT NULL,
  `added_on` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qa_campaign_languages`
--

INSERT INTO `qa_campaign_languages` (`id`, `cate_name`, `added_on`, `status`) VALUES
(2, 'Spanish', '2019-11-27', 1),
(3, 'English', '2019-11-27', 1),
(4, 'Bengali', '2019-11-27', 0),
(7, 'France', '2019-11-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_categories`
--

CREATE TABLE `qa_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_categorymetas`
--

CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_contentwords`
--

CREATE TABLE `qa_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_contentwords`
--

INSERT INTO `qa_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(2, 12, 1, 'Q', 2),
(2, 13, 1, 'Q', 2),
(2, 14, 1, 'Q', 2),
(2, 15, 1, 'Q', 2),
(2, 16, 1, 'Q', 2),
(2, 17, 1, 'Q', 2),
(2, 18, 1, 'Q', 2),
(2, 19, 1, 'Q', 2),
(2, 20, 1, 'Q', 2),
(2, 21, 1, 'Q', 2),
(2, 22, 1, 'Q', 2),
(2, 23, 1, 'Q', 2),
(3, 12, 1, 'Q', 3),
(3, 13, 1, 'Q', 3),
(3, 14, 1, 'Q', 3),
(3, 15, 1, 'Q', 3),
(3, 16, 1, 'Q', 3),
(3, 17, 1, 'Q', 3),
(3, 18, 1, 'Q', 3),
(3, 19, 1, 'Q', 3),
(3, 26, 1, 'Q', 3),
(3, 27, 1, 'Q', 3),
(3, 28, 1, 'Q', 3),
(3, 23, 1, 'Q', 3),
(4, 12, 1, 'Q', 4),
(4, 29, 1, 'Q', 4),
(4, 13, 1, 'Q', 4),
(4, 14, 1, 'Q', 4),
(4, 15, 1, 'Q', 4),
(4, 16, 1, 'Q', 4),
(4, 17, 1, 'Q', 4),
(4, 18, 1, 'Q', 4),
(4, 19, 1, 'Q', 4),
(4, 30, 1, 'Q', 4),
(4, 31, 1, 'Q', 4),
(4, 23, 1, 'Q', 4);

-- --------------------------------------------------------

--
-- Table structure for table `qa_cookies`
--

CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) UNSIGNED NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_cookies`
--

INSERT INTO `qa_cookies` (`cookieid`, `created`, `createip`, `written`, `writeip`) VALUES
(15077469233356870087, '2019-11-18 15:49:25', 789284744, '2019-11-18 15:50:24', 789284744);

-- --------------------------------------------------------

--
-- Table structure for table `qa_iplimits`
--

CREATE TABLE `qa_iplimits` (
  `ip` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_iplimits`
--

INSERT INTO `qa_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0, 'L', 437431, 1),
(0, 'R', 437309, 1),
(737971209, 'L', 437196, 1),
(737971209, 'W', 437197, 1),
(737971360, 'L', 437238, 1),
(737971360, 'Q', 437238, 3),
(737972056, 'R', 437154, 1),
(789284744, 'Q', 437247, 1),
(1866539834, 'L', 437240, 1),
(1866545628, 'L', 437256, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_messages`
--

CREATE TABLE `qa_messages` (
  `messageid` int(10) UNSIGNED NOT NULL,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) UNSIGNED NOT NULL,
  `touserid` int(10) UNSIGNED NOT NULL,
  `fromhidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `tohidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_options`
--

CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_options`
--

INSERT INTO `qa_options` (`title`, `content`) VALUES
('ad_post_below', ''),
('allow_change_usernames', '1'),
('allow_close_questions', '1'),
('allow_login_email_only', ''),
('allow_private_messages', '1'),
('allow_self_answer', '1'),
('allow_user_walls', '1'),
('allow_view_q_bots', '1'),
('antibotcaptcha_charset', '23456789'),
('antibotcaptcha_count', '4'),
('approve_user_required', ''),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_blobid', ''),
('avatar_default_height', ''),
('avatar_default_show', ''),
('avatar_default_width', ''),
('avatar_message_list_size', '80'),
('avatar_profile_size', '200'),
('avatar_q_list_size', '80'),
('avatar_q_page_q_size', '80'),
('avatar_store_size', '400'),
('avatar_users_size', '180'),
('block_bad_words', ''),
('block_ips_write', ''),
('button_style', ''),
('cache_flaggedcount', ''),
('cache_qcount', '4'),
('cache_queuedcount', '0'),
('cache_tagcount', '1'),
('cache_uapprovecount', '1'),
('cache_unaqcount', '4'),
('cache_unselqcount', '4'),
('cache_unupaqcount', '4'),
('cache_userpointscount', '3'),
('captcha_module', 'King Captcha'),
('captcha_on_anon_post', '1'),
('captcha_on_feedback', '1'),
('captcha_on_register', '1'),
('captcha_on_reset_password', '1'),
('captcha_on_unapproved', ''),
('captcha_on_unconfirmed', '0'),
('columns_tags', '3'),
('columns_users', '2'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('confirm_user_required', ''),
('custom_answer', ''),
('custom_ask', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('custom_register', ''),
('custom_welcome', ''),
('db_version', '59'),
('disable_image', '0'),
('disable_news', '0'),
('disable_video', '0'),
('disable_watermark', '0'),
('do_ask_check_qs', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', ''),
('editor_for_qs', ''),
('embed_enable_thickbox', ''),
('embed_gmap_height', ''),
('embed_gmap_width', ''),
('embed_mp3_player_code', ''),
('extra_field_active', '1'),
('extra_field_display', '1'),
('extra_field_label', ''),
('extra_field_prompt', ''),
('fb_user_token', ''),
('feedback_email', 'warren@fluid.coffee'),
('feedback_enabled', '1'),
('feed_for_activity', '1'),
('feed_for_hot', ''),
('feed_for_qa', '1'),
('feed_for_questions', '1'),
('feed_for_search', ''),
('feed_for_tag_qs', ''),
('feed_for_unanswered', '1'),
('feed_full_text', '1'),
('feed_number_items', '50'),
('feed_per_category', '1'),
('flagging_hide_after', '5'),
('flagging_notify_every', '2'),
('flagging_notify_first', '1'),
('flagging_of_posts', '1'),
('follow_on_as', '1'),
('footer_fb', ''),
('footer_google', ''),
('footer_pin', ''),
('footer_twi', ''),
('footer_ytube', ''),
('form_security_salt', 'k5j3fgch05qw8catx19li6tcwg7ofk7o'),
('from_email', 'no-reply@fluid.coffee'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('image_max_file_count', '12'),
('image_max_upload', '2'),
('king_analytic', ''),
('king_analytic_box', ''),
('king_key', 'e29215bf-103d-4b07-884c-c00715976cc0'),
('king_live_search_enabled', '1'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('mailing_body', '\n\n\n--\nfluid coffee\nhttp://www.fluid.coffee//'),
('mailing_enabled', ''),
('mailing_from_email', 'no-reply@fluid.coffee'),
('mailing_from_name', 'fluid coffee'),
('mailing_last_userid', ''),
('mailing_per_minute', '500'),
('mailing_subject', 'A message from fluid coffee'),
('match_ask_check_qs', '3'),
('match_example_tags', '3'),
('max_copy_user_updates', '10'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_cs', '40'),
('max_rate_ip_flags', '10'),
('max_rate_ip_logins', '20'),
('max_rate_ip_messages', '10'),
('max_rate_ip_qs', '20'),
('max_rate_ip_registers', '5'),
('max_rate_ip_uploads', '20'),
('max_rate_ip_votes', '600'),
('max_rate_user_as', '25'),
('max_rate_user_cs', '20'),
('max_rate_user_flags', '5'),
('max_rate_user_messages', '5'),
('max_rate_user_qs', '10'),
('max_rate_user_uploads', '10'),
('max_rate_user_votes', '300'),
('max_store_user_updates', '50'),
('min_len_a_content', '12'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_anon_post', '1'),
('moderate_by_points', ''),
('moderate_edited_again', ''),
('moderate_notify_admin', '1'),
('moderate_points_limit', '150'),
('moderate_unapproved', ''),
('moderate_unconfirmed', ''),
('moderate_update_time', '1'),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_myPage', '1'),
('nav_news', '1'),
('nav_qa_not_home', '0'),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_test', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('nav_users1', ''),
('neat_urls', '1'),
('notice_visitor', ''),
('notice_welcome', ''),
('notify_admin_q_post', ''),
('notify_users_default', '0'),
('pages_prev_next', '3'),
('page_size_ask_check_qs', '5'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_pms', '10'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('page_size_search', '10'),
('page_size_tags', '30'),
('page_size_tag_qs', '20'),
('page_size_una_qs', '20'),
('page_size_users', '20'),
('page_size_wall', '10'),
('permit_anon_view_ips', '70'),
('permit_anon_view_ips_points', ''),
('permit_close_q', '150'),
('permit_close_q_points', ''),
('permit_delete_hidden', '40'),
('permit_delete_hidden_points', ''),
('permit_edit_a', '100'),
('permit_edit_a_points', ''),
('permit_edit_c', '70'),
('permit_edit_c_points', ''),
('permit_edit_q', '70'),
('permit_edit_q_points', ''),
('permit_edit_silent', '40'),
('permit_edit_silent_points', ''),
('permit_flag', '110'),
('permit_flag_points', ''),
('permit_hide_show', '70'),
('permit_hide_show_points', ''),
('permit_moderate', '100'),
('permit_moderate_points', ''),
('permit_post_a', '150'),
('permit_post_a_points', ''),
('permit_post_c', '150'),
('permit_post_c_points', ''),
('permit_post_q', '150'),
('permit_post_q_points', ''),
('permit_post_wall', '110'),
('permit_post_wall_points', ''),
('permit_retag_cat', '70'),
('permit_retag_cat_points', ''),
('permit_select_a', '100'),
('permit_select_a_points', ''),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_view_voters_flaggers_points', ''),
('permit_vote_a', '120'),
('permit_vote_a_points', ''),
('permit_vote_down', '120'),
('permit_vote_down_points', ''),
('permit_vote_q', '120'),
('permit_vote_q_points', ''),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('previous_lable', ''),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('register_notify_admin', ''),
('register_terms', '[options/default_terms]'),
('show_ad_post_below', ''),
('show_a_c_links', '1'),
('show_a_form_immediate', 'always'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_register', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '1'),
('show_c_reply_buttons', '1'),
('show_fewer_cs_count', '5'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_home_description', ''),
('show_message_history', '1'),
('show_notice_visitor', ''),
('show_notice_welcome', ''),
('show_post_update_meta', ''),
('show_register_terms', '0'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '1'),
('show_view_count_q_page', '1'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', ''),
('site_theme', 'royal'),
('site_theme_mobile', 'royal'),
('site_title', 'fluid coffee'),
('site_url', 'http://www.fluid.coffee//'),
('smtp_active', ''),
('smtp_address', ''),
('smtp_authenticate', ''),
('smtp_password', ''),
('smtp_port', '25'),
('smtp_secure', ''),
('smtp_username', ''),
('sort_answers_by', 'created'),
('suspend_register_users', ''),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('video_ffmpeg', '/usr/bin/ffmpeg'),
('video_max_upload', '10'),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_qs', '1'),
('voting_on_q_page_only', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pages`
--

CREATE TABLE `qa_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `icon` varchar(800) DEFAULT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_postmetas`
--

CREATE TABLE `qa_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_postmetas`
--

INSERT INTO `qa_postmetas` (`postid`, `title`, `content`) VALUES
(1, 'qa_q_extra', ''),
(2, 'qa_q_extra', 'http://fluid.coffee//king-include/uploads/2019/11/sun_final_days-hd-587750.jpg'),
(3, 'qa_q_extra', 'http://fluid.coffee//king-include/uploads/2019/11/saturn_dream-wide-927569.jpg'),
(4, 'qa_q_extra', 'http://www.fluid.coffee//king-include/uploads/2019/11/img_20190805_185525__01-900369.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `qa_posts`
--

CREATE TABLE `qa_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `postformat` enum('V','I','N') DEFAULT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` int(10) UNSIGNED DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` int(10) UNSIGNED DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `netvotes` smallint(6) NOT NULL DEFAULT 0,
  `lastviewip` int(10) UNSIGNED DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_posts`
--

INSERT INTO `qa_posts` (`postid`, `type`, `postformat`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', 'I', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 737971360, NULL, NULL, 0, 0, 0, 737971360, 1, 62351000000, 0, '', '2019-11-18 06:01:09', NULL, NULL, 'asasasas adad dsdsdsd', '', '', NULL, NULL),
(2, 'Q', 'I', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 737971360, NULL, NULL, 0, 0, 0, 737971360, 1, 62351200000, 0, '', '2019-11-18 06:23:39', NULL, NULL, 'This is a test image upload from Yunus', 'http://fluid.coffee//king-include/uploads/2019/11/thumb_sun_final_days-hd-587750.jpg', '', NULL, NULL),
(3, 'Q', 'I', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 737971360, NULL, NULL, 0, 0, 0, 1866545628, 2, 62351700000, 0, '', '2019-11-18 06:26:22', NULL, NULL, 'blah blahblah blah', 'http://fluid.coffee//king-include/uploads/2019/11/thumb_saturn_dream-wide-927569.jpg', '', NULL, NULL),
(4, 'Q', 'I', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 15077469233356870087, 789284744, NULL, NULL, 0, 0, 0, NULL, 3, 62364800000, 0, '', '2019-11-19 00:09:19', NULL, NULL, 'Test Image Test Image', 'http://www.fluid.coffee//king-include/uploads/2019/11/thumb_img_20190805_185525__01-900369.jpg', 'mirik', 'Yunus Aslam', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_posttags`
--

CREATE TABLE `qa_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_posttags`
--

INSERT INTO `qa_posttags` (`postid`, `wordid`, `postcreated`) VALUES
(4, 32, '2019-11-19 00:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `qa_sharedevents`
--

CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_sharedevents`
--

INSERT INTO `qa_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 2, '2019-11-18 06:01:09'),
('U', 2, 1, 1, NULL, 2, '2019-11-18 06:01:09'),
('Q', 2, 2, 2, NULL, 2, '2019-11-18 06:23:39'),
('U', 2, 2, 2, NULL, 2, '2019-11-18 06:23:39'),
('Q', 3, 3, 3, NULL, 2, '2019-11-18 06:26:22'),
('U', 2, 3, 3, NULL, 2, '2019-11-18 06:26:22'),
('Q', 4, 4, 4, 'T', NULL, '2019-11-18 15:50:24'),
('Q', 4, 4, 4, NULL, NULL, '2019-11-19 00:09:19'),
('T', 32, 4, 4, NULL, NULL, '2019-11-19 00:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagmetas`
--

CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagwords`
--

CREATE TABLE `qa_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_tagwords`
--

INSERT INTO `qa_tagwords` (`postid`, `wordid`) VALUES
(4, 32);

-- --------------------------------------------------------

--
-- Table structure for table `qa_titlewords`
--

CREATE TABLE `qa_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_titlewords`
--

INSERT INTO `qa_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 24),
(3, 25),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userevents`
--

CREATE TABLE `qa_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userevents`
--

INSERT INTO `qa_userevents` (`userid`, `entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
(2, 'Q', 3, 3, 3, NULL, 2, '2019-11-18 06:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfavorites`
--

CREATE TABLE `qa_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userfavorites`
--

INSERT INTO `qa_userfavorites` (`userid`, `entitytype`, `entityid`, `nouserevents`) VALUES
(2, 'Q', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfields`
--

CREATE TABLE `qa_userfields` (
  `fieldid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userfields`
--

INSERT INTO `qa_userfields` (`fieldid`, `title`, `content`, `position`, `flags`, `permit`) VALUES
(1, 'name', NULL, 1, 0, NULL),
(2, 'location', NULL, 2, 0, NULL),
(3, 'website', NULL, 3, 2, NULL),
(4, 'about', NULL, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlevels`
--

CREATE TABLE `qa_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlimits`
--

CREATE TABLE `qa_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userlimits`
--

INSERT INTO `qa_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(2, 'Q', 437238, 3),
(2, 'W', 437197, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlogins`
--

CREATE TABLE `qa_userlogins` (
  `userid` int(10) UNSIGNED NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usermetas`
--

CREATE TABLE `qa_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usernotices`
--

CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userpoints`
--

CREATE TABLE `qa_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `qposts` mediumint(9) NOT NULL DEFAULT 0,
  `aposts` mediumint(9) NOT NULL DEFAULT 0,
  `cposts` mediumint(9) NOT NULL DEFAULT 0,
  `aselects` mediumint(9) NOT NULL DEFAULT 0,
  `aselecteds` mediumint(9) NOT NULL DEFAULT 0,
  `qupvotes` mediumint(9) NOT NULL DEFAULT 0,
  `qdownvotes` mediumint(9) NOT NULL DEFAULT 0,
  `aupvotes` mediumint(9) NOT NULL DEFAULT 0,
  `adownvotes` mediumint(9) NOT NULL DEFAULT 0,
  `qvoteds` int(11) NOT NULL DEFAULT 0,
  `avoteds` int(11) NOT NULL DEFAULT 0,
  `upvoteds` int(11) NOT NULL DEFAULT 0,
  `downvoteds` int(11) NOT NULL DEFAULT 0,
  `bonus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userpoints`
--

INSERT INTO `qa_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `qvoteds`, `avoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 160, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userprofile`
--

CREATE TABLE `qa_userprofile` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userprofile`
--

INSERT INTO `qa_userprofile` (`userid`, `title`, `content`) VALUES
(2, 'about', 'This is just me uploading pictures into the website. So that we can test all the upload sizes.'),
(2, 'location', 'India'),
(2, 'name', 'Yunus Aslam'),
(2, 'website', 'http://illusionsoftwares.com');

-- --------------------------------------------------------

--
-- Table structure for table `qa_users`
--

CREATE TABLE `qa_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) UNSIGNED NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `avatarblobid` bigint(20) UNSIGNED DEFAULT NULL,
  `avatarwidth` smallint(5) UNSIGNED DEFAULT NULL,
  `avatarheight` smallint(5) UNSIGNED DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` int(10) UNSIGNED NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) UNSIGNED DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `wallposts` mediumint(9) NOT NULL DEFAULT 0,
  `pass_view` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_users`
--

INSERT INTO `qa_users` (`userid`, `created`, `createip`, `email`, `handle`, `avatarblobid`, `avatarwidth`, `avatarheight`, `passsalt`, `passcheck`, `level`, `loggedin`, `loginip`, `written`, `writeip`, `emailcode`, `sessioncode`, `sessionsource`, `flags`, `wallposts`, `pass_view`) VALUES
(1, '2019-11-13 15:40:27', 3028378629, 'warren@fluid.coffee', 'warrenong', NULL, NULL, NULL, 0x6b777768666b75686467643866776a37, 0x08ff9b35963cf21128b767ecb827d56b5e1d3783, 120, '2019-11-19 00:08:47', 1866545628, '2019-11-19 00:09:19', 1866545628, '', 'trhb2ba8', NULL, 0, 0, ''),
(2, '2019-11-14 18:54:57', 737972056, 'yunus.aslam@gmail.com', 'yunus_aslam', NULL, NULL, NULL, 0x78386231706b3838637a723038357764, 0x912d4b56100312b9f21600862a426b6309bbd95e, 100, '2019-11-25 15:07:50', 0, '2019-11-18 06:26:51', 737971360, '', 'm3tp80y0', NULL, 1, 0, ''),
(3, '2019-11-21 10:30:01', 0, 'campaign@gmail.com', 'satirtha', NULL, NULL, NULL, 0x726f716665666c753179343731627a76, 0x7d94a565a74ac28907349de512922ce26c5fb32d, 0, '2019-11-21 10:30:04', 0, NULL, NULL, '1cjt3fuy', '3gconsec', NULL, 2, 0, '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `qa_uservotes`
--

CREATE TABLE `qa_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_widgets`
--

CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_words`
--

CREATE TABLE `qa_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_words`
--

INSERT INTO `qa_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'asasasas', 1, 0, 0, 0),
(2, 'adad', 1, 0, 0, 0),
(3, 'dsdsdsd', 1, 0, 0, 0),
(4, 'this', 1, 0, 0, 0),
(5, 'is', 1, 0, 0, 0),
(6, 'a', 1, 0, 0, 0),
(7, 'test', 2, 0, 0, 0),
(8, 'image', 2, 0, 0, 0),
(9, 'upload', 1, 0, 0, 0),
(10, 'from', 1, 0, 0, 0),
(11, 'yunus', 1, 0, 0, 0),
(12, 'http', 0, 3, 0, 0),
(13, 'fluid', 0, 3, 0, 0),
(14, 'coffee', 0, 3, 0, 0),
(15, 'king', 0, 3, 0, 0),
(16, 'include', 0, 3, 0, 0),
(17, 'uploads', 0, 3, 0, 0),
(18, '2019', 0, 3, 0, 0),
(19, '11', 0, 3, 0, 0),
(20, 'thumb_sun_final_days', 0, 1, 0, 0),
(21, 'hd', 0, 1, 0, 0),
(22, '587750', 0, 1, 0, 0),
(23, 'jpg', 0, 3, 0, 0),
(24, 'blah', 1, 0, 0, 0),
(25, 'blahblah', 1, 0, 0, 0),
(26, 'thumb_saturn_dream', 0, 1, 0, 0),
(27, 'wide', 0, 1, 0, 0),
(28, '927569', 0, 1, 0, 0),
(29, 'www', 0, 1, 0, 0),
(30, 'thumb_img_20190805_185525__01', 0, 1, 0, 0),
(31, '900369', 0, 1, 0, 0),
(32, 'mirik', 0, 0, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qa_blobs`
--
ALTER TABLE `qa_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Indexes for table `qa_cache`
--
ALTER TABLE `qa_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Indexes for table `qa_campaign_bannedip`
--
ALTER TABLE `qa_campaign_bannedip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_campaign_blacklistemails`
--
ALTER TABLE `qa_campaign_blacklistemails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_campaign_blacklistphones`
--
ALTER TABLE `qa_campaign_blacklistphones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_campaign_category`
--
ALTER TABLE `qa_campaign_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_campaign_ecard`
--
ALTER TABLE `qa_campaign_ecard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_campaign_image`
--
ALTER TABLE `qa_campaign_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_campaign_languages`
--
ALTER TABLE `qa_campaign_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa_categories`
--
ALTER TABLE `qa_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_cookies`
--
ALTER TABLE `qa_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Indexes for table `qa_iplimits`
--
ALTER TABLE `qa_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `qa_messages`
--
ALTER TABLE `qa_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  ADD KEY `touserid` (`touserid`,`type`,`created`),
  ADD KEY `fromhidden` (`fromhidden`),
  ADD KEY `tohidden` (`tohidden`);

--
-- Indexes for table `qa_options`
--
ALTER TABLE `qa_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `qa_pages`
--
ALTER TABLE `qa_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `qa_sharedevents`
--
ALTER TABLE `qa_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `qa_tagmetas`
--
ALTER TABLE `qa_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `qa_userfields`
--
ALTER TABLE `qa_userfields`
  ADD PRIMARY KEY (`fieldid`);

--
-- Indexes for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD KEY `source` (`source`,`identifiermd5`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `qa_userpoints`
--
ALTER TABLE `qa_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD UNIQUE KEY `userid` (`userid`,`title`);

--
-- Indexes for table `qa_users`
--
ALTER TABLE `qa_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `email` (`email`),
  ADD KEY `handle` (`handle`),
  ADD KEY `level` (`level`),
  ADD KEY `created` (`created`,`level`,`flags`);

--
-- Indexes for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`);

--
-- Indexes for table `qa_widgets`
--
ALTER TABLE `qa_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `qa_words`
--
ALTER TABLE `qa_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qa_campaign_bannedip`
--
ALTER TABLE `qa_campaign_bannedip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qa_campaign_blacklistemails`
--
ALTER TABLE `qa_campaign_blacklistemails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qa_campaign_blacklistphones`
--
ALTER TABLE `qa_campaign_blacklistphones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qa_campaign_category`
--
ALTER TABLE `qa_campaign_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `qa_campaign_ecard`
--
ALTER TABLE `qa_campaign_ecard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `qa_campaign_image`
--
ALTER TABLE `qa_campaign_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qa_campaign_languages`
--
ALTER TABLE `qa_campaign_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `qa_categories`
--
ALTER TABLE `qa_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_messages`
--
ALTER TABLE `qa_messages`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qa_pages`
--
ALTER TABLE `qa_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_posts`
--
ALTER TABLE `qa_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_userfields`
--
ALTER TABLE `qa_userfields`
  MODIFY `fieldid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_users`
--
ALTER TABLE `qa_users`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qa_widgets`
--
ALTER TABLE `qa_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_words`
--
ALTER TABLE `qa_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`);

--
-- Constraints for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
