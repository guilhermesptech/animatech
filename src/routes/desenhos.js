var express = require("express");
var router = express.Router();

var desenhoController = require("../controllers/desenhoController");

router.get("/exibirPodioDoUsuario/:usuarioId", function (req, res) {
    desenhoController.exibirPodioDoUsuario(req, res);
});

router.get("/exibirPodioGeral", function (req, res) {
    desenhoController.exibirPodioGeral(req, res);
})

router.get("/exibirOsGenerosPreferidosDoUsuario/:usuarioId", function (req, res) {
    desenhoController.exibirOsGenerosPreferidosDoUsuario(req, res);
})

router.get("/exibirOsGenerosPreferidosNoGeral", function (req, res) {
    desenhoController.exibirOsGenerosPreferidosNoGeral(req, res);
})

router.get("/exibirTodosOsDesenhos", function (req, res) {
    desenhoController.exibirTodosOsDesenhos(req, res);
})

router.post("/votar", function (req, res) {
    desenhoController.votar(req, res);
})

module.exports = router;