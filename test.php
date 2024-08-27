<?php

if (isset($_GET['name'])) {
  echo "<h1>" . $_GET['name'] . "</h1>";
}else {
  echo "<h1>ther is no request</h1>";
}