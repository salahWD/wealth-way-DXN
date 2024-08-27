<?php
  session_start();
  if (isset($_SESSION['user'])) {
    $style = 'home.css';
    $pageName = 'home';
    include "init.php";
    include $inc . '/header.php';
    ?>
    <div class="bg-objects-holder">
      <div class="bg-object" data-direction="right" data-position="-100"><div class="center-gap"></div></div>
      <div class="bg-object" data-direction="left" data-position="-100"><div class="center-gap"></div></div>
    </div>
    <div class="container">
      <div class="row">
        <div class="offset-md-2"></div>
        <div class="col-lg-8">
          <div style="position:relative;border-radius: 15px;overflow:hidden">
            <img
              class="embed-responsive embed-responsive-16by9 img-thumbnail"
              style="object-fit: cover;"
              src="images/how-it-works.jpg"
              alt="how it works image" />
            <div style="position: absolute;width: 100%;height:100%;background: black;opacity:0.55;inset:0;"></div>
            <div style="position: absolute;left:50%;top:50%;background: black;opacity:0.75;width:75px;height:75px;transform: translate(-50%, -50%);border-radius:50%;display: flex;place-items:center">
              <div style="border: 20px solid transparent;border-left: 30px solid white;"></div>
            </div>
          </div>
          <!-- <div class="embed-responsive embed-responsive-16by9 img-thumbnail"> -->
            <!-- <iframe src="https://www.youtube-nocookie.com/embed/klPhpmHvMcg" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe> -->
          <!-- </div> -->
        </div>
        <hr class="separet">
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="card">
            <div class="card-header p-0 card-image">
              <div class="img-flued"><img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/intro.svg" alt="<?php ?>"></div>
            </div>
            <div class="card-body text-center">
              <div class="content">
                <h4 class="cap"><?php echo $LANG['INTRODUCTION'];?></h4>
                <p class="lead"><?php echo $LANG['ABOUT_COMPANY_AND_SYSTEM'];?></p>
                <a href="introduction.php" class="btn btn-primary btn-block btn-sm mt-2"><?php echo $LANG['HERE'];?></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="card">
            <div class="card-header p-0 card-image">
              <div class="img-flued"><img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/login.svg" alt=""></div>
            </div>
            <div class="card-body text-center">
              <div class="content">
                <h4 class="cap"><?php echo $LANG['BE_A_MEMBER'];?></h4>
                <p class="lead"><?php echo $LANG['BECOME_A_DISTRIBUTOR'];?></p>
                <a href="https://eworld.dxn2u.com/s/accreg/ar/<?php
                echo get('dxn_id', $USERS_T, "id = " . $_SESSION['la'])['dxn_id'];?>" class="btn btn-primary btn-block btn-sm mt-2"><?php echo $LANG['HERE'];?></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="card">
            <div class="card-header p-0 card-image">
              <div class="img-flued"><img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/training.svg" alt=""></div>
            </div>
            <div class="card-body text-center">
              <div class="content">
                <h4 class="cap"><?php echo $LANG['LERNING'];?></h4>
                <p class="lead"><?php echo $LANG['WATCH_TUTORIALS'];?></p>
                <a href="lectures.php" class="btn btn-primary btn-block btn-sm mt-2"><?php echo $LANG['HERE'];?></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="card">
            <div class="card-header p-0 card-image">
              <div class="img-flued"><img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/products.jpg" alt=""></div>
            </div>
            <div class="card-body text-center">
              <div class="content">
                <h4 class="cap"><?php echo $LANG['PRODUCTS'];?></h4>
                <p class="lead"><?php echo $LANG['LERN_ABOUT_PRODUCTS'];?></p>
                <a href="products.php" class="btn btn-primary btn-block btn-sm mt-2"><?php echo $LANG['HERE'];?></a>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="card<?php if (!$_SESSION['subscriber'] && !$_SESSION['admin']) {echo ' premium';}?>">
            <div class="card-header p-0 card-image">
              <div class="img-flued"><img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/target.svg" alt=""></div>
            </div>
            <div class="card-body text-center">
              <div class="content">
                <h4><?php echo $LANG['SD_PLAN'];?></h4>
                <p class="lead"><?php echo $LANG['STAR_DIAMOND_PLAN'];?></p>
                <?php if (!$_SESSION['subscriber'] && !$_SESSION['admin']) {?>
                  <span class="btn btn-info btn-block upgradeToPrem btn-sm mt-2"><?php echo $LANG['HERE'];?></span>
                <?php }else {?>
                  <a href="sd-plan.php" class="btn btn-primary btn-block btn-sm mt-2"><?php echo $LANG['HERE'];?></a>
                <?php }?>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="card<?php if (!$_SESSION['subscriber'] && !$_SESSION['admin']) {echo ' premium';}?>">
            <div class="card-header p-0 card-image">
            <div class="img-flued"><img class="img-responsive" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/images/day_task.svg" alt=""></div>
            </div>
            <div class="card-body text-center">
              <div class="content">
                <h4 class="cap"><?php echo $LANG['DAYLE_TASKS'];?></h4>
                <p class="lead"><?php echo $LANG['DAYLE_TASKS_TABLE'];?></p>
                <?php if (!$_SESSION['subscriber'] && !$_SESSION['admin']) {?>
                  <span class="btn btn-info btn-block upgradeToPrem btn-sm mt-2"><?php echo $LANG['HERE'];?></span>
                <?php }else {?>
                  <a href="dayle-tasks.php" class="btn btn-primary btn-block btn-sm mt-2"><?php echo $LANG['HERE'];?></a>
                <?php }?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <?php
    include $inc . "/footer.php";
  }else {
    header("Location: index.php");
    exit();
  }
?>