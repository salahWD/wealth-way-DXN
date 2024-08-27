<?php

  $host     = "localhost";
  $db_name  = "baka_train";
  $user = 'root';
  $pass = '';
  // $host     = "sql764.main-hosting.eu";
  // $db_name  = "u705313695_main";
  // $user     = 'u705313695_root';
  // $pass     = '2z#|l0r8;q:Z';
  $dsn      = "mysql:host=$host;dbname=$db_name";
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

<?php

  // $dsn = 'mysql:host=localhost;dbname=baka_train';
  // $user = 'root';
  // $pass = '';
  // $options = array(
  //   PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
  // );
  // try {
  //   $con = new PDO($dsn, $user, $pass, $options);
  //   $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  // }
  // catch (PDOException $e) {
  //   echo 'faild to connect' . $e->getMessage();
  // }
?>