using FichaRPG.Services;
using System.ComponentModel.DataAnnotations;

namespace FichaRPG.Models
{
    public class UsuarioViewModel:PadraoViewModel
    {
        public string Nome { get; set; }
        public string UsuarioLogin { get; set; }
        public string Senha { get; set; }
        public bool SenhaValida(string senha)
        {
            return Senha == senha;
        }
        public void SetSenhaHash()
        {
            Senha = EncriptionService.EncriptarString(Senha);
        }
    }
}
