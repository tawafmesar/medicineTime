<?php 

include "../connect.php" ; 

$usersid = filterRequest("usersid") ; 
$itemsid = filterRequest("itemsid") ; 

deleteData("medicine" , "users_id  = $usersid AND medicine_id = $itemsid") ; 
