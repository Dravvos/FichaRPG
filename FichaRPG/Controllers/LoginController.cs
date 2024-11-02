using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.AspNetCore.Http;
using FichaRPG.DAO;
using FichaRPG.Services;

namespace FichaRPG.Controllers
{
    public class LoginController : Controller
    {
        UsuarioDAO DAO = new UsuarioDAO();
        public IActionResult Index()
        {
            ViewBag.Logado = HelperControllers.VerificaUsuarioLogado(HttpContext.Session);
            return View();
        }
        public IActionResult Login(UsuarioViewModel model)
        {
            try
            {
                UsuarioDAO dao = new UsuarioDAO();
                ValidaDados(model);
                if (ModelState.IsValid == true)
                {
                    if (model != null&&!string.IsNullOrEmpty(model.Senha))
                    {
                        model.SetSenhaHash();
                        bool SenhaValida = model.SenhaValida(model.Senha);
                        bool v = dao.VerificaSeUsuarioESenhaCorrespondem(ref model);

                        if (SenhaValida && v)
                        {
                            SessionService.SalvaCache<UsuarioViewModel>(HttpContext, "Usuario", model);
                            HttpContext.Session.SetString("Logado", "true");
                            var pathBase = HttpContext.Request.Host;
                            var protocol = HttpContext.Request.Scheme;
                            var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Personagem")}";
                            
                            return Redirect(redirectUrl);
                        }
                        else
                        {
                            ViewBag.Erro = "Usuário e/ou senha inválidos";
                            return View("Index");
                        }
                    }
                    else
                        return Json("Algo deu errado");
                }
                else
                {
                    return View("Index");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }

        }

        private void ValidaDados(UsuarioViewModel model)
        {
            ModelState.Clear();
            if (string.IsNullOrEmpty(model.UsuarioLogin))
                ModelState.AddModelError("UsuarioLogin", "Digite seu email/nome de usuário");
            if (string.IsNullOrEmpty(model.Senha))
                ModelState.AddModelError("Senha", "Digite sua senha");
        }
        public IActionResult LogOff()
        {
            try 
            {
                SessionService.SalvaCache<UsuarioViewModel>(HttpContext, "Usuario", null);
                HttpContext.Session.Clear();
                var pathBase = HttpContext.Request.Host;
                var protocol = HttpContext.Request.Scheme;
                var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Login")}";
                return Redirect(redirectUrl);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
    }
}
