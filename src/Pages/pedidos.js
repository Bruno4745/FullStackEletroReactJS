import { Form, Button, Container, Table } from 'react-bootstrap';
import { useEffect, useState } from 'react';
import Pedido from '../Componentes/Pedidos';

export default function Pedidos(){
    
    const [ pedidos, setPedidos ] = useState([]);

    useEffect(() => {
        async function fethData() {
            const url = "http://localhost/react/php/api/pedido.php";
            const resposta = await fetch(url);
            const resultado = await resposta.json();
            setPedidos(resultado);
        }
        fethData();
    }, [])

    const atualizaValorUnitario = () => {
        
    }

    const atualizaTotal = () => {
        const valor = document.getElementById("valor").value;
        const quantidade = document.getElementById("quantidade").value;
        const total = parseFloat(valor) * parseInt(quantidade);
        document.getElementById("valor_total").value = `R$ ${total}`;
    }

    const enviaPedido = async (evento) => {
        evento.preventDefault();

        const url = "http://localhost/react/php/api/pedido.php";
        const dados = new FormData(evento.target);   
        await fetch(url, {
            method: "POST",
            body: dados
        })
    }

    return(
        <Container>
            <Form onSubmit={enviaPedido} className="col-12 col-md-10 mx-auto my-5">
                <h1>Formulario de Compra</h1>
                <Form.Group>
                    <Form.Label>Nome</Form.Label>
                    <Form.Control id="nome" name="nome" className="mb-3" type="text" placeholder="Digite seu nome" required />
                </Form.Group>  
                <Form.Group>
                    <Form.Label>Endereco</Form.Label>
                    <Form.Control id="endereco" name="endereco" className="mb-3" type="text" placeholder="Digite seu endereco" required />
                </Form.Group>  
                <Form.Group>
                    <Form.Label>Telefone</Form.Label>
                    <Form.Control id="telefone" name="telefone" className="mb-3" type="text" placeholder="Digite seu telefone" required />
                </Form.Group>  
                <Form.Group>
                    <Form.Label>Produto</Form.Label>
                        <Form.Control onChange={atualizaValorUnitario} id="produto" name="produto" as="select">
                            <option></option>
                            <option>Fogão 5 Bocas Brastemp</option>
                            <option>Fogão Consul 4 bocas cor Inox</option>
                            <option>Geladeira Brastemp Frost Free Duplex 375 litros Inox</option>
                            <option>Geladeira Consul CRE44AK Frost Free Duplex</option>
                            <option>Geladeira Cycle Defrost Inox 475L Electrolux</option>
                            <option>Lava Louças 14 Serviços Brastemp</option>
                            <option>Lava Louças Electrolux 8 Servicos</option>
                            <option>Lavadoura de Roupas Electrolux Automática 13kg</option>
                            <option>Lavadoura de Roupas Samsung WD4000 Inox Look - 11kg</option>
                            <option>Micro-ondas Brastemp 38L com Grill Ative</option>
                            <option>Micro-ondas Electrolux MS37R</option>
                            <option>Micro-ondas Philco 26L</option>
                    </Form.Control>
                </Form.Group>
                <Form.Group>
                    <Form.Label>Valor Unitario</Form.Label>
                    <Form.Control onChange={atualizaTotal} id="valor" name="valor" className="mb-3" type="number" step="0.01" placeholder="Digite o valor unitario" required />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Quantidade</Form.Label>
                    <Form.Control onChange={atualizaTotal} id="quantidade" name="quantidade" className="mb-3" type="number" min="1" required />
                </Form.Group> 
                <Form.Group>
                    <Form.Label>Valor Total</Form.Label>
                    <Form.Control id="valor_total" name="valor_total" className="mb-3" type="text" readOnly />
                </Form.Group>
                <Form.Group>
                    <Button type="submit" variant="success">Enviar</Button>
                    {'  '}
                    <Button type="reset" variant="warning">Limpar</Button>
                </Form.Group>
            </Form>
            <h5>INNER JOIN com 4 tabelas (vendas, cliente, produto e pedidos)</h5>
            <Table striped bordered hover fluid>
                <thead>
                    <tr>
                        <th>IdVenda (vendas)</th>
                        <th>Nome (cliente)</th>
                        <th>Endereco (cliente)</th>
                        <th>Telefone (cliente)</th>
                        <th>Categoria (produto)</th>
                        <th>Produto (produto)</th>
                        <th>Valor (pedidos)</th>
                        <th>Quantidade (pedidos)</th>
                        <th>Total (pedidos)</th>
                    </tr>
                </thead>
                <tbody>
                    {pedidos && pedidos.map(item => <Pedido key={item.idvendas} id={item.idvendas} 
                    nome={item.nome_cliente} endereco={item.endereco} telefone={item.telefone} 
                    categoria={item.categoria} produto={item.descricao}
                    valor={item.valor_unit} quantidade={item.quantidade} total={item.valor_total} />)}
                </tbody>
            </Table>
        </Container>
    )
}