import { useEffect, useState } from 'react';
import { Jumbotron, Container, Form, Button, Table } from 'react-bootstrap';
import ImgWhats from './imagens/whatsapp.png';
import ImgEmail from './imagens/email.png';
import Comentarios from '../Componentes/Comentarios'

export default function Contato() {

    const [comentarios, setComentarios] = useState([]);

    const enviaMensagem = async (evento) => {
        evento.preventDefault();

        const url = "http://localhost/react/php/api/mensagens.php";
        const dados = new FormData(evento.target);
        await fetch(url, {
            method: "POST",
            body: dados
        }); 
    }

    useEffect(() => {
        async function fethData() {
            const url = "http://localhost/react/php/api/mensagens.php";
            const resposta = await fetch(url);
            const resultado = await resposta.json();
            setComentarios(resultado);
        }
        fethData();
    }, []);

    return(
        <Container>
            <Jumbotron className="bg-white pb-2">
                <h1>Contato</h1>
                <hr className="my-4"/>
                <div className="row text-center my-5">
                    <div className="col col-12 col-sm-6 mt-2">
                        <img src={ImgWhats} alt="Email" width="70"/>
                        <p>contato@fullstackeletro.com</p>
                    </div>
                    <div className="col col-12 col-sm-6">
                        <img src={ImgEmail} alt="WhatsApp" width="70"/>
                        <p>(11) 2222-3333</p>
                    </div>
                </div>
            </Jumbotron>
            <Form onSubmit={enviaMensagem} className="col-12 col-md-10 mx-auto mb-5">
                <h3>Entre em contato conosco!!!</h3>
                <Form.Group>
                    <Form.Label>Nome</Form.Label>
                    <Form.Control id="nome" name="nome" className="mb-3" type="text" placeholder="Digite seu nome" required />
                </Form.Group>
                <Form.Group>
                    <Form.Label>Mensagem</Form.Label>
                    <Form.Control id="mensagem" name="mensagem" className="mb-3" as="textarea" rows={3} placeholder="Digite uma mensagem" required />
                </Form.Group>
                <Form.Group>
                    <Button type="submit" variant="success">Enviar</Button>
                    {'  '}
                    <Button type="reset" variant="warning">Limpar</Button>
                </Form.Group>
            </Form>
            <Table striped bordered hover>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Comentario</th>
                        <th>Data</th>
                    </tr>
                </thead>
                <tbody>
                    {comentarios && comentarios.map(item => <Comentarios key={item.idcomentario} id={item.idcomentario} nome={item.nome} comentario={item.mensagem} data={item.data} />)}
                </tbody>
            </Table>
        </Container>
    )
}