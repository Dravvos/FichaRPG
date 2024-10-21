using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using System;

namespace FichaRPG.Controllers
{
    public class UsuarioController : PadraoController<UsuarioViewModel>
    {
        public UsuarioController()
        {
            DAO = new UsuarioDAO();
            GeraProximoId = false;
            ExigeAutenticacao=false;
        }
        public override IActionResult Create()
        {
            ViewBag.Operacao = "I";
            return base.Create();
        }
        public override IActionResult Save(UsuarioViewModel model, string operacao)
        {
            try
            {

                model.SetSenhaHash(); 
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

                    return RedirectToAction("Index","Login");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        protected override void ValidaDados(UsuarioViewModel model, string operacao)
        {
            if (string.Equals(operacao, "I") &&
                model.UsuarioLogin != null &&
                (DAO as UsuarioDAO).VerificaSeUsuarioEstaCadastrado(model.UsuarioLogin))
                ModelState.AddModelError("usuarioLogin", "Esse usuário já existe");

           

            if (string.Equals(operacao, "A"))
            {
                ModelState.Remove("usuarioLogin");
                ModelState.Remove("senha");

                if (model.UsuarioLogin == null)
                    ModelState.AddModelError("Usuario", "O login de usuário foi alterado");

                if (model.Senha == null)
                    ModelState.AddModelError("Senha", "A senha do usuário foi alterada");
            }
        }
    }
}
