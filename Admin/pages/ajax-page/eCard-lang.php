<?php  
// connection db
require_once '../../../db/db.php';
$errmsg['no_error'] = false;
$i = 0;
foreach($_POST['title'] as $details)
{
	$insertQuery = $my_db->query("INSERT INTO ".$db_prefix."eCard SET `campaign_category` = '".$_POST['cate'][$i]."', `eCard_title` = '".$details."', `eCard_description` = '".$_POST['short_d'][$i]."', `language_id` = '".$_POST['t_id'][$i]."' ");
	$i++;
}
if($insertQuery)
{
	$errmsg['main_error'] = "Successfully Added";
	$errmsg['no_error'] = true;
}
echo  json_encode($errmsg);
?>