using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace FichaRPG.Services
{
    public class SessionService
    {
        public static void SalvaCache<T>(HttpContext contexto,string chave, T valor)
        {
            var ValorSerializado = JsonConvert.SerializeObject(valor);
            contexto.Session.SetString(chave, ValorSerializado);
        }
        public static T RecuperaCache<T>(HttpContext contexto,string chave)
        {
            var ValorEmCache = contexto.Session.GetString(chave);
            if (ValorEmCache == null)
                return default(T);
            return JsonConvert.DeserializeObject<T>(ValorEmCache);
        }
    }
}
