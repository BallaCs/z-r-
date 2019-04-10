<?php require 'fejlec.php'; ?>
<?php
if (isset($_GET['cim']) && isset($_GET['id'])) {
    $post_cim = $_GET['cim'];
    $post_id = $_GET['id'];
}else {
    header("Location: index.php");
}  
?>
<?php require 'connect.php'; ?>
<div class="single">
<div class="container">
    
    <?php
        $sql = "SELECT cim, szoveg, Kep_ID, datum, Post_ID, video FROM post WHERE Post_ID='$post_id';";
        $result = $conn->query($sql);
        $resultCeck = mysqli_num_rows($result);
        if ($resultCeck > 0) {
            while($row = mysqli_fetch_assoc($result))
            {   
                echo '<div class="single-post">';
                if ($row['cim'] != NULL) {
                    echo   '<h1>' . $row['cim'] . '</h1>';
                }
                echo '<div class="row">';
                echo '<div class="col-12 col-md-6">';
                if ($row['Kep_ID'] != 0) {
                    $kep_id = $row['Kep_ID'];
                    $sql = "SELECT utvonal FROM kep WHERE Kep_ID = '$kep_id' ORDER BY Kep_ID DESC LIMIT 1;";
                    $result2 = mysqli_query($conn, $sql);
                    $row2 = mysqli_fetch_assoc($result2);
                    $utvonal = $row2['utvonal'];

                    echo '<img src=' . $utvonal . '>';
                }
                echo '</div>';
                echo '<div class="col-12 col-md-6">';
                if ($row['szoveg'] != NULL) {
                    echo   '<p>' . $row['szoveg'] . '</p>';
                }
                echo '</div></div>';
                if ($row['video'] != NULL) {
                    $video = $row['video'];
                    echo '<div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item"  src="https://www.youtube.com/embed/' . $video . '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>';
                }

                if (isset($_SESSION['username'])){
                    echo '<div class ="row"><div class="col-6">
                                <a href="poszt-szerkesztes.php?id=' .$row['Post_ID'] .'"><i class="fas fa-edit"></i> Szerkesztés</a>';
                                //echo '<a href="poszt-torles.php?id=' .$row['Post_ID'] .'"><i class="fas fa-trash-alt"></i> Törlés</a></div>';
                    echo '<a href="#" onclick="confirmTorles(\'poszt-torles.php?id=' .$row['Post_ID'] .'\')"><i class="fas fa-trash-alt"></i> Törlés</a></div>';
                    echo '<div class="col-6"><p class="date">' . $row['datum'] . '</p></div></div>';
                }else {
                    echo '<p class="date">' . $row['datum'] . '</p>';
                }
 
                echo '</div>';
            }
        }
    ?>
    <?php $conn->close(); ?>
    <div class="row">
        <?php
            require 'connect.php';
            $sql = "SELECT cim, Kep_ID, datum, Post_ID,DATE_FORMAT(datum, '%Y-%m-%d') AS date FROM post WHERE Post_ID != '$post_id' ORDER BY `date` DESC, `Post_ID` DESC LIMIT 4;";
            $result = $conn->query($sql);
            $resultCeck = mysqli_num_rows($result);
            if ($resultCeck > 0) {
                while($row = mysqli_fetch_assoc($result))
                {   
                    echo '<div class="col-6 col-sm-4 col-md-3"><div class="post-preview">';
                        echo '<a href="single-post.php?id=' . $row['Post_ID'] . '&cim=' . $row['cim'] . '">';
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
    </div>  
<?php require 'lablec.php'; ?>