<?php
 
 include "../connect.php";

 $itemsid= filterRequest('itemsid');
 $userid = filterRequest('userid');

 $stmt= $con->prepare("INSERT INTO `favorite`(`favorite_usersid`,`favorite_itemsid`) VALUES($userid,$itemsid)");

 $stmt->execute();
 $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

 $count =$stmt->rowCount();
 result($count,$data);