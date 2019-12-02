<?php 
require_once '../../../db/db.php';
$errmsg['no_error'] = false;
// insert query
$insertQuery = $my_db->query("INSERT INTO `qa_campaign_image` SET `ecard_img` = '".$_POST['card_image']."' , `ecard_path` = '".$_POST['card_path']."' , `update_on` = '".date('Y-m-d H:i:sa')."' , `campaign_category` = '".$_POST['choose_copy_campaign']."'  ");
if($insertQuery)
{
	$errmsg['no_error'] = true;
	$errmsg['main_error'] = "Successfully copied";
}
echo json_encode($errmsg);
?>