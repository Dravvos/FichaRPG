namespace FichaRPG.Models
{
    public class DadoViewModel:PadraoViewModel
    {
        public string? Nome { get; set; }
        public string Dado { get; set; }
        public int PersonagemId { get; set; }
        public bool Dano { get; set; }
    }
}
