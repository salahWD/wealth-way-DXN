<?php
  session_start();
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
              <iframe class="video" src="https://www.youtube-nocookie.com/embed/QqNjGDgj6zA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </li>
            <li class="splide__slide">
              <iframe class="video" src="https://www.youtube-nocookie.com/embed/bPDq-bMmfSU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </li>
            <li class="splide__slide">
              <iframe class="video" src="https://www.youtube-nocookie.com/embed/PjCK4o5v6gQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </li>
            <li class="splide__slide">
              <iframe class="video" src="https://www.youtube-nocookie.com/embed/H4W2-ptglxI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </li>
            <li class="splide__slide">
              <iframe class="video" src="https://www.youtube-nocookie.com/embed/-yL601nd02Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

<?php
  include $inc . '/auther-contact.php';
  include "include/footer.php";
?>