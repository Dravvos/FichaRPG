using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace FichaRPG.Controllers
{
    public class RitualController : PadraoController<RituaisViewModel>
    {

        public RitualController()
        {
            ExigeAutenticacao = true;
            DAO = new RituaisDAO();
        }
        [HttpGet]
        public override IActionResult Create()
        {
            if (TempData["Personagem"] != null)
            {
                ViewBag.Operacao = "I";
                ViewBag.Personagem = JsonConvert.DeserializeObject(TempData["Personagem"].ToString());
            }
            return base.Create();
        }
        protected override void ValidaDados(RituaisViewModel model, string operacao)
        {
            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Digite o nome do ritual");
            if (string.IsNullOrEmpty(model.Elemento))
                ModelState.AddModelError("Elemento", "Digite o elemento do ritual");
            if (model.Circulo <= 0)
                ModelState.AddModelError("Circulo", "Digite o círculo do ritual");
            if (model.Circulo > 4)
                ModelState.AddModelError("Circulo", "Rituais só podem ser de até 4° círculo");
            if (string.IsNullOrEmpty(model.Execucao))
                ModelState.AddModelError("Execucao", "Digite o modo execução");
            if (string.IsNullOrEmpty(model.Alcance))
                ModelState.AddModelError("Alcance", "Digite o alcance do ritual");
            if (string.IsNullOrEmpty(model.Duracao))
                ModelState.AddModelError("Duracao", "Digite a duracao do ritual");

        }
        public override IActionResult Save(RituaisViewModel model, string operacao)
        {

            int personagemId = Convert.ToInt32(Request.Form["Persona-id"]);
            try
            {
                ValidaDados(model, operacao);
                if (ModelState.IsValid == false)
                {
                    ViewBag.Operacao = operacao;
                    return View(NomeViewForm, model);
                }
                else
                {
                    if (string.Equals(operacao, "I"))
                    {
                        try
                        {
                            var relacaoRitualModel = new RelacaoRitualViewModel();
                            var relacaoRitualDao = new RelacaoRitualDAO();
                            relacaoRitualModel.PersonagemId = personagemId;

                            if (Equals(DAO.ProximoId() - 1,0))
                            {
                                relacaoRitualModel.RitualId = DAO.ProximoId();
                                relacaoRitualModel.Id = DAO.ProximoId();
                            }
                            DAO.Insert(model);

                            relacaoRitualModel.RitualId = DAO.ProximoId() - 1;
                            relacaoRitualDao.Insert(relacaoRitualModel);

                        }
                        catch (Exception e)
                        {
                            return View("Error", new ErrorViewModel(e.ToString()));
                        }
                    }
                    else
                        DAO.Update(model);

                    return RedirectToAction("Index", "Personagem");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public IActionResult Editar(int id, int personagemId)
        {
            ViewBag.Personagem = personagemId;


            return base.Edit(id);
        }

    }
}
