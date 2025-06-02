var database = require("../database/config")

function exibirPodioDoUsuario(usuarioId) {
    const instrucaoSql = `
        SELECT 
            d.nome AS nome_desenho,
            d.descricao,
            d.imagem_url,
            v.quantidade_votos
        FROM 
	        voto v
        INNER JOIN 
	        desenho d ON v.fkdesenho = d.id
        INNER JOIN 
	        usuario u ON v.fkusuario = u.id
        WHERE
	        v.fkusuario = ${usuarioId}
        ORDER BY 
            v.quantidade_votos DESC
        LIMIT 
            3;
    `;

    console.log("Executando a instrução SQL (exibir pódio do usuário): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirPodioGeral() {
    const instrucaoSql = `
        SELECT 
            d.nome AS nome_desenho,
            d.descricao,
            d.imagem_url,
            v.quantidade_votos
        FROM 
	        voto v
        INNER JOIN 
	        desenho d ON v.fkdesenho = d.id
        INNER JOIN 
	        usuario u ON v.fkusuario = u.id
        ORDER BY 
            v.quantidade_votos DESC
        LIMIT 
            3;
    `;

    console.log("Executando a instrução SQL (exibir pódio geral): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirOsGenerosPreferidosDoUsuario(usuarioId) {
    const instrucaoSql = `
        SELECT 
	        g.nome,
            SUM(v.quantidade_votos) as 'total_votos'
        FROM
	        voto v
        INNER JOIN
	        desenho d ON d.id = v.fkdesenho
        INNER JOIN
            genero g ON d.fkgenero = g.id
        WHERE
            v.fkusuario = ${usuarioId}
        GROUP BY
	        g.nome
        ORDER BY
	        total_votos DESC
        LIMIT 
            5;
    `;

    console.log("Executando a instrução SQL (exibir os gêneros preferidos do usuário): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirOsGenerosPreferidosNoGeral() {
    const instrucaoSql = `
        SELECT 
	        g.nome,
            SUM(v.quantidade_votos) as 'total_votos'
        FROM
	        voto v
        INNER JOIN
	        desenho d ON d.id = v.fkdesenho
        INNER JOIN
            genero g ON d.fkgenero = g.id
        GROUP BY
	        g.nome
        ORDER BY
	        total_votos DESC
        LIMIT 
            5;
    `;

    console.log("Executando a instrução SQL (exibir os gêneros preferidos no geral): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirTodosOsDesenhos() {
    const instrucaoSql = `
        SELECT
            id,
            nome,
            descricao,
            imagem_url
        FROM
            desenho;
    `;

    console.log("Executando a instrução SQL (exibir todos os desenhos): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function votar(usuarioId, desenhoId) {

    const verificaSql = `
        SELECT 
            * 
        FROM 
            voto
        WHERE
            fkusuario = ${usuarioId}
        AND
            fkdesenho = ${desenhoId};
    `;

    console.log("Verificando se já existe o registro na tabela: \n" + verificaSql);
    return database.executar(verificaSql)
        .then(function (resultado) {
            if (resultado.length > 0) {

                const instrucaoSql = `
                    UPDATE
                        voto
                    SET
                        quantidade_votos = quantidade_votos + 1
                    WHERE
                        fkusuario = ${usuarioId}
                    AND
                        fkdesenho = ${desenhoId};
                `;
                console.log("Executando a instrução SQL (update na tabela voto): \n" + instrucaoSql)
                return database.executar(instrucaoSql);
            } else {
                const instrucaoSql = `
                    INSERT INTO voto
                    (
                        quantidade_votos,
                        fkusuario,
                        fkdesenho
                    )
                    VALUES
                    (
                        1,
                        ${usuarioId},
                        ${desenhoId}
                    );
                `;
                console.log("Executando a instrução SQL (insert na tabela voto): \n" + instrucaoSql)
                return database.executar(instrucaoSql);
            }
        })



    const instrucaoSql = `

        UPDATE
            voto
        SET
            quantidade_votos = quantidade_votos + 1
        WHERE
            fkusuario = ${usuarioId}
        AND
            fkdesenho = ${desenhoId};

    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    exibirPodioDoUsuario,
    exibirPodioGeral,
    exibirOsGenerosPreferidosDoUsuario,
    exibirOsGenerosPreferidosNoGeral,
    exibirTodosOsDesenhos,
    votar
};