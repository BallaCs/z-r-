<?php require 'fejlec.php'; ?>
<?php 
require 'connect.php';
$id = mysqli_real_escape_string($conn, $_GET['id']); 
$sql = "SELECT cim, szoveg, utvonal, datum, Post_ID, video, vers FROM post WHERE Post_ID = " .$id .";";
$result = $conn->query($sql);
$row = mysqli_fetch_assoc($result);

        $cim = $row['cim'];
        

            $utvonal = $row['utvonal'];


        $szoveg = $row['szoveg'];
        
        if ($row['video'] != NULL) {
            $video = $row['video'];
        }else {
            $video = NULL;
        }
        if ($row['vers'] != 0) {
            $vers = 'checked';
        }else{
            $vers = '';
        }
        $datum = $row['datum'];

        $conn->close();
?>
<div class="container">
  <form action="poszt-szerkesztes-db.php?id=<?php echo $id?>" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <input type="text" class="form-control" name="cim" placeholder="Cím" value="<?php echo $cim;?>">
    </div>
    <div class="form-row align-items-center">
      <div class="col-7">
        <div class="custom-file">
            <input type="file" accept=".jpg,.jpeg,.png" class="custom-file-input" name="file">
            <label class="custom-file-label" for="file" data-browse="Tallózás...">Csak ha új képet akarsz!</label>
        </div>
      </div>
      <div class="col-4">
        <input type="url" class="form-control" name="video" placeholder="Youtube video link" <?php if($video != NULL) echo 'value="https://www.youtube.com/watch?v='. $video .'"' ;?>>
      </div>
      <div class="col-1">
        <div class="checkbox">
          <label style="margin-bottom:0;"><input type="checkbox" name="vers" <?php echo $vers;?>> Vers</label>
        </div>
      </div>
    </div>
    <div class="form-group">
      <textarea class="form-control" rows="15" placeholder="Vers/Szöveg" name="szoveg"><?php echo $szoveg;?></textarea>
    </div>
    <div class="bootstrap-iso">
        <div class="form-group ">
          <div class="input-group">
            <input class="form-control" name="date" id="date" placeholder="YYYY-MM-DD" type="text" value="<?php echo $datum;?>"/>
          </div>
        </div>  
    </div>
    <script>
      $(document).ready(function(){
        var date_input=$('input[name="date"]');
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
          format: 'yyyy-mm-dd',
          container: container,
          todayHighlight: true,
          autoclose: true,
        })
      })
    </script>
  <button type="submit" name="submit" class="btn btn-primary">Módosít</button>
  </form>
</div>
<?php require 'lablec.php'; ?>