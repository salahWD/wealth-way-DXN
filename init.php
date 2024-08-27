<?php

  // routed variabls

  $USERS_ADVANCED_T   = 'users_advanced';
  $EXAMS_DEGREES_T    = 'exams_degrees';
  $USERS_T            = 'users';
  $EPISODES_T         = 'episodes';
  $QUESTIONS_T        = 'questions';
  $ANSERS_T           = 'ansers';
  $SDPLAN_T           = 'sd_plan';
  $TBFG1              = '3x5_g1';
  $TBFG2              = '3x5_g2';
  $DAYLE_T            = 'dayle_tasks';
  $HISTORY_T          = 'user_history';

  $inc = './include';
  $webPath = '/wealth_way';
  // $webPath = '/';

  // defaults
  $defualt_id     = 1;

  // dxn ranks
  $RANKS = [
    'Member',
    'SA',
    'SD',
    'SR',
  ];

  include $inc . '/ar.php';
  include $inc . '/connect.php';
  include $inc . '/function.php';
  // $_SESSION['la'] has link auther id
  // get_link_auther_info() to get info and takes $info && $id
  $_SESSION['la'] = ther_is_link_auther();// returns link auther id
  $link_auther_info = get('dxn_id, phone_number, instagram, facebook', $USERS_T, "id = " . $_SESSION['la']);
  $_SESSION['info'] = $link_auther_info;
?>