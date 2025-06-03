var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

// Cadastro e autenticação de usuário
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.get("/exibirFotoDoUsuario/:usuarioId", function (req, res) {
    usuarioController.exibirFotoDoUsuario(req, res);
});

router.post("/salvarDataHoraAcesso", function (req, res) {
    usuarioController.salvarDataHoraAcesso(req, res);
});

router.get("/exibirMesMaisAcessadoPeloUsuario/:usuarioId", function (req, res) {
    usuarioController.exibirMesMaisAcessadoPeloUsuario(req, res);
});

module.exports = router;