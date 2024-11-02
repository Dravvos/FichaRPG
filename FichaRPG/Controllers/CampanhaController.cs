using FichaRPG.DAO;
using FichaRPG.Models;
using Microsoft.AspNetCore.Mvc;

namespace FichaRPG.Controllers
{
    public class CampanhaController : PadraoController<CampanhaViewModel>
    {
        public CampanhaController()
        {
            DAO = new CampanhaDAO();
            GeraProximoId = false;
            ExigeAutenticacao = true;
        }

        public override IActionResult Index()
        {
            ViewBag.Usuario = UsuarioLogado;
            var campanhas = new CampanhaDAO().ObterCampanhasPorUsuario(UsuarioLogado.Id);
            return View(campanhas);
        }

        public override IActionResult Save(CampanhaViewModel model, string operacao)
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
                    if (string.Equals(operacao, "I"))
                    {
                        var campanhaUsuarioModel = new CampanhaUsuarioViewModel();
                        campanhaUsuarioModel.UsuarioId = UsuarioLogado.Id;
                        if (Equals(DAO.ProximoId() - 1, 0))
                        {
                            campanhaUsuarioModel.CampanhaId = DAO.ProximoId();
                        }

                        DAO.Insert(model);
                        campanhaUsuarioModel.CampanhaId = DAO.ProximoId() - 1;
                        new CampanhaUsuarioDAO().Insert(campanhaUsuarioModel);
                    }
                    else
                        DAO.Update(model);

                    return RedirectToAction("Index", "Campanha");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public IActionResult DesatribuirUsuarioCampanha(int id)
        {
            var dao = new CampanhaUsuarioDAO();
            dao.Delete(id);
            return RedirectToAction("Index", "Campanha");
        }

        public IActionResult DesatribuirPersonagemCampanha(int id)
        {
            var dao = new CampanhaPersonagemDAO();
            dao.Delete(id);
            return RedirectToAction("Index", "Campanha");
        }

        public IActionResult AtribuirCampanhaUsuario(int usuarioId, int campanhaId)
        {
            var dao = new CampanhaUsuarioDAO();
            var model = new CampanhaUsuarioViewModel();
            model.CampanhaId = campanhaId;
            model.UsuarioId = usuarioId;
            dao.Insert(model);
            return RedirectToAction("Details", "Campanha", campanhaId);
        }

        public IActionResult AtribuirCampanhaPersonagem(int personagemId, int campanhaId)
        {
            var dao = new CampanhaPersonagemDAO();
            var model = new CampanhaPersonagemViewModel();
            model.CampanhaId = campanhaId;
            model.PersonagemId = personagemId;
            dao.Insert(model);
            return RedirectToAction("Details", "Campanha", campanhaId);
        }

        public override IActionResult Delete(int id)
        {
            try
            {
                var daoU = new CampanhaUsuarioDAO();
                var daoP = new CampanhaPersonagemDAO();
                var campanhasUsuario = daoU.ObterUsuariosDeUmaCampanha(id);
                foreach (var cu in campanhasUsuario)
                {
                    daoU.Delete(cu.Id);
                }
                var campanhasPersonagem = daoP.ObterPersonagensDeUmaCampanha(id);
                foreach (var cp in campanhasPersonagem)
                {
                    daoP.Delete(cp.Id);
                }
                DAO.Delete(id);
                return RedirectToAction("Index", "Campanha");
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public override IActionResult Create()
        {
            ViewBag.Operacao = "I";
            return base.Create();
        }

        public IActionResult Details(int id)
        {
            try
            {
                var model = DAO.Consulta(id);
                if (model == null)
                {
                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Campanha")}";
                    return Redirect(redirectUrl);
                }

                var campanhaUsuarioDao = new CampanhaUsuarioDAO();
                var campanhaPersonagemDao = new CampanhaPersonagemDAO();

                if (model != null)
                {
                    var campanhasUsuario = campanhaUsuarioDao.ObterUsuariosDeUmaCampanha(id);
                    if (campanhasUsuario.Select(x => x.UsuarioId).Contains(UsuarioLogado.Id) == false)
                    {
                        return RedirectToAction("Index", "Campanha");
                    }

                    ViewBag.User = UsuarioLogado.Nome;
                    ViewBag.Usuario = UsuarioLogado.Id;

                    return View("Details", model);
                }
                else
                {
                    var pathBase = HttpContext.Request.Host;
                    var protocol = HttpContext.Request.Scheme;
                    var redirectUrl = $"{protocol}://{pathBase}{Url.Action("Index", "Campanha")}";
                    return Redirect(redirectUrl);
                }
            }
            catch (Exception ex)
            {
                return View("Error", new ErrorViewModel(ex.ToString()));
            }
        }

        public IActionResult PersonagensParaCampanha(int campanhaId)
        {
            try
            {
                ViewBag.Usuario = UsuarioLogado.Id;
                ViewBag.CampanhaId = campanhaId;
                var personagem = new PersonagemDAO();
                List<PersonagemViewModel> cadastrado = personagem.ListarPersonagensPorUsuario(UsuarioLogado.Id);
                if (cadastrado != null)
                    return View(cadastrado);
                else
                {
                    return RedirectToAction("Create", "Campanha");
                }
            }
            catch (Exception erro)
            {
                return View("Error", new ErrorViewModel(erro.ToString()));
            }
        }

        public override IActionResult Edit(int id)
        {
            ViewBag.Operacao = "A";
            return base.Edit(id);
        }

        public byte[]? ConvertImageToByte(IFormFile? file)
        {
            if (file != null)
            {
                using (var ms = new MemoryStream())
                {
                    file.CopyTo(ms);
                    return ms.ToArray();
                }
            }
            else
                return null;
        }

        protected override void ValidaDados(CampanhaViewModel model, string operacao)
        {
            ModelState.Clear();
            if (string.IsNullOrEmpty(model.Nome))
                ModelState.AddModelError("Nome", "Preencha o nome da campanha");

            if (model.FotoCapa != null && model.FotoCapa.Length / 1024 / 1024 >= 10)
                ModelState.AddModelError("FotoCapa", "Imagem limitada a 10 mb.");

            if (ModelState.IsValid)
            {
                //na alteração, se não foi informada a imagem, iremos manter a que já estava salva.
                if (operacao == "A" && model.FotoCapa == null)
                {
                    CampanhaViewModel cid = DAO.Consulta(model.Id);
                    model.FotoCapaEmByte = cid.FotoCapaEmByte;
                }
                else
                {
                    model.FotoCapaEmByte = ConvertImageToByte(model.FotoCapa);
                }
            }
        }
    }
}
