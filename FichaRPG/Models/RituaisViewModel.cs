namespace FichaRPG.Models
{
    public class RituaisViewModel:PadraoViewModel
    {
        public string Nome { get; set; }
        public string Elemento { get; set; }
        public short Circulo { get; set; }
        public string Execucao { get; set; }
        public string Alcance { get; set; }
        public string Efeito { get; set; }

        public string Duracao { get; set; }
        public string? Resistencia { get; set; }
        public string? Discente { get; set; }
        public string? Verdadeiro { get; set; }
    }
}
