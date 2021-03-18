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
      }

      if (isFound($user, $pass)) {
        $errors['dubl_user'] = 'this username was used before';
      }
      
      if (empty($errors)) {
        
        $last_letter = $user[strlen($user) - 1];
        $number_slice = $phone[strlen($phone) - 3];$number_slice .= $phone[strlen($phone) - 2];
        $alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        $token = $alphabet[rand(0, strlen($alphabet) - 1)] . floor($number_slice * 9954.5) . $alphabet[rand(0, strlen($alphabet) - 1)] . $last_letter . $alphabet[rand(0, strlen($alphabet) - 1)];

        $stmt = $con->prepare("INSERT INTO $USERS_T (username, phone_number, token, password) VALUES (?, ?, ?, ?)");
        $stmt->execute([$user, $phone, $token, $pass]);

        $_SESSION['subscriber']   = 0;
        $_SESSION['user']         = $user;
        $_SESSION['id']           = isFound($user, $pass);
        $_SESSION['admin']        = 0;
        
        $stmt = $con->prepare("INSERT INTO $USERS_ADVANCED_T (user_id, last_ep) VALUES (?, ?)");
        $stmt->execute([$_SESSION['id'], 1]);

        $remem  = isset($_POST['remember']) && !empty($_POST['remember']) ? true : false;
        if ($remem) {
          setcookie('registered', $user . '%250%' . $_POST['password'], time() + 2592000);
        }
        header("Location: home.php");
        exit();
      }


    }?>
<?php include $inc . '/header.php';?>
<div class="container">
  <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card card-signin my-5">
        <div class="card-body">
          <?php if (isset($_GET['form']) && $_GET['form'] == 'signup') {?>
            <h4 class="card-title text-center">Sign up</h4>
            <form class="form-signin" action="<?php echo $_SERVER["PHP_SELF"] . '?form=signup';?>" method="POST">

              <div class="form-label-group mb-3">
                <label for="inputUsername">username</label>
                <input
                    type="text"
                    name="username"
                    id="inputUsername"
                    class="form-control <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo 'is-invalid';}?> <?php if (isset($errors['dubl_user']) && !empty($errors['dubl_user'])) {echo 'is-invalid';}?>"
                    placeholder="username"
                    required autofocus>
                <div class="invalid-feedback">
                  <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo $errors['user_error'];}?>
                  <?php if (isset($errors['dubl_user']) && !empty($errors['dubl_user'])) {echo $errors['dubl_user'];}?>
                </div>
              </div>

              <div class="form-label-group mb-3">
                <label for="inputPhone">phone number</label>
                <input 
                type="number"
                name="phone"
                id="inputPhone"
                class="form-control <?php if (isset($errors['phone_error']) && !empty($errors['phone_error'])) {echo 'is-invalid';}?>"
                placeholder="phone"
                required>
                <div class="invalid-feedback">
                  <?php if (isset($errors['phone_error']) && !empty($errors['phone_error'])) {echo $errors['phone_error'];}?>
                </div>
              </div>
              
              <div class="form-label-group mb-3">
                <label for="inputPassword">Password</label>
                <input
                    type="password"
                    name="password"
                    id="inputPassword"
                    class="form-control <?php if (isset($errors['pass_error']) && !empty($errors['pass_error'])) {echo 'is-invalid';}?>"
                    placeholder="Password"
                    required>
                <div class="invalid-feedback">
                  <?php if (isset($errors['pass_error']) && !empty($errors['pass_error'])) {echo $errors['pass_error'];}?>
                </div>
              </div>
              
              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" name="remember" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember me</label>
              </div>
              <button name="signup" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Signup</button>
              <hr class="my-4">
              <p class="text-center note">
                <span>have account ?</span> <a href="index.php">login now</a>
              </p>
            </form>
          <?php }else {?>
            <h4 class="card-title text-center">Login</h4>
            <p class="text-danger text-center">
              <?php if (isset($errors['user_error']) && !empty($errors['user_error'])) {echo $errors['user_error'];}?>
            </p>
            <form class="form-signin" action="<?php echo $_SERVER["PHP_SELF"];?>" method="POST">

              <div class="form-label-group mb-3">
                <label for="inputUsername">username</label>
                <input
                    type="text"
                    name="username"
                    id="inputUsername"
                    class="form-control"
                    placeholder="username"
                    required autofocus>
              </div>

              <div class="form-label-group mb-3">
                <label for="inputPassword">Password</label>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" name="remember" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember me</label>
              </div>
              <button name="login" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Login</button>
              <hr class="my-4">
              <p class="text-center note">
                <span>Not A Member ?</span> <a href="index.php?form=signup">sign up now</a>
              </p>
            </form>
          <?php }?>
        </div>
      </div>
    </div>
  </div>
</div>
<?php endif;