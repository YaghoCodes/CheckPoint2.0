var express = require("express");
var router = express.Router();

var jogoController = require("../controllers/jogoController");


router.post("/publicar", function (req, res) {
    jogoController.adicionarJogo(req, res);
})


module.exports = router;