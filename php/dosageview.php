<?php


include "./connect.php";


$id = filterRequest("id");


getAllData("medicine", " isDaily = 2 AND users_id  = ?  ", array($id));

?>