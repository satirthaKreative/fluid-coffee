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
	// template images
	$selectImage = $my_db->query("SELECT * FROM ".$db_prefix."image INNER JOIN  ".$db_prefix."category ON  ".$db_prefix."image.campaign_category = ".$db_prefix."category.id ORDER BY ".$db_prefix."image.id DESC ");
?>