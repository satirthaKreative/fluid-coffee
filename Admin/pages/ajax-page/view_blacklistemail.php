<?php  
	// connection db
	require_once '../../../db/db.php';
	// fetch query
	$selectQuery = $my_db->query("SELECT * FROM ".$db_prefix."blacklistemails WHERE id = '".$_POST['data_val']."' ");
	$fetchQuery = $selectQuery->fetch_array();
	echo json_encode($fetchQuery);
?>