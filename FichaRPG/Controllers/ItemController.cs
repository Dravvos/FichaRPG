﻿using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;

namespace FichaRPG.Controllers
{
    public class ItemController : PadraoController<ItensViewModel>
    {
        public ItemController()
        {
            DAO = new ItensDAO();
            GeraProximoId = false;
            ExigeAutenticacao = true;
        }
        [HttpGet]
        public override IActionResult Create()
        {
            if (HttpContext.Session.GetInt32("ItemId") != 0 && HttpContext.Session.GetInt32("ItemId") != null)
            {
                ViewBag.Personagem = HttpContext.Session.GetInt32("ItemId");

                return base.Create();
            }
            return base.Create();
        }
        public IActionResult Editar(int id, int personagemId)
        {

            ViewBag.Personagem = personagemId;

            return base.Edit(id);

        }
        protected override void ValidaDados(ItensViewModel model, string operacao)
        {
            ModelState.Clear();
            if (model.Espaco < 0)
                ModelState.AddModelError("espaco", "Digite quanto de espaco o item ocupa");
            if (model.Categoria.IndexOf("I") == -1 || !model.Categoria.Contains("I"))
                ModelState.AddModelError("categoria", "Digite a categoria como números romanos (I, II, III ou IV)");
            if (string.Equals(model.Categoria, "0"))
                ModelState.Remove("categoria");
            if (!string.Equals(operacao, "I"))
                ModelState.Remove("PersonagemId");
        }
        public override IActionResult Save(ItensViewModel model, string operacao)
        {
            ModelState.Clear();
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
                        DAO.Insert(model);
                    else
                        DAO.Update(model);

                    return RedirectToAction("Details", "Personagem", new { id = model.PersonagemId });
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
                return RedirectToAction("Details", "Personagem", new { id = HttpContext.Session.GetInt32("PersonagemId") });
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
    }
}
