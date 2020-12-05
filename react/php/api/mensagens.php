<?php

    header("Access-Control-Allow-Origin:*");

    require_once "../actions/conexao.php";

    if($_SERVER['REQUEST_METHOD'] === 'GET'){

        $sql = "SELECT * FROM comentario;";
        $resultado = query($sql);
        $comentarios = [];

        while($row = mysqli_fetch_assoc($resultado)){
            $comentarios[] = $row;
        }

        echo json_encode($comentarios); 

    } else if($_SERVER['REQUEST_METHOD'] === 'POST'){
        
        $nome = $_POST['nome'];
        $mensagem = $_POST['mensagem'];

        $sql = "INSERT INTO comentario (nome, mensagem) VALUES ('$nome', '$mensagem');";
            
        nonquery($sql);
    }

?>