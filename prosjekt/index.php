<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<?php

//Tilkoblingsinformasjon:
$tjener = "localhost";
$brukernavn = "root";
$passord = "";
$database = "mydb";

//Opprette en kobling:
$kobling = new mysqli($tjener, $brukernavn, $passord, $database);

//Angi UTF-8 som tegnesett:
$kobling->set_charset("utf8");

//Sjekker om tilkobling virker:
if ($kobling->connect_error) {
    die("Noe gikk galt: " . $kobling->connect_error);
}

$sql = "SELECT * FROM produkt";
$resultat = $kobling->query($sql);
echo "Spørringen ga $resultat->num_rows rader.";

?>
</body>
</html>