var acrobacia = document.getElementById("acrobacia");
var adestramento = document.getElementById("adestramento");
var artes = document.getElementById("artes");
var atletismo = document.getElementById("atletismo");
var atualidades = document.getElementById("atualidades");
var ciencias = document.getElementById("ciencia");
var crime = document.getElementById("crime");
var diplomacia = document.getElementById("diplomacia");
var enganacao = document.getElementById("enganacao");
var fortitude = document.getElementById("fortitude");
var furtividade = document.getElementById("furtividade");
var iniciativa = document.getElementById("iniciativa");
var intimidacao = document.getElementById("intimidacao");
var intuicao = document.getElementById("intuicao");
var investigacao = document.getElementById("investigacao");
var luta = document.getElementById("luta");
var medicina = document.getElementById("medicina");
var ocultismo = document.getElementById("ocultismo");
var percepcao = document.getElementById("percepcao");
var pilotagem = document.getElementById("pilotagem");
var pontaria = document.getElementById("pontaria");
var profissao = document.getElementById("profissao");
var reflexos = document.getElementById("reflexos");
var religiao = document.getElementById("religiao");
var sobrevivencia = document.getElementById("sobrevivencia");
var tatica = document.getElementById("tatica");
var tecnologia = document.getElementById("tecnologia");
var vontade = document.getElementById("vontade");

var pericias = document.getElementsByClassName("rpg-column");


var SelectElements = document.getElementsByClassName("rpg-pericias");
var max = SelectElements.length;

var ddlOrigem = document.getElementById("origemSel");

var ddlClasse = document.getElementById("classeSel");
var ddlTrilha = document.getElementById("trilhaSel");
var ddlNex = document.getElementById("nex");

function GetSelectedValue() {
    var selectedValue = ddlClasse.value;
    return selectedValue;
}
window.addEventListener("load", function (e) {

    if (ddlNex >= 10 && GetSelectedValue() == 1) {
        var linkAPI1 = '/Personagem/PreparaListaTrilhasCombatente/';
        $.ajax({
            url: linkAPI1,
            success: function (dados) {
                var z = Object.values(dados);
                ddlTrilha.length = 1;
                for (let i = 0; i < z.length; i++) {
                    ddlTrilha.options[ddlTrilha.options.length] = new Option(z[i].nome, z[i].id);
                }

            }
        })
    }

    if (ddlNex.value >= 10 && GetSelectedValue() == 2) {
        var linkAPI2 = '/Personagem/PreparaListaTrilhasEspecialista/';
        $.ajax({
            url: linkAPI2,
            success: function (dados) {
                var z = Object.values(dados);
                ddlTrilha.length = 1;
                for (let i = 0; i < z.length; i++) {
                    ddlTrilha.options[ddlTrilha.options.length] = new Option(z[i].nome, z[i].id);
                }

            },
            error: function (erro) {
                console.log(erro.then.toString());
            }
        })

    }

    if (ddlNex.value >= 10 && GetSelectedValue() == 3) {
        var linkAPI3 = '/Personagem/PreparaListaTrilhasOcultista/';
        $.ajax({
            url: linkAPI3,
            success: function (dados) {
                var z = Object.values(dados);
                ddlTrilha.length = 1;
                for (let i = 0; i < z.length; i++) {
                    ddlTrilha.options[ddlTrilha.options.length] = new Option(z[i].nome, z[i].id);
                }

            }
        })
    }

    for (let i = 0; i < pericias.length; i++) {

        if (pericias[i].value == 5)
            pericias[i].style.color = "green";
        else if (pericias[i].value == 10)
            pericias[i].style.color = "blue";
        else if (pericias[i].value == 15)
            pericias[i].style.color = "yellow";
        else
            pericias[i].style.color = "white";
    }


})


ddlClasse.onchange = function () {
    var linkAPI1 = '/Personagem/PreparaListaTrilhasCombatente/';
    if (ddlNex.value >= 10 && GetSelectedValue() == 1) {
        $.ajax({
            url: linkAPI1,
            success: function (dados) {
                var z = Object.values(dados);
                ddlTrilha.length = 1;
                for (var i = 0; i < z.length; i++) {
                    ddlTrilha.options[ddlTrilha.options.length] = new Option(z[i].nome, z[i].id);
                }

            }
        })  
    }
    var linkAPI2 = '/Personagem/PreparaListaTrilhasEspecialista/';

    if (ddlNex.value >= 10 && GetSelectedValue() == 2) {
        $.ajax({
            url: linkAPI2,
            success: function (dados) {
                var z = Object.values(dados);
                ddlTrilha.length = 1;
                for (var i = 0; i < z.length; i++) {
                    ddlTrilha.options[ddlTrilha.options.length] = new Option(z[i].nome, z[i].id);
                }

            }
        })
    }

    var linkAPI3 = '/Personagem/PreparaListaTrilhasOcultista/';

    if (ddlNex.value >= 10 && GetSelectedValue() == 3) {
        $.ajax({
            url: linkAPI3,
            success: function (dados) {
                var z = Object.values(dados);
                ddlTrilha.length = 1;
                for (var i = 0; i < z.length; i++) {
                    ddlTrilha.options[ddlTrilha.options.length] = new Option(z[i].nome, z[i].id);
                }

            }
        })
    }
}


function getOrigemSelected() {
    return ddlOrigem.value;
}

function limpaSelect() {
    for (let i = 0; i < max; i++) {
        SelectElements[i].style.color = "white";
        SelectElements[i].value = 0;
    }
}


ddlOrigem.onchange = function () {
    if (getOrigemSelected() == 1) {
        limpaSelect();
        ciencias.value = 5;
        investigacao.value = 5;
        ciencias.style.color = "green";
        investigacao.style.color = "green";
    }
    if (getOrigemSelected() == 2) {
        limpaSelect();
        intuicao.value = 5;
        medicina.value = 5;
        intuicao.style.color = "green";
        medicina.style.color = "green";
    }
    if (getOrigemSelected() == 4) {
        limpaSelect();
        artes.value = 5;
        enganacao.value = 5;

        artes.style.color = "green";
        enganacao.style.color = "green";
    }
    if (getOrigemSelected() == 5) {
        limpaSelect();
        acrobacia.value = 5;
        atletismo.value = 5;

        acrobacia.style.color = "green";
        atletismo.style.color = "green";
    }
    if (getOrigemSelected() == 6) {
        limpaSelect();
        fortitude.value = 5;
        profissao.value = 5;

        fortitude.style.color = "green";
        profissao.style.color = "green";
    }
    if (getOrigemSelected() == 7) {
        limpaSelect();
        crime.value = 5;
        furtividade.value = 5;

        crime.style.color = "green";
        furtividade.style.color = "green";
    }
    if (getOrigemSelected() == 8) {
        limpaSelect();
        ocultismo.value = 5;
        religiao.value = 5;

        ocultismo.style.color = "green";
        religiao.style.color = "green";
    }
    if (getOrigemSelected() == 9) {
        limpaSelect();
        fortitude.value = 5;
        sobrevivencia.value = 5;

        fortitude.style.color = "green";
        sobrevivencia.style.color = "green";
    }
    if (getOrigemSelected() == 10) {
        limpaSelect();
        profissao.value = 5;
        tecnologia.value = 5;

        profissao.style.color = "green";
        tecnologia.style.color = "green";
    }
    if (getOrigemSelected() == 11) {
        limpaSelect();
        diplomacia.value = 5;
        profissao.value = 5;

        diplomacia.style.color = "green";
        profissao.style.color = "green";
    }
    if (getOrigemSelected() == 12) {
        limpaSelect();
        profissao.value = 5;
        investigacao.value = 5;

        profissao.style.color = "green";
        investigacao.style.color = "green";
    }
    if (getOrigemSelected() == 13) {
        limpaSelect();
        luta.value = 5;
        reflexos.value = 5;

        reflexos.style.color = "green";
        luta.style.color = "green";
    }
    if (getOrigemSelected() == 14) {
        limpaSelect();
        diplomacia.value = 5;
        pilotagem.value = 5;

        pilotagem.style.color = "green";
        diplomacia.style.color = "green";
    }
    if (getOrigemSelected() == 15) {
        limpaSelect();
        iniciativa.value = 5;
        intimidacao.value = 5;

        iniciativa.style.color = "green";
        intimidacao.style.color = "green";
    }
    if (getOrigemSelected() == 16) {
        limpaSelect();
        pontaria.value = 5;
        tatica.value = 5;

        pontaria.style.color = "green";
        tatica.style.color = "green";
    }
    if (getOrigemSelected() == 17) {
        limpaSelect();
        fortitude.value = 5;
        profissao.value = 5;

        fortitude.style.color = "green";
        profissao.style.color = "green";
    }
    if (getOrigemSelected() == 18) {
        limpaSelect();
        percepcao.value = 5;
        pontaria.value = 5;

        percepcao.style.color = "green";
        pontaria.style.color = "green";
    }
    if (getOrigemSelected() == 19) {
        limpaSelect();
        religiao.value = 5;
        vontade.value = 5;

        religiao.style.color = "green";
        vontade.style.color = "green";
    }
    if (getOrigemSelected() == 20) {
        limpaSelect();
        intuicao.value = 5;
        vontade.value = 5;

        intuicao.style.color = "green";
        vontade.style.color = "green";
    }
    if (getOrigemSelected() == 21) {
        limpaSelect();
        ocultismo.value = 5;
        investigacao.value = 5;

        ocultismo.style.color = "green";
        investigacao.style.color = "green";
    }
    if (getOrigemSelected() == 22) {
        limpaSelect();
        tecnologia.value = 5;
        investigacao.value = 5;

        tecnologia.style.color = "green";
        investigacao.style.color = "green";
    }
    if (getOrigemSelected() == 23) {
        limpaSelect();
        adestramento.value = 5;
        sobrevivencia.value = 5;

        adestramento.style.color = "green";
        sobrevivencia.style.color = "green";
    }
    if (getOrigemSelected() == 24) {
        limpaSelect();
        crime.value = 5;
        enganacao.value = 5;

        crime.style.color = "green";
        enganacao.style.color = "green";
    }
    if (getOrigemSelected() == 25) {
        limpaSelect();
        atualidades.value = 5;
        investigacao.value = 5;

        atualidades.style.color = "green";
        investigacao.style.color = "green";
    }
    if (getOrigemSelected() == 26) {
        limpaSelect();
        reflexos.value = 5;
        vontade.value = 5;

        reflexos.style.color = "green";
        vontade.style.color = "green";
    }
}