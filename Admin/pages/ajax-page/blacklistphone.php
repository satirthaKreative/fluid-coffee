<?php  
	// connection db
	require_once '../../../db/db.php';
	$errmsg['no_error'] = false;
	// category add ajax
	if($_POST['action_type'] == 'add')
	{
		$data_ip = $_POST['data1'];
		$select_check_ip = $my_db->query("SELECT * FROM ".$db_prefix."blacklistphones WHERE cate_name = '".$data_ip."' ");
		if($select_check_ip->num_rows == 0){
			if(!ctype_digit($data_ip)){
				$errmsg['main_msg'] = "Enter a valid phone number";
				$errmsg['no_error'] = true;
			}
			else{
				// insert category query
				$insertQuery = $my_db->query("INSERT INTO ".$db_prefix."blacklistphones SET cate_name = '".$_POST['data1']."' ,added_on = '".date('Y-m-d')."' ");
				if($insertQuery)
				{
					$errmsg['main_msg'] = "Successfully Added";
					$errmsg['no_error'] = true;
				}
			}
		} else {
			$errmsg['main_msg'] = "This  Already Added On Previous";
			$errmsg['no_error'] = true;
		}
	}
	//  category Update ajax
	if($_POST['action_type'] == 'update')
	{
		// insert category query
		$insertQuery = $my_db->query("UPDATE ".$db_prefix."blacklistphones SET cate_name = '".$_POST['data1']."' ,added_on = '".date('Y-m-d')."' WHERE id = '".$_POST['data_new']."' ");
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
		$insertQuery = $my_db->query("DELETE FROM ".$db_prefix."blacklistphones WHERE id = '".$_POST['data1']."' ");
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
		$insertQuery = $my_db->query("UPDATE ".$db_prefix."blacklistphones SET status = '".$_POST['status_id']."' WHERE id = '".$_POST['data']."' ");
		if($insertQuery)
		{
			$errmsg['main_msg'] = "Successfully Updated";
			$errmsg['no_error'] = true;
		}
	}
	echo json_encode($errmsg);

?>