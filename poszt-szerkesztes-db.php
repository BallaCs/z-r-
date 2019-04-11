<?php
require 'connect.php';
$id = $_GET['id']; 

if(isset($_POST['submit'])){
    if (!empty($_POST['cim'])) {
        $cim = mysqli_real_escape_string($conn, $_POST['cim']);
    } else {
        $cim = NULL;
    }

    if (!empty($_POST['vers'])) {
        $vers = true;
    } else {
        $vers = false;
    }
    
    if (!empty($_POST['szoveg'])) {
        $szoveg = mysqli_real_escape_string($conn, $_POST['szoveg']);
    } else {
        $szoveg = NULL;
    }

    if (!empty($_POST['video'])) {
        $video_array = explode('=', $_POST['video']);
        $video = mysqli_real_escape_string($conn, end($video_array));
    } else {
        $video = NULL;
    }

    if (!empty($_POST['date'])) {
        $date = mysqli_real_escape_string($conn, $_POST['date']);
    } else {
        $date = date("Y-m-d");
    }

    if ($_FILES["file"]["error"] == 0) {
        $file = $_FILES['file'];

        $fileName = $file['name'];
        $fileTmpName = $file['tmp_name'];
        $fileSize = $file['size'];
        $fileError = $file['error'];
        $fileType = $file['type'];

        $fileExt = explode('.', $fileName);
        $fileActualExt = strtolower(end($fileExt));

        $allowed = array('jpg','jpeg','png');

        if (in_array($fileActualExt, $allowed)) {
            if ($fileSize < 2097152) {
                $fileNameNew = uniqid('', true).".".$fileActualExt;
                $fileDestination = 'assets/kepek/'.$fileNameNew;
                move_uploaded_file($fileTmpName, $fileDestination);
            } else {
                echo "Túl nagy fájl méret (nagyobb mint 2mb)";
            }
        } else {
            echo "Nem megengedett fájl formátum!";
        }
        $utvonal = $fileDestination;
    }
        
        
        //post táblába feltöltés
        $sql = "UPDATE post SET cim='$cim', szoveg='$szoveg', vers='$vers', datum='$date', video='$video' WHERE Post_ID=". $id ."";
        mysqli_query($conn, $sql);
        if ($_FILES["file"]["error"] == 0) {
            $sql = "UPDATE post SET utvonal='$utvonal' WHERE Post_ID=". $id ."";
            mysqli_query($conn, $sql);
        }
    
    $conn->close();

    header("Location: index.php");
}
?>