<?php


include "../connect.php";


$id = filterRequest("id");


getAllData("medicine", "users_id  = ?  ", array($id));

