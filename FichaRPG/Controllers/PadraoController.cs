using FichaRPG.Models;
using FichaRPG.DAO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System;
using Microsoft.AspNetCore.Mvc.Filters;
using FichaRPG.Services;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;

namespace FichaRPG.Controllers
{
   
    public class PadraoController<T> : Controller where T : PadraoViewModel
    {
        protected bool ExigeAutenticacao { get; set; } = true;
        protected PadraoDAO<T> DAO { get; set; }
        protected bool GeraProximoId { get; set; }
        protected string NomeViewIndex { get; set; } = "Index";
        protected string NomeViewForm { get; set; } = "Form";
        protected UsuarioViewModel UsuarioLogado { get; set; }
        public virtual IActionResult Index()
        {
            try
            {
                List<T> lista = DAO.Listagem();
                return View(NomeViewIndex, lista);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public virtual IActionResult Create()
        {
            try
            {
                ViewBag.Operacao = "I";
                T model = Activator.CreateInstance(typeof(T)) as T;
                return View(NomeViewForm, model);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public virtual IActionResult Save(T model, string operacao)
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
                    if (operacao == "I")
                        DAO.Insert(model);
                    else
                        DAO.Update(model);

                    return RedirectToAction(NomeViewIndex);
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        protected virtual void ValidaDados(T model, string operacao)
        {
            ModelState.Clear();
            if (string.Equals(operacao, "I") && DAO.Consulta(model.Id) != null)
                ModelState.AddModelError("Id", "Código já está em uso!");
            if (string.Equals(operacao, "A") && DAO.Consulta(model.Id) == null)
                ModelState.AddModelError("Id", "Este registro não existe!");
            if (model.Id <= 0)
                ModelState.AddModelError("Id", "Id inválido!");
        }
        public virtual IActionResult Edit(int id)
        {
            try
            {
                ViewBag.Operacao = "A";
                var model = DAO.Consulta(id);
                if (model == null)
                    return RedirectToAction(NomeViewIndex);
                else
                {
                    return View(NomeViewForm, model);
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public virtual IActionResult Delete(int id)
        {
            try
            {
                DAO.Delete(id);
                return RedirectToAction(NomeViewIndex);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public override void OnActionExecuting(ActionExecutingContext contexto)
        {
            try
            {
                UsuarioViewModel usuarioEmCache = SessionService.RecuperaCache<UsuarioViewModel>(HttpContext, "Usuario");
                if (usuarioEmCache != null)
                {
                    ViewBag.User = usuarioEmCache;
                    UsuarioLogado = usuarioEmCache;
                }
                if (ExigeAutenticacao && !HelperControllers.VerificaUsuarioLogado(HttpContext.Session))
                {
                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Login")}";
                    contexto.Result = Redirect(redirectUrl);

                }
                else if(!ExigeAutenticacao && !HelperControllers.VerificaUsuarioLogado(HttpContext.Session))
                {
                    ViewBag.Logado = false;
                    base.OnActionExecuting(contexto);
                }
                else if (ExigeAutenticacao&& HelperControllers.VerificaUsuarioLogado(HttpContext.Session))
                {
                    ViewBag.Logado = true;
                    base.OnActionExecuting(contexto);
                }
            }
            catch(Exception erro)
            {
                contexto.Result = View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
    }
}
