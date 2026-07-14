var database = require("../database/config");

function buscarPorNome(nome) {

    console.log("Buscando jogo:", nome);

    var instrucaoSql = `
        SELECT *
        FROM jogo
        WHERE nome = '${nome}';
    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

function InserirJogoBD(jogo) {

    var instrucaoSql = `
        INSERT INTO jogo
        (nome, description, imagem)
        VALUES
        ('${jogo.titulo}',
            '${jogo.descricao}',
            '${jogo.foto}'
        );
    `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarPorNome,
    InserirJogoBD
};