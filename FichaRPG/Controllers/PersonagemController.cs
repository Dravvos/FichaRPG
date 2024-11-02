using System.Data;
using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using FichaRPG.Enums;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Linq;
using Newtonsoft.Json;
using System;

namespace FichaRPG.Controllers
{
    public class PersonagemController : PadraoController<PersonagemViewModel>
    {
        private readonly PatenteDAO _patente = new PatenteDAO();
        private readonly ClasseDAO _classe = new ClasseDAO();
        private readonly OrigemDAO _origem = new OrigemDAO();
        private readonly TrilhaDAO _trilha = new TrilhaDAO();
        public PersonagemController()
        {
            ExigeAutenticacao = true;
            DAO = new PersonagemDAO();
            GeraProximoId = false;
        }

        public override IActionResult Index()
        {
            try
            {
                ViewBag.Usuario = UsuarioLogado.Id;
                var personagem = new PersonagemDAO();
                List<PersonagemViewModel> cadastrado = personagem.ListarPersonagensPorUsuario(UsuarioLogado.Id);
                if (cadastrado != null)
                    return base.Index();
                else
                {
                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Create", "Personagem")}";
                    return Redirect(redirectUrl);
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public override IActionResult Delete(int id)
        {
            var relacaoRitual = new RelacaoRitualDAO();
            var ritual = new RituaisDAO();
            var dado = new DadoDAO();
            var arma = new ArmasDAO();
            var item = new ItensDAO();
            List<RituaisViewModel> rituais = ritual.ListarRituaisPorPersonagem(id);
            for (int i = 0; i < ritual.ListarRituaisPorPersonagem(id).Count; i++)
            {
                relacaoRitual.Deletar(id, rituais.ElementAt(i).Id);
                ritual.Delete(rituais.ElementAt(i).Id);
            }
            dado.DeletarDadosPorPersonagem(id);
            for (int i = 0; i < arma.Listar(id).Count; i++)
            {
                arma.Deletar(id);
            }
            for (int i = 0; i < item.ListarItensPorPersonagem(id).Count; i++)
            {
                item.Deletar(id);
            }
            return base.Delete(id);
        }
        public IActionResult Details(int id)
        {
            try
            {
                var personagem = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);
                if (model == null)
                {
                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Personagem")}";
                    return Redirect(redirectUrl);
                }

                PatenteViewModel patente = _patente.Consulta(DAO.Consulta(id).PatenteId);
                ClasseViewModel classe = _classe.Consulta(DAO.Consulta(id).ClasseId);
                OrigemViewModel origem = _origem.Consulta(DAO.Consulta(id).OrigemId);
                IEnumerable<TrilhaViewModel> trilha = _trilha.Listagem().Where(a => a.Id == model.TrilhaId);

                var vida = model.PontosDeVidaAtual;
                var sanidade = model.SanidadeAtual;
                var pe = model.PontosDeEsforcoAtual;
                if (model.TrilhaId == null)
                    ViewBag.Trilha = "Nenhuma";
                else
                    ViewBag.Trilha = trilha.ElementAt(0).Nome;
                if (model != null)
                {
                    ViewBag.User = UsuarioLogado.Nome;
                    ViewBag.Patente = patente.Nome;
                    ViewBag.Classe = classe.Nome;
                    ViewBag.Origem = origem.Nome;
                    ViewBag.Usuario = UsuarioLogado.Id;

                    return View("Details", model);
                }
                else
                {
                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Personagem")}";
                    return Redirect(redirectUrl);
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        protected override void ValidaDados(PersonagemViewModel model, string operacao)
        {
            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Digite o nome do personagem");
            if (model.Idade <= 0)
                ModelState.AddModelError("Idade", "Digite a idade do personagem");
            if (model.OrigemId <= 0)
                ModelState.AddModelError("OrigemId", "Escolha uma origem");
            if (model.Nex < 5)
                ModelState.AddModelError("Nex", "Digite um Nex maior que 5%");
            if (model.Nex % 5 != 0)
                ModelState.AddModelError("Nex", "O Nex deve ser um múltiplo de 5");
            if (model.Nex == 99)
                ModelState.Remove("Nex");
            if (model.ClasseId <= 0)
                ModelState.AddModelError("ClasseId", "Escolha uma Classe");
            if (model.Nex >= 10 && model.TrilhaId <= 0)
                ModelState.AddModelError("TrilhaId", "Escolha uma Trilha");
            if (model.PatenteId <= 0)
                ModelState.AddModelError("PatenteId", "Escolha uma Patente");
            if (model.PontosDeVidaMaximo < 1)
                ModelState.AddModelError("PvMax", "Pontos de vida devem ser maior que 1");
            if (model.SanidadeMaxima < 1)
                ModelState.AddModelError("SanidadeMax", "Sanidade deve ser maior que 1");
            if (model.PontosDeEsforcoMaximo < 1)
                ModelState.AddModelError("PeMax", "Pontos de esforço devem ser maior que 1");


        }
        public override IActionResult Save(PersonagemViewModel model, string operacao)
        {
            try
            {
                ModelState.Clear();
                ValidaDados(model, operacao);

                if (ModelState.IsValid == false)
                {
                    ViewBag.Operacao = operacao;
                    return Create();
                }
                else
                {
                    if (model.TrilhaId == 0)
                        model.TrilhaId = null;

                    if (string.Equals(operacao, "I"))
                    {
                        model.UsuarioId = UsuarioLogado.Id;
                        model.PontosDeVidaAtual = model.PontosDeVidaMaximo;
                        model.SanidadeAtual = model.SanidadeMaxima;
                        model.PontosDeEsforcoAtual = model.PontosDeEsforcoMaximo;

                        if (model.PontosDeVidaMaximo == 1 && model.ClasseId == (int)enumClasse.Combatente)
                        {
                            if (model.Nex == 5)
                            {

                                model.PontosDeVidaMaximo = (short)(20 + model.Vigor);
                                model.PontosDeEsforcoMaximo = (short)(2 + model.Presenca);
                                model.SanidadeMaxima = 12;


                            }
                            else
                            {
                                model.PontosDeVidaMaximo = (short)((short)(20 + model.Vigor) + (4 + model.Vigor) * (model.Nex / 5 - 1));
                                model.PontosDeEsforcoMaximo = (short)((short)(2 + model.Presenca) + (2 + model.Presenca) * (model.Nex / 5 - 1));
                                model.SanidadeMaxima = (short)(12 + 3 * (model.Nex / 5 - 1));
                            }
                        }
                        else if (model.PontosDeVidaMaximo == 1 && model.ClasseId == (int)enumClasse.Especialista)
                        {
                            if (model.Nex == 5)
                            {

                                model.PontosDeVidaMaximo = (short)(16 + model.Vigor);
                                model.PontosDeEsforcoMaximo = (short)(3 + model.Presenca);
                                model.SanidadeMaxima = 16;


                            }
                            else
                            {
                                model.PontosDeVidaMaximo = (short)(16 + model.Vigor + (3 + model.Vigor) * (model.Nex / 5 - 1));
                                model.PontosDeEsforcoMaximo = (short)((short)(3 + model.Presenca) + (3 + model.Presenca) * (model.Nex / 5 - 1));
                                model.SanidadeMaxima = (short)(16 + 4 * (model.Nex / 5 - 1));
                            }
                        }
                        else if (model.PontosDeVidaMaximo == 1 && model.ClasseId == (int)enumClasse.Ocultista)
                        {
                            if (model.Nex == 5)
                            {

                                model.PontosDeVidaMaximo = (short)(12 + model.Vigor);
                                model.PontosDeEsforcoMaximo = (short)(4 + model.Presenca);
                                model.SanidadeMaxima = 20;


                            }
                            else
                            {
                                model.PontosDeVidaMaximo = (short)(12 + model.Vigor + (2 + model.Vigor) * (model.Nex / 5 - 1));
                                model.PontosDeEsforcoMaximo = (short)((short)(4 + model.Presenca) + (4 + model.Presenca) * (model.Nex / 5 - 1));
                                model.SanidadeMaxima = (short)(20 + 5 * (model.Nex / 5 - 1));
                            }
                        }

                        DAO.Insert(model);
                    }
                    else
                        DAO.Update(model);

                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action(NomeViewIndex, "Personagem")}";
                    return Redirect(redirectUrl);
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public override IActionResult Create()
        {
            PreparaListaOrigensParaCombo();
            PreparaListaClassesParaCombo();
            PreparaListaPatentesParaCombo();

            ViewBag.Operacao = "I";
            return base.Create();
        }
        public override IActionResult Edit(int id)
        {

            PreparaListaOrigensParaCombo();
            PreparaListaClassesParaCombo();
            PreparaListaPatentesParaCombo();

            ViewBag.Operacao = "A";

            var dao = new TrilhaDAO();
            IEnumerable<TrilhaViewModel> trilhas = dao.Listagem().Where(a => a.Id == DAO.Consulta(id).TrilhaId);
            List<SelectListItem> listaDeTrilhas = new List<SelectListItem>();
            foreach (TrilhaViewModel trilha in trilhas)
            {
                SelectListItem item = new SelectListItem(trilha.Nome, trilha.Id.ToString());
                listaDeTrilhas.Add(item);
            }
            ViewBag.TrilhasAtual = listaDeTrilhas;


            return base.Edit(id);
        }
        private void PreparaListaOrigensParaCombo()
        {
            var origemDao = new OrigemDAO();
            List<OrigemViewModel> origens = origemDao.Listagem();
            var listaDeOrigens = new List<SelectListItem>
            {
                new SelectListItem("Desconhecido", "0")
            };
            foreach (OrigemViewModel origem in origens)
            {
                var item = new SelectListItem(origem.Nome, origem.Id.ToString());
                listaDeOrigens.Add(item);
            }
            ViewBag.Origens = listaDeOrigens;
        }
        private void PreparaListaClassesParaCombo()
        {
            var classeDao = new ClasseDAO();
            List<ClasseViewModel> classes = classeDao.Listagem();
            var listaDeClasses = new List<SelectListItem>
            {
                new SelectListItem("Mundano", "0")
            };
            foreach (ClasseViewModel classe in classes)
            {
                var item = new SelectListItem(classe.Nome, classe.Id.ToString());
                listaDeClasses.Add(item);
            }
            ViewBag.Classes = listaDeClasses;

        }
        private void PreparaListaPatentesParaCombo()
        {
            PatenteDAO dao = new PatenteDAO();
            List<PatenteViewModel> patentes = dao.Listagem();
            List<SelectListItem> listaDePatentes = new List<SelectListItem>
            {
                new SelectListItem("Desconhecido", "0")
            };
            foreach (PatenteViewModel patente in patentes)
            {
                SelectListItem item = new SelectListItem(patente.Nome, patente.Id.ToString());
                listaDePatentes.Add(item);
            }
            ViewBag.Patentes = listaDePatentes;
        }
        public IActionResult PreparaListaTrilhasCombatente()
        {
            var trilhaDao = new TrilhaDAO();
            List<TrilhaViewModel> trilhas = trilhaDao.ListarTrilhasDeCombatente();
            var listaTrilhas = new List<SelectListItem>
            {
                new SelectListItem("Nenhuma", "0")
            };
            foreach (TrilhaViewModel trilha in trilhas)
            {
                SelectListItem item = new SelectListItem(trilha.Nome, trilha.Id.ToString());
                listaTrilhas.Add(item);
            }
            ViewBag.TrilhasCombatente = listaTrilhas;
            return Json(trilhas);
        }
        public IActionResult PreparaListaTrilhasEspecialista()
        {
            var trilhaDao = new TrilhaDAO();
            List<TrilhaViewModel> trilhas = trilhaDao.ListarTrilhasDeEspecialista();
            List<SelectListItem> listaTrilhas = new List<SelectListItem>
            {
                new SelectListItem("Nenhuma", "0")
            };
            foreach (TrilhaViewModel trilha in trilhas)
            {
                SelectListItem item = new SelectListItem(trilha.Nome, trilha.Id.ToString());
                listaTrilhas.Add(item);
            }
            ViewBag.TrilhasEspecialista = listaTrilhas;
            return Json(trilhas);
        }
        public IActionResult PreparaListaTrilhasOcultista()
        {
            TrilhaDAO dao = new TrilhaDAO();
            List<TrilhaViewModel> trilhas = dao.ListarTrilhasDeOcultista();
            List<SelectListItem> listaTrilhas = new List<SelectListItem>
            {
                new SelectListItem("Nenhuma", "0")
            };
            foreach (TrilhaViewModel trilha in trilhas)
            {
                SelectListItem item = new SelectListItem(trilha.Nome, trilha.Id.ToString());
                listaTrilhas.Add(item);
            }
            ViewBag.TrilhasOcultista = listaTrilhas;
            return Json(trilhas);
        }

        [HttpPost]
        public IActionResult CriaDadoPersonalizado(int id, string nome, string dado, bool dano)
        {
            try
            {
                var model = new DadoViewModel();
                var dao = new DadoDAO();
                model.PersonagemId = id;
                model.Nome = nome;
                model.Dado = dado;
                model.Dano = dano;
                dao.Insert(model);
                return Json("Dados Adicionados com sucesso");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }
        }
        [HttpPost]
        public IActionResult AtualizaDadoPersonalizado(string nome, string dado, bool dano)
        {
            try
            {
                var model = new DadoViewModel();
                var dao = new DadoDAO();
                model.Nome = nome;
                model.Dado = dado;
                model.Dano = dano;
                dao.Update(model);
                return Json("Dados Adicionados com sucesso");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }
        }
        [HttpPost]
        public IActionResult AdicionaUm(int id, string caracteristica)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);

                switch (caracteristica)
                {
                    case "vida":
                        model.PontosDeVidaAtual += 1;
                        dao.UpdateVida(model);
                        return Json(model.PontosDeVidaAtual);
                    case "sanidade":
                        model.SanidadeAtual += 1;
                        dao.UpdateSanidade(model);
                        return Json(model.SanidadeAtual);
                    case "pontos de esforço":
                        model.PontosDeEsforcoAtual += 1;
                        dao.UpdatePontosDeEsforco(model);
                        return Json(model.PontosDeEsforcoAtual);
                    default:
                        break;
                }
                return Json("Null");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }
        }
        [HttpPost]
        public IActionResult AdicionaCinco(int id, string caracteristica)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);
                switch (caracteristica)
                {
                    case "vida":
                        model.PontosDeVidaAtual += 5;
                        dao.UpdateVida(model);
                        return Json(model.PontosDeVidaAtual);
                    case "sanidade":
                        model.SanidadeAtual += 5;
                        dao.UpdateSanidade(model);
                        return Json(model.SanidadeAtual);
                    case "pontos de esforço":
                        model.PontosDeEsforcoAtual += 5;
                        dao.UpdatePontosDeEsforco(model);
                        return Json(model.PontosDeEsforcoAtual);
                    default:
                        break;
                }
                return Json("Null");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }
        }
        [HttpPost]
        public IActionResult DiminuiUm(int id, string caracteristica)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);

                switch (caracteristica)
                {
                    case "vida":
                        model.PontosDeVidaAtual--;
                        dao.UpdateVida(model);
                        return Json(model.PontosDeVidaAtual);
                    case "sanidade":
                        model.SanidadeAtual--;
                        dao.UpdateSanidade(model);
                        return Json(model.SanidadeAtual);
                    case "pontos de esforço":
                        model.PontosDeEsforcoAtual--;
                        dao.UpdatePontosDeEsforco(model);
                        return Json(model.PontosDeEsforcoAtual);
                    default:
                        break;
                }
                return Json("Null");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }
        }
        [HttpPost]
        public IActionResult DiminuiCinco(int id, string caracteristica)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);
                switch (caracteristica)
                {
                    case "vida":
                        model.PontosDeVidaAtual -= 5;
                        dao.UpdateVida(model);
                        return Json(model.PontosDeVidaAtual);
                    case "sanidade":
                        model.SanidadeAtual -= 5;
                        dao.UpdateSanidade(model);
                        return Json(model.SanidadeAtual);
                    case "pontos de esforço":
                        model.PontosDeEsforcoAtual -= 5;
                        dao.UpdatePontosDeEsforco(model);
                        return Json(model.PontosDeEsforcoAtual);
                    default:
                        break;
                }
                return Json("Null");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }
        }

        [HttpPost]
        public IActionResult AtualizaVida(int id, short vida)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);
                model.PontosDeVidaAtual = vida;
                dao.UpdateVida(model);
                return Json("Dados salvos com sucesso!!");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }

        }
        [HttpPost]
        public IActionResult AtualizaSanidade(int id, short sanidade)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);
                model.SanidadeAtual = sanidade;
                dao.UpdateSanidade(model);
                return Json("Dados salvos com sucesso!!");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }

        }
        [HttpPost]
        public IActionResult AtualizaPe(int id, short pe)
        {
            try
            {
                var dao = new PersonagemDAO();
                PersonagemViewModel model = DAO.Consulta(id);
                model.PontosDeEsforcoAtual = pe;
                dao.UpdatePontosDeEsforco(model);
                return Json("Dados salvos com sucesso!!");
            }
            catch (Exception e)
            {
                return Json(e.ToString());
            }

        }
        [HttpPost]
        public IActionResult Ritual(int id)
        {
            TempData["Personagem"] = JsonConvert.SerializeObject(id);

            var pathBase = HttpContext.Request.Host;
            var protocol = HttpContext.Request.Scheme;
            var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Create", "Ritual")}";
            return Redirect(redirectUrl);
        }
        [HttpPost]
        public IActionResult Arma(int armaId)
        {
            TempData["ArmaId"] = JsonConvert.SerializeObject(armaId);
            var pathBase = HttpContext.Request.Host;
            var protocol = HttpContext.Request.Scheme;
            var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Create", "Arma")}";
            return Redirect(redirectUrl);
        }
        [HttpPost]
        public IActionResult Item(int itemId)
        {
            TempData["ItemId"] = JsonConvert.SerializeObject(itemId);
            var pathBase = HttpContext.Request.Host;
            var protocol = HttpContext.Request.Scheme;
            var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Create", "Item")}";
            return Redirect(redirectUrl);
        }
    }
}
