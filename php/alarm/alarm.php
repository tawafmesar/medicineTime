<?php

include "../connect.php";

$alarm_title = filterRequest("alarm_title");
$alarm_time_before = filterRequest("alarm_time");
$users_id = filterRequest("users_id");


// Format the DateTime object as a MySQL timestamp
//$alarm_time = $alarm_time_before->format("Y-m-d H:i:s");


    $data = array(
        "alarm_title" => $alarm_title,
        "alarm_time" =>  $alarm_time_before,
        "users_id" => $users_id,
    );
    insertData("alarm" , $data) ; 

    