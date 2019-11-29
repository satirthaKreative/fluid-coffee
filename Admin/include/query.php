<?php  
	// select category
	$selectCate = $my_db->query("SELECT * FROM ".$db_prefix."category ");
	// select banned ip's
	$selectIp = $my_db->query("SELECT * FROM ".$db_prefix."bannedip ");
	// select blacklist emails
	$selectEmail = $my_db->query("SELECT * FROM ".$db_prefix."blacklistemails");
	// select blacklist phones
	$selectPhone = $my_db->query("SELECT * FROM ".$db_prefix."blacklistphones");
	// select Language 
	$selectLanguage = $my_db->query("SELECT * FROM ".$db_prefix."languages");
?>