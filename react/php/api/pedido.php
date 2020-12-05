<?php

    header("Access-Control-Allow-Origin:*");

    require_once "../actions/conexao.php";

    if($_SERVER['REQUEST_METHOD'] === 'GET'){

        $sql = "SELECT vendas.idvendas,
                       cliente.nome_cliente, cliente.endereco, cliente.telefone,
                       pedidos.quantidade, pedidos.valor_unit, pedidos.valor_total,
                       produto.categoria, produto.descricao
                FROM vendas 
                INNER JOIN cliente ON vendas.idcliente = cliente.idcliente
                INNER JOIN pedidos ON vendas.idpedidos = pedidos.idpedidos
                INNER JOIN produto ON vendas.idproduto = produto.idproduto;";
        $resultado = query($sql);
        $pedidos = [];

        while($row = mysqli_fetch_assoc($resultado)){
            $pedidos[] = $row;
        }

        echo json_encode($pedidos); 

    } else if($_SERVER['REQUEST_METHOD'] === 'POST'){
        
        $nome = $_POST['nome'];
        $endereco = $_POST['endereco'];
        $telefone = $_POST['telefone'];
        $produto = $_POST['produto'];
        $valor = floatval($_POST['valor']);
        $quantidade = intval($_POST['quantidade']);
        $valor_total = floatval($valor * $quantidade);

        $sql = "INSERT INTO cliente (nome_cliente, endereco, telefone)
                VALUES ('$nome', '$endereco' ,'$telefone');";
        nonquery($sql);

        $sql = "INSERT INTO pedidos (nome_produto, valor_unit, quantidade, valor_total)  
                VALUES ('$produto', $valor, $quantidade, $valor_total);";
        nonquery($sql);
    }
//Nao esta atualizando a tabela automaticamente com as informacoes novas do formulario
//pq nao consegui pegar o ultimo id de cada tabela (cliente, pedido e produto) para inserir na tabela VENDAS

?>