<?php
session_start();
if ($_SESSION['admin'] == 1) {
  if (isset($_GET['action']) && $_GET['action'] == 'manage') {
    $style = 'lectures.css';
  }else {
    $style = 'admin.css';
  }
  include 'init.php';
  
    $actions = ['add', 'manage', 'edit', 'del'];
    $action = isset($_GET['action']) && in_array($_GET['action'], $actions) ? $_GET['action'] : $actions[0];
    if ($action == 'add') {// add page
      if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $e_name     = validate_str($_POST['e_name']);
        $errors = array();
        if (!isset($_POST['e_name']) || empty(validate_str($_POST['e_name']))) {
          $errors['name_error'] = 'is-invalid';
        }

        if (isset($_POST['e_link']) && !empty($_POST['e_link'])) {
          $e_link     = filter_var($_POST['e_link'], FILTER_SANITIZE_URL);
          $url        = parse_url($e_link, PHP_URL_QUERY);
          $url        = parse_str($url, $parametars);
          $url        = $parametars['v'];
          $url_err = 'mb-2';
        }else {
          $errors['url_error'] = 'this url is not valid';
        }

        if (isset($_FILES['e_img']) && !empty($_FILES['e_img'])) {
          if ($_FILES['e_img']['error'] == 4) {
            $noImg = 'no image selected';
          }else {

            $e_img      = $_FILES['e_img'];
            $accepts    = ['png', 'jpeg', 'jpg'];
            $img_ext    = pathinfo($e_img['name'], PATHINFO_EXTENSION);

            if ($e_img['size'] > 25165824) {$error['img_error'] = 'larger than 3MB';}
            if (!in_array($img_ext, $accepts)) {$errors['img_error'] = 'invalid image file';}
          }
        }

        if (count($errors) == 0) {
          
          $strChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
          $fileName = '';
          for ($i=0; $i < 15; $i++) {
            $rand = rand(0, strlen($strChars) - 1);
            if ($i == 9) {
              $fileName .= '.' . $e_img['name'][0];
            }
            $fileName .= $strChars[$rand];
          }
          $fileName = $fileName . '.' . $img_ext;
          move_uploaded_file($e_img['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . $webPath . '/uploads/images/' . $fileName);// uploading the image
          
          $count_of_ep = new_order();

          $stmt = $con->prepare("INSERT INTO $EPISODES_T (`order`, `episode_name`, `episode_link`, `episode_img`, `add_date`) VALUES (?, ?, ?, ?, NOW())");
          $stmt->execute([$count_of_ep, $e_name, $url, $fileName]);
          header("Location: manage-episode.php");
          exit();
        }
      }?>
      <?php include $inc . '/header.php';?>
      <div class="container">
        <div class="mb-3 cap col-md-12 text-center"><h1><?php echo $LANG['ADD_EPISODE'];?></h1></div>
        <div class="row">
          <div class="offset-md-2"></div>
          <div class="col-md-8">
            <div class="image-holder">
              <img class="img-flued inactive" id="image-review" alt="">
              <span class="icon text-center">?</span>
            </div>
            <form action="<?php echo $_SERVER['PHP_SELF'] . '?action=add'; ?>" method="post" enctype="multipart/form-data">
              <div class="form-row">
                <div class="col-md-6">
                  <input
                    type="text" name="e_name" placeholder="<?php echo $LANG['EPISODE_NAME'];?>" required data-validate="text"
                    class="form-control mb-2 <?php echo isset($errors['name_error']) ? 'is-invalid': '';?>"
                    value="<?php echo isset($e_name) ? $e_name: '';?>">
                  <div class="invalid-feedback text-align mb-2"><?php echo $LANG['NAME_CANT_BE_EMPTY'];?></div>
                </div>
                <div class="col-md-6 mb-2">
                  <input
                    type="file" data-name="e_img" id="uploaded-image" data-validate="image" placeholder="episode image" accept=".png, .jpg, .jpeg" required
                    class="form-control <?php echo isset($errors['img_error']) ? 'is-invalid': '';?>">
                  <div class="invalid-feedback mb-2">ther is an error in this file. <?php echo isset($errors['img_error']) ? $errors['img_error'] :'';?>!!</div>
                </div>
                <div class="col-md-6">
                  <input
                    type="url" name="e_link" placeholder="<?php echo $LANG['EPISODE_LINK'];?>" data-validate="text" required
                    class="form-control mb-2 <?php echo isset($errors['url_error']) ? 'is-invalid': '';?>"
                    value="<?php echo isset($e_link) ? $e_link: '';?>">
                  <div class="invalid-feedback text-align mb-2"><?php echo $LANG['EPISODE_LINK_CANT_BE_EMPTY'];?></div>
                </div>
              </div>
              <div class="row">
                <div class="offset-md-3"></div>
                <div class="col-md-6">
                  <button class="btn btn-block btn-primary cap" type="submit"><i class="fa fa-fw fa-plus"></i> <?php echo $LANG['ADD'];?></button>
                </div>
                <div class="offset-md-3"></div>
              </div>
            </form>
          </div>
          <div class="offset-md-2"></div>
        </div>
      </div>
    <?php
    }elseif ($action == 'manage') {
      include $inc . '/header.php';?>
        <div class="container">
          <h1 class="text-center mb-5"><?php echo $LANG['MANAGE_LECTURES'];?></h1>
        <?php if ($lectures = getEpisodes($_SESSION['id'])):?>
          <div class="row">
            <?php foreach ($lectures as $index => $lecture):?>
              <div class="col-md-3 mb-4">
              <a href="manage-episode.php?action=edit&e=<?php echo $lecture['episode_id']?>">
                <div class="card card-shadow">
                  <span class="ep_number"><?php echo $index + 1;?></span>
                  <img class="card-img-top" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/uploads/images/<?php echo $lecture['episode_img'];?>" alt="">
                  <div class="card-body">
                    <p class="card-text"><?php echo $lecture['episode_name'];?></p>
                  </div>
                </div>
              </a>
            </div>
            <?php endforeach;?>
          </div>
        </div>
      <?php else:?>
        <div class="container">
          <div class="custom-alert custom-alert-danger">
            <span class="type"></span>
            ther is no lectures
          </div>
        </div>
      <?php endif;
    }elseif ($action == 'edit') {// edit page
      if (isset($_POST['eid']) && !empty($_POST['eid']) && is_numeric($_POST['eid'])) {
        $eid        = intval($_POST['eid']);
        $errors     = array();
        
        if (isset($_POST['e_name']) && !empty($_POST['e_name'])) {
          $e_name = validate_str($_POST['e_name']);
        }

        if (isset($_POST['order']) && !empty($_POST['order']) && is_numeric($_POST['order'])) {
          $old_order = intval($_POST['order']);
        }

        if (isset($_POST['e_order']) && !empty($_POST['e_order']) && is_numeric($_POST['e_order'])) {

          $post_order = filter_var($_POST['e_order'], FILTER_SANITIZE_NUMBER_INT);

          $stmt = $con->prepare("SELECT ep.episode_id FROM $EPISODES_T ep WHERE ep.order = ?");
          $stmt->execute([$post_order]);

          if ($stmt->rowCount() > 0) {// if ther is an ep on the same order that's user selected
            if ($post_order < $old_order) {// if translate is from big to small
              
              $stmt = $con->prepare("UPDATE $EPISODES_T ep SET ep.order = ep.order + 1 WHERE ep.order >= ? AND ep.order < ?");
              $stmt->execute([$post_order, $old_order]);
            }else {// if translate is from small to big
              $stmt = $con->prepare("UPDATE $EPISODES_T ep SET ep.order = ep.order - 1 WHERE ep.order > ? AND ep.order <= ?");
              $stmt->execute([$old_order, $post_order]);
            }
            $e_order = $post_order;
          }else {
            $stmt = $con->prepare("SELECT COUNT(ep.episode_id) eps FROM $EPISODES_T");
            $stmt->execute();
            $last_ep = $stmt->fetch(PDO::FETCH_ASSOC)['eps'];
            $stmt = $con->prepare("UPDATE $EPISODES_T ep SET ep.order = ep.order - 1 WHERE ep.order > ?");
            $stmt->execute([$e_course, $old_order]);
            $e_order = intval($last_ep);
          }
        }

        if (isset($_POST['e_link']) && !empty($_POST['e_link'])) {
          $e_link     = filter_var($_POST['e_link'], FILTER_SANITIZE_URL);
          $url        = parse_url($e_link, PHP_URL_QUERY);
          $url        = parse_str($url, $parametars);
          $url        = $parametars['v'];
          $url_err = 'mb-2';
        }

        if (isset($_FILES['e_img']) && !empty($_FILES['e_img'])) {
          if ($e_img['error'] == 4) {
            $errors['img_error'] = 'ther is an error in the image';
          }else {
            $e_img      = $_FILES['e_img'];
            $accepts    = ['png', 'jpeg', 'jpg'];
            $img_ext    = pathinfo($e_img['name'], PATHINFO_EXTENSION);
            if ($e_img['size'] > 25165824) {$error['img_error'] = 'larger than 3MB';}
            if (!in_array($img_ext, $accepts)) {$errors['img_error'] = 'invalid image file';}
          }
        }

        if (isset($_POST['ansers']) && !empty($_POST['ansers'])):
          $quest_keys = array_keys($_POST['ansers']);
          if (isset($_POST['questions']) && !empty($_POST['questions'])):
            foreach ($_POST['questions'] as $index => $que):// que is array 0 offset has the question 1 has an id
              if (isset($que[1]) && !empty($que[1])):// if ther is question id
                if (isset($que[2]) && $que[2] == 'delete'):
                  $stmt = $con->prepare("DELETE FROM $QUESTIONS_T WHERE q_id = ?");
                  $stmt->execute([$que[1]]);
                else:
                  $stmt = $con->prepare("UPDATE $QUESTIONS_T SET question = ? WHERE q_id = ?");
                  $stmt->execute([$que[0], $que[1]]);
                  if (!empty($_POST['ansers'][$quest_keys[$index]])):// if ther is an ansers for this question
                    $ansers = $_POST['ansers'][$quest_keys[$index]];
                    // anser is array offset 0 has anser offset 1 is_right offset 2 has id
                    foreach ($ansers as $anser):// if ther is anser and is_right and id
                      if (isset($anser[1]) && isset($anser[2])):
                        if ($anser[1] == 'delete'):
                          $stmt = $con->prepare("DELETE FROM $ANSERS_T WHERE anser_id = ?");
                          $stmt->execute([$anser[2]]);
                        else:
                          $stmt = $con->prepare("UPDATE $ANSERS_T SET anser = ?, is_right = ? WHERE anser_id = ?");
                          $stmt->execute([$anser[0], $anser[1], $anser[2]]);
                        endif;
                      elseif (isset($anser[1])):// if ther is is_right
                        $stmt = $con->prepare("INSERT INTO $ANSERS_T (q_id, anser, is_right) VALUES (?, ?, ?)");
                        $stmt->execute([$que[1], $anser[0], $anser[1]]);
                      endif;
                    endforeach;
                  endif;
                endif;
              elseif (isset($que[0]) && !empty($que[0])):// if ther is the question text
                $stmt = $con->prepare("INSERT INTO $QUESTIONS_T(e_id, question) VALUES (?, ?)");
                $stmt->execute([$eid, $que[0]]);
                $ansers = $_POST['ansers'][$index];
                if (!empty($ansers)):
                  foreach ($ansers as $anser):
                    $stmt = $con->prepare("SELECT q.q_id FROM $QUESTIONS_T q WHERE q.e_id = ? AND q.question = ? LIMIT 1");
                    $stmt->execute([$eid, $que[0]]);
                    $quest_id = $stmt->fetch(PDO::FETCH_ASSOC)['q_id'];
                    if (isset($anser[1]) && !empty($anser[0])):
                      $stmt = $con->prepare("INSERT INTO $ANSERS_T (q_id, anser, is_right) VALUES (?, ?, ?)");
                      $stmt->execute([$quest_id, $anser[0], $anser[1]]);
                    endif;
                  endforeach;
                endif;
              endif;
            endforeach;
          endif;
        endif;

        if (empty($errors) && isset($e_name) && !empty($e_name) && isset($url) && !empty($url) && isset($e_order) && !empty($e_order)) {
          if (isset($e_img) && !empty($e_img)) {

            $strChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            $fileName = '';
            for ($i=0; $i < 15; $i++) {
              $rand = rand(0, strlen($strChars) - 1);
              if ($i == 9) {
                $fileName .= '.' . $e_img['name'][0];
              }
              $fileName .= $strChars[$rand];
            }
            $fileName = $fileName . '.' . $img_ext;
            move_uploaded_file($e_img['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . $webPath . '/uploads/images/' . $fileName);// uploading the image

            $sql = "UPDATE $EPISODES_T SET episode_name = ?, episode_link = ?, episode_img = ?, order = ?, add_date = NOW() WHERE episode_id = ?";
            $stmt = $con->prepare($sql);
            $stmt->execute([$e_name, $url, $fileName, $e_order, $eid]);

          }else {
            $sql = "UPDATE $EPISODES_T SET episode_name = ?, episode_link = ?, order = ?, add_date = NOW() WHERE episode_id = ?";
            $stmt = $con->prepare($sql);
            $stmt->execute([$e_name, $url, $e_order, $eid]);
          }
        }
        header("Location: manage-episode.php?action=manage");
        exit();
      }elseif (isset($_GET['e']) && !empty($_GET['e']) && is_numeric($_GET['e'])) {
        $eid = intval($_GET['e']);
      
        include $inc . '/header.php';
        $ep = get("*", $EPISODES_T, "episode_id = " . $eid);?>
      <div class="container">
        <div class="mb-3 cap col-md-12 text-center"><h1><?php echo $LANG['EDIT_EPISODE'];?></h1></div>
        <div class="row">
          <div class="image-holder">
            <img class="img-thumbnail" id="image-review" src="http://<?php echo $_SERVER['HTTP_HOST'] . $webPath;?>/uploads/images/<?php echo $ep['episode_img']?>" alt="">
          </div>
        </div>
        <div class="row">
          <div class="offset-md-2"></div>
          <form class="col-md-8" action="<?php echo $_SERVER['PHP_SELF'] . '?e=' . $eid . '&action=edit'; ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="order" value="<?php echo $ep['order']?>">
            <input type="hidden" name="eid" value="<?php echo $eid;?>">
            <div class="form-row">
              <div class="col-md-6">
                <input
                  type="text" name="e_name" data-validate="text" placeholder="episode name" required
                  class="form-control mb-2 <?php echo isset($errors['name_error']) ? 'is-invalid': '';?>"
                  value="<?php echo $ep['episode_name']?>">
                <div class="invalid-feedback mb-2">name can't be empty</div>
              </div>
              <div class="col-md-6">
                <input
                  type="file" data-name="e_img" id="uploaded-image" data-validate="image" placeholder="episode image" accept=".png, .jpg, .jpeg"
                  class="form-control <?php echo isset($errors['img_error']) ? 'is-invalid': '';?>">
                <div class="invalid-feedback mb-2">ther is an error in this file. <?php echo isset($errors['img_error']) ? $errors['img_error'] :'';?>!!</div>
              </div>
              <div class="col-md-6">
                <input
                  type="number" name="e_order" data-validate="order" data-max-value="999" placeholder="order in course" required
                  class="form-control mb-2 <?php echo isset($errors['order_error']) ? 'is-invalid': '';?>"
                  value="<?php echo $ep['order']?>">
                <div class="invalid-feedback mb-2">order can't be empty</div>
              </div>
              <div class="col-md-12">
                <input
                  type="url" name="e_link" placeholder="episode link (from youtube)" required
                  class="form-control mb-2 <?php echo isset($errors['url_error']) ? 'is-invalid': '';?>"
                  value="https://www.youtube.com/watch?v=<?php echo $ep['episode_link']?>">
                <div class="invalid-feedback mb-2"><?php if (isset($errors['url_error'])) {echo $errors['url_error'];}else {echo 'url can\'t be empty';}?></div>
              </div>
            </div>
            <button class="btn btn-success cap float-right" type="submit"><i class="fa fa-fw fa-save"></i> save changes</button>
            <a href="manage-episode.php?action=manage" class="btn btn-danger cap"><i class="far fa-fw fa-window-close"></i> cancel</a>
            <div class="clearfix"></div>
          </form>
          <div class="offset-md-2"></div>
        </div>

        <hr>

        <form action="http://<?php echo $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'] . "?action=edit&e=$eid"?>" method="POST">
          <input type="hidden" name="eid" value="<?php echo $eid;?>">
          <div class="container">
            <div class="row">
              <div class="col-md-2 mb-2">
                <button type="submit" class="btn btn-info cap"><i class="fa fa-fw fa-lg fa-save"></i> save</button>
              </div>
              <div class="col-md-2 mb-2">
                <div class="btn float-left btn-info addQuestion cap"><i class="fa fa-fw fa-lg fa-plus"></i> add question</div>
              </div>
            </div>
            <div class="row">
              <?php
                $stmt = $con->prepare("SELECT q.question, q.q_id, a.anser_id, a.anser, a.is_right FROM $QUESTIONS_T q LEFT JOIN ansers a ON a.q_id = q.q_id WHERE q.e_id = ?");
                $stmt->execute([$eid]);
                $exam_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if ($stmt->rowCount() > 0) {
                  $questions = array();
                  $question_id = array();
                  foreach ($exam_data as $getQuestion) {
                    array_push($questions, $getQuestion['question']);
                    array_push($question_id, $getQuestion['q_id']);
                  }
                  $questions = array_unique($questions);
                  $question_id = array_unique($question_id);
                  $id_keys = array_keys($question_id);
                  $i = 0;
                  foreach ($questions as $index => $data) {?>
                    <div class="col-md-4 mb-2">
                      <div class="card question-box">
                        <div class="card-header box-header text-center">
                          <span class="remove-btn big_close_btn">
                            <span class="cancel-btn-content"></span>
                            <span class="cancel-btn-content"></span>
                          </span>
                          <h3><?php echo $data?></h3>
                          <input type="hidden" class="form-control input-question" name="questions[<?php echo $i?>][0]" data-number="<?php echo $i?>" value="<?php echo $data?>">
                          <input type="hidden" name="questions[<?php echo $i?>][1]" value="<?php echo $question_id[$id_keys[$i]]?>">
                        </div>
                        <div class="card-body">
                          <button class="add-anser-btn btn btn-info mb-2 float-right">
                            <i class="fa fa-fw fa-lg fa-plus"></i> Anser
                          </button>
                          <?php
                            if (!empty($exam_data)) {
                              foreach ($exam_data as $anser_key => $anser) {
                                if ($anser['q_id'] == $question_id[$id_keys[$i]]) {?>
                                  <div class="anser-container">
                                    <input type="text" placeholder="anser <?php echo $index;?>" name="ansers[<?php echo $index;?>][<?php echo $anser_key?>][0]" class="form-control mb-2 anser-input" value="<?php echo $anser['anser'];?>">
                                    <input type="hidden" name="ansers[<?php echo $index;?>][<?php echo $anser_key?>][1]" value="<?php echo $anser['is_right'];?>">
                                    <input type="hidden" name="ansers[<?php echo $index;?>][<?php echo $anser_key?>][2]" value="<?php echo $anser['anser_id'];?>">
                                    <div class="options">
                                      <span class="anser-remove-btn">
                                        <span class="cancel-btn-content"></span>
                                        <span class="cancel-btn-content"></span>
                                      </span>
                                      <span class="is_right <?php if ($anser['is_right'] == 1) {echo 'bg-success';}else {echo 'bg-danger';}?>"></span>
                                    </div>
                                  </div>
                                <?php
                                }
                              }
                            }
                          ?>
                        </div>
                      </div>
                    </div>
                  <?php
                    $i++;
                  }
                }
              ?>
            </div>
          </div>
        </form>
      </div>
      <?php
      }else {
        header("Location: index.php");
        exit();
      }
    }elseif ($action == 'del') {
      $eid = isset($_GET['e']) && !empty($_GET['e']) && is_numeric($_GET['e']) ? $_GET['e']: 'error';
      $cid = isset($_GET['c']) && !empty($_GET['c']) && is_numeric($_GET['c']) ? $_GET['c']: 'error';
      if ($eid != 'error' && $cid != 'error') {
        $stmt = $con->prepare("DELETE FROM $EPISODES_T WHERE episode_id = ?");
        $stmt->execute([$eid]);
        header("Location: manage-course.php?c=$cid&action=edit");
        exit();
      }else {
        header("Location: index.php");
        exit();
      }
    }else {// if the action != anything of array actions
      header("Location: index.php");
      exit();
    }
    ?>
    </div>
  <?php
  include 'include/footer.php';
}else {// ther is no session user
  header("Location: index.php");
  exit();
}