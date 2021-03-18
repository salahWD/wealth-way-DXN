<?php
  session_start();
if (isset($_SESSION['user'])) {
  $style = 'sd-plan.css';
  $pageName = 'sdTable';
  include 'init.php';
  if (isSubscriber($_SESSION['id']) || isAdmin($_SESSION['id'])):
    include 'include/header.php';
    $default_rows_count = 8;
    ?>
    <div class="container">
    <?php
      $stmt = $con->prepare("SELECT * FROM $SDPLAN_T WHERE up_line = ?");
      $stmt->execute([$_SESSION['id']]);?>
      <h1 class="cap text-center"><?php echo $LANG['SD_PLAN'];?></h1>
      <?php if (members_count_sd($_SESSION['id'], $default_rows_count)):?>
        <a href="member.php?action=add" class="btn btn-primary mb-2 float cap"><i class="fa fa-fw fa-plus"></i> <?php echo $LANG['ADD'] . ' ' . $LANG['MEMBER'];?></a>
      <?php endif;?>

      <div class="table table-responsive table-striped table-body">
        <div class="table-header table-row cap">
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['NAME'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['DXN_ID'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['START_DATE'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['CURRENT_CUMULATIVE'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['TARGET_CUMULATIVE'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['DEFFERENCE'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['TARGET_RANK'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['END_DATE'];?></div>
          <div class="table-cell bg-primary c-white bold"><?php echo $LANG['CONTROL'];?></div>
        </div>
        <?php
        $i = 0;
        if ($stmt->rowCount() > 0):
          ?>
          <?php foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row):?>
            <div class="table-row content-row cap">
              <div class="table-cell"><a href="https://www.wa.me/<?php echo $row['number']?>" class="link"><?php echo $row['username'];?></a></div>
              <div class="table-cell"><?php echo $row['dxn_id'];?></div>
              <div class="table-cell"><?php echo $row['start_date'];?></div>
              <div class="table-cell"><?php echo $row['current_cumulative'];?></div>
              <div class="table-cell"><?php echo $row['target_cumulative'];?></div>
              <div class="table-cell"><?php echo ($row['target_cumulative'] - $row['current_cumulative']) >= 0 ? ($row['target_cumulative'] - $row['current_cumulative']) : '*****';?></div>
              <div class="table-cell"><?php echo $RANKS[$row['current_rank']];?></div>
              <div class="table-cell"><?php echo $row['end_date'];?></div>
              <div class="table-cell control">
                <a href="member.php?action=edit&uid=<?php echo $row['user_id']?>" class="btn btn-success btn-sm"><i class="fa fa-fw fa-edit"></i></a>
                <a href="member.php?action=delete&uid=<?php echo $row['user_id']?>" class="btn btn-danger btn-sm"><i class="fa fa-fw fa-trash"></i></a>
              </div>
            </div>
            <?php $i++;?>
          <?php endforeach;?> 
        <?php endif;// if ther is no result of sql statment?>
      <?php for ($i;$i < $default_rows_count;$i++):?>
        <div class="empty-row table-row cap">
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
          <div class="table-cell"></div>
        </div>
      <?php endfor;?>
      </div>
    </div>
  <?php
  else:
    header("Location: index.php");
    exit();
  endif;// end if user is not premum
  include 'include/footer.php';
}else {
  header("Location: index.php");
  exit();
}?>