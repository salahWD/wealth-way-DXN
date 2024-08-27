<?php
session_start();
$pageName = 'lesson';
if (isset($_SESSION['user'])):
  $style = 'lectures.css';
  include 'init.php';
  $stmt = $con->prepare("SELECT * FROM $EPISODES_T");
  $stmt->execute();
  $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
  $last_ep = last_ep($_SESSION['id']);
  include $inc . '/header.php';?>
    <div class="container">
      <div class="card lecture-info">
        <div class="row">
          <div class="col-md-5">
            <img class="img-responsive img-thumbnail" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/uploads/images/lessons-header.jpeg" alt="lessons-header">
          </div>
          <div class="col-md-7">
            <div class="info">
              <h3 class="cap mb-4"><?php echo $LANG['LESSONS_TITLE'];?></h3>
              <hr>
              <ul class="list-unstyled cap">
                <li>
                  <span><?php echo $LANG['LESSONS'];?></span>:
                  <?php echo count($result);?>
                </li>
                <li class="text-align">
                  <span><?php echo $LANG['WATCHED'];?></span>:
                  <?php echo $last_ep - 1 < 0 ? 0 : $last_ep;// to get the order of last watched " not last allwoyd "?>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <?php
          if ($stmt->rowCount() > 0):?>
            <?php foreach($result as $index => $lesson):?>
              <div class="col-md-3 mb-4">
                <?php if ($index <= $last_ep ):?>
                  <a href="watch.php?eid=<?php echo $lesson['episode_id']?>">
                    <div class="card <?php if ($index + 1 == $last_ep) {echo 'border-primary';}?> card-shadow">
                      <span class="ep_number"><?php echo $index + 1;?></span>
                      <img class="card-img-top" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/uploads/images/<?php echo $lesson['episode_img'];?>" alt="">
                      <div class="card-body">
                        <p class="card-text"><?php echo $lesson['episode_name'];?></p>
                      </div>
                    </div>
                  </a>
                <?php else:?>
                  <div class="card card-shadow">
                    <span class="ep_number"><?php echo $index + 1;?></span>
                    <span class="lock"><i class="fa fa-lock" aria-hidden="true"></i></span>
                    <img class="card-img-top no-color" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/uploads/images/<?php echo $lesson['episode_img'];?>" alt="">
                    <div class="card-body">
                      <p class="card-text"><?php echo $lesson['episode_name']?></p>
                    </div>
                  </div>
                <?php endif;?>
              </div>
            <?php endforeach;?>
          <?php else:?>
            <div class="col-md-12">
              <div class="custom-alert custom-alert-danger mt-4 text-align">
                <div class="type"></div>
                <?php echo $LANG['THER_IS_NO_EPISODES'];?>
                <?php echo $LANG['BACK_TO'];?>
                <a href="home.php" class="btn btn-primary"><?php echo $LANG['HOME'];?></a>
              </div>
            </div>
          <?php endif;?>
      </div>
    </div>
  <?php
  include $inc . '/footer.php';
else:
  header("Location: index.php?form=signup&lp=lectures.php");
  exit();
endif;
?>