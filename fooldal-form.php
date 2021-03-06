<?php
  if (isset($_SESSION['username'])){
    echo 
    '<div class="container">
      <form action="fooldal-form-feltolt.php" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <input type="text" class="form-control" name="cim" placeholder="Cím">
        </div>
        <div class="form-row align-items-center">
          <div class="col-6">
            <div class="custom-file">
                <input type="file" accept=".jpg,.jpeg,.png" class="custom-file-input" name="file">
                <label class="custom-file-label" for="file" data-browse="Tallózás...">Válassz képet</label>
            </div>
          </div>
          <div class="col-5">
            <input type="url" class="form-control" name="video" placeholder="Youtube video link">
          </div>
          <div class="col-1">
            <div class="checkbox">
              <label style="margin-bottom:0;"><input type="checkbox" name="vers"> Vers</label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <textarea class="form-control" rows="15" placeholder="Vers/Szöveg" name="szoveg"></textarea>
        </div>
        <div class="bootstrap-iso">
            <div class="form-group ">
              <div class="input-group">
                <input class="form-control" name="date" id="date" placeholder="YYYY-MM-DD" type="text"/>
              </div>
            </div>  
        </div>'
        ?>
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
      <?php
      echo
      '<button type="submit" name="submit" class="btn btn-primary">Közzétesz</button>
      </form>
    </div>';
  }
?>