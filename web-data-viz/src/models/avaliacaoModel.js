var database = require("../database/config");

async function buscarAvaliacao(usuario, jogo) {

    console.log("Buscando avaliação");

    var instrucaoSql = `
        SELECT *
        FROM avaliacao
        WHERE fk_usuario = ${usuario}
        AND fk_jogo = ${jogo};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

async function inserirAvaliacao(usuario, jogo, review, nota, status) {

    console.log("Inserindo avaliação");

    var instrucaoSql = `
        INSERT INTO avaliacao
        (fk_usuario, fk_jogo, review, nota, status)
        VALUES (
            ${usuario},
            ${jogo},
            '${review}',
            ${nota},
            '${status}'
        );
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

async function buscarReviews(id) {

    console.log("Buscando reviews");

    var instrucaoSql = `
        SELECT a.review, a.nota, u.username as nome_usuario
        FROM usuario u
        JOIN avaliacao a ON u.id_usuario = a.fk_usuario
        WHERE a.fk_jogo = ${id} LIMIT 3;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);

    return database.executar(instrucaoSql);
}

      
module.exports = {
    buscarAvaliacao,
    inserirAvaliacao,
    buscarReviews
};