var usuario = document.getElementById("usuario");
var userId = document.getElementById("model-usuario");
if (usuario.value != userId.value) {
    location.href = `Index`;
}
var rolarDado = document.getElementById("rolarDados");
var id = document.getElementById("id");
var customizado = document.getElementById("dadoCustom");
var num = document.getElementById("dice");
var numeroDados = num.value;
var total = document.getElementsByTagName("h4")[1];
var popupDado = document.getElementById("ModalDado");
var Criar = document.getElementById("Criar");
var mais1 = document.getElementById("mais1");
var menos1 = document.getElementById("menos1");
var mais5 = document.getElementById("mais5");
var menos5 = document.getElementById("menos5");

var Sanidade = document.getElementById("Sanidade");
var Pe = document.getElementById("Pe");
var Vida = document.getElementById("Vida");

var numero = document.getElementById("number");

var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");

var popupRitual = document.getElementById("ModalRitual");
var AbrirRitual = document.getElementById("Ritual");
var CriarRitual = document.getElementById("CriarRitual");

var ddlVida = document.getElementById("rangeValuePv");
var ddlSanidade = document.getElementById("rangeValueSan");
var ddlPe = document.getElementById("rangeValuePe");

function MostraHabilidades() {
    var div1 = document.getElementById("page1");
    var div2 = document.getElementById("page2");

    var btn1 = document.getElementById("habilidades");
    var btn2 = document.getElementById("poderes");

    if (div1.style.display != "block") {
        div1.style.display = "block";
        div1.classList.replace("hide", "show");
        div2.classList.replace("show", "hide");
        div2.style.display = "none";
        btn1.classList.add("border-light");
        btn2.classList.remove("border-light");
        btn1.classList.add("rounded-pill");
        btn2.classList.remove("rounded-pill");
    }
}


function MostraPoderes() {
    var div1 = document.getElementById("page1");
    var div2 = document.getElementById("page2");

    var btn1 = document.getElementById("habilidades");
    var btn2 = document.getElementById("poderes");

    if (div2.style.display != "block") {
        div2.style.display = "block";
        div2.classList.replace("hide", "show");
        div1.classList.replace("show", "hide");
        div1.style.display = "none";



        btn2.classList.add("border-light");
        btn1.classList.remove("border-light");
        btn2.classList.add("rounded-pill");
        btn1.classList.remove("rounded-pill");

    }
}



var Pages = document.getElementsByClassName("px-2");

var NavButtons = document.getElementsByClassName("nav");

var Rituais = new Map();
for (let i = 0; i < Pages.length; i++) {
    Rituais.set(i, document.getElementById("page-" + i))

}

var Paginas = new Map();
for (let i = 0; i < Pages.length; i++) {
    Paginas.set(i, document.getElementById("pagina-" + i))

}

function MostraRitual(event, page) {
    var i, tabItem, navLinks;


    tabItem = document.getElementsByClassName("hideable");
    for (i = 0; i < tabItem.length; i++) {
        tabItem[i].style.display = "none";
    }

    navLinks = document.getElementsByClassName("nav-link");
    for (i = 0; i < navLinks.length; i++) {
        navLinks[i].className = navLinks[i].className.replace(" border rounded-pill", "");
    }

    document.getElementById(page).style.display = "block";
    event.currentTarget.className += " border rounded-pill";

}

Criar.onclick = function () {
    popupDado.style.display = "block";
}


var criar = document.getElementById("criar");


criar.onclick = function () {
    let nomeDado = document.getElementById("dNome");
    let dado = document.getElementById("dValor");
    let dano = document.getElementById("switchDano");
    let x = dado.value.replace("+", "m");
    var linkAPI1 = '/Personagem/CriaDadoPersonalizado?id=' + id.value + "&nome=" + nomeDado.value + "&dado=" + x + "&dano=" + dano.checked;
    $.ajax({
        type: "POST",
        url: linkAPI1,
        dataType: "json",
        success: function (data) {
            console.log(data);
            popupDado.style.display = "none";
            location.reload();
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}


var dados = new Map();

var descendentes = document.getElementsByClassName("form-text");
var damage = new Map();
for (let i = 0; i < numeroDados; i++) {
    dados.set("ValorDado-" + i, document.getElementById("dadoValor-" + i));
    damage.set(i, document.getElementById("damage-" + i));
}

customizado.onclick = function () {


    for (let i = 0; i < descendentes.length; i++) {
        descendentes[i].addEventListener("click", function (e) {

            let valor = dados.get("ValorDado-" + i).value;
            let d = valor.indexOf("d");
            let mais = valor.indexOf("+");
            let adicional = valor.substring(mais + 1, valor.length);
            let qtdDados = valor.substring(0, d);
            let faces = parseInt(valor.substring(d + 1, valor.length));


            numero.textContent = "D" + faces + ":";
            modal.style.display = "block";
            let randomNumber = [];
            if (damage.get(i).value == "False") {

                for (let i = 0; i < qtdDados; i++) {


                    randomNumber[i] = ((Math.random() * (faces - 1) + 1) + 1).toFixed(0).toString();
                    if (i == parseInt(faces) - 1) {
                        numero.textContent += randomNumber[i]
                        break;
                    }
                    numero.textContent += randomNumber[i] + ", ";
                    let maximo = Math.max.apply(null, randomNumber);
                    if (mais == -1) {
                        total.innerHTML = "Resultado:" + maximo + "+" + "=" + maximo;
                    }
                    else {
                        total.innerHTML = "Resultado:" + maximo + "+" + adicional + "=" + (maximo + parseInt(adicional));
                    }
                }
            }
            else {
                let soma = 0;

                total.innerHTML = "Resultado: ";
                for (let i = 0; i < qtdDados; i++) {
                    randomNumber[i] = ((Math.random() * (faces - 1)) + 1).toFixed(0).toString();

                    if (i == qtdDados) {
                        soma += parseInt(adicional);
                        total.innerHTML += randomNumber[i];
                    }
                    numero.textContent += randomNumber[i] + ", ";
                    soma += parseInt(randomNumber[i]);
                    total.innerHTML += randomNumber[i] + "+";

                }
                if (mais == -1) {

                    total.innerHTML += "=";
                    total.innerHTML += soma;
                    let text = total.textContent;
                    total.innerHTML = text.replaceAll("+=", '=');
                }
                else {
                    total.innerHTML += adicional + "= ";
                    soma += parseInt(adicional);

                    total.innerHTML += soma;
                }

            }
        }

        )

    }


}

rolarDado.onclick = function () {
    let input1 = document.getElementById("Dado");
    let valor = input1.value;
    let d = valor.indexOf("d");
    let mais = valor.indexOf("+");
    let adicional = valor.substring(mais + 1, valor.length);
    let qtdDados = valor.substring(0, d);
    let faces = parseInt(valor.substring(d + 1, valor.length));

    if (mais != -1) {
        numero.textContent = "d" + faces + ": ";
        modal.style.display = "block";
        let randomNumber = [];
        for (let i = 0; i < qtdDados; i++) {
            randomNumber[i] = (Math.random() * (faces - 1 + 1) + 1).toFixed(0).toString();

            if (i == parseInt(faces) - 1) {
                numero.textContent += randomNumber[i];
                break;
            }
            numero.textContent += randomNumber[i] + ", ";
        }
        let maximo = Math.max.apply(null, randomNumber);
        total.innerHTML = "Teste: " + maximo + "+" + adicional + "=" + (maximo + parseInt(adicional));
    }

    else {
        numero.textContent = "d" + faces + ": ";
        modal.style.display = "block";
        let randomNumber = [];
        for (let i = 0; i < qtdDados; i++) {
            randomNumber[i] = (Math.random() * faces).toFixed(0).toString();

            if (i == parseInt(faces) - 1) {
                numero.textContent += randomNumber[i];
                break;
            }
            numero.textContent += randomNumber[i] + ", ";
        }
        let maximo = Math.max.apply(null, randomNumber);
        total.innerHTML = "Teste: " + maximo;
    }
}

function PopupTreinado(pericia, atributo, num) {

    numero.textContent = "d20: ";
    modal.style.display = "block";

    let input1 = document.getElementById("valor-" + num);
    let valor = input1.textContent;
    let mais = valor.indexOf("+");
    let adicional = valor.substring(mais + 1, valor.length);

    let randomNumber = [];
    for (let i = 0; i < atributo.innerHTML; i++) {
        randomNumber[i] = (Math.random() * (20 - 1 + 1)).toFixed(0).toString();


        if (i == parseInt(atributo.innerHTML) - 1) {
            numero.textContent += randomNumber[i];
            break;
        }
        numero.textContent += randomNumber[i] + ", ";
    }
    let maximo = Math.max.apply(null, randomNumber) + parseInt(adicional);
    total.innerHTML = pericia + ": " + (maximo - parseInt(adicional)) + "+" + adicional + "=" + maximo;
}


Vida.onchange = function () {


    var linkAPI1 = '/Personagem/AtualizaVida?id=' + id.value + "&vida=" + Vida.value;
    $.ajax({
        type: "POST",
        url: linkAPI1,
        dataType: "json",
        success: function (data) {
            console.log(data);
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}
Sanidade.onchange = function () {


    var linkAPI2 = '/Personagem/AtualizaSanidade?id=' + id.value + "&sanidade=" + Sanidade.value;
    $.ajax({
        type: "POST",
        url: linkAPI2,
        dataType: "json",
        success: function (data) {
            console.log(data);
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}
Pe.onchange = function () {


    var linkAPI3 = '/Personagem/AtualizaPe?id=' + id.value + "&pe=" + Pe.value;
    $.ajax({
        type: "POST",
        url: linkAPI3,
        dataType: "json",
        success: function (data) {
            console.log(data);
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}

function AtualizaPv() {
    ddlVida.innerHTML = Vida.value;

}

function AtualizaSan() {
    ddlSanidade.innerHTML = Sanidade.value;

}

function AtualizaPe() {
    ddlPe.innerHTML = Pe.value;

}

var agilidade = document.getElementById("Agi");
var intelecto = document.getElementById("Int");
var vigor = document.getElementById("Vig");
var forca = document.getElementById("For");
var presenca = document.getElementById("Pre");

agilidade.onclick = function () {
    numero.textContent = "d20: ";
    modal.style.display = "block";
    var randomNumber = [];
    for (let i = 0; i < agilidade.innerHTML; i++) {
        randomNumber[i] = (Math.random() * 20).toFixed(0).toString();

        if (i == parseInt(agilidade.innerHTML) - 1) {
            numero.textContent += randomNumber[i];
            break;
        }
        numero.textContent += randomNumber[i] + ", ";
    }
    let maximo = Math.max.apply(null, randomNumber);
    total.innerHTML = "Agilidade: " + maximo;
}

intelecto.onclick = function () {
    numero.textContent = "d20: ";
    modal.style.display = "block";
    var randomNumber = [];
    for (let i = 0; i < intelecto.innerHTML; i++) {
        randomNumber[i] = (Math.random() * 20).toFixed(0).toString();

        if (i == parseInt(intelecto.innerHTML) - 1) {
            numero.textContent += randomNumber[i];
            break;
        }
        numero.textContent += randomNumber[i] + ", ";
    }
    let maximo = Math.max.apply(null, randomNumber);
    total.innerHTML = "Intelecto: " + maximo;
}

forca.onclick = function () {
    numero.textContent = "d20: ";
    modal.style.display = "block";
    var randomNumber = [];
    for (let i = 0; i < forca.innerHTML; i++) {
        randomNumber[i] = (Math.random() * 20).toFixed(0).toString();

        if (i == parseInt(forca.innerHTML) - 1) {
            numero.textContent += randomNumber[i];
            break;
        }
        numero.textContent += randomNumber[i] + ", ";
    }
    let maximo = Math.max.apply(null, randomNumber);
    total.innerHTML = "Força: " + maximo;
}

vigor.onclick = function () {
    numero.textContent = "d20: ";
    modal.style.display = "block";
    var randomNumber = [];
    for (let i = 0; i < vigor.innerHTML; i++) {
        randomNumber[i] = (Math.random() * 20).toFixed(0).toString();

        if (i == parseInt(vigor.innerHTML) - 1) {
            numero.textContent += randomNumber[i];
            break;
        }
        numero.textContent += randomNumber[i] + ", ";
    }
    let maximo = Math.max.apply(null, randomNumber);
    total.innerHTML = "Vigor: " + maximo;
}

presenca.onclick = function () {
    numero.textContent = "d20: ";
    modal.style.display = "block";
    var randomNumber = [];
    for (let i = 0; i < presenca.innerHTML; i++) {
        randomNumber[i] = (Math.random() * 20).toFixed(0).toString();

        if (i == parseInt(presenca.innerHTML) - 1) {
            numero.textContent += randomNumber[i];
            break;
        }
        numero.textContent += randomNumber[i] + ", ";
    }
    let maximo = Math.max.apply(null, randomNumber);
    total.innerHTML = "Presença: " + maximo;
}

function AdicionaMaisUm(caracteristica) {
    var linkAPI1 = '/Personagem/AdicionaUm?id=' + id.value + "&caracteristica="+caracteristica.toString();
    $.ajax({
        type: "POST",
        url: linkAPI1,
        dataType: "json",
        success: function (data) {
            console.log(data);

            if (caracteristica === "pontos de esforço") {
                Pe.value = data;
                AtualizaPe();
            }
            if (caracteristica === "sanidade") {
                Sanidade.value = data;
                AtualizaSan();
            }
            if (caracteristica === "vida") {
                Vida.value = data;
                AtualizaPv();
            }
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}

function AdicionaMaisCinco(caracteristica) {
    var linkAPI1 = '/Personagem/AdicionaCinco?id=' + id.value + "&caracteristica=" + caracteristica.toString();
    $.ajax({
        type: "POST",
        url: linkAPI1,
        dataType: "json",
        success: function (data) {
            console.log(data);

            if (caracteristica === "pontos de esforço") {
                Pe.value = data;
                AtualizaPe();
            }
            if (caracteristica === "sanidade") {
                Sanidade.value = data;
                AtualizaSan();
            }
            if (caracteristica === "vida") {
                Vida.value = data;
                AtualizaPv();
            }
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}

function DiminuiMenosUm(caracteristica) {
    var linkAPI1 = '/Personagem/DiminuiUm?id=' + id.value + "&caracteristica=" + caracteristica.toString();
    $.ajax({
        type: "POST",
        url: linkAPI1,
        dataType: "json",
        success: function (data) {
            console.log(data);

            if (caracteristica === "pontos de esforço") {
                Pe.value = data;
                AtualizaPe();
            }
            if (caracteristica === "sanidade") {
                Sanidade.value = data;
                AtualizaSan();
            }
            if (caracteristica === "vida") {
                Vida.value = data;
                AtualizaPv();
            }
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}

function DiminuiMenosCinco(caracteristica) {
    var linkAPI1 = '/Personagem/DiminuiCinco?id=' + id.value + "&caracteristica=" + caracteristica.toString();
    $.ajax({
        type: "POST",
        url: linkAPI1,
        dataType: "json",
        success: function (data) {
            console.log(data);

            if (caracteristica === "pontos de esforço") {
                Pe.value = data;
                AtualizaPe();
            }
            if (caracteristica === "sanidade") {
                Sanidade.value = data;
                AtualizaSan();
            }
            if (caracteristica === "vida") {
                Vida.value = data;
                AtualizaPv();
            }
        },
        error: function (request, status, erro) {
            console.log(erro.toString());
        }
    })
}


function closePopup() {
    modal.style.display = "none";
    popupDado.style.display = "none";
}

var pericias = new Map();

for (let i = 1; i <= 15; i++) {
    pericias.set("pericia" + i, document.getElementById("peri-" + i));
}
pericias.get("pericia1").onclick = function () {
    if (pericias.get("pericia1").textContent.includes("acrobacia")) {
        PopupTreinado("Acrobacia", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("adestramento")) {
        PopupTreinado("Adestramento", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("artes")) {
        PopupTreinado("Artes", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("atletismo")) {
        PopupTreinado("Atletismo", forca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("atualidades")) {
        PopupTreinado("Atualidades", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("ciencias")) {
        PopupTreinado("Ciências", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 1)
    }
    if (pericias.get("pericia1").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 1)
    }
    if (pericias.get("pericia1").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 1)
    }
    if (pericias.get("pericia1").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 1)
    }
    if (pericias.get("pericia1").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 1)
    }

}

pericias.get("pericia2").onclick = function () {

    if (pericias.get("pericia2").textContent.includes("adestramento")) {
        PopupTreinado("Adestramento", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("artes")) {
        PopupTreinado("Artes", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("atletismo")) {
        PopupTreinado("Atletismo", forca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("atualidades")) {
        PopupTreinado("Atualidades", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("ciencias")) {
        PopupTreinado("Ciências", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 2)
    }
    if (pericias.get("pericia2").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 2)
    }
    if (pericias.get("pericia2").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 2)
    }
    if (pericias.get("pericia2").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 2)
    }
    if (pericias.get("pericia2").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 2)
    }
    if (pericias.get("pericia2").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 2)
    }
    if (pericias.get("pericia2").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 2)
    }
    if (pericias.get("pericia2").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 2)
    }
    if (pericias.get("pericia2").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 2)
    }
    if (pericias.get("pericia2").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 2)
    }

}

pericias.get("pericia3").onclick = function () {

    if (pericias.get("pericia3").textContent.includes("artes")) {
        PopupTreinado("Artes", presenca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("atletismo")) {
        PopupTreinado("Atletismo", forca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("atualidades")) {
        PopupTreinado("Atualidades", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("ciencias")) {
        PopupTreinado("Ciências", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 3)
    }
    if (pericias.get("pericia3").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 3)
    }
    if (pericias.get("pericia3").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 3)
    }
    if (pericias.get("pericia3").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 3)
    }
    if (pericias.get("pericia3").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 3)
    }
    if (pericias.get("pericia3").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 3)
    }
    if (pericias.get("pericia3").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 3)
    }
    if (pericias.get("pericia3").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 3)
    }
    if (pericias.get("pericia3").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 3)
    }
    if (pericias.get("pericia3").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 3)
    }

}

pericias.get("pericia4").onclick = function () {

    if (pericias.get("pericia4").textContent.includes("atletismo")) {
        PopupTreinado("Atletismo", forca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("atualidades")) {
        PopupTreinado("Atualidades", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("ciencias")) {
        PopupTreinado("Ciências", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 4)
    }
    if (pericias.get("pericia4").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 4)
    }
    if (pericias.get("pericia4").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 4)
    }
    if (pericias.get("pericia4").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 4)
    }
    if (pericias.get("pericia4").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 4)
    }
    if (pericias.get("pericia4").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 4)
    }
    if (pericias.get("pericia4").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 4)
    }
    if (pericias.get("pericia4").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 4)
    }
    if (pericias.get("pericia4").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 4)
    }
    if (pericias.get("pericia4").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 4)
    }

}

pericias.get("pericia5").onclick = function () {

    if (pericias.get("pericia5").textContent.includes("atualidades")) {
        PopupTreinado("Atualidades", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("ciencias")) {
        PopupTreinado("Ciências", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 5)
    }
    if (pericias.get("pericia5").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 5)
    }
    if (pericias.get("pericia5").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 5)
    }
    if (pericias.get("pericia5").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 5)
    }
    if (pericias.get("pericia5").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 5)
    }
    if (pericias.get("pericia5").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 5)
    }
    if (pericias.get("pericia5").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 5)
    }
    if (pericias.get("pericia5").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 5)
    }
    if (pericias.get("pericia5").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 5)
    }
    if (pericias.get("pericia5").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 5)
    }
    if (pericias.get("pericia5").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 5)
    }
    if (pericias.get("pericia5").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 5)
    }
    if (pericias.get("pericia5").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 5)
    }
    if (pericias.get("pericia5").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 5)
    }
    if (pericias.get("pericia5").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 5)
    }

}

pericias.get("pericia6").onclick = function () {

    if (pericias.get("pericia6").textContent.includes("ciencias")) {
        PopupTreinado("Ciências", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 6)
    }
    if (pericias.get("pericia6").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 6)
    }
    if (pericias.get("pericia6").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 6)
    }
    if (pericias.get("pericia6").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 6)
    }
    if (pericias.get("pericia6").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 6)
    }
    if (pericias.get("pericia6").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 6)
    }
    if (pericias.get("pericia6").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 6)
    }
    if (pericias.get("pericia6").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 6)
    }
    if (pericias.get("pericia6").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 6)
    }
    if (pericias.get("pericia6").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 6)
    }
    if (pericias.get("pericia6").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 6)
    }
    if (pericias.get("pericia6").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 6)
    }
    if (pericias.get("pericia6").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 6)
    }
    if (pericias.get("pericia6").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 6)
    }
    if (pericias.get("pericia6").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 6)
    }

}

pericias.get("pericia7").onclick = function () {

    if (pericias.get("pericia7").textContent.includes("crime")) {
        PopupTreinado("Crime", agilidade, 7)
    }
    if (pericias.get("pericia7").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 7)
    }
    if (pericias.get("pericia7").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 7)
    }
    if (pericias.get("pericia7").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 7)
    }
    if (pericias.get("pericia7").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 7)
    }
    if (pericias.get("pericia7").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 7)
    }
    if (pericias.get("pericia7").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 7)
    }
    if (pericias.get("pericia7").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 7)
    }
    if (pericias.get("pericia7").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 7)
    }
    if (pericias.get("pericia7").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 7)
    }
    if (pericias.get("pericia7").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 7)
    }
    if (pericias.get("pericia7").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 7)
    }
    if (pericias.get("pericia7").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 7)
    }
    if (pericias.get("pericia7").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 7)
    }
    if (pericias.get("pericia7").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 7)
    }

}

pericias.get("pericia8").onclick = function () {

    if (pericias.get("pericia8").textContent.includes("diplomacia")) {
        PopupTreinado("Diplomacia", presenca, 8)
    }
    if (pericias.get("pericia8").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 8)
    }
    if (pericias.get("pericia8").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 8)
    }
    if (pericias.get("pericia8").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 8)
    }
    if (pericias.get("pericia8").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 8)
    }
    if (pericias.get("pericia8").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 8)
    }
    if (pericias.get("pericia8").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 8)
    }
    if (pericias.get("pericia8").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 8)
    }
    if (pericias.get("pericia8").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 8)
    }
    if (pericias.get("pericia8").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 8)
    }
    if (pericias.get("pericia8").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 8)
    }
    if (pericias.get("pericia8").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 8)
    }
    if (pericias.get("pericia8").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 8)
    }
    if (pericias.get("pericia8").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 8)
    }

}

pericias.get("pericia9").onclick = function () {

    if (pericias.get("pericia9").textContent.includes("enganacao")) {
        PopupTreinado("Enganação", presenca, 9)
    }
    if (pericias.get("pericia9").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 9)
    }
    if (pericias.get("pericia9").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 9)
    }
    if (pericias.get("pericia9").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 9)
    }
    if (pericias.get("pericia9").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 9)
    }
    if (pericias.get("pericia9").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 9)
    }
    if (pericias.get("pericia9").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 9)
    }
    if (pericias.get("pericia9").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 9)
    }
    if (pericias.get("pericia9").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 9)
    }
    if (pericias.get("pericia9").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 9)
    }
    if (pericias.get("pericia9").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 9)
    }
    if (pericias.get("pericia9").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 9)
    }
    if (pericias.get("pericia9").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 9)
    }

}

pericias.get("pericia10").onclick = function () {

    if (pericias.get("pericia10").textContent.includes("fortitude")) {
        PopupTreinado("Fortitude", vigor, 10)
    }
    if (pericias.get("pericia10").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 10)
    }
    if (pericias.get("pericia10").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 10)
    }
    if (pericias.get("pericia10").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 10)
    }
    if (pericias.get("pericia10").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 10)
    }
    if (pericias.get("pericia10").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 10)
    }
    if (pericias.get("pericia10").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 10)
    }
    if (pericias.get("pericia10").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 10)
    }
    if (pericias.get("pericia10").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 10)
    }
    if (pericias.get("pericia10").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 10)
    }
    if (pericias.get("pericia10").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 10)
    }
    if (pericias.get("pericia10").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 10)
    }

}

pericias.get("pericia11").onclick = function () {

    if (pericias.get("pericia11").textContent.includes("furtividade")) {
        PopupTreinado("Furtividade", agilidade, 11)
    }
    if (pericias.get("pericia11").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 11)
    }
    if (pericias.get("pericia11").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 11)
    }
    if (pericias.get("pericia11").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 11)
    }
    if (pericias.get("pericia11").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 11)
    }
    if (pericias.get("pericia11").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 11)
    }
    if (pericias.get("pericia11").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 11)
    }
    if (pericias.get("pericia11").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 11)
    }
    if (pericias.get("pericia11").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 11)
    }
    if (pericias.get("pericia11").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 11)
    }
    if (pericias.get("pericia11").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 11)
    }

}

pericias.get("pericia12").onclick = function () {

    if (pericias.get("pericia12").textContent.includes("iniciativa")) {
        PopupTreinado("Iniciativa", agilidade, 12)
    }
    if (pericias.get("pericia12").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 12)
    }
    if (pericias.get("pericia12").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 12)
    }
    if (pericias.get("pericia12").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 12)
    }
    if (pericias.get("pericia12").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 12)
    }
    if (pericias.get("pericia12").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 12)
    }
    if (pericias.get("pericia12").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 12)
    }
    if (pericias.get("pericia12").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 12)
    }
    if (pericias.get("pericia12").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 12)
    }
    if (pericias.get("pericia12").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 12)
    }

}

pericias.get("pericia13").onclick = function () {
    if (pericias.get("pericia13").textContent.includes("intimidacao")) {
        PopupTreinado("Intimidação", presenca, 13)
    }
    if (pericias.get("pericia13").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 13)
    }
    if (pericias.get("pericia13").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 13)
    }
    if (pericias.get("pericia13").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 13)
    }
    if (pericias.get("pericia13").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 13)
    }
    if (pericias.get("pericia13").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 13)
    }
    if (pericias.get("pericia13").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 13)
    }
    if (pericias.get("pericia13").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 13)
    }
    if (pericias.get("pericia13").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 13)
    }

}

pericias.get("pericia14").onclick = function () {
    if (pericias.get("pericia14").textContent.includes("intuicao")) {
        PopupTreinado("Intuição", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 14)
    }
    if (pericias.get("pericia14").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 14)
    }
    if (pericias.get("pericia14").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 14)
    }
    if (pericias.get("pericia14").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 14)
    }
    if (pericias.get("pericia14").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 14)
    }
    if (pericias.get("pericia14").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 14)
    }
    if (pericias.get("pericia14").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 14)
    }
    if (pericias.get("pericia14").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 14)
    }

}

pericias.get("pericia15").onclick = function () {

    if (pericias.get("pericia15").textContent.includes("investigacao")) {
        PopupTreinado("Investigação", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("luta")) {
        PopupTreinado("Luta", forca, 15)
    }
    if (pericias.get("pericia15").textContent.includes("medicina")) {
        PopupTreinado("Medicina", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("ocultismo")) {
        PopupTreinado("Ocultismo", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("percepcao")) {
        PopupTreinado("Percepção", presenca, 15)
    }
    if (pericias.get("pericia15").textContent.includes("pilotagem")) {
        PopupTreinado("Pilotagem", agilidade, 15)
    }
    if (pericias.get("pericia15").textContent.includes("pontaria")) {
        PopupTreinado("Pontaria", agilidade, 15)
    }
    if (pericias.get("pericia15").textContent.includes("profissao")) {
        PopupTreinado("Profissão", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("reflexos")) {
        PopupTreinado("Reflexos", agilidade, 15)
    }
    if (pericias.get("pericia15").textContent.includes("religiao")) {
        PopupTreinado("Religião", presenca, 15)
    }
    if (pericias.get("pericia15").textContent.includes("sobrevivencia")) {
        PopupTreinado("Sobrevivência", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("tatica")) {
        PopupTreinado("Tática", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("tecnologia")) {
        PopupTreinado("Tecnologia", intelecto, 15)
    }
    if (pericias.get("pericia15").textContent.includes("vontade")) {
        PopupTreinado("Vontade", presenca, 15)
    }

}
