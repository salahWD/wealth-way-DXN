<?php
session_start();
if (isset($_SESSION['user'])) {
  if ($_SERVER["REQUEST_METHOD"] == 'POST') {

    $style = "exam.css";
    $pageName = 'lesson';
    include 'init.php';

    if (isset($_POST['exam']) && is_numeric($_POST['exam'])) {
      $eid  = intval($_POST['exam']);
      $data = is_allowyd_lecture($_SESSION['id'], $eid);
      if (!empty($data)) {// if ther is a questions
        $stmt = $con->prepare("SELECT q.question, q.q_id AS qId, a.anser_id, a.anser, a.is_right FROM $QUESTIONS_T q INNER JOIN ansers a ON a.q_id = q.q_id WHERE q.e_id = ?");
        $stmt->execute([$eid]);
        $exam = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($stmt->rowCount() > 0) {

          include $inc . '/header.php';
          $quest  = [];// all of questions
          $aId    = [];// ansers.question_id
          foreach ($exam as $add) {
            array_push($quest, $add['question']);// adding the questions to the array
            array_push($aId, $add['qId']);// adding the ansers id for each anser
          }
          $quest = array_unique($quest);// unique the array
          $qId = array_unique($aId);// unique the array
          $keys = array_keys($qId);// unique the array
          ?>
          <div class="container">
            <div class="row">
              <div class="offset-md-1"></div>
              <div class="col-md-10">
                <div class="card">
                  <div class="card-header text-center">
                    <h3 class="cap"><?php echo $LANG['EXAM'];?> <?php echo $data['order']?></h3>
                  </div>
                  <div class="card-body">
                    <form action="<?php echo $_SERVER['PHP_SELF'];?>" method="POST">
                      <input type="hidden" name="eid" value="<?php echo $eid;?>">
                      <?php
                      $i = 1;
                      $x = 0;
                      $y = 0;
                      $z = 0;
                      foreach ($quest as $q) {?>
                      <div class="quest-box">
                        <p class="lead question"><?php echo $q;?></p>
                        <div class="ansers-box">
                        <?php
                        foreach ($exam as $data) {
                          if ($data['qId'] == $qId[$keys[$y]]) {?>
                          <div class="anser">
                            <label for="anser<?php echo $i;?>"><?php echo $data['anser'];?></label>
                            <input
                              class="mr-4 <?php if ($data['is_right'] == 1) {echo 'right';}?>"
                              name="<?php echo $qId[$keys[$y]];?>"
                              type="radio"
                              value="<?php echo $data['anser_id'];?>"
                              id="anser<?php echo $i;?>">
                          </div>
                          <?php
                          }
                          $i++;
                          $z++;
                        }
                        $y++;
                        ?>
                        <hr>
                        </div>
                      </div>
                      <?php
                      }
                      ?>
                      <br>
                      <button class="btn btn-primary float cap" name="degree" id="btn-send"><i class="fa fa-fw fa-share"></i> <?php echo $LANG['DONE'];?></button>
                      <div class="clearfix"></div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
      <?php
        }else {// if ther is no [questions] or [ansers on question]
          if ($data['order'] == $data['last_ep'] - 1) {// if he was watching last ep this will redirect him to nex ep without exam
            $stmt = $con->prepare("SELECT COUNT(episode_id) FROM $EPISODES_T");
            $stmt->execute();
            $last_order = $stmt->fetch(PDO::FETCH_NUM)[0];
            $lastEp = $data['order'] + 1;// update last episode in DB
            if ($last_order > $lastEp) {
              $stmt = $con->prepare("UPDATE $USERS_ADVANCED_T ua SET ua.last_ep = ? WHERE ua.user_id = ?");
              $stmt->execute([$lastEp, $_SESSION['id']]);// updating the last ep
            }

            $stmt = $con->prepare("SELECT id FROM $EXAMS_DEGREES_T WHERE user_id = ? AND lecture_id = ?");
            $stmt->execute([$_SESSION['id'], $eid]);// updating the last ep
            if ($stmt->rowCount() > 0) {
              $record_id = $stmt->fetch(PDO::FETCH_NUM)[0];
              $stmt = $con->prepare("UPDATE $EXAMS_DEGREES_T SET user_id = ? WHERE id = ?");
              $stmt->execute([$_SESSION['id'], $record_id]);// updating the last ep
            }else {
              $stmt = $con->prepare("INSERT INTO $EXAMS_DEGREES_T (user_id, lecture_id) VALUES (?, ?)");
              $stmt->execute([$_SESSION['id'], $eid]);// updating the last ep
            }
          }else {// if he was not watching last ep and ther is no exam after lecture he watched
            $lastEp = $data['order'] + 1;// get the next ep
          }
          $stmt = $con->prepare("SELECT ep.episode_id FROM $EPISODES_T ep WHERE ep.order = ?");
          $stmt->execute([$lastEp]);// get id of next ep based on $lastEP
          if ($stmt->rowCount() > 0) {
            $to = $stmt->fetch(PDO::FETCH_NUM)[0];
            header("Location: watch.php?eid=$to");
            exit();
          }else {
            header("Location: lectures.php");
            exit();
          }
        }
      }else {
        header("Location: lectures.php");
        exit();
      }?>    
    <?php
    }else if (isset($_POST['degree'])) {// ther is a exam request
      if (isset($_POST['eid']) && !empty($_POST['eid']) && is_numeric($_POST['eid'])) {
        $stmt = $con->prepare("SELECT ep.order, ua.last_ep FROM $EPISODES_T ep, $USERS_ADVANCED_T ua WHERE ua.user_id = ? AND ep.episode_id = ?");
        $stmt->execute([$_SESSION['id'], $_POST['eid']]);
        $datacheck = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($stmt->rowCount() > 0) {
          if ($datacheck['last_ep'] + 1 >= $datacheck['order']) {
            include $inc . '/header.php';
            $stmt = $con->prepare("SELECT q.q_id, q.question, a.anser_id, a.anser FROM $QUESTIONS_T q INNER JOIN $ANSERS_T a ON a.q_id = q.q_id WHERE q.e_id = ? AND a.is_right = 1");
            $stmt->execute([$_POST['eid']]);
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($stmt->rowCount() > 0) {?>
            <div class="container">
              <div class="row">
                <div class="offset-md-1"></div>
                <div class="col-md-10">
                  <div class="card">
                    <div class="card-header text-center">
                      <h3 class="cap"><?php echo $LANG['EXAM'];?> <?php echo $datacheck['order'];?></h3>
                    </div>
                    <div class="card-body">
                      <form action="<?PHP echo $_SERVER['PHP_SELF']?>" method="POST">
                        <?php
                        $questions = 0;
                        $degree = 0;
                        foreach ($data as $DBanser) {
                          if (isset($_POST[$DBanser['q_id']]) && !empty($_POST[$DBanser['q_id']])) {
                            $questions++;
                            if ($DBanser['anser_id'] == $_POST[$DBanser['q_id']]) {// if database anser equal post anser?>
                              <div class="quest-box">
                              <div class="row">
                                <p class="lead question-height col-sm-4"><?php echo $DBanser['question']?></p>
                                <div class="alert mb-1 col-sm-6 alert-success"><?php echo $DBanser['anser']?></div>
                                <h5 class="text-success text-center anser-deg col-sm-2">+1</h5>
                              </div>
                              </div>
                            <?php
                            $degree++;
                            }else {// if the anser is fail?>
                              <div class="quest-box">
                              <div class="row">
                                <p class="lead question-height col-sm-4"><?php echo $DBanser['question']?></p>
                                <?php
                                $stmt = $con->prepare("SELECT anser FROM $ANSERS_T WHERE anser_id = ?");
                                $stmt->execute([$_POST[$DBanser['q_id']]]);
                                $anser = $stmt->fetch(PDO::FETCH_ASSOC);
                                ?>
                                <div class="alert mb-1 col-sm-6 alert-danger"><?php echo $anser['anser']?></div>
                                <h5 class="text-danger text-center anser-deg col-sm-2">0</h5>
                              </div>
                                
                              </div>
                            <?php
                            }
                            echo '<hr>';
                          }else {// if ther is no anser
                            $questions++;?>
                            <div class="quest-box alert alert-danger">
                              <p class="lead mb-1 question"><?php echo $DBanser['question']?></p>
                              <span><?php echo $LANG["THER_IS_NO_ANSERS"];?></span>
                            </div>
                          <?php
                          }
                        }?>
                        <br>

                        <?php
                        # updating or inserting into exams degrees table to save the exam info
                        $stmt = $con->prepare("SELECT id FROM $EXAMS_DEGREES_T ed WHERE user_id = ? AND lecture_id = ?");
                        $stmt->execute([$_SESSION['id'], intval($_POST['eid'])]);
                        if ($stmt->rowCount() > 0):// insert 
                          $id_of_record   = $stmt->fetch(PDO::FETCH_NUM)[0];
                          $is_success     = $degree     >= ($questions / 2) ? 1: 0;
                          $question_count = $questions  >= 1 ? $questions : 'NULL';
                          $right_ansers   = $degree;
                          $stmt = $con->prepare("UPDATE $EXAMS_DEGREES_T SET user_id = ?, lecture_id = ?, right_ansers = ?, questions_count = ?, is_success = ? WHERE id = ?");
                          $stmt->execute([$_SESSION['id'], intval($_POST['eid']), $degree, $questions, $is_success, $id_of_record]);
                        else:// update
                          $is_success     = $degree     >= ($questions / 2) ? 1: 0;
                          $question_count = $questions  >= 1 ? $questions : 'NULL';
                          $right_ansers   = $degree     >= 1 ? $degree : 'NULL';
                          $stmt = $con->prepare("INSERT INTO $EXAMS_DEGREES_T (user_id, lecture_id, right_ansers, questions_count, is_success) VALUES (?, ?, ?, ?, ?)");
                          $stmt->execute([$_SESSION['id'], intval($_POST['eid']), $degree, $questions, $is_success]);
                        endif;
                        ?>

                        <?php
                          if ($degree >= ($questions / 2)) {// if he is successed
                            $stmt = $con->prepare("UPDATE $USERS_ADVANCED_T ua SET ua.last_ep = ? WHERE ua.user_id = ?");
                            $lastEp = $datacheck['order'] + 1;// updating the last ep
                            $stmt->execute([$lastEp, $_SESSION['id']]);
                          ?>
                          <div class="row">
                            <div class="offset-md-1"></div>
                            <div class="col-md-2">
                              <h5 class="text-success text-center"><?php echo $LANG['SUCCESS'];?></h5>
                            </div>
                            <div class="col-md-2">
                              <h5 class="text-center">
                              <?php echo $LANG['PERCINT'];?>: <span class="text-success" id="examPercent"><?php echo (100 * ($degree / $questions));?>%</span>
                              </h5>
                            </div>
                            <div class="col-md-2">
                              <h5 class="text-center">
                                <?php echo $LANG['DEGREE'];?>: <span class="text-success"><?php echo $degree .' / ' . $questions;?></span>
                              </h5>
                            </div>
                            <div class="col-md-2 col-sm-6 text-center">
                              <a href="watch.php?eid=<?php echo $_POST['eid']?>" class="text-center btn btn-info"><i class="fas fa-fw fa-redo-alt"></i><b> <?php echo $LANG['RESTART'];?></b></a>
                            </div>
                            <div class="col-md-2 col-sm-6 text-center">
                            <?php
                              $stmt = $con->prepare("SELECT ep.episode_id FROM $EPISODES_T ep WHERE ep.order = ?");
                              $stmt->execute([$datacheck['order'] + 1]);
                              if ($stmt->rowCount() > 0) {?>
                                <a href="watch.php?eid=<?php echo $stmt->fetch(PDO::FETCH_NUM)[0];?>" class="text-center btn btn-success"><b><?php echo $LANG['NEXT'];?> </b><i class="fa fa-fw fa-arrow-right"></i></a>
                              <?php }?>
                            </div>
                          </div>
                          <?php
                          }else {// if he is failed?>
                            <div class="row">
                            <div class="offset-md-1"></div>
                            <h5 class="text-danger text-center col-md-2">
                              <?php echo $LANG['FAILED'];?>
                            </h5>
                            <h5 class="text-center col-md-2">
                            <?php echo $LANG['PERCINT'];?>: <span class="text-danger" id="examPercent"><?php echo (100 * ($degree / $questions));?>%</span>
                            </h5>
                            <h5 class="text-center col-md-2">
                            <?php echo $LANG['DEGREE'];?>: <span class="text-danger"><?php echo $degree .' / ' . $questions;?></span>
                            </h5>
                            <div class="col-md-2 col-sm-6">
                              <a href="watch.php?eid=<?php echo $_POST['eid'];?>" class="text-center btn btn-danger"><b><?php echo $LANG['RESTART'];?> </b><i class="fas fa-fw fa-redo-alt"></i></a>
                            </div>
                          </div>
                          <?php }?>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <?php

            }else {// if ther is no right ansers in all of the exam
              header("Location: index.php");
              exit();
            }
          }else {// if exam order is larger than last episode mean he is not allowyd to see it
            header("Location: lectures.php");
            exit();
          }
        }else {
          header("Location: index.php");
          exit();
        }
      }else {// if ther is no post episode id in post degree page
        header("Location: index.php");
        exit();
      }
    }else {// if ther is no post degree or post exam
      header("Location: index.php");
      exit();
    }
    include $inc . '/footer.php';
  }else {// ther is no post request
    header("Location: lectures.php");
    exit();
  }
}else {// if ther is no user session
  header("Location: index.php");
  exit();
}