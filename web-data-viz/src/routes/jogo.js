var express = require("express");
var router = express.Router();

var jogoController = require("../controllers/jogoController");


router.post("/publicar", function (req, res) {
    jogoController.adicionarJogo(req, res);
})

router.get("/catalogo", function (req, res) {
    jogoController.listarJogos(req, res);
});

router.get('/buscarID/:id', function (req, res) {
    jogoController.buscarId(req, res);
});

router.get('/reviews/:id', function (req, res) {
    jogoController.buscarReviews(req, res);
});

module.exports = router;