<?php
include ("sambungan.php");

session_start();
$idpelajar = $_SESSION["username"];

date_default_timezone_set("Asia/Kuala Lumpur");
$tarikh = date('d/m/Y');

$sql = "select * from soalan order by idsoalan ASC";
$data = mysqli_query($sambungan, $sql);

while ($soalan = mysqli_fetch_array($data)) {
    $idsoalan = $soalan["idsoalan"];
    $jawapanpelajar = $_POST["idsoalan"];
    $sql = "insert into kuiz values('$idpelajar','$idsoalan','$tarikh','$jawapanpelajar',0)";
    $datakuiz = mysqli_query($sambungan, $sql);
    }
include ("jawab_ulangkaji.php");

?>