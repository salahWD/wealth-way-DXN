<?php
session_start();
if (isset($_SESSION['user'])):
  $style = 'products.css';
  $pageName = 'Products';
  include 'init.php';
  include 'include/header.php';?>
  
<div class="container">
  <h1 class="cap text-center mb-5"><?php echo $LANG['PRODUCTS'];?></h1>
  <div class="row">
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/01.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/02.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/03.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/04.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/05.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/06.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/07.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/08.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/09.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/10.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/11.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/12.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/13.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/14.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/15.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/16.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/17.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/18.jpg" alt="">
      </div>
    </div>
    <div class="col-sm-6 col-md-3 mb-3">
      <div class="product" data-title="" data-p="">
        <img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/19.jpg" alt="">
      </div>
    </div>
  </div>
</div>

<?php
include 'include/footer.php';
else:
  header("Location: index.php");
  exit();
endif;
?>