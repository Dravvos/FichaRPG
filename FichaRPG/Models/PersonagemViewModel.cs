using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;

namespace FichaRPG.Models
{
    public class PersonagemViewModel:PadraoViewModel
    {
        public int UsuarioId { get; set; }
        public string Nome { get; set; }
        public short Idade { get; set; }
        public string? LocalNascimento { get; set; }
        public short Nex { get; set; }
        public short Forca { get; set; }
        public short Vigor { get; set; }
        public short Intelecto { get; set; }
        public short Presenca { get; set; }
        public short Agilidade { get; set; }
        public short Defesa { get; set; }
        public IFormFile Imagem { get; set; }
        public byte[]? ImagemEmByte { get; set; }
        public string ImagemEmBase64
        {
            get
            {
                if (ImagemEmByte != null)
                    return Convert.ToBase64String(ImagemEmByte);
                else
                    return string.Empty;
            }
        }
        public string? Historia { get; set; }
        public string? Aparencia { get; set; }
        public string? Personalidade { get; set; }
        public string? DoencaFobiaMania { get; set; }
        public string? Favoritos { get; set; }
        public string? Anotacoes { get; set; }
        public int OrigemId { get; set; }
        public short Deslocamento { get; set; } = 9;
        public short PontosDeVidaMaximo { get; set; }
        public short PontosDeVidaAtual { get; set; }
        public short SanidadeMaxima { get; set; }
        public short SanidadeAtual { get; set; }
        public short PontosDeEsforcoAtual { get; set; }
        public short PontosDeEsforcoMaximo { get; set; }
        public int PatenteId { get; set; }
        public int ClasseId { get; set; }
        public int? TrilhaId { get; set; }
        public short Acrobacia {get; set; }
	    public short Adestramento {get; set; }
	    public short Artes {get; set; }
	    public short Atletismo {get; set; }
	    public short Atualidades {get; set; }
	    public short Ciencias {get; set; }
	    public short Crime {get; set; }
	    public short Diplomacia {get; set; }
	    public short Enganacao {get; set; }
	    public short Fortitude {get; set; }
	    public short Furtividade {get; set; }
	    public short Iniciativa {get; set; }
	    public short Intimidacao {get; set; }
	    public short Intuicao {get; set; }
	    public short Investigacao {get; set; }
	    public short Luta {get; set; }
	    public short Medicina {get; set; }
	    public short Ocultismo {get; set; }
	    public short Percepcao {get; set; }
	    public short Pilotagem {get; set; }
	    public short Pontaria {get; set; }
	    public short Profissao {get; set; }
	    public short Reflexos {get; set; }
	    public short Religiao {get; set; }
	    public short Sobrevivencia {get; set; }
	    public short Tatica {get; set; }
	    public short Tecnologia {get; set; }
	    public short Vontade { get; set; }
    }
}
