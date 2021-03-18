<?php
session_start();
if (isset($_SESSION['user'])) {
  include 'init.php';
  $eid    = isset($_GET['eid']) && !empty($_GET['eid']) && is_numeric($_GET['eid']) ? intval($_GET['eid']): 'error';
  if ($eid == 'error') {
    header("Location: index.php");
    exit();
  }else {
    if ($data = getEpisode($eid, $_SESSION['id'])) {
      include 'include/header.php';?>
      <div class="container">
        <div class="row">
          <h2 class="cap col-md-12 text-center mb-5"><?php echo $data['episode_name']?></h2>
          <div class="offset-md-1"></div>
          <div class="col-md-10">
            <div class="embed-responsive embed-responsive-16by9 video-shadow">
                <iframe
                  src="https://www.youtube-nocookie.com/embed/<?php echo $data['episode_link'];?>"
                  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                  allowfullscreen
                ></iframe>
            </div>
            <div class="buttons-holder">
              <form action="./exam.php" method="POST">
                <input type="hidden" name="exam" value="<?php echo $eid?>">
                <button class="btn btn-primary mt-3 float-right cap">
                  <?php echo $LANG['NEXT'];?> <i class="fas fa-arrow-right fa-fw"></i>
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    <?php
    }else {
      header("Location: index.php");
      exit();
    }
  }
  include 'include/footer.php';
}else {
  header("Location: index.php");
  exit();
}