using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class RituaisDAO : PadraoDAO<RituaisViewModel>
    {
        protected override SqlParameter[] CriaParametros(RituaisViewModel model)
        {
            object resistencia = model.Resistencia;
            object discente = model.Discente;
            object verdadeiro = model.Verdadeiro;

            if (resistencia == null)
                resistencia = DBNull.Value;
            if (discente == null)
                discente = DBNull.Value;
            if (verdadeiro == null)
                verdadeiro = DBNull.Value;

            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("alcance",model.Alcance),
                new SqlParameter("efeito",model.Efeito),
                new SqlParameter("circulo",model.Circulo),
                new SqlParameter("elemento",model.Elemento),
                new SqlParameter("resistencia",resistencia),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("duracao",model.Duracao),
                new SqlParameter("execucao",model.Execucao),
                new SqlParameter("discente",discente),
                new SqlParameter("verdadeiro",verdadeiro)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(RituaisViewModel model)
        {
            object resistencia = model.Resistencia;
            object discente = model.Discente;
            object verdadeiro = model.Verdadeiro;

            if (resistencia == null)
                resistencia = DBNull.Value;
            if (discente == null)
                discente = DBNull.Value;
            if (verdadeiro == null)
                verdadeiro = DBNull.Value;

            SqlParameter[] parametros =
            {
                new SqlParameter("alcance",model.Alcance),
                new SqlParameter("efeito",model.Efeito),
                new SqlParameter("circulo",model.Circulo),
                new SqlParameter("elemento",model.Elemento),
                new SqlParameter("resistencia",resistencia),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("duracao",model.Duracao),
                new SqlParameter("execucao",model.Execucao),
                new SqlParameter("discente",discente),
                new SqlParameter("verdadeiro",verdadeiro)
            };
            return parametros;
        }

        protected override RituaisViewModel MontaModel(DataRow registro)
        {
            var model = new RituaisViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Elemento = registro["elemento"].ToString(),
                Duracao = registro["duracao"].ToString(),
                Alcance = registro["alcance"].ToString(),
                Circulo = Convert.ToInt16(registro["circulo"]),
                Efeito = registro["efeito"].ToString(),
                Execucao = registro["execucao"].ToString()
            };
            if (registro["resistencia"] != DBNull.Value)
                model.Resistencia = registro["resistencia"].ToString();
            if (registro["discente"]!=DBNull.Value)
                model.Discente= registro["discente"].ToString();
            if (registro["verdadeiro"] != DBNull.Value)
                model.Verdadeiro = registro["verdadeiro"].ToString();
            return model;
        }
        public List<RituaisViewModel> ListarRituaisPorPersonagem(int personagemId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("Personagem_id", personagemId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaRituais", parametro);
            var lista = new List<RituaisViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        protected override void SetTabela()
        {
            Tabela = "Rituais";
        }
    }
}
