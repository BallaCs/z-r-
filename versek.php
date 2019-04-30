<?php require 'fejlec.php'; ?>
<?php require 'connect.php'; ?>
<div class="versek">
<div class="container">

    <h1>Versek</h1>
    <?php
        $sql = "SELECT cim, szoveg, utvonal, vers, datum, Post_ID, video, DATE_FORMAT(datum, '%Y-%m-%d') AS date FROM post WHERE vers = 1 ORDER BY `date` DESC, `Post_ID` DESC;";
        $result = $conn->query($sql);
        $resultCeck = mysqli_num_rows($result);
        if ($resultCeck > 0) {
            $i = 0;
            while($row = mysqli_fetch_assoc($result))
            {   
                echo '<div class="poszt">';
                if ($row['cim'] != NULL) {
                    echo   '<h2>' . $row['cim'] . '</h2>';
                }
                    ?>
                    <div class="row">
                        <div class="col-12 col-md-6 <?php if($i%2!=0){ echo 'order-2';} ?>">
                        <?php $utvonal = $row['utvonal'];
                            echo '<img src=' . $utvonal . '>'; ?>
                        </div>
                    
                   
                <?php
                if ($row['szoveg'] != NULL) { ?>
                    <div class="col-12 col-md-6" <?php if($i%2!=0){ echo 'style="text-align:right"';} ?>>
                    <?php echo   '<p>' . $row['szoveg'] . '</p>';
                    echo '</div>';
                }
                    echo '</div>';
                if ($row['video'] != NULL) {
                    $video = $row['video'];
                    echo '<div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item"  src="https://www.youtube.com/embed/' . $video . '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>';
                }

                if (isset($_SESSION['username'])){
                    echo '<div class ="row"><div class="col-6">
                    <a href="poszt-szerkesztes.php?id=' .$row['Post_ID'] .'"><i class="fas fa-edit"></i> Szerkesztés</a>';
                    echo '<a href="#" onclick="confirmTorles(\'poszt-torles.php?id=' .$row['Post_ID'] .'\')"><i class="fas fa-trash-alt"></i> Törlés</a></div>';
                    echo '<div class="col-6"><p class="date">' . $row['datum'] . '</p></div></div>';
                }else {
                    echo '<p class="date">' . $row['datum'] . '</p>';
                }
                
                echo '</div>';
                $i++;
            }
        }
    ?>
</div>
</div>
<?php $conn->close(); ?>
<script>
    $( document ).ready(function() {
      $("#versek").addClass("active");
    });
</script>
<?php require 'lablec.php'; ?>