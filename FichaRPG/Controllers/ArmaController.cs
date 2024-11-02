using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;

namespace FichaRPG.Controllers
{
    public class ArmaController : PadraoController<ArmasViewModel>
    {
        public ArmaController()
        {
            DAO = new ArmasDAO();
            GeraProximoId = false;
            ExigeAutenticacao = true;
        }
        [HttpGet]
        public override IActionResult Create()
        {
            if (TempData["ArmaId"] != null)
            {
                ViewBag.Personagem = JsonConvert.DeserializeObject(TempData["ArmaId"].ToString());

                return base.Create();
            }
            return Json("ERRO! ArmaId está nulo");
        }
        protected override void ValidaDados(ArmasViewModel model, string operacao)
        {
            if (model.Categoria.IndexOf("I") == -1 || !model.Categoria.Contains("I"))
                ModelState.AddModelError("categoria", "Digite a categoria como números romanos (I, II, III, IV ou 0)");
            if (string.Equals(model.Categoria, "0"))
                ModelState.Remove("categoria");
            if (model.Dano.IndexOf('d')==-1)
                ModelState.AddModelError("dano", "Digite o formato correto de dano da arma. Ex:2d8+6");
            if (model.Critico.IndexOf('d') == -1)
                ModelState.AddModelError("critico", "Digite o formato correto de dano crítico da arma. Ex:4d8+6");
            if (model.Espaco<0)
                ModelState.AddModelError("espaco", "Digite o espaço que o item ocupa");
            if (!string.Equals(operacao,"I"))
                ModelState.Remove("PersonagemId");

        }
        public override IActionResult Save(ArmasViewModel model, string operacao)
        {

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
                    if (string.Equals(operacao , "I"))
                        DAO.Insert(model);
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
        public override IActionResult Delete(int id)
        {
            try
            {
                DAO.Delete(id);
                var pathBase = HttpContext.Request.Host;
                var protocol = HttpContext.Request.Scheme;
                var redirectUrl = $"{protocol}://{pathBase}{Url.Action(NomeViewIndex, "Personagem")}";
                return Redirect(redirectUrl);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
    }
}
