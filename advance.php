<?php
session_start();
if (isset($_SESSION['user'])):
    $style = 'advance.css';
    include 'init.php';
    include $inc . '/header.php';
    if (isset($_GET['t']) && !empty($_GET['t']) && $_GET['t'] == 1):// t = team{ to see team members advance }
      
      $stmt = $con->prepare("SELECT * FROM $USERS_T us WHERE up_line = ?");
      $stmt->execute([$_SESSION['id']]);
      if ($stmt->rowCount() > 0):
        $members = $stmt->fetchAll(PDO::FETCH_ASSOC);?>
        <div class="container">
          <table class="table text-center">
            <thead class="thead-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">اسم العضو</th>
                <th scope="col">التواصل</th>
              </tr>
            </thead>
            <?php foreach($members as $i => $member):?>
              <tbody>
                <tr>
                  <th scope="row"><?php echo $i+1;?></th>
                  <td><a href="advance.php?m=<?php echo $member['id'];?>"><div class="btn btn-block btn-primary"><?php echo $member['username'];?></div></a></td>
                  <td><a href="https://wa.me/<?php echo $member['phone_number'];?>" class="btn btn-block btn-success"><?php echo $member['phone_number'];?></a></td>
                </tr>
              </tbody>
            <?php endforeach;?>
          </table>
        </div>
        

      <?php else:?>
        <div class="container">
          <div class="custom-alert text-align custom-alert-danger">
            لا يوجد أي اعضاء
            <span class="type"></span>
          </div>
        </div>
      <?php endif;?>
    <?php
    elseif (isset($_GET['m']) && !empty($_GET['m']) && is_numeric($_GET['m'])):
      $stmt = $con->prepare("SELECT up_line from $USERS_T WHERE id = ? LIMIT 1");
      $stmt->execute([intval($_GET['m'])]);
      if ($stmt->rowCount() > 0):
        $upline_id = $stmt->fetch(PDO::FETCH_NUM)[0];// setting upline id
        if ($upline_id == $_SESSION['id']):// check if user is upline
          $member_id    = intval($_GET['m']);// setting member id

          // ======= Get Info ====== //
          $member_info  = user_advance($member_id);// getting member info
          $history      = member_history($member_id);

          // ======== Some Constants ======= //
          $types = [
            'حلقة',
            'اختبار'
          ];
          // array of lectures names to use it on history table
          $lectures = getAll('episode_id, episode_name', $EPISODES_T, '', '', '');?>

          <div class="container">
            <div class="row">
              <div class="col-md-6">
                <div class="box">
                  <h4 class="title"><?php echo $LANG["DONE_TRAININGS"];?></h4>
                  <p class="advance-number"><?php echo $member_info['advance'] . ' / ' . $member_info['l_count'];?></p>
                  <div class="progress">
                    <div class="progress-bar w-0" role="progressbar" style="width: <?php echo $member_info['percent'] . '%';?>;" aria-valuenow="<?php echo $member_info['percent'];?>" aria-valuemin="0" aria-valuemax="100"><?php echo $member_info['percent'] == 0 ? '': $member_info['percent'] . '%';?></div>
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
                      <?php foreach($member_info['exams_hestory'] as $index => $exam):?>
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
            <hr>
            <div class="box">
              <table class="table">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">نوع الصفحة</th>
                    <th scope="col">اسم الصفحة</th>
                    <th scope="col">التاريخ</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach($history as $record):?>
                    <tr>
                      <td data-type="<?php echo $record['page_type'];?>"><?php echo $types[$record['page_type'] - 1];?></td>
                      <td><a href="./watch.php?eid=<?php echo $record['page_id'];?>"><?php echo $lectures[$record['page_id']]['episode_name'];?></a></td>
                      <td><?php echo $record['date'];?></td>
                    </tr>
                  <?php endforeach;?>
                </tbody>
              </table>
            </div>
          </div>
        <?php else:
          header("Location: advance.php?t=1");
          exit();
        endif;
      else:
        header("Location: advance.php?t=1");
        exit();
      endif;
    else:
      $self_info = user_advance($_SESSION['id']);
      ?>

      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="box">
              <h4 class="title"><?php echo $LANG["DONE_TRAININGS"];?></h4>
              <p class="advance-number"><?php echo $self_info['advance'] . ' / ' . $self_info['l_count'];?></p>
              <div class="progress">
                <div class="progress-bar w-0" role="progressbar" style="width: <?php echo $self_info['percent'] . '%';?>;" aria-valuenow="<?php echo $self_info['percent'];?>" aria-valuemin="0" aria-valuemax="100"><?php echo $self_info['percent'] == 0 ? '': $self_info['percent'] . '%';?></div>
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
                  <?php foreach($self_info['exams_hestory'] as $index => $exam):?>
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
    <?php endif;
    include $inc . '/footer.php';
else:
  header("Location: index.php");
  exit();
endif;
?>