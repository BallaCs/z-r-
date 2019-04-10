<?php require 'fejlec.php'; ?>
<?php if (isset($_SESSION['username'])){ ?>
    <div class="container">
        <div class="row justify-content-center">
            <form action="link-feltolt.php?type=1" method="post">
                <input class="col-6 url-sor" type="url" name="link" id="link" placeholder="Megosztani kívánt link:">
                <button type="submit" name="submit" class="form-gomb col-5">Közzétesz</button>
            </form>
        </div>
    </div>
<?php } ?>
<div class=link-oldal>
    <div class="container">
        <h1>Képi lélegeztetés</h1>
        <div class="row">
            <?php 
            require 'connect.php';

            $sql = "SELECT link, Link_ID, link_kep, link_cim, link_text FROM linkmegoszt WHERE tipus=1 ORDER BY Link_ID DESC;";
            $result = $conn->query($sql);
            $resultCeck = mysqli_num_rows($result);
            if ($resultCeck > 0) {
                while($row = mysqli_fetch_assoc($result))
                {
                    echo '<div class="col-12 col-sm-6">';
                    if (isset($_SESSION['username'])){
                        //echo '<a href="link-torles.php?id=' .$row['Link_ID'] .'&type=1"><i class="fas fa-trash-alt"></i> Törlés</a>';
                        echo '<a href="#" onclick="confirmTorles(\'link-torles.php?id=' .$row['Link_ID'] .'&type=1\')"><i class="fas fa-trash-alt"></i> Törlés</a>';

                    } 
                    echo '<div class="row">';
                        echo '<div class="col-12 col-lg-6">';
                             echo "<img src='" . $row['link_kep'] . "' alt='Preview image'>";
                        echo "</div>";
                        echo '<div class="col-12 col-lg-6">';                     
                            echo "<h3>" . $row['link_cim'] . "</h3><p>" . $row['link_text'] . "</p>";
                            echo '<a href="'. $row['link'] .'">Tekintsd meg az eredeti oldalon!</a>';
                    echo "</div></div>";
                    echo '</div>';
                }
            }
            ?>
            <?php $conn->close(); ?>

        </div>
    </div>
</div>
<script>
    $( document ).ready(function() {
      $("#publikaciok").addClass("active");
    });
</script>
<?php require 'lablec.php'; ?>