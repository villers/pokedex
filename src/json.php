<?php
header('Content-Type: application/json');

$contents = file_get_contents("pokedex.json");
$contents = json_decode($contents);


foreach ($contents->objects as $key => $value) {
	unset($contents->objects[$key]->moves);
}

echo json_encode($contents);


 ?>