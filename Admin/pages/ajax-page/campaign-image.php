<?php  
	// connection db
	require_once '../../../db/db.php';
	$errmsg['no_error'] = false;
	// category add ajax
		$newimg = "image".substr(uniqid(),0,6).$_FILES['user_image']['name'];
		move_uploaded_file($_FILES['user_image']['tmp_name'], "../uploads/".$newimg);
		// insert category query
		$insertQuery = $my_db->query("UPDATE ".$db_prefix."category SET cate_image = '".$newimg."' WHERE id = '".$_POST['choose_campaign']."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Added";
			$errmsg['no_error'] = true;
		}
	
	echo json_encode($errmsg);

?>