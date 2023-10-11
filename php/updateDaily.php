<?php 

include "./connect.php"  ;


$updatenumber    = 1;

$data = array(
"isDos" => $updatenumber
) ; 

updateData("medicine" ,  $data   ) ; 