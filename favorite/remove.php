<?php
 
 include "../connect.php";

 $itemsid= filterRequest('itemsid');
 $userid = filterRequest('userid');

 $stmt= $con->prepare("DELETE FROM `favorite` WHERE`favorite_usersid`=$userid and`favorite_itemsid`= $itemsid");

 $stmt->execute();
 $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

 $count =$stmt->rowCount();
 result($count,$data);