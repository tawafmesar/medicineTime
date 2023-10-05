<?php 

include "../connect.php" ; 

$usersid = filterRequest("usersid") ; 
$itemsid = filterRequest("itemsid") ; 

deleteData("alarm" , "users_id  = $usersid AND alarm_id = $itemsid") ; 
