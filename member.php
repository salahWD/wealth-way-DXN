<?php
  session_start();
  if (isset($_SESSION['user'])) {
    $style = 'mamber.css';
    include 'init.php';
      $actions = ['add', 'edit', 'delete'];
      $action = isset($_GET['action']) ? $_GET['action'] : 'error';
      if (!empty($action) && in_array($action, $actions)):
        if ($action == 'add'):// add page
          
          $default_rows_count = 8;// if action == add it checks to the members count to allow him or not
          if (members_count_sd($_SESSION['id'], $default_rows_count)):
            
            if ($_SERVER['REQUEST_METHOD'] == 'POST'):
              
              if (!isset($_POST['username']) || empty($_POST['username'])):
                $errors['name'] = 'true';
              else:
                $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
              endif;// proccecing the username

              if (!isset($_POST['number']) || empty($_POST['number'])):
                $errors['number'] = 'true';
              else:
                $number = filter_var($_POST['number'], FILTER_SANITIZE_NUMBER_INT);
              endif;// proccecing the phone number
              
              if (!isset($_POST['dxnId']) || empty($_POST['dxnId'])):
                $errors['dxnId'] = 'true';
              else:
                $dxnId = filter_var($_POST['dxnId'], FILTER_SANITIZE_NUMBER_INT);
              endif;// proccecing the dxn id
              
              if (!isset($_POST['cumulative']) || empty($_POST['cumulative'])):
                $errors['cumulative'] = 'true';
              else:
                $cumulative = filter_var($_POST['cumulative'], FILTER_SANITIZE_NUMBER_INT);
              endif;// proccecing the cumulative points
              
              if (!isset($_POST['rank']) || empty($_POST['rank'])):
                $errors['rank'] = 'true';
              else:
                $rank = filter_var($_POST['rank'] - 1, FILTER_SANITIZE_NUMBER_INT);
              endif;// proccecing the current rank
              
              if (empty($errors)):
                $stmt = $con->prepare("INSERT INTO $SDPLAN_T(username, number, dxn_id, current_cumulative, target_cumulative, current_rank, up_line, end_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                $stmt->execute([$username, $number, $dxnId, $cumulative, 4500, $rank, $_SESSION['id'], date('Y-m-j', (time() + (60 * 60 * 24 * 30 * 5)))]);
                header("Location: sd-plan.php");
                exit();
              endif;
              
            endif;// if isset post request
            include 'include/header.php';?>
            
          <div class="container">
            <form action="<?php echo $_SERVER['PHP_SELF'] . '?action=add';?>" method="POST" class="needs-validation">
              <div class="holder">
                <div class="label-container">
                  <label for="username" class="cap"><?php echo $LANG['NAME'];?></label>
                  <input type="text" name="username" id="username" placeholder="<?php echo $LANG['MEMBER_NAME'];?>" class="form-control <?php if (isset($errors['name'])) {echo 'is-invalid';}?>">
                  <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['MEMBER_NAME_IS_REQUIRE'];?></div>
                </div>
                <div class="label-container">
                  <label for="number" class="cap"><?php echo $LANG['PHONE_NUMBER'];?></label>
                  <input type="number" name="number" id="number" placeholder="<?php echo $LANG['PHONE_NUMBER_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['number'])) {echo 'is-invalid';}?>">
                  <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['PHONE_NUMBER_IS_REQUIRE'];?></div>
                </div>
                <div class="label-container">
                  <label for="dxnId" class="cap"><?php echo $LANG['DXN_ID'];?></label>
                  <input type="number" name="dxnId" id="dxnId" placeholder="<?php echo $LANG['DXN_ID_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['dxnId'])) {echo 'is-invalid';}?>">
                  <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['DXN_ID_IS_REQUIRE'];?></div>
                </div>
                <div class="label-container">
                  <label for="cumulative" class="cap"><?php echo $LANG['CURRENT_CUMULATIVE'];?></label>
                  <input type="number" name="cumulative" id="cumulative" placeholder="<?php echo $LANG['CURRENT_CUMULATIVE_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['cumulative'])) {echo 'is-invalid';}?>">
                  <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['CUMULATIVE_POINT_IS_REQUIRE'];?></div>
                </div>
                <div class="label-container">
                  <label for="rank" class="cap"><?php echo $LANG['CURRENT_RANK'];?></label>
                  <select name="rank" id="rank" class="form-control <?php if (isset($errors['rank'])) {echo 'is-invalid';}?>">
                  <?php foreach ($RANKS as $index => $rank):?>
                    <option value="<?php echo $index + 1?>"><?php echo $rank?></option>
                  <?php endforeach;?>
                  </select>
                  <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['CURRENT_RANK_IS_REQUIRE'];?></div>
                </div>
                <button type="submit" class="btn"><?php echo $LANG['SAVE'];?> <i class="fa fa-fw fa-save"></i></button>
              </div>
            </form>
          </div>
          <?php else:
            header("Location: " . $_SERVER['HTTP_REFERER']);
            exit();
          endif;?>
        <?php elseif ($action == 'edit'):// edit page
          
          if ($_SERVER['REQUEST_METHOD'] == 'POST'):
            $uid = isset($_POST['uid']) && !empty($_POST['uid']) && is_numeric($_POST['uid']) ? intval($_POST['uid']) : 'error';
            if ($uid != 'error'):
              if (SDhasAccess($_SESSION['id'], $uid)):
                if (!isset($_POST['username']) || empty($_POST['username'])):
                  $errors['name'] = 'true';
                else:
                  $username = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
                endif;// proccecing the username
  
                if (!isset($_POST['number']) || empty($_POST['number'])):
                  $errors['number'] = 'true';
                else:
                  $number = filter_var($_POST['number'], FILTER_SANITIZE_NUMBER_INT);
                endif;// proccecing the phone number
  
                if (!isset($_POST['dxnId']) || empty($_POST['dxnId'])):
                  $errors['dxnId'] = 'true';
                else:
                  $dxn_id = filter_var($_POST['dxnId'], FILTER_SANITIZE_NUMBER_INT);
                endif;// proccecing the dxn id
  
                if (!isset($_POST['cumulative']) || empty($_POST['cumulative'])):
                  $errors['cumulative'] = 'true';
                else:
                  $cumulative = filter_var($_POST['cumulative'], FILTER_SANITIZE_NUMBER_INT);
                endif;// proccecing the cumulative points
  
                if (!isset($_POST['target_cumulative']) || empty($_POST['target_cumulative'])):
                  $errors['target_cumulative'] = 'true';
                else:
                  $target_cumulative = filter_var($_POST['target_cumulative'], FILTER_SANITIZE_NUMBER_INT);
                endif;// proccecing the target cumulative points
  
                if (!isset($_POST['end_date']) || empty($_POST['end_date'])):
                  $errors['end_date'] = 'true';
                else:
                  $end_date = filter_var($_POST['end_date'], FILTER_SANITIZE_NUMBER_INT);
                endif;// proccecing the end date
  
                if (!isset($_POST['rank']) || empty($_POST['rank'])):
                  $errors['rank'] = 'true';
                else:
                  $rank = filter_var($_POST['rank'] - 1, FILTER_SANITIZE_NUMBER_INT);
                endif;// proccecing the current rank
  
                if (empty($errors)):
                  $stmt = $con->prepare("UPDATE $SDPLAN_T SET
                  username = ?, number = ?, dxn_id = ?, current_cumulative = ?, target_cumulative = ?, current_rank = ?, end_date = ? WHERE user_id = ?");
                  $stmt->execute([
                    $username, $number, $dxn_id, $cumulative, $target_cumulative, $rank, $end_date, $uid
                  ]);
                  header("Location: sd-plan.php");
                  exit();
                else:// if ther is errors
                  header("Location: sd-plan.php");
                  exit();
                endif;
              else:// if has no access
                header("Location: sd-plan.php");
                exit();
              endif;
            else:// if ther is no uid
              header("Location: sd-plan.php");
              exit();
            endif;
          endif;// if request method == post
          
        
          $uid = isset($_GET['uid']) && !empty($_GET['uid']) && is_numeric($_GET['uid']) ? intval($_GET['uid']) : 'error';
          if ($uid != 'error'):
            if (SDhasAccess($_SESSION['id'], $uid)):
              $stmt = $con->prepare("SELECT * FROM $SDPLAN_T WHERE user_id = ? LIMIT 1");
              $stmt->execute([$uid]);
              if ($stmt->rowCount() > 0):
                $data = $stmt->fetch(PDO::FETCH_ASSOC);
                include 'include/header.php';?>

                <div class="container">
                  <form action="<?php echo $_SERVER['PHP_SELF'] . '?action=edit&uid=' . $uid;?>" method="POST" class="needs-validation">
                    <input type="hidden" name="uid" value="<?php echo $uid?>">
                    <div class="holder">
                      <div class="label-container">
                        <label for="username" class="cap"><?php echo $LANG['NAME'];?></label>
                        <input type="text" name="username" id="username" placeholder="member name" class="form-control <?php if (isset($errors['name'])) {echo 'is-invalid';}?>" value="<?php echo $data['username']?>">
                        <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['MEMBER_NAME_IS_REQUIRE'];?></div>
                      </div>
                      <div class="label-container">
                        <label for="number" class="cap"><?php echo $LANG['PHONE_NUMBER'];?></label>
                        <input type="number" name="number" id="number" placeholder="<?php echo $LANG['PHONE_NUMBER_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['number'])) {echo 'is-invalid';}?>" value="<?php echo $data['number']?>">
                        <div class="invalid-feedback text-danger mb-1">phone number is require</div>
                      </div>
                      <div class="label-container">
                        <label for="dxnId" class="cap"><?php echo $LANG['DXN_ID'];?></label>
                        <input type="number" name="dxnId" id="dxnId" placeholder="<?php echo $LANG['DXN_ID_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['dxnId'])) {echo 'is-invalid';}?>" value="<?php echo $data['dxn_id']?>">
                        <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['DXN_ID_REQUIRE'];?></div>
                      </div>
                      <div class="label-container">
                        <label for="cumulative" class="cap"><?php echo $LANG['CURRENT_CUMULATIVE'];?></label>
                        <input type="number" name="cumulative" id="cumulative" placeholder="<?php echo $LANG['CURRENT_CUMULATIVE_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['cumulative'])) {echo 'is-invalid';}?>" value="<?php echo $data['current_cumulative']?>">
                        <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['CUMULATIVE_POINT_IS_REQUIRE'];?></div>
                      </div>
                      <div class="label-container">
                        <label for="target_cumulative" class="cap"><?php echo $LANG['TARGET_CUMULATIVE'];?></label>
                        <input type="number" name="target_cumulative" id="target_cumulative" placeholder="<?php echo $LANG['TARGET_CUMULATIVE_PLACEHOLDER'];?>" class="form-control <?php if (isset($errors['target_cumulative'])) {echo 'is-invalid';}?>" value="<?php echo $data['target_cumulative']?>">
                        <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['TARGET_CUMULATIVE_IS_REQUIRE'];?></div>
                      </div>
                      <div class="label-container">
                        <label for="end_date" class="cap"><?php echo $LANG['END_DATE'];?></label>
                        <input type="date" name="end_date" id="end_date" class="form-control <?php if (isset($errors['end_date'])) {echo 'is-invalid';}?>" value="<?php echo $data['end_date']?>">
                        <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['END_DATE_IS_REQUIRE'];?></div>
                      </div>
                      <div class="label-container">
                        <label for="rank" class="cap"><?php echo $LANG['CURRENT_RANK'];?></label>
                        <select name="rank" id="rank" class="form-control <?php if (isset($errors['rank'])) {echo 'is-invalid';}?>">
                        <?php foreach ($RANKS as $index => $rank):?>
                          <?php if ($index == $data['current_rank']):?>
                            <option value="<?php echo $index + 1;?>" selected><?php echo $rank;?></option>
                          <?php else:?>
                              <option value="<?php echo $index + 1;?>"><?php echo $rank?></option>
                          <?php endif;?>
                        <?php endforeach;?>
                        </select>
                        <div class="invalid-feedback text-danger mb-1"><?php echo $LANG['CURRENT_RANK_IS_REQUIRE'];?></div>
                      </div>
                      <button type="submit" class="btn"><?php echo $LANG['SAVE'];?> <i class="fa fa-fw fa-save"></i></button>
                    </div>
                  </form>
                </div>
                
              <?php
              else:
                header("Location: sd-plan.php");
                exit();
              endif;
            else:// if ther is no access
              header("Location: sd-plan.php");
              exit();
            endif;
          else:
            header("Location: sd-plan.php");
            exit();
          endif;// if uid == error
        ?>
        <?php elseif ($action == 'delete'):// delete page
          
          $uid = isset($_GET['uid']) && !empty($_GET['uid']) && is_numeric($_GET['uid']) ? intval($_GET['uid']) : 'error';
          if ($uid != 'error'):
            if (SDhasAccess($_SESSION['id'], $uid))://check if you have access on the deleting user
              $stmt = $con->prepare("DELETE FROM $SDPLAN_T WHERE user_id = ?");
              $stmt->execute([$uid]);
            else:// if dont have access
              header("Location: sd-plan.php");
              exit();
            endif;
            header("Location: sd-plan.php");
            exit();
          else:
            header("Location: sd-plan.php");
            exit();
          endif;
          ?>

        <?php endif;// if get action == add?>
      <?php else:
        header("Location: index.php");
        exit();?>
      <?php endif;// if get action isset and !empty and in array action?>
    <?php
    include 'include/footer.php';
  }else {
    header("Location: index.php");// if ther is no session user
    exit();
  }
?>