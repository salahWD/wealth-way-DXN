<?php
  session_start();
  if (isset($_SESSION['user'])):
    header("Location: home.php");
    exit();
  else:
    $style = 'login.css';
    $loginPage = '';
    $pageTitle = 'login | baka train';
    include "init.php";
    if (isset($_COOKIE['registered'])) {// login from cookies
      $cookie_user = substr($_COOKIE['registered'], 0, strpos($_COOKIE['registered'], '%250%'));
      $cookie_pass = sha1(substr($_COOKIE['registered'], strpos($_COOKIE['registered'], '%250%') + 5));
      if (isFound($cookie_user, $cookie_pass) == true) {
        $id = isFound($cookie_user, $cookie_pass);

        $_SESSION['user'] = $cookie_user;
        $_SESSION['id']   = $id;

        $_SESSION['admin'] = isAdmin($id);
        $_SESSION['subscriber'] = isSubscriber($id);
      }
      header("Location: home.php");
      exit();
    }

    if (isset($_POST['login'])):// login
      $errors = array();
      $user = isset($_POST['username']) && !empty($_POST['username']) ? filter_var($_POST['username'], FILTER_SANITIZE_STRING) : 'error';
      if ($user == 'error') {
        $errors['user_error'] = 'invalid username or password';
      }
      
      $pass = isset($_POST['password']) && !empty($_POST['password']) ? sha1($_POST['password']): 'error';
      if ($pass == 'error') {
        $errors['user_error'] = 'invalid username or password';
      }

      if (isFound($user, $pass) == true && empty($errors)) {

        $id = isFound($user, $pass);

        $_SESSION['user'] = $user;
        $_SESSION['id']   = $id;
        
        $_SESSION['admin'] = isAdmin($id);
        $_SESSION['subscriber'] = isSubscriber($id);


        $remem  = isset($_POST['remember']) && !empty($_POST['remember']) ? true : false;
        if ($remem) {
          setcookie('registered', $user . '%250%' . $_POST['password'], time() + 2592000);
        }
        
        header("Location: home.php");
        exit();
      }else{
        $errors['user_error'] = 'invalid username or password';
      }
    endif;?>

    <?php
    if (isset($_POST['signup'])) {// signup

      $errors = array();

      $user = isset($_POST['username']) && !empty($_POST['username']) ? filter_var($_POST['username'], FILTER_SANITIZE_STRING): 'error';
      if ($user == 'error') {
        $errors['user_error'] = 'username is require';
      }

      $pass = isset($_POST['password']) && !empty($_POST['password']) ? sha1($_POST['password']): 'error';
      if ($pass == 'error') {
        $errors['pass_error'] = 'password is require';
      }

      $phone = isset($_POST['phone']) && !empty($_POST['phone']) && is_numeric($_POST['phone']) ? filter_var($_POST['phone'], FILTER_SANITIZE_NUMBER_INT) : 'error';
      if ($phone == 'error') {
        $errors['phone_error'] = 'phone number is require';
      }elseif (get('phone_number', $USERS_T, "phone_number = " . $phone) != false) {
        $errors['phone_error'] = 'this phone number was used before';
      }
      if (isFound($user, $pass)) {
        $errors['dubl_user'] = 'this username was used before';
      }
      
      if (empty($errors)) {
        
        $last_letter = $user[strlen($user) - 1];
        $number_slice = $phone[strlen($phone) - 3];$number_slice .= $phone[strlen($phone) - 2];
        $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        $token = $alphabet[rand(0, strlen($alphabet) - 1)] . floor($number_slice * 9954.5) . $alphabet[rand(0, strlen($alphabet) - 1)] . $last_letter . $alphabet[rand(0, strlen($alphabet) - 1)];

        if (isset($_SESSION['la']) && !empty($_SESSION['la']) && is_numeric($_SESSION['la'])):
          $link_auther_id = intval($_SESSION['la']);
        elseif (isset($_COOKIE['la']) && !empty($_COOKIE['la'])):
          $link_auther_id = link_auther_info('id', $_COOKIE['la']);
        endif;

        $stmt = $con->prepare("INSERT INTO $USERS_T (username, phone_number, token, up_line, password) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$user, $phone, $token, $link_auther_id, $pass]);

        $_SESSION['subscriber']   = 0;
        $_SESSION['user']         = $user;
        $_SESSION['id']           = isFound($user, $pass);
        $_SESSION['admin']        = 0;
        
        $stmt = $con->prepare("INSERT INTO $USERS_ADVANCED_T (user_id, last_ep) VALUES (?, ?)");
        $stmt->execute([$_SESSION['id'], 0]);

        $remem  = isset($_POST['remember']) && !empty($_POST['remember']) ? true : false;
        if ($remem) {
          setcookie('registered', $user . '%250%' . $_POST['password'], time() + 2592000);
        }
        if (isset($_GET['lp']) && !empty($_GET['lp'])) {// last page ( the page he coming from )
          header("Location: " . $_GET['lp']);
          exit();
        }
        header("Location: home.php");
        exit();
      }


    }?>
<?php
  include $inc . '/header.php';
  $lp = isset($_GET['lp']) && !empty($_GET['lp']) ? '&lp='.$_GET['lp'] : '';// last page to redirect
?>
<div class="container">
  <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card card-signin my-5">
        <div class="card-body">
          <?php if (isset($_GET['form']) && $_GET['form'] == 'signup') {?>
            <h4 class="card-title text-center"><?php echo $LANG['SIGNUP'];?></h4>
            <form class="form-signin" action="<?php echo $_SERVER["PHP_SELF"] . '?form=signup' . $lp;?>" method="POST">
              <div class="form-label-group mb-3">
                <label for="inputUsername"><?php echo $LANG['USERNAME'];?></label>
                <input
                    type="text"
                    name="username"
                    id="inputUsername"
                    class="form-control <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo 'is-invalid';}?> <?php if (isset($errors['dubl_user']) && !empty($errors['dubl_user'])) {echo 'is-invalid';}?>"
                    placeholder="<?php echo $LANG['USERNAME'];?>"
                    required autofocus>
                <div class="invalid-feedback">
                  <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo $errors['user_error'];}?>
                  <?php if (isset($errors['dubl_user']) && !empty($errors['dubl_user'])) {echo $errors['dubl_user'];}?>
                </div>
              </div>

              <div class="form-label-group mb-3">
                <label for="inputPhone"><?php echo $LANG['PHONE_NUMBER'];?></label>
                <input 
                type="number"
                name="phone"
                id="inputPhone"
                class="form-control <?php if (isset($errors['phone_error']) && !empty($errors['phone_error'])) {echo 'is-invalid';}?>"
                placeholder="<?php echo $LANG['PHONE_NUMBER_PLACEHOLDER'];?>"
                required>
                <div class="invalid-feedback">
                  <?php if (isset($errors['phone_error']) && !empty($errors['phone_error'])) {echo $errors['phone_error'];}?>
                </div>
              </div>
              
              <div class="form-label-group mb-3">
                <label for="inputPassword"><?php echo $LANG['PASSWORD'];?></label>
                <input
                    type="password"
                    name="password"
                    id="inputPassword"
                    class="form-control <?php if (isset($errors['pass_error']) && !empty($errors['pass_error'])) {echo 'is-invalid';}?>"
                    placeholder="<?php echo $LANG['ACCOUNT_PASSWORD'];?>"
                    required>
                <div class="invalid-feedback">
                  <?php if (isset($errors['pass_error']) && !empty($errors['pass_error'])) {echo $errors['pass_error'];}?>
                </div>
              </div>
              
              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" name="remember" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1"><?php echo $LANG['REMEMBER_ME'];?></label>
              </div>
              <button name="signup" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><?php echo $LANG['SIGNUP'];?></button>
              <hr class="my-4">
              <p class="text-center note">
                <span><?php echo $LANG['HAVE_AN_ACCOUNT_?'];?></span> <a href="index.php"><?php echo $LANG['LOGIN'];?></a>
              </p>
            </form>
          <?php }else {?>
            <h4 class="card-title text-center"><?php echo $LANG['LOGIN'];?></h4>
            <p class="text-danger text-center">
              <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo $errors['user_error'];}?>
            </p>
            <form class="form-signin" action="<?php echo $_SERVER["PHP_SELF"];?>" method="POST">

              <div class="form-label-group mb-3">
                <label for="inputUsername"><?php echo $LANG['USERNAME'];?></label>
                <input
                    type="text"
                    name="username"
                    id="inputUsername"
                    class="form-control"
                    placeholder="<?php echo $LANG['USERNAME'];?>"
                    required autofocus>
              </div>

              <div class="form-label-group mb-3">
                <label for="inputPassword"><?php echo $LANG['PASSWORD'];?></label>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="<?php echo $LANG['ACCOUNT_PASSWORD'];?>" required>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" name="remember" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1"><?php echo $LANG['REMEMBER_ME'];?></label>
              </div>
              <button name="login" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"><?php echo $LANG['LOGIN'];?></button>
              <hr class="my-4">
              <p class="text-center note">
                <span><?php echo $LANG['NOT_A_MEMBER_?'];?></span> <a href="index.php?form=signup"><?php echo $LANG['SIGNUP'];?></a>
              </p>
            </form>
          <?php }?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php endif;