<?php 
if(isset($_POST['submit']) && $_FILES["file"]["error"][0] != 4 && !empty($_POST['album'])){
    
    require 'connect.php';

    $album = $_POST['album'];
    //fájlok megszámlálása
    $countfiles = count($_FILES['file']['name']);

    $conn->close();
 //fájlokon végigmenni ciklussal
 for($i=0;$i<$countfiles;$i++){
 
     if ($_FILES["file"]["error"][$i] == 0) {
        //$file = $_FILES['file'][$i];

        $fileName = $_FILES['file']['name'][$i];
        $fileTmpName = $_FILES['file']['tmp_name'][$i];
        $fileSize = $_FILES['file']['size'][$i];
        $fileError = $_FILES['file']['error'][$i];
        $fileType = $_FILES['file']['type'][$i];

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
            echo 'átment';
            require 'connect.php';
            $sql = "SELECT Album_ID FROM album WHERE albumNev = '$album' ORDER BY Album_ID DESC LIMIT 1;";
            $result = mysqli_query($conn, $sql);
            $row = mysqli_fetch_assoc($result);
            $album_id = $row["Album_ID"];
        //képet kép táblába feltölteni
            $sql = "INSERT INTO kep (utvonal, Album_ID) VALUES ('$fileDestination', '$album_id');";
            mysqli_query($conn, $sql);
            $conn->close();
        } else {
            echo "Nem megengedett fájl formátum!";
        }
    }
 }
}else {
    echo 'kint';
    var_dump(isset($_POST['submit']));
    var_dump($_FILES["file"]["error"][0] == 0 );
    echo $_FILES["file"]["error"][0];
    var_dump(!empty($_POST['album']));
}
header("Location: galeria.php");

?>