<div class="fooldal">
    <div class="welcome">
        <h1>Hegedűs Gyöngyi honlapja</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-8">
                <div class="row">
                <?php
                    require 'connect.php';
                    $sql = "SELECT cim, Kep_ID, datum, Post_ID,DATE_FORMAT(datum, '%Y-%m-%d') AS date FROM post ORDER BY `date` DESC, `Post_ID` DESC;";
                    $result = $conn->query($sql);
                    $resultCeck = mysqli_num_rows($result);
                    if ($resultCeck > 0) {
                        while($row = mysqli_fetch_assoc($result))
                        {   
                            echo '<div class="col-6"><div class="post-preview">';

                            if (isset($_SESSION['username'])){
                                echo '<a href="poszt-szerkesztes.php?id=' .$row['Post_ID'] .'"><i class="fas fa-edit"></i> Szerkesztés</a>';
                                //echo '<a href="poszt-torles.php?id=' .$row['Post_ID'] .'"><i class="fas fa-trash-alt"></i> Törlés</a>';
                                echo '<a href="#" onclick="confirmTorles(\'poszt-torles.php?id=' .$row['Post_ID'] .'\')"><i class="fas fa-trash-alt"></i> Törlés</a>';
                            }  
                            echo '<a href="post.php?id=' . $row['Post_ID'] . '&cim=' . $row['cim'] . '">';
                            if ($row['Kep_ID'] != 0) {
                                $kep_id = $row['Kep_ID'];
                                $sql = "SELECT utvonal FROM kep WHERE Kep_ID = '$kep_id' ORDER BY Kep_ID DESC LIMIT 1;";
                                $result2 = mysqli_query($conn, $sql);
                                $row2 = mysqli_fetch_assoc($result2);
                                $utvonal = $row2['utvonal'];

                                echo '<img src=' . $utvonal . '>';
                            }
                            
                            if ($row['cim'] != NULL) {
                                echo   '<h2>' . $row['cim'] . '</h2>';
                            }
                            echo '<p class="date">' . $row['datum'] . '</p>';
                            
                            echo '</a></div></div>';
                        }
                    }
                ?>
                </div>
            </div>
            <div class="col-4 sidebar">
            <?php if (isset($_SESSION['username'])){ ?>
                <div class="container">
                    <div class="row justify-content-center">
                        <form action="link-feltolt.php?type=4" method="post">
                            <input class="col-12 url-sor" type="url" name="link" id="link" placeholder="Megosztani kívánt link:">
                            <button type="submit" name="submit" class="form-gomb col-12">Közzétesz</button>
                        </form>
                    </div>
                </div>
            <?php } ?>
            <div class="container">
        <h2>Cikkek rólam</h2>
        <div class="row">
            <?php 
            require 'connect.php';

            $sql = "SELECT link, Link_ID, link_kep, link_cim, link_text FROM linkmegoszt WHERE tipus=4 ORDER BY Link_ID DESC;";
            $result = $conn->query($sql);
            $resultCeck = mysqli_num_rows($result);
            if ($resultCeck > 0) {
                while($row = mysqli_fetch_assoc($result))
                {   
                    echo '<div class="col-6">';
                    if (isset($_SESSION['username'])){
                        echo '<a href="link-torles.php?id=' .$row['Link_ID'] .'&type=3"><i class="fas fa-trash-alt"></i> Törlés</a>';
                    } 
                    echo '<div class="row">';
                        echo '<div class="col-12">';
                             echo "<img src='" . $row['link_kep'] . "' alt='Preview image'>";
                        echo "</div>";
                        echo '<div class="col-12">';                     
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
        </div>
    </div>
</div>