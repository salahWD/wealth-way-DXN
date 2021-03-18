<?php

  function getAll($select, $table, $join, $where = NULL, $order = NULL) {
    global $con;
    global $USERS_T;
    global $COURSES_T;
    global $USERS_ADVANCED_T;
    global $EPISODES_T;
    $join = $join == NULL ? '' : $join;
    $where = $where == NULL ? '' : 'WHERE ' . $where;
    $order = $order == NULL ? '' : "ORDER BY $order";
    $select = $con->prepare("SELECT $select FROM $table $join $where $order");
    $select->execute();
    $info = $select->fetchAll(PDO::FETCH_ASSOC);
    return $info;
  }

  function get($select, $table, $where = NULL) {
    global $con;
    $where = $where == NULL ? '' : 'WHERE ' . $where;
    $select = $con->prepare("SELECT $select FROM $table $where ");
    $select->execute();
    $info = $select->fetch(PDO::FETCH_ASSOC);
    return $info;
  }

  function isAdmin($useId) {
    global $con;
    global $USERS_T;
    $stmtAdmin = $con->prepare("SELECT groupId FROM $USERS_T WHERE Id = ?");
    $stmtAdmin->execute(array($useId));
    $fetchedAdmin = $stmtAdmin->fetch(PDO::FETCH_ASSOC);
    if ($fetchedAdmin['groupId'] == 3) {
      return 1;
    }else {
      return 0;
    }
  }

  function isSubscriber($uid) {
    global $con;
    global $USERS_T;

    $stmtSubscribe = $con->prepare("SELECT groupId FROM $USERS_T WHERE Id = ?");
    $stmtSubscribe->execute([$uid]);
    $fetchedSubscribe = $stmtSubscribe->fetch(PDO::FETCH_ASSOC);
    if ($fetchedSubscribe['groupId'] == 1) {
      return 1;
    }else {
      return 0;
    }
  }

  function isFound($user, $pass) {
    global $con;
    global $USERS_T;
    $found_init = $con->prepare("SELECT id FROM $USERS_T WHERE username = ? AND password = ?");
    $found_init->execute(array($user, $pass));
    $isFound = $found_init->rowCount();
    if ($isFound > 0) {
      return $found_init->fetch(PDO::FETCH_ASSOC)['id'];
    }else {
      return false;
    }
  }

  function subs_dxn_id($uid) {
    global $con;
    global $USERS_T;

    $stmt = $con->prepare("SELECT dxn_id FROM $USERS_T WHERE id = ? AND groupId >= 2");
    $stmt->execute([$uid]);

    if ($stmt->rowCount() > 0) {
      return $stmt->fetch(PDO::FETCH_ASSOC)['dxn_id'];
    }else {
      return false;
    }

  }

function is_allowyd_lecture($uid, $eid) {
  global $con;
  global $EPISODES_T;
  global $USERS_ADVANCED_T;
  $stmt = $con->prepare("SELECT ua.last_ep, ep.order FROM $EPISODES_T ep, $USERS_ADVANCED_T ua WHERE ua.user_id = ? AND ep.episode_id = ?");
  $stmt->execute([$uid, $eid]);
  $data = $stmt->fetch(PDO::FETCH_ASSOC);
  if ($stmt->rowCount() > 0) {
    if ($data['last_ep'] + 1 >= $data['order']) {
      return $data;
    }else {
      return false;
    }
  }else {
    return false;
  }
}

function last_ep($uid) {
  global $con;
  global $USERS_ADVANCED_T;
  $stmt = $con->prepare("SELECT last_ep FROM $USERS_ADVANCED_T WHERE user_id = ?");
  $stmt->execute([$uid]);
  if ($stmt->rowCount() > 0) {
    $result = $stmt->fetch(PDO::FETCH_NUM)[0];
    return $result;
  }else {
    return '0';
  }
}

function getEpisodes($uid) {
  global $con;
  global $COURSES_T;
  global $EPISODES_T;
  global $USERS_ADVANCED_T;
  $sql = "SELECT e.*, ua.last_ep FROM $EPISODES_T e JOIN $USERS_ADVANCED_T ua ON ua.user_id = ? ORDER BY e.order";
  $get_stmt = $con->prepare($sql);
  $get_stmt->execute([$uid]);
  if ($get_stmt->rowCount() > 0) {
    return $get_stmt->fetchAll(PDO::FETCH_ASSOC);
  }else {
    return false;
  }
}

function getEpisode($epId, $uid) {
  global $con;
  global $EPISODES_T;
  global $USERS_ADVANCED_T;
  $stmt = $con->prepare("SELECT ep.* FROM $EPISODES_T ep JOIN $USERS_ADVANCED_T ua ON ua.user_id = ? WHERE ep.episode_id = ? AND ua.last_ep +1 >= ep.order");
  $stmt->execute([$uid, $epId]);
  if ($stmt->rowCount() == 1) {
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }else {
    return false;
  }
}

function validate_str($validate) {

  $validate = filter_var($validate, FILTER_SANITIZE_SPECIAL_CHARS);

  return $validate;
}

function new_order() {
  global $con;
  global $EPISODES_T;
  $stmt = $con->prepare("SELECT COUNT(episode_id) + 1 FROM $EPISODES_T");
  $stmt->execute();
  $count_of_ep = $stmt->fetch(PDO::FETCH_NUM)[0];
  return $count_of_ep;
}

function SDhasAccess($access, $user) {

  global $con;
  global $SDPLAN_T;

  if (isAdmin($access)):
    return true;
  else:
    $stmt = $con->prepare("SELECT up_line FROM $SDPLAN_T WHERE user_id = ? LIMIT 1");
    $stmt->execute([$user]);
    if ($stmt->rowCount() > 0) {
      $upline = $stmt->fetch(PDO::FETCH_NUM)[0];
      if ($access == $upline) {
        return true;// if he is up line
      }else {
        return false;// if he is not up line
      }
    }else {
      return false;// if ther is no user [ member ]
    }
  endif;
}


// function TBFhasAccess($access, $user, $g = 1) {

//   global $con;
//   global $USERS_T;
//   global $TBFG1;
//   global $TBFG2;

//   if (isAdmin($access)):
//     return true;// if is admin
//   else:
//     if ($g == 1):
//       $stmt = $con->prepare("SELECT up_line FROM $TBFG1 WHERE user_id = ? LIMIT 1");
//       $stmt->execute([$user]);
//       if ($stmt->rowCount() > 0):
//         $upline = $stmt->fetch(PDO::FETCH_NUM)[0];
//         if ($access == $upline):
//           return true;// if he is up line
//         else:
//           return false;// if he is not up line
//         endif;
//       else:
//         return false;// if ther is no user member
//       endif;
//     elseif ($g == 0):
//       $stmt = $con->prepare("SELECT up_line FROM $TBFG2 WHERE user_id = ? LIMIT 1");
//       $stmt->execute([$user]);
//       if ($stmt->rowCount() > 0):
//         $upline = $stmt->fetch(PDO::FETCH_NUM)[0];
//         if ($access == $upline):
//           return true;// if he is up line
//         else:
//           return false;// if he is not up line
//         endif;
//       else:
//         return false;// if ther is no user member
//       endif;
//     endif;
//   endif;

// }


function members_count_sd($user_id, $member_count = 8) {

  global $con;
  global $SDPLAN_T;

  $stmt = $con->prepare("SELECT COUNT(user_id) AS members_count FROM $SDPLAN_T sd WHERE sd.up_line = ?");
  $stmt->execute([$user_id]);
  $count = $stmt->fetch(PDO::FETCH_ASSOC);

  if ($stmt->rowCount() > 0) {
    if ($count['members_count'] < $member_count) {
      return true;
    }else {
      return false;
    }
  }else {
    return false;
  }
}

?>