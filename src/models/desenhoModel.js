var database = require("../database/config")

function top3() {
    const instrucaoSql = `
        SELECT
            nome,
            descricao,
            imagem_url,
            curtidas
        FROM
            desenho
        ORDER BY 
            curtidas DESC
        LIMIT 3
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function generosMaisCurtidos() {
    const instrucaoSql = `
        SELECT 
	        g.nome,
            g.descricao,
            SUM(d.curtidas) as 'curtidas_genero'
        FROM
	        genero g
        INNER JOIN
	        desenho d on g.id = d.fkgenero
        GROUP BY
	        g.nome, g.descricao
        ORDER BY
	        curtidas_genero DESC;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function listarDesenhos() {
    const instrucaoSql = `
    SELECT
        id,
        nome,
        descricao,
        imagem_url
    FROM
        desenho;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function votar(id) {
    const instrucaoSql = `
    UPDATE
        desenho
    SET
        curtidas = curtidas + 1
    WHERE
        id = ${id}
    `

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    top3,
    generosMaisCurtidos,
    listarDesenhos,
    votar
};