<?php

    header("Access-Control-Allow-Origin:*");
    require_once "../actions/conexao.php";

    $result = query("SELECT * FROM produto");
    $produtos = array();

    while($row = mysqli_fetch_assoc($result)){
        $produtos[] = $row;
    }

    /*Json reconhece apenas UTF8, esta funcao converte tudo para UTF8.
    
    function utf8ize($d) {
        if (is_array($d)) {
            foreach ($d as $k => $v) {
                $d[$k] = utf8ize($v);
            }
        } else if (is_string ($d)) {
            return utf8_encode($d);
        }
        return $d;
    }

    echo json_encode(utf8ize($produtos));*/

    echo json_encode($produtos);
?>