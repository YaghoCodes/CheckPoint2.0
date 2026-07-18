var database = require("../database/config")

async function buscarKpiNota(usuario) {
    console.log("Cheguei no model de buscar kpi de nota media")
    var instrucaoSql = `
            SELECT TRUNCATE(AVG(nota), 1) nota_media FROM
            avaliacao WHERE fk_usuario = ${usuario};
        `;
    console.log("Executando a instrução SQL para buscar Kpi: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

async function buscarConcluidos(usuario) {
    console.log("Cheguei no model de buscar reviews da semana do GB")
    var instrucaoSql = `
            SELECT count(*) AS concluidos
             from avaliacao WHERE
              fk_usuario = ${usuario}
               and status = 2;
        `;
    console.log("Executando a instrução SQL para buscar Kpi conclusão: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

async function buscarAdcionados(usuario) {
    console.log("Cheguei no model de buscar os jogos adciunados do usuario")
    var instrucaoSql = `
            SELECT count(*) AS adicionados
             from avaliacao WHERE
              fk_usuario = ${usuario};
        `;
    console.log("Executando a instrução SQL para buscar Kpi conclusão: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



async function buscarTop5AvaliadosPeloUsuario(usuario) {
    console.log("Cheguei no model de buscar os top 5 jogos avaliados pelo usuario e as notas da comunidade")
    const instrucaoSql = `
        SELECT 
            j.nome,
            a.nota,
            (SELECT AVG(a2.nota) 
             FROM avaliacao a2 
             WHERE a2.fk_jogo = j.id_jogo) AS media
        FROM avaliacao a
        JOIN jogo j ON j.id_jogo = a.fk_jogo
        WHERE a.fk_usuario = ${usuario}
        AND a.nota IS NOT NULL
        ORDER BY media DESC
        LIMIT 5
    `;
    console.log("Executando a instrução SQL para os top 5 jogos avaliados pelo usuario : \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

async function buscarstatusGD(usuario) {
    console.log("Cheguei no model de buscar os top generos do usuario")
    var instrucaoSql = `
       SELECT 
            SUM(CASE WHEN status = 0 THEN 1 ELSE 0 END) AS wishlist,
            SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) AS jogando,
            SUM(CASE WHEN status = 2 THEN 1 ELSE 0 END) AS concluidos
        FROM avaliacao
        WHERE fk_usuario = ${usuario};  
        `;
    console.log("Executando a instrução SQL para dados do os top generos do usuario : \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



module.exports = {
    buscarKpiNota,
    buscarConcluidos,
    buscarAdcionados,
    buscarTop5AvaliadosPeloUsuario,
    buscarstatusGD
}