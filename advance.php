<?php
session_start();
if (isset($_SESSION['user'])):
    $style = 'advance.css';
    include 'init.php';
    include $inc . '/header.php';
    $stmt = $con->prepare("SELECT COUNT(ep.episode_id) as all_lectures, ua.last_ep FROM $EPISODES_T ep, $USERS_ADVANCED_T ua WHERE ua.user_id = ?");
    $stmt->execute([$_SESSION['id']]);
    $trainings_advance = $stmt->fetch(PDO::FETCH_ASSOC);// fetching last_ep and all lectures count
    $percent = ($trainings_advance['last_ep'] / $trainings_advance['all_lectures']) * 100;// calcolation to get percent of advance
    $stmt = $con->prepare("SELECT ed.*, ep.episode_name as lecture_name FROM $EXAMS_DEGREES_T ed INNER JOIN $EPISODES_T ep ON ep.episode_id = ed.lecture_id WHERE user_id = ?");
    $stmt->execute([$_SESSION['id']]);
    $exams_hestory = $stmt->fetchAll(PDO::FETCH_ASSOC);// fetching
    ?>

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="box">
            <h4 class="title"><?php echo $LANG["DONE_TRAININGS"];?></h4>
            <p class="advance-number"><?php echo $trainings_advance['last_ep'] . ' / ' . $trainings_advance['all_lectures'];?></p>
            <div class="progress">
              <div class="progress-bar w-0" role="progressbar" style="width: <?php echo $percent . '%';?>;" aria-valuenow="<?php echo $percent;?>" aria-valuemin="0" aria-valuemax="100"><?php echo $percent == 0 ? '': $percent . '%';?></div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="box">
            <h4 class="title"><?php echo $LANG["EXAMS_LIST"];?></h4>
            
            <table class="table">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">#</th>
                  <th scope="col"><?php echo $LANG['LESSON_TITLE'];?></th>
                  <th scope="col"><?php echo $LANG['DEGREE'];?></th>
                  <th scope="col"><?php echo $LANG['PERCINT'];?></th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($exams_hestory as $index => $exam):?>
                  <tr>
                    <th scope="row"><?php echo $index + 1;?></th>
                    <td><?php echo $exam['lecture_name'];?></td>
                    <td><?php echo $exam['right_ansers'] != NULL && $exam['questions_count'] != NULL && $exam['questions_count'] > 0 ? $exam['right_ansers'] . ' / ' . $exam['questions_count'] : '--';?></td>
                    <td><?php echo $exam['right_ansers'] != NULL && $exam['questions_count'] != NULL && $exam['questions_count'] > 0 ? ($exam['right_ansers'] / $exam['questions_count']) * 100 . '%': '--';?></td>
                  </tr>
                <?php endforeach;?>
              </tbody>
            </table>

          </div>
        </div>
      </div>
    </div>
    
    <?php
    include $inc . '/footer.php';
else:
  header("Location: index.php");
  exit();
endif;
?>