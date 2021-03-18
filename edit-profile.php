<?php
session_start();
if (isset($_SESSION['user'])) {
  $style = 'edit-profile.css';
  include 'init.php';

  if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $errors = array();

    $numSta = isset($_POST['number_start']) && !empty($_POST['number_start']) && is_numeric($_POST['number_start']) ? filter_var($_POST['number_start'], FILTER_SANITIZE_NUMBER_INT) : 'error';
    $user   = isset($_POST['username']) && !empty($_POST['username']) ? filter_var($_POST['username'], FILTER_SANITIZE_STRING) : 'error';
    $phone  = isset($_POST['phone']) && !empty($_POST['phone']) && is_numeric($_POST['phone']) ? filter_var($_POST['phone'], FILTER_SANITIZE_NUMBER_INT) : 'error';
    $dxnid  = isset($_POST['dxn']) && !empty($_POST['dxn']) && is_numeric($_POST['dxn']) ? filter_var($_POST['dxn'], FILTER_SANITIZE_NUMBER_INT) : 'error';

    if ($user == 'error') {
      $errors['user_error'] = 'INVALID_USERNAME';
    }
    if ($phone == 'error') {
      $errors['phone_error'] = 'INVALID_PHONE_NUMBER';
    }
    if ($dxnid == 'error') {
      $errors['dxn_error'] = 'INVALID_DXN_ID';
    }
    // if ($numSta == 'error') {
    //   $errors['number_start_error'] = 'invalid start phone number';
    // }
    
    if (empty($errors)) {
      if (isset($_POST['password']) && !empty($_POST['password'])) {
        $pass = sha1($_POST['password']);
        $stmt = $con->prepare("UPDATE $USERS_T AS u SET u.username = ?, u.phone_number = ?, u.dxn_id = ?, u.password = ? WHERE u.id = ?");
        $stmt->execute([$user, $phone, $dxnid, $pass, $_SESSION['id']]);
      }else {
        $stmt = $con->prepare("UPDATE $USERS_T AS u SET u.username = ?, u.phone_number = ?, u.dxn_id = ? WHERE u.id = ?");
        $stmt->execute([$user, $phone, $dxnid, $_SESSION['id']]);
      }
      $_SESSION['user'] = $user;
      header("Location: edit-profile.php");
      exit();
    }
  }
  include $inc . '/header.php';
  $data = get('phone_number, dxn_id, token', $USERS_T, "id = " . $_SESSION['id']);
  ?>
  <div class="container">
    <div class="row">
      <div class="offset-md-3"></div>
      <div class="col-md-6">
        <form class="needs-validation" method="POST" action="<?php echo $_SERVER['PHP_SELF'];?>" novalidate>
            <div class="mb-3 form-row">
              <label for="username"><?php echo $LANG['USERNAME'];?></label>
              <input
                type="text"
                class="form-control <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo 'is-invalid';}?>"
                name="username"
                id="username"
                placeholder="<?php echo $LANG['USERNAME'];?>"
                value="<?php echo $_SESSION['user'];?>"
                required>
              <div class="invalid-feedback text-danger"><?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo $LANG[$errors['user_error']];}?></div>
            </div>
            <div class="mb-3 form-row">
              <label for="phone"><?php echo $LANG['PHONE_NUMBER'];?></label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <select name="number_start" class="form-control form-control-sm" required>
                      <option value="1">+90</option>
                      <option value="2">+54</option>
                      <option value="3">+12</option>
                    </select>
                  </span>
                </div>
                <input
                    type="number"
                    class="form-control <?php if (isset($errors['phone_error']) && !empty($errors['phone_error'])) {echo 'is-invalid';}?>"
                    name="phone"
                    id="phone"
                    placeholder="<?php echo $LANG['PHONE_NUMBER_PLACEHOLDER'];?>"
                    value="<?php echo $data['phone_number'];?>"
                    required>
                <div class="invalid-feedback text-danger">
                  <?php echo $LANG['INVALID_PHONE_NUMBER'];?>
                </div>
              </div>
            </div>
            <div class="mb-3 form-row">
              <label for="dxn"><?php echo $LANG['DXN_ID'];?></label>
              <input
                type="number"
                class="form-control <?php if (isset($errors['dxn_error']) && !empty($errors['dxn_error'])) {echo 'is-invalid';}?>"
                id="dxn"
                name="dxn"
                placeholder="DXN id"
                value="<?php echo $data['dxn_id'];?>">
              <div class="invalid-feedback text-danger"><?php if (isset($errors['dxn_error']) && !empty($errors['dxn_error'])) {echo $LANG[$errors['dxn_error']];}?></div>
            </div>
            <div class="mb-3 form-row">
              <label for="pass"><?php echo $LANG['PASSWORD'];?></label>
              <input
                type="text"
                class="form-control"
                id="pass"
                name="password"
                placeholder="<?php echo $LANG['ACCOUNT_PASSWORD'];?>">
            </div>
            <?php if ($_SESSION['subscriber'] == true || $_SESSION['admin'] == true):?>
              <div class="mb-3 form-row">
                <label for="token"><?php echo $LANG['TOKEN'];?></label>
                <div class="input-group">
                  <input
                      type="text"
                      readonly="true"
                      class="form-control"
                      id="token"
                      value="www.healthway.com/introduction.php?p=<?php echo $data['token'];?>">
                  <button type="button" data-msg='<i class="far fa-fw fa-clone"></i> تم النسخ ' id="copyToken" class="copy btn btn-primary"><i class="far fa-fw fa-clone"></i><?php echo $LANG["COPY"];?></button>
                </div>
              </div>
            <?php endif;?>
          <button class="btn float btn-primary" type="submit"><i class="fa fa-edit fa-fw"></i> <?php echo $LANG['EDIT'];?></button>
          <div class="clearfix"></div>
        </form>
      </div>
    </div>
  </div>
  <?php
  include $inc . '/footer.php';
}else {
  header("Location: index.php");
  exit();
}