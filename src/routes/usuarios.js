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

// Foto de perfil do usuário
router.put("/atualizarImagemPerfil", function (req, res) {
    usuarioController.atualizarImagemPerfil(req, res);
});

router.post("/retornarImagemPerfil", function (req, res) {
    usuarioController.retornarImagemPerfil(req, res);
});

module.exports = router;