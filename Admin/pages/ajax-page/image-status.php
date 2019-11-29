<?php  
	// connection db
	require_once '../../../db/db.php';
	$errmsg['no_error'] = false;

	if($_POST['action_type'] == 'language_status')
	{
		// insert language query
		$insertQuery = $my_db->query("UPDATE ".$db_prefix."category SET on_off_state = '".$_POST['data']."' WHERE id = '".$_POST['state_id']."' ");
		if($insertQuery)
		{
			$errmsg['no_error'] = true;
		}
	}
	// category delete ajax
	if($_POST['action_type'] == 'delete')
	{
		// insert category query
		$insertQuery = $my_db->query("DELETE FROM ".$db_prefix."image WHERE id = '".$_POST['data1']."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Deleted Data";
			$errmsg['no_error'] = true;
		}
	}
	echo json_encode($errmsg);
?>