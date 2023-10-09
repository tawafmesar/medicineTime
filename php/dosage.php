<?php


include "./connect.php";



$itemsid = filterRequest("itemsid") ; 



    $data = array("isDos" => "2");

    updateData("medicine", $data, "medicine_id = '$itemsid'");
 

?>