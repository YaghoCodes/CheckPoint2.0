var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/kpi/:idUsuario", function (req, res) {
    dashboardController.buscarKpis(req, res);
});

router.get("/graficoBarra/:idUsuario", function (req, res) {
    dashboardController.buscarComparacaoNotas(req, res);
});

router.get("/graficoDonut/:idUsuario", function (req, res) {
    dashboardController.buscarStatusJogos(req, res);
});


module.exports = router;