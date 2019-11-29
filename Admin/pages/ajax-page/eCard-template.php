<?php  
// connection db
require_once '../../../db/db.php';
$errmsg['no_error'] = false;
$category_id = $_POST['choose_campaign'];
$select_category = $my_db->query("SELECT * FROM ".$db_prefix."category WHERE id = '".$category_id."' ");
$fetch_category = $select_category->fetch_array();
$cate_name = $fetch_category['cate_name'];

if(!file_exists("../uploads/".$cate_name))
{
	mkdir("../uploads/".$cate_name,0777,true);
}

$total_count = count($_FILES['upload_img']['name']);

for($i=0;$i<$total_count;$i++)
{
	$newimg = "image".substr(uniqid(),0,6).$_FILES['upload_img']['name'][$i];
	move_uploaded_file($_FILES['upload_img']['tmp_name'][$i], "../uploads/".$cate_name."/".$newimg);
	$insertQuery = $my_db->query("INSERT INTO ".$db_prefix."image SET `ecard_img` = '".$newimg."', `ecard_path` = '".$cate_name."', `campaign_category` = '".$category_id."' ");
}
if($insertQuery)
{
	$errmsg['main_msg'] = "Successfully Added";
	$errmsg['no_error'] = true;
}

echo  json_encode($errmsg);
?>