<?php
  session_start();
  session_unset();
  session_destroy();
  setcookie('registered', '', time() - 500);
  header("Location: index.php");
  exit();
?>