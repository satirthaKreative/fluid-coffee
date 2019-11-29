<?php 
// config file connection
include_once "../../../db/db.php";
$errmsg['no_error'] = true;
//  logout connection
session_destroy();
echo json_encode($errmsg);
?>