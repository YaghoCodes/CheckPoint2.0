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

function listarJogos() {

    var instrucaoSql = `
        select j.id_jogo, j.nome, j.imagem, AVG(a.nota) as media from jogo j
        join avaliacao a on j.id_jogo = a.fk_jogo GROUP BY
        j.id_jogo,
        j.nome,
        j.imagem order by media DESC LIMIT 30;
        `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

function buscarPorId(id) {

    var instrucaoSql = `
        select j.id_jogo, j.nome, j.imagem, j.description, TRUNCATE(AVG(a.nota), 2) as media from jogo j
        join avaliacao a on j.id_jogo = a.fk_jogo WHERE j.id_jogo = ${id} GROUP BY
        j.id_jogo,
        j.nome,
        j.imagem,
        j.description;
        `;

    console.log(instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    buscarPorNome,
    InserirJogoBD,
    listarJogos,
    buscarPorId
};