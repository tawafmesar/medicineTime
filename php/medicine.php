<?php

include "./connect.php";

$medicine_name = filterRequest("medicine_name");
$medicine_type = filterRequest("medicine_type");
$HealthCondition = filterRequest("HealthCondition");
$users_id  = filterRequest("users_id");


    $data = array(
        "medicine_name" => $medicine_name,
        "medicine_type" =>  $medicine_type,
        "HealthCondition" => $HealthCondition,
        "users_id" => $users_id,
    );
    insertData("medicine" , $data) ; 
