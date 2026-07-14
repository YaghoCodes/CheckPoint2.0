var jogoModel = require("../models/jogoModel");
var avaliacaoModel = require("../models/avaliacaoModel");

async function adicionarJogo(req, res) {

    try {

        const usuario = req.body.usuario;

        const titulo = req.body.titulo
            .trim()
            .toLowerCase()
            .replace(/\b\w/g, letra => letra.toUpperCase());

        const jogo = {
            titulo: titulo,
            foto: req.body.foto,
            descricao: req.body.descricao
        };

        const avaliacao = {
            review: req.body.review,
            nota: req.body.nota,
            status: req.body.status
        };

        console.log("Entrou no controller.");

        let jogoExiste = await jogoModel.buscarPorNome(jogo.titulo);

        if (jogoExiste.length === 0) {

            console.log("Jogo não encontrado. Inserindo...");

            await jogoModel.InserirJogoBD(jogo);

            jogoExiste = await jogoModel.buscarPorNome(jogo.titulo);

        }


        const idJogo = jogoExiste[0].id_jogo;


        const avaliacaoExiste = await avaliacaoModel.buscarAvaliacao(usuario, idJogo);

        if (avaliacaoExiste.length > 0) {

            return res.status(409).json({
                mensagem: "Você já possui uma avaliação para este jogo."
            });

        }

        console.log("Inserindo avaliação...");

        await avaliacaoModel.inserirAvaliacao(
            usuario,
            idJogo,
            avaliacao.review,
            avaliacao.nota,
            avaliacao.status
        );

        return res.status(201).json({
            mensagem: "Jogo e avaliação cadastrados com sucesso!"
        });

    } catch (erro) {

        console.error("Erro no controller:", erro);

        return res.status(500).json({
            mensagem: "Erro ao cadastrar jogo e avaliação.",
            erro: erro.message
        });

    }

}

module.exports = {
    adicionarJogo
}