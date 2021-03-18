<?php
session_start();
if (isset($_SESSION['user'])):
  $style = 'dayle-tasks.css';
  $pageName = 'dayleTasks';
  include 'init.php';
  if (isSubscriber($_SESSION['id']) || isAdmin($_SESSION['id'])):
    if ($_SERVER['REQUEST_METHOD'] == 'POST'):
      $columns = ['id', 'gethering', 'continueu', 'training', 'social_media'];
      if (isset($_POST['edit'])):
        foreach ($_POST['edit'] as $row):// fetch rows
          $query = "UPDATE $DAYLE_T SET ";
          $x = 0;
          $values = array();
          foreach ($row as $index => $value):// fetch cells
            if ($index != 0):
              if ($x > 0):// small trick to add , in socand time not from the first to make sql stmt valid
                $query .= ',';
              else:
                $x++;
              endif;
              if (!empty($value)):// checks and fillters
                $value = filter_var($value, FILTER_SANITIZE_STRING);// value of post cell
                $values[] = $value;
                $query .= " $columns[$index] = ?";// update date
              else:
                $query .= " $columns[$index] = NULL";// delete data
              endif;
            elseif ($index == 0):
              $id = intval($value);
            endif;
          endforeach;
          if (!empty($values)):// if he added some rows
            array_push($values, $id);// may get error if ther is no input hidden id
            $query .= " WHERE $columns[0] = ?";
            $stmt = $con->prepare($query);
            $stmt->execute(array_values($values));
          elseif (isset($id) && !empty($id)):// if he deleted some rows
            $query .= " WHERE $columns[0] = ?";
            $stmt = $con->prepare($query);
            $stmt->execute([$id]);// may get error if ther is no input hidden id
          endif;
        endforeach;

      endif;// if ther is a post[edit] array

      if (isset($_POST['add'])):
        $columns = ['user_id', 'gethering', 'continueu', 'training', 'social_media'];
        $query = "INSERT INTO $DAYLE_T ($columns[0], $columns[1], $columns[2], $columns[3], $columns[4]) VALUES ";
        $values = array();
        $x = 0;
        foreach ($_POST['add'] as $row):// loop on all rows

          if ($x > 0):
            $query .= ', ';// add , between row insert and socand row insert like [ insert into (?,?,?) , (?,?,?) ]
          else:
            $x++;
          endif;

          foreach($row as $index => $value):// loop on all cells 
            $value = filter_var($value, FILTER_SANITIZE_STRING);
            if ($index == 0):
              $query .= '(';
            else:
              $query .= ', ';
            endif;
            if ($index == 0):
              $query .= $_SESSION['id'] . " ,";
            endif;
            if (!empty($value)):
              $query .= '?';
              array_push($values, $value);
            else:
              $query .= ' NULL';
            endif;
            if ($index ==  count($row) - 1):
              $query .= ')';
            endif;
          endforeach;
        endforeach;
        $stmt = $con->prepare($query);
        $stmt->execute($values);
        header("Location: dayle-tasks.php");
        exit();
      endif;// if ther is a post[add] array

    endif;// if ther is a post request
    include $inc. '/header.php';
  ?>
  <div class="container">
    <div class="video-holder">
      <i class="fa fa-fw fa-4x fa-info-circle help" id="video-toggler"></i>
      <span class="vidoe-toggle"></span>
    </div>
    <div class="flex">
      <iframe class="video" style="display: none" src="https://www.youtube-nocookie.com/embed/N26hubY9ACA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    <h1 class="cap text-center mb-4"><?php echo $LANG['DAYLE_TASKS_TABLE'];?></h1>
    <form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST">
      <div class="table table-responsive table-striped table-body dayle-table">
        <div class="table-header table-row cap">
          <div class="table-cell bg-primary bold c-white" style="width: 30px;">#</div>
          <div class="table-cell bg-primary bold c-white"><?php echo $LANG['PROMOTION'];?></div>
          <div class="table-cell bg-primary bold c-white"><?php echo $LANG['FOLLOW_UP'];?></div>
          <div class="table-cell bg-primary bold c-white"><?php echo $LANG['TRAINING'];?></div>
          <div class="table-cell bg-primary bold c-white"><?php echo $LANG['SOCIAL_MEDIA'];?></div>
        </div>
        <?php
          $i = 1;
          $stmt = $con->prepare("SELECT * FROM $DAYLE_T WHERE user_id = ?");
          $stmt->execute([$_SESSION['id']]);
          if ($stmt->rowCount() > 0):?>
            <?php $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);?>
            <?php foreach ($tasks as $task):?>
              <div class="table-row">
                <div class="table-cell text-center id">
                  <?php echo $i;?>
                  <input type="hidden" class="id" data-name="edit[<?php echo $i?>][0]" value="<?php echo $task['id']?>">
                </div>
                <div class="table-cell p-0">
                  <textarea class="textarea form-control"  data-name="edit[<?php echo $i?>][1]" placeholder=""><?php echo $task['gethering']?></textarea>
                </div>
                <div class="table-cell p-0">
                  <textarea class="textarea form-control" data-name="edit[<?php echo $i?>][2]" placeholder=""><?php echo $task['continueu']?></textarea>
                </div>
                <div class="table-cell p-0">
                  <textarea class="textarea form-control" data-name="edit[<?php echo $i?>][3]" placeholder=""><?php echo $task['training']?></textarea>
                </div>
                <div class="table-cell p-0">
                  <textarea class="textarea form-control" data-name="edit[<?php echo $i?>][4]" placeholder=""><?php echo $task['social_media']?></textarea>
                </div>
              </div>
              <?php $i++;?>
            <?php endforeach;?>
          <?php endif;// if ther is row count?>
        <?php for (;$i <= 31;$i++):?>
          <div class="table-row">
            <div class="table-cell text-center id">
              <?php echo $i;?>
            </div>
            <div class="table-cell p-0">
              <textarea class="textarea form-control"  data-name="add[<?php echo $i?>][0]" placeholder=""></textarea>
            </div>
            <div class="table-cell p-0">
              <textarea class="textarea form-control" data-name="add[<?php echo $i?>][1]" placeholder=""></textarea>
            </div>
            <div class="table-cell p-0">
              <textarea class="textarea form-control" data-name="add[<?php echo $i?>][2]" placeholder=""></textarea>
            </div>
            <div class="table-cell p-0">
              <textarea class="textarea form-control" data-name="add[<?php echo $i?>][3]" placeholder=""></textarea>
            </div>
          </div>
        <?php endfor;?>
      </div>
      <button type="submit" class="btn float btn-success"><i class="fa fa-fw fa-save"></i> <?php echo $LANG['SAVE'];?></button>
      <div class="clearfix"></div>
    </form>
  </div>

  <?php
  include $inc . '/footer.php';

  else:// else if user is not subscriber
    header("Location: index.php");
    exit();
  endif;// end if user is not subscriber
else:// if ther is no session user
  header("Location: index.php");
  exit();
endif;
?>