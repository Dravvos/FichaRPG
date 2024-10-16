namespace FichaRPG.Models
{
    public class CampanhaViewModel : PadraoViewModel
    {
        public string? Nome { get; set; }
        public string? Descricao { get; set; }
        public byte[]? FotoCapaEmByte { get; set; }
        public IFormFile? FotoCapa { get; set; }
        public string? FotoCapaBase64
        {
            get
            {
                if (FotoCapaEmByte != null)
                    return Convert.ToBase64String(FotoCapaEmByte);
                else
                    return string.Empty;
            }
        }
    }
}
