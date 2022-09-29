<?php

$pizzas = [
    "1" => [
        "name" => "Reine",
        "base" => "Tomate",
        "prix" => 10.90,
        "ingredient" => [
            "champi",
            "mozza",
            "jambon",
            "olive"
        ],
        "like" => 3
    ],
    "2" => [
        "name" => "4 fromage",
        "base" => "Tomate",
        "prix" => 10.90,
        "ingredient" => [
            "champi",
            "mozza",
            "gorgonzola",
            "emmental",
            "chevre",
            "olive"
        ],
        "like" => 5
    ]
]

?>

<!doctype html>
<html lang="en">
<head>
    <title>Pizza Gang</title>
</head>
<body>

<h1>Pizza Gang</h1>


<table border="1">
    <thead>
        <th>Nom</th>
        <th>Base</th>
        <th>Prix</th>
        <th>Ingredients</th>
        <th>Like</th>
    </thead>

    <?php

    foreach ($pizzas as $pizza) {
        echo "<tr>";
        echo "<td>".$pizza['name']."</td>";
        echo "<td>".$pizza['base']."</td>";
        echo "<td>".$pizza['prix']."</td>";
        echo "<td>";
        echo "<ul>";
        foreach ($pizza["ingredient"] as $value) {
            echo "<li>".$value."</li>";
        }
        echo "</ul>";
        echo "</td>";
        echo "<td>".$pizza['like']."</td>";

        echo "</tr>";

    }

    ?>
</table>


</body>
</html>



