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
            if (HttpContext.Session.GetInt32("RitualId") != 0 && HttpContext.Session.GetInt32("RitualId") != null)
            {
                ViewBag.Personagem = HttpContext.Session.GetInt32("RitualId");

                return base.Create();
            }
            return Json("ERRO! PersonagemId está nulo");
        }
        protected override void ValidaDados(RituaisViewModel model, string operacao)
        {
            ModelState.Clear();
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
            try
            {
                int personagemId = Convert.ToInt32(HttpContext.Session.GetInt32("RitualId"));
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
        public override IActionResult Delete(int id)
        {
            try
            {
                DAO.Delete(id);
                return RedirectToAction("Details", "Personagem", new { id = HttpContext.Session.GetInt32("PersonagemId") });
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

    }
}
