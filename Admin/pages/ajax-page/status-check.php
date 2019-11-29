<?php  
// connection db
require_once '../../../db/db.php';
$errmsg['no_error'] = false;
// language status change ajax
if($_POST['action_type'] == 'language_status')
{
	// insert language query
	$insertQuery = $my_db->query("UPDATE ".$db_prefix."image SET status = '".$_POST['data']."' WHERE id = '".$_POST['state_id']."' ");
	if($insertQuery)
	{
		$errmsg['no_error'] = true;
	}
}
echo  json_encode($errmsg);
?>