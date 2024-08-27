<div class="container">
  <div class="auther-contact mt-5">
    <div class="row">
      <div class="col-md-12">
        <div class="alert alert-warning text-center">يرجى من الأعضاء الكرام التواصل للأهمية</div>
      </div>
      <div class="col-md-12">
        <div class="row">
          <div class="col">
            <a href="dxn_e_world.com/<?php echo $_SESSION['info']['dxn_id'];?>" class="login-btn btn-lg btn btn-block btn-primary"><?php echo $LANG['BE_A_MEMBER'];?></a>
          </div>
          <div class="col">
            <a href="http://wa.me/<?php echo $_SESSION['info']['phone_number'];?>" class="btn btn-block btn-success"><span class="social-icon whatsapp"><i class="fab fa-2x fa-fw fa-whatsapp"></i></span></a>
          </div>
          <div class="col">
            <a href="./lectures.php" class="btn btn-block btn-primary"><span class="social-icon font-weight-bold whatsapp"><i class="fas ml-2 fa-2x fa-book"></i>التدريبات</span></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>