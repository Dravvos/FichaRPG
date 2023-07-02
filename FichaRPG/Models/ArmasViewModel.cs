namespace FichaRPG.Models
{
    public class ArmasViewModel : PadraoViewModel
    {
        public string Nome { get; set; }
        public string Dano { get; set; }
        public string Alcance { get; set; }
        public string? Tipo { get; set; }
        public string Critico { get; set; }
        public int PersonagemId { get; set; }
        public int Espaco { get; set; }
        public string Categoria { get; set; }
    }
}
