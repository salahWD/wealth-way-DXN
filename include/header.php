<!DOCTYPE html>
<html lang="<?php echo isset($_COOKIE['lang']) && !empty($_COOKIE['lang']) && $_COOKIE['lang'] == 'ar' ? 'ar': 'en';?>">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cash-control" content="no-cash" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/all.min.css" />
    <link rel="stylesheet" href="css/global.css" />
    <?php if (isset($getSliderScript)):?>
      <link rel="stylesheet" href="css/splide.min.css">
      <link rel="stylesheet" href="css/splide-core.min.css">
      <link rel="stylesheet" href="css/splide-default.min.css">
    <?php endif;?>
    <?php if (!isset($loginPage)):?>
      <link rel="stylesheet" href="css/navbar.css" />
    <?php endif;?>
    <?php if (isset($style)):?>
      <link rel="stylesheet" href="css/<?php echo $style;?>"/>
    <?php endif;?>
    <link rel="stylesheet" href="css/ar.css">
    <title><?php if (isset($pageTitle)) {echo $pageTitle;}else {echo 'Wealth Way';}?></title>
  </head>
  <body>
<?php if (!isset($loginPage)) {?>
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="bg-white">
    <div class="container">
      <a class="navbar-brand" href="home.php">
        <svg class="logo" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
          viewBox="0 0 319.24 146.48" style="enable-background:new 0 0 319.24 146.48;" xml:space="preserve">
          <style type="text/css">
            .st0{fill:url(#SVGID_1_);}
            .st1{fill:url(#SVGID_2_);}
            .st2{fill:url(#SVGID_3_);}
            .st3{fill:url(#SVGID_4_);}
            .st4{fill:url(#SVGID_5_);}
            .st5{fill:url(#SVGID_6_);}
            .st6{fill:url(#SVGID_7_);}
            .st7{fill:url(#SVGID_8_);}
          </style>
          <g>
            
              <linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="196.5397" y1="69.975" x2="230.8398" y2="148.7645" gradientTransform="matrix(1 0 0 -1 -148.0449 147.9041)">
              <stop  offset="0" style="stop-color:#888888"/>
              <stop  offset="1" style="stop-color:#DDDDDD"/>
            </linearGradient>
            <path class="st0" d="M66.8,84.89l-21.59,0c-3.87,0-7.6-1.78-9.85-5.01c-1.04-1.49-1.7-3.23-1.37-5.1
              c0.99-5.66,19.38-69.37,19.38-69.37s1.32-4.85,7.24-5.26C62.82,0,98.4-0.05,98.4,0.11c-0.01,4.11-17.79,60.36-23.69,78.9
              C73.59,82.52,70.4,84.89,66.8,84.89z"/>
            <linearGradient id="SVGID_2_" gradientUnits="userSpaceOnUse" x1="38.7328" y1="-0.053" x2="28.6205" y2="88.9358">
              <stop  offset="0" style="stop-color:#0083FD"/>
              <stop  offset="1" style="stop-color:#03E5FB"/>
            </linearGradient>
            <path class="st1" d="M39.28,0.01l-27.68,0c-3.97,0-7.8,1.78-10.1,5.01c-1.06,1.49-1.74,3.23-1.41,5.1
              c1.01,5.66,19.88,69.37,19.88,69.37s1.36,4.85,7.42,5.26c2.27,0.15,39.55,0.23,39.41,0.14c-0.21-0.14-1.85-1.88-2.99-5.12
              C57.35,61.32,39.28,0.01,39.28,0.01z"/>
            <linearGradient id="SVGID_3_" gradientUnits="userSpaceOnUse" x1="109.4308" y1="82.6335" x2="152.7128" y2="1.1884">
              <stop  offset="0" style="stop-color:#888888"/>
              <stop  offset="1" style="stop-color:#DDDDDD"/>
            </linearGradient>
            <path class="st2" d="M133.66,84.89l-21.59,0c-3.87,0,6.71,0-11.24,0c-2.83,0-0.31-8.24,0.02-10.11
              c0.99-5.66,19.38-69.37,19.38-69.37s1.32-4.85,7.24-5.26c2.21-0.15,37.79-0.2,37.79-0.04c-0.01,4.11-17.79,60.36-23.69,78.9
              C140.45,82.52,137.26,84.89,133.66,84.89z"/>
            
              <linearGradient id="SVGID_4_" gradientUnits="userSpaceOnUse" x1="359.5495" y1="67.9004" x2="342.745" y2="144.7599" gradientTransform="matrix(-1 0 0 -1 449.9106 147.9041)">
              <stop  offset="0" style="stop-color:#03E5FB"/>
              <stop  offset="1" style="stop-color:#0083FD"/>
            </linearGradient>
            <path class="st3" d="M93.88,84.89l21.59,0c3.87,0-3.27,0,14.68,0c1.18,0,4.69,0,4.69,0c-0.02,0.02-0.23-0.19-0.57-0.56
              c-3.75-4.04-6.47-8.92-8.02-14.22L107.31,5.41c0,0-1.32-4.85-7.24-5.26C97.87,0,62.28-0.05,62.28,0.11c0,0.12,2.8-0.43,5.44,8.41
              c6.32,21.17,16.33,64.47,18.25,70.49C87.09,82.52,90.28,84.89,93.88,84.89z"/>
            
              <linearGradient id="SVGID_5_" gradientUnits="userSpaceOnUse" x1="350.524" y1="8.3876" x2="384.8241" y2="87.1771" gradientTransform="matrix(1 0 0 -1 -148.0449 147.9041)">
              <stop  offset="0" style="stop-color:#888888"/>
              <stop  offset="1" style="stop-color:#DDDDDD"/>
            </linearGradient>
            <path class="st4" d="M220.79,146.48l-21.59,0c-3.87,0-7.6-1.78-9.85-5.01c-1.04-1.49-1.7-3.23-1.37-5.1
              C188.96,130.7,207.35,67,207.35,67s1.32-4.85,7.24-5.26c2.21-0.15,37.79-0.2,37.79-0.04c-0.01,4.11-17.79,60.36-23.69,78.9
              C227.58,144.11,224.39,146.48,220.79,146.48z"/>
            <linearGradient id="SVGID_6_" gradientUnits="userSpaceOnUse" x1="181.9366" y1="1.6391" x2="164.9134" y2="151.4431">
              <stop  offset="0" style="stop-color:#0083FD"/>
              <stop  offset="1" style="stop-color:#03E5FB"/>
            </linearGradient>
            <path class="st5" d="M172.11,141.04c0,0,1.36,4.85,7.42,5.26c2.27,0.15,39.55,0.23,39.41,0.14c-0.21-0.14-1.85-1.88-2.99-5.12
              c-4.57-13.03-40.47-135.81-40.47-135.81s-1.33-5.03-7.39-5.44c-2.27-0.15-39.58-0.05-39.44,0.04c0.21,0.14,1.85,1.88,2.99,5.12"/>
            <linearGradient id="SVGID_7_" gradientUnits="userSpaceOnUse" x1="263.4152" y1="144.2209" x2="306.6972" y2="62.7758">
              <stop  offset="0" style="stop-color:#888888"/>
              <stop  offset="1" style="stop-color:#DDDDDD"/>
            </linearGradient>
            <path class="st6" d="M287.64,146.48l-21.59,0c-3.87,0,6.71,0-11.24,0c-2.83,0-0.31-8.24,0.02-10.11
              C255.81,130.7,274.21,67,274.21,67s1.32-4.85,7.24-5.26c2.21-0.15,37.79-0.2,37.79-0.04c-0.01,4.11-17.79,60.36-23.69,78.9
              C294.43,144.11,291.24,146.48,287.64,146.48z"/>
            
              <linearGradient id="SVGID_8_" gradientUnits="userSpaceOnUse" x1="205.5651" y1="6.313" x2="188.7606" y2="83.1725" gradientTransform="matrix(-1 0 0 -1 449.9106 147.9041)">
              <stop  offset="0" style="stop-color:#03E5FB"/>
              <stop  offset="1" style="stop-color:#0083FD"/>
            </linearGradient>
            <path class="st7" d="M247.87,146.48l21.59,0c3.87,0-3.27,0,14.68,0c1.18,0,4.69,0,4.69,0c-0.02,0.02-0.23-0.19-0.57-0.56
              c-3.75-4.04-6.47-8.92-8.02-14.22L261.3,67c0,0-1.32-4.85-7.24-5.26c-2.21-0.15-37.79-0.2-37.79-0.04c0,0.12,2.8-0.43,5.44,8.41
              c6.32,21.17,16.33,64.47,18.25,70.49C241.08,144.11,244.27,146.48,247.87,146.48z"/>
          </g>
          <g>
            <path d="M34.67,199.37l-5.9-24.66h5.1l3.72,16.93l4.5-16.93h5.93l4.32,17.21l3.79-17.21h5.01l-6,24.66h-5.27l-4.91-18.44
              l-4.91,18.44H34.67z"/>
            <path d="M65.93,199.37v-24.66h18.29v4.16H70.91v5.46H83.3v4.18H70.91v6.7h13.78v4.16H65.93z"/>
            <path d="M113.4,199.37h-5.42l-2.14-5.61h-9.87l-2.02,5.61h-5.29l9.6-24.66h5.29L113.4,199.37z M104.22,189.59l-3.38-9.16
              l-3.35,9.16H104.22z"/>
            <path d="M118.42,199.37v-24.47h5v20.31h12.37v4.16H118.42z"/>
            <path d="M147.15,199.37v-20.5h-7.31v-4.16h19.59v4.16h-7.31v20.5H147.15z"/>
            <path d="M164.93,199.37v-24.66h4.98v9.7h9.75v-9.7h5v24.66h-5v-10.79h-9.75v10.79H164.93z"/>
            <path d="M209.96,199.37l-5.9-24.66h5.1l3.72,16.93l4.5-16.93h5.93l4.32,17.21l3.79-17.21h5.01l-6,24.66h-5.27l-4.91-18.44
              l-4.91,18.44H209.96z"/>
            <path d="M263.46,199.37h-5.42l-2.14-5.61h-9.87l-2.02,5.61h-5.29l9.6-24.66h5.29L263.46,199.37z M254.28,189.59l-3.38-9.16
              l-3.35,9.16H254.28z"/>
            <path d="M274.84,199.37v-10.38l-9.04-14.27h5.85l5.79,9.75l5.69-9.75h5.73l-9.06,14.31v10.35H274.84z"/>
          </g>
          <g>
            <path d="M54.25,239.68l-0.18,3.18c-0.64,0.16-1.17,0.3-1.57,0.41c-0.4,0.11-0.82,0.25-1.26,0.43c-0.75,0.26-1.63,0.68-2.64,1.25
              c-1.14,0.54-2.07,1.06-2.77,1.56c-0.7,0.5-1.48,1.16-2.33,2l-1.8-0.94l1.01-1.12l1.14-1.05c0.25-0.29,0.62-0.64,1.12-1.05
              c0.5-0.41,1.07-0.83,1.71-1.25c-0.86,0-1.73-0.1-2.6-0.31c-0.87-0.2-1.53-0.54-1.99-1.01c-0.07-0.04-0.12-0.18-0.13-0.42
              l-0.02-0.46c0-1.1,0.29-2.48,0.86-4.13c0.64-1.85,1.46-3.35,2.44-4.53c1.2-1.42,2.5-2.13,3.89-2.13c1.13,0,1.94,0.36,2.44,1.08
              c0.37,0.56,0.55,1.24,0.55,2.04l-0.04,0.57l-0.04,0.48c-0.19-0.15-0.45-0.3-0.77-0.45c-0.32-0.15-0.62-0.25-0.88-0.28h-0.13
              c-1.35,0-2.64,0.77-3.87,2.31c-0.97,1.23-1.45,2.15-1.45,2.75l0.86,0.48c1,0.47,1.88,0.78,2.66,0.95l1.3,0.15l1.23,0.07
              c0.54,0,1.08-0.04,1.62-0.13C53.12,240.03,53.68,239.88,54.25,239.68z"/>
            <path d="M68.57,248.51l-4.49,1.67l-2.09-31.42l4.49-1.65L68.57,248.51z"/>
            <path d="M90.61,247.89c0,0.98-0.12,1.88-0.37,2.68L89.71,252c-0.29,0.82-0.6,1.52-0.92,2.09c-0.51,0.95-1.19,1.9-2.02,2.86
              s-1.92,2.09-3.25,3.41c-1.17,1.14-1.96,1.87-2.35,2.18l-5.34-4.48c0.97-0.35,2.17-0.95,3.6-1.8c1.74-1.04,3.19-2.11,4.33-3.21
              s2.07-2.23,2.77-3.41c0.62-1,1.04-2.04,1.27-3.14c-0.04-0.35-0.2-0.9-0.46-1.65c-0.16-0.54-0.29-0.94-0.37-1.2
              s-0.24-0.65-0.46-1.18l-0.94-1.89l3.63-2.26l0.48,1.25c0.13,0.38,0.28,0.84,0.44,1.36s0.29,1,0.4,1.43v0.88l0.11-0.11V247.89z"/>
            <path d="M107.73,248.47H89.09v-4.92h15.67v-1.56v-0.99c0-0.37-0.04-0.69-0.11-0.97c-0.06-0.35-0.13-0.7-0.21-1.05
              c-0.08-0.35-0.18-0.69-0.3-1.01c-0.19-0.7-0.37-1.22-0.52-1.56l2.81-1.14l0.53,2.09c0.25,0.98,0.4,1.7,0.46,2.15l0.2,1.91
              l0.11,1.82V248.47z M97.99,225.83l-3.34,3.13l-3.24-3.13l3.25-3.31L97.99,225.83z M102.17,220.17l-3.19,3.37l-3.24-3.35l3.25-3.34
              L102.17,220.17z M106.49,225.83l-3.2,3.14l-3.3-3.13l3.23-3.33L106.49,225.83z"/>
            <path d="M122.89,248.47h-15.84v-4.92h10.96l-1.74-24.78l4.56-1.65L122.89,248.47z"/>
            <path d="M137.47,248.51l-4.49,1.67l-2.09-31.42l4.49-1.65L137.47,248.51z"/>
            <path d="M175.57,248.6c-0.48,0.15-1.6,0.33-3.35,0.55c-1.75,0.22-3.42,0.33-5,0.33l-1.78,0.07l-1.85,0.07
              c-1.9,0-3.35-0.16-4.33-0.48c-1.32-0.41-2.05-1.17-2.2-2.26v-1.01c0-1.43,0.37-2.91,1.1-4.42c0.56-1.17,1.11-2.04,1.67-2.59
              l0.13,0.11c-0.16,0.22-0.35,0.56-0.57,1.01c-0.24,0.56-0.35,1.01-0.35,1.36c0,0.26,0.09,0.57,0.26,0.92l0.57,0.84
              c0.44,0.39,1.15,0.7,2.13,0.91c0.98,0.21,2.49,0.32,4.53,0.32c1.82,0,3.2-0.1,4.14-0.3c0.95-0.2,1.46-0.4,1.55-0.6
              c0-1.25-0.12-2.31-0.35-3.19c-0.1-0.44-0.26-0.94-0.46-1.49s-0.46-1.17-0.77-1.85c-0.47-1.17-1.01-2.19-1.63-3.06
              c-0.44-0.63-1.16-1.49-2.17-2.59l3.43-3.8l0.26,1.05c0.34,1.06,0.7,1.96,1.08,2.7l1.67,3.56c0.56,1.16,1.04,2.56,1.45,4.22
              c0.56,2.23,0.84,3.65,0.84,4.26V248.6z"/>
            <path d="M197.98,248.47H174.3v-4.92h20.24l-0.02-0.65l-0.11-1.24l-0.35-1.34c-0.1-0.45-0.23-0.89-0.39-1.3
              c-0.31,0.18-0.7,0.37-1.17,0.57c-0.15,0.07-0.4,0.18-0.75,0.33c-0.64,0.26-1.3,0.39-1.98,0.39l-1.08-0.07
              c-0.29-0.04-0.66-0.14-1.1-0.29c-1.55-0.45-2.68-0.94-3.38-1.45c-0.57-0.42-0.97-0.91-1.19-1.45l-0.13-0.35l-0.11-0.48
              c0-0.82,0.19-1.94,0.57-3.36c0.16-0.62,0.32-1.17,0.47-1.67c0.15-0.5,0.32-0.96,0.49-1.38c0.51-1.2,1.11-2.14,1.78-2.81
              c0.85-0.81,1.82-1.21,2.92-1.21c1.22,0,2.45,0.69,3.69,2.07c1.08,1.22,2.01,2.74,2.79,4.57c0.64,1.38,1.22,3.16,1.74,5.36
              c0.23,1.04,0.42,2.03,0.55,2.96c0.13,0.93,0.2,1.76,0.2,2.49V248.47z M187.38,219.69l-3.2,3.23l-3.27-3.2l3.25-3.21L187.38,219.69z
              M193.35,237.41v-0.4c0-0.63-0.37-1.64-1.1-3.02c-0.79-1.53-1.58-2.48-2.35-2.84c-0.06-0.04-0.18-0.07-0.37-0.09h-0.31h-0.42
              c-0.35,0-0.72,0.06-1.1,0.18s-0.68,0.31-0.9,0.57c-0.16,0.19-0.34,0.5-0.54,0.93c-0.2,0.43-0.3,0.84-0.3,1.22
              c0,0.34,0.09,0.7,0.26,1.08c0.18,0.38,0.39,0.68,0.64,0.9c0.63,0.59,1.9,1.01,3.82,1.27L193.35,237.41z M195.83,219.66l-3.19,3.25
              l-3.24-3.19l3.23-3.2L195.83,219.66z"/>
            <path d="M214.84,248.47H196.2v-4.92h15.67v-1.43v-1.01c0-0.41-0.04-0.77-0.11-1.08c-0.21-0.82-0.41-1.52-0.6-2.09l-0.47-1.54
              l2.75-1.14l0.5,1.96c0.25,1.01,0.4,1.73,0.46,2.15c0.07,0.37,0.13,0.7,0.18,0.99c0,0.03,0.04,0.39,0.13,1.09s0.13,1.29,0.13,1.79
              V248.47z M205.63,257.43l-3.18,3.16l-3.15-3.16l3.15-3.19L205.63,257.43z M214.02,257.43l-3.26,3.17l-3.17-3.17l3.19-3.19
              L214.02,257.43z"/>
            <path d="M236.71,247.89c0,0.98-0.13,1.88-0.37,2.68l-0.53,1.43c-0.29,0.82-0.6,1.52-0.92,2.09c-0.51,0.95-1.19,1.9-2.02,2.86
              c-0.83,0.95-1.92,2.09-3.25,3.41c-1.17,1.14-1.96,1.87-2.35,2.18l-5.34-4.48c0.97-0.35,2.17-0.95,3.6-1.8
              c1.74-1.04,3.19-2.11,4.33-3.21s2.07-2.23,2.77-3.41c0.62-1,1.04-2.04,1.27-3.14c-0.04-0.35-0.2-0.9-0.46-1.65
              c-0.16-0.54-0.29-0.94-0.37-1.2s-0.24-0.65-0.46-1.18l-0.94-1.89l3.63-2.26l0.48,1.25c0.13,0.38,0.28,0.84,0.44,1.36
              s0.29,1,0.4,1.43v0.88l0.11-0.11V247.89z"/>
            <path d="M266.35,248.47h-31.13v-4.92l6.44-0.07c0.37-0.16,0.68-0.35,0.94-0.57c0.26-0.22,0.51-0.51,0.73-0.86
              c0.21-0.22,0.41-0.51,0.62-0.86l0.57-1.03l-1.38-21.4l4.34-1.65l0.26,3.39l0.28,4.33l0.19,2.61l0,0.68c0,1.1-0.1,2.36-0.29,3.78
              c-0.06,0.41-0.13,0.89-0.22,1.45s-0.18,1.07-0.29,1.54c-0.07,0.44-0.15,0.82-0.22,1.14c-0.01,0.1-0.04,0.23-0.09,0.37l0.59,0.04
              c0-0.13,0.48-0.67,1.43-1.6c1.14-1.13,2.35-2.08,3.63-2.86c1.71-1.03,3.3-1.54,4.75-1.54h0.35c2.31,0,4.21,1.38,5.69,4.15
              c1.05,2.04,1.84,4.75,2.35,8.15C266.2,244.86,266.35,246.77,266.35,248.47z M261.85,243.54c0-1.46-0.47-3.22-1.41-5.27
              c-0.72-1.58-1.6-2.58-2.64-3.01h-1.03c-1.19,0-2.76,0.66-4.72,1.98c-1.46,1-3,2.28-4.59,3.85c-1.39,1.36-2.09,2.18-2.09,2.46
              H261.85z"/>
          </g>
        </svg>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse justify-content-between navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto justify-content-between text-center pr-lg-3">
          <li class="nav-item<?php if (isset($pageName) && $pageName == 'home') {echo ' active';}?>">
            <a class="nav-link" href="home.php"><?php echo $LANG['HOME'];?> <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item<?php if (isset($pageName) && $pageName == 'lesson') {echo ' active';}?>">
            <a class="nav-link" href="lectures.php"><?php echo $LANG['LESSONS'];?></a>
          </li>
          <li class="nav-item<?php if (isset($pageName) && $pageName == 'sdTable') {echo ' active';}?>">
            <a class="nav-link" href="sd-plan.php"><?php echo $LANG['SD_TABLE'];?></a>
          </li>
          <li class="nav-item<?php if (isset($pageName) && $pageName == 'dayleTasks') {echo ' active';}?>">
            <a class="nav-link" href="dayle-tasks.php"><?php echo $LANG['DAYLE_TASKS'];?></a>
          </li>
          <li class="nav-item<?php if (isset($pageName) && $pageName == 'Products') {echo ' active';}?>">
            <a class="nav-link" href="products.php"><?php echo $LANG['PRODUCTS'];?></a>
          </li>
          <?php if (isset($_SESSION['user'])):?>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-fw fa-cog"></i> <?php echo $_SESSION['user']?>
              </a>
              <div class="dropdown-menu text-align" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="edit-profile.php"><i class="far fa-edit fa-fw"></i> <?php echo $LANG['PROFILE'];?></a>
                <a class="dropdown-item" href="advance.php"><i class="far fa-edit fa-fw"></i> <?php echo $LANG['PERSONAL_ADVANCE'];?></a>
                <a class="dropdown-item" href="advance.php?t=1"><i class="far fa-edit fa-fw"></i> <?php echo $LANG['TEAM_ADVANCE'];?></a>
                <?php if (isset($_SESSION['admin']) && $_SESSION['admin']) {?>
                  <div class="dropdown-divider"></div>
                  <a href="manage-episode.php" class="dropdown-item cap"><i class="fas fa-plus-circle fa-fw"></i> <?php echo $LANG['ADD_EPISODE'];?></a>
                  <a href="manage-episode.php?action=manage" class="dropdown-item cap"><i class="fas fa-plus-circle fa-fw"></i> <?php echo $LANG['MANAGE_LECTURES'];?></a>
                <?php }?>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="exit.php"><i class="fas fa-sign-out-alt fa-fw"></i> <?php echo $LANG['LOGOUT'];?></a>
              </div>
            </li>
          <?php endif;?>
        </ul>
        <ul class="nav justify-content-center pb-2 pt-1 pr-lg-3">
          <?php if(isset($_SESSION['info']['instagram']) && !empty($_SESSION['info']['instagram'])):?>
            <li class="nav-item">
              <a href="https://www.instagram.com/<?php echo $_SESSION['info']['instagram'];?>"><span class="social-icon instagram"><i class="fab fa-2x fa-fw fa-instagram"></i></span></a>
            </li>
          <?php endif;?>
          <?php if(isset($_SESSION['info']['phone_number']) && !empty($_SESSION['info']['phone_number'])):?>
            <li class="nav-item">
              <a href="https://wa.me/<?php echo $_SESSION['info']['phone_number'];?>"><span class="social-icon whatsapp"><i class="fab fa-2x fa-fw fa-whatsapp"></i></span></a>
            </li>
          <?php endif;?>
          <?php if(isset($_SESSION['info']['facebook']) && !empty($_SESSION['info']['facebook'])):?>
            <li class="nav-item">
              <a href="https://www.facebook.com/<?php echo $_SESSION['info']['facebook'];?>"><span class="social-icon facebook"><i class="fab fa-2x fa-fw fa-facebook"></i></span></a>
            </li>
          <?php endif;?>
        </ul>
      </div>
    </div>
  </div>
</nav>
<?php }?>