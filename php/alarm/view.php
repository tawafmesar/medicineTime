<?php


include "../connect.php";


$id = filterRequest("id");


getAllData("alarm", "users_id  = ?  ", array($id));

