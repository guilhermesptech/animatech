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

module.exports = {
    top3,
    generosMaisCurtidos
}