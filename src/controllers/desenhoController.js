var desenhoModel = require("../models/desenhoModel");

function top3(req, res) {
    desenhoModel.top3()
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log("Erro ao buscar o top 3", erro);
            res.json({ erro: "Erro na busca" });
        })
}

function generosMaisCurtidos(req, res) {
    desenhoModel.generosMaisCurtidos()
        .then(function (resultado) {
            res.json(resultado);
        })
        .catch(function (erro) {
            console.log("Erro ao buscar os gêneros mais curtidos", erro);
            res.json({ erro: "Erro na busca" });
        })
}

function listarDesenhos(req, res) {
    desenhoModel.listarDesenhos()
        .then(function (resultado) {
            res.json(resultado)
        })
        .catch(function (erro) {
            console.log("Erro na listagem de desenhos", erro);
            res.json({ erro: "Erro na listagem" });
        })
}

function votar(req, res) {
    var id = req.body.id;

    desenhoModel.votar(id)
        .then(function (resultado) {
            res.json(resultado)
        })
        .catch(function (erro) {
            console.log("Erro na votação", erro);
            res.json({ erro: "Erro na votação" });
        })
}

module.exports = {
    top3,
    generosMaisCurtidos,
    listarDesenhos,
    votar
}