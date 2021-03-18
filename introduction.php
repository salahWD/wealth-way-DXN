<?php
  session_start();
  if (isset($_SESSION['user'])) {
    $getSliderScript = '';// to get slider scripts and styles
    $style = 'intro.css';
    include "init.php";
    include 'include/header.php';
    ?>
    <h1 class="text-center cap mb-4"><?php echo $LANG['INTRODUCTION'];?></h1>
    <div class="container">
      <div class="col-md-12">
        <div id="image-slider" class="splide">
          <div class="splide__track">
            <ul class="splide__list">
              <li class="splide__slide">
                <iframe class="video" src="https://www.youtube-nocookie.com/embed/" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </li>
              <li class="splide__slide">
                <iframe class="video" src="https://www.youtube-nocookie.com/embed/" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  
  <?php
    include $inc . '/auther-contact.php';
    include "include/footer.php";
  }else {
    header("Location: index.php");
    exit();
  }
?>