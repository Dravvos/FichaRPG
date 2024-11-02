using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;
using System;

namespace FichaRPG.Controllers
{
    public class RelacaoRitualController : PadraoController<RelacaoRitualViewModel>
    {
        public RelacaoRitualController()
        {
            DAO = new RelacaoRitualDAO();
            ExigeAutenticacao = true;
            GeraProximoId = false;
        }
        public IActionResult Deletar(int personagemId,int ritualId)
        {
            try
            {
                var dao = new RelacaoRitualDAO();
                dao.Deletar(personagemId,ritualId);
                var pathBase = HttpContext.Request.Host;
                var protocol = HttpContext.Request.Scheme;
                var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Personagem")}";
                return Redirect(redirectUrl);
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }
        public override IActionResult Save(RelacaoRitualViewModel model, string operacao)
        {
            return base.Save(model, operacao);
        }

    }
}
