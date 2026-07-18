var dashboardModel = require('../models/dashboardModel');
var usuarioModel = require("../models/usuarioModel");

async function buscarKpis(req, res) {
    try {
        const usuario = req.params.idUsuario;

        const kpiAdcionados = await dashboardModel.buscarAdcionados(usuario);
        const kpiNotaMedia = await dashboardModel.buscarKpiNota(usuario);
        const kpiConcluidos = await dashboardModel.buscarConcluidos(usuario);

        return res.status(200).json({
            adicionados: kpiAdcionados[0]?.adicionados || 0,
            nota_media: kpiNotaMedia[0]?.nota_media || 0,
            concluidos: kpiConcluidos[0]?.concluidos || 0
        });
    } catch (error) {
        console.log("Erro no controller:", error);

        return res.status(500).json({
            erro: "Erro buscar kpis dashboard"
        });
    }

}

async function buscarComparacaoNotas(req, res) {
    try {
        const usuario = req.params.idUsuario;

        const comparacao = await dashboardModel.buscarTop5AvaliadosPeloUsuario(usuario);

        const dados = comparacao.map(item => ({
            jogo: item.nome,
            notaUsuario: Number(item.nota),
            mediaComunidade: Number(item.media)
        }));

        return res.status(200).json(dados);

    } catch (error) {
        console.log("Erro no controller:", error);

        return res.status(500).json({
            erro: "Erro buscar comparação de notas dashboard"
        });
    }
}

async function buscarStatusJogos(req, res) {
    try {
        const usuario = req.params.idUsuario;

        const resultado = await dashboardModel.buscarstatusGD(usuario);

        return res.status(200).json({
            wishlist: resultado[0]?.wishlist || 0,
            jogando: resultado[0]?.jogando || 0,
            concluidos: resultado[0]?.concluidos || 0
        });

    } catch (error) {
        console.log("Erro no controller:", error);

        return res.status(500).json({
            erro: "Erro buscar status dos jogos dashboard"
        });
    }
}

module.exports = {
    buscarKpis,
    buscarComparacaoNotas,
    buscarStatusJogos
};