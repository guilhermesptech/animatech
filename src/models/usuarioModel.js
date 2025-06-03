var database = require("../database/config")

function autenticar(usuario, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", usuario, email, senha)
    var instrucaoSql = `
        SELECT id, nome, sobrenome, data_nascimento, genero, nome_usuario, email FROM usuario WHERE nome_usuario = '${usuario}' AND email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, sobrenome, dataNascimento, genero, usuario, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, sobrenome, dataNascimento, genero, usuario, email, senha);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO usuario (nome, sobrenome, data_nascimento, genero, nome_usuario, email, senha) VALUES ('${nome}', '${sobrenome}', '${dataNascimento}', '${genero}', '${usuario}', '${email}', '${senha}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirFotoDoUsuario(usuarioId) {
    var instrucaoSql = `
        SELECT 
            imagem_url 
        FROM 
            usuario 
        WHERE 
            id = '${usuarioId}';
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarDataHoraAcesso(id) {
    var instrucaoSql = `
        INSERT INTO acesso_usuario
        (
            fkusuario
        )
        VALUES
        (
            ${id}
        );
    `;
    console.log("Executando a instrução SQL (exibir a foto do usuário): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function exibirMesMaisAcessadoPeloUsuario(usuarioId) {
    var instrucaoSql = `
        SELECT
            MONTH(data_acesso) AS mes,
            COUNT(*) AS total_acessos
        FROM
            acesso_usuario
        WHERE
            fkusuario = ${usuarioId}
        GROUP BY
            mes
        ORDER BY 
            mes;
    `;

    console.log("Executando a instrução SQL (exibir o mês mais acessado): \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    exibirFotoDoUsuario,
    salvarDataHoraAcesso,
    exibirMesMaisAcessadoPeloUsuario
};