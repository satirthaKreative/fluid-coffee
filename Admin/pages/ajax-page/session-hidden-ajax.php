<?php 
	require_once '../../../db/db.php'; 
	$session_category_id = $_POST['hidden_data']; 
	$session_image_id = $_POST['image_new_id'];
	$_SESSION['image_session_id'] = $session_image_id;
	$_SESSION['category_id'] = $session_category_id; 
	echo $_SESSION['image_session_id'];
?>