<?php

  $dsn = 'mysql:host=localhost;dbname=baka_train';
  $user = 'root';
  $pass = '';
  $options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
  );
  try {
    $con = new PDO($dsn, $user, $pass, $options);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }
  catch (PDOException $e) {
    echo 'faild to connect' . $e->getMessage();
  }
?>