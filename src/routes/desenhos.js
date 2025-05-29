var express = require("express");
var router = express.Router();

var desenhoController = require("../controllers/desenhoController");

router.get("/top3", function (req, res) {
    desenhoController.top3(req, res);
});

module.exports = router;