namespace FichaRPG.Models
{
    public class ItensViewModel:PadraoViewModel
    {
        public string Nome { get; set; }
        public string Descricao { get; set; }
        public int Espaco { get; set; }
        public string Categoria { get; set; }
        public int PersonagemId { get; set; }
    }
}
