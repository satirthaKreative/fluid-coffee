<?php  
	// connection db
	require_once '../../../db/db.php';
	$errmsg['no_error'] = false;
	// category add ajax
	if($_POST['action_type'] == 'add')
	{
		
		// insert category query
		$insertQuery = $my_db->query("INSERT INTO ".$db_prefix."category SET cate_name = '".$_POST['data1']."' ,cate_details = '".$_POST['data2']."' , added_on = '".date('Y-m-d')."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Added";
			$errmsg['no_error'] = true;
		}
	}
	//  category Update ajax
	if($_POST['action_type'] == 'update')
	{
		// insert category query
		$insertQuery = $my_db->query("UPDATE ".$db_prefix."category SET cate_name = '".$_POST['data1']."' ,cate_details = '".$_POST['data2']."' ,added_on = '".date('Y-m-d')."' WHERE id = '".$_POST['data_new']."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Updated";
			$errmsg['no_error'] = true;
		}
	}
	// category delete ajax
	if($_POST['action_type'] == 'delete')
	{
		// insert category query
		$insertQuery = $my_db->query("DELETE FROM ".$db_prefix."category WHERE id = '".$_POST['data1']."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Deleted Data";
			$errmsg['no_error'] = true;
		}
	}
	// status change ajax
	if($_POST['action_type'] == 'status')
	{
		// insert category query
		$insertQuery = $my_db->query("UPDATE ".$db_prefix."category SET status = '".$_POST['status_id']."' WHERE id = '".$_POST['data']."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Updated";
			$errmsg['no_error'] = true;
		}
	}
	echo json_encode($errmsg);

?>