<?php 

	require_once '../db/db.php';
	// data set
	$errmsg['no_error'] = false;
	// my queries
	$data1 = $_POST['username'];
	$data2 = md5($_POST['pass']);
	//checking query
	$check_data =  $my_db->query("SELECT * FROM `qa_users` WHERE email = '".$data1."' AND pass_view = '".$data2."' ");
	$fetch_data = $check_data->fetch_array();
	// count rows
	if($check_data->num_rows>0)
	{
		$_SESSION['log_user_id'] = $fetch_data['userid'];
		$errmsg['no_error'] = true;
		$errmsg['mainmsg'] = "Successfully Logged In! Redirecting....";
	}
	echo json_encode($errmsg);
?>