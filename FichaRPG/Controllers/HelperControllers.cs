using Microsoft.AspNetCore.Http;

namespace FichaRPG.Controllers
{
    public class HelperControllers
    {
        public static bool VerificaUsuarioLogado(ISession session)
        {
            string logado = session.GetString("Logado");
            if (string.IsNullOrEmpty(logado))
                return false;
            else
                return true;
        }
    }
}
