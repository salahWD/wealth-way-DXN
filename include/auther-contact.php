<?php

if (isset($_GET['p']) && !empty($_GET['p'])):
  $provider = $_GET['p'];
  $stmt = $con->prepare("SELECT dxn_id, instagram, facebook, phone_number FROM $USERS_T us WHERE token = ?");
  $stmt->execute([$provider]);
  if ($stmt->rowCount() > 0):
    $auther_contact = $stmt->fetch(PDO::FETCH_ASSOC);
    $_SESSION['dxn']          = $auther_contact['dxn_id'];
    $dxn_id       = $auther_contact['instagram'];
    $_SESSION['phone']        = $auther_contact['phone_number'];
    $phone        = $auther_contact['dxn_id'];
    $_SESSION['instagram']    = $auther_contact['instagram'];
    $instagram    = $auther_contact['phone_number'];
    $_SESSION['facebook']     = $auther_contact['facebook'];
    $facebook     = $auther_contact['facebook'];
  else:// if token is invalid
    $_SESSION['dxn']          = '555555';
    $dxn_id                   = '555555';
    $_SESSION['phone']        = '555555';
    $phone                    = '555555';
    $_SESSION['instagram']    = '555555';
    $instagram                = '555555';
    $_SESSION['facebook']     = '555555';
    $facebook                 = '555555';
  endif;
// if ther is session token
elseif (isset($_SESSION['dxn']) || isset($_SESSION['instagram']) || isset($_SESSION['facebook']) || isset($_SESSION['phone'])):
  $phone        = $_SESSION['phone'];
  $dxn_id       = $_SESSION['dxn'];
  $facebook     = $_SESSION['facebook'];
  $instagram    = $_SESSION['instagram'];
else:// if ther is no token in sessions or get
  $_SESSION['dxn']        = '555555';
  $_SESSION['instagram']  = '555555';
  $_SESSION['facebook']   = '555555';
  $_SESSION['phone']      = '555555';
endif;

?>

<div class="container">
  <div class="auther-contact mt-5">
    <div class="row">
      <div class="col-md-5">
        <a href="dxn_e_world.com/<?php echo $dxn_id;?>" class="login-btn btn btn-primary btn-block btn-lg"><?php echo $LANG['BE_A_MEMBER'];?></a>
      </div>
      <div class="col-md-7 mt-sm-3">
        <div class="row">
          <?php if($_SESSION['instagram'] != NULL):?>
            <div class="col text-center">
              <a href="https://www.instagram.com/<?php echo $_SESSION['instagram'];?>"><span class="social-icon instagram"><i class="fab fa-2x fa-fw fa-instagram"></i></span></a>
            </div>
          <?php endif;?>
          <div class="col text-center">
            <a href="http://wa.me/<?php echo $_SESSION['phone'];?>"><span class="social-icon whatsapp"><i class="fab fa-2x fa-fw fa-whatsapp"></i></span></a>
          </div>
          <?php if($_SESSION['facebook'] != NULL):?>
            <div class="col text-center">
              <a href="https://www.facebook.com/<?php echo $_SESSION['facebook'];?>"><span class="social-icon facebook"><i class="fab fa-2x fa-fw fa-facebook"></i></span></a>
            </div>
          <?php endif;?>
        </div>
      </div>
    </div>
  </div>
</div>