<?php 

include "../connect.php" ; 

$id = filterRequest("id") ;  

deleteData("medicine" , "medicine_id = $id"); 

