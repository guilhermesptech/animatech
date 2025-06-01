var desenhoModel = require("../models/desenhoModel");

function exibirPodioDoUsuario(req, res) {

    const usuarioId = req.params.usuarioId;

    desenhoModel.exibirPodioDoUsuario(usuarioId)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log("Erro ao buscar o pódio do usuário", erro);
            res.json({ erro: "Erro na busca" });
        })
}

function exibirOsGenerosPreferidosDoUsuario(req, res) {

    const usuarioId = req.params.usuarioId;

    desenhoModel.exibirOsGenerosPreferidosDoUsuario(usuarioId)
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log("Erro ao buscar os gêneros preferidos do usuário", erro);
            res.json({ erro: "Erro na busca" });
        })
}

function exibirTodosOsDesenhos(req, res) {
    desenhoModel.exibirTodosOsDesenhos()
        .then(function (resultado) {
            res.json(resultado)
        })
        .catch(function (erro) {
            console.log("Erro na exibição dos desenhos", erro);
            res.json({ erro: "Erro na listagem" });
        })
}

function votar(req, res) {
    var usuarioId = req.body.usuarioId;
    var desenhoId = req.body.desenhoId;

    desenhoModel.votar(usuarioId, desenhoId)
        .then(function (resultado) {
            res.json(resultado)
        })
        .catch(function (erro) {
            console.log("Erro na votação", erro);
            res.json({ erro: "Erro na votação" });
        })
}

module.exports = {
    exibirPodioDoUsuario,
    exibirOsGenerosPreferidosDoUsuario,
    exibirTodosOsDesenhos,
    votar
}