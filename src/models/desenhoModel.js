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

module.exports = {
    top3
};