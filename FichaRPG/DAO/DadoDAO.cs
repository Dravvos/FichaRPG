using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class DadoDAO : PadraoDAO<DadoViewModel>
    {
        protected override SqlParameter[] CriaParametros(DadoViewModel model)
        {
            object nome = model.Nome;
            if (nome == null)
                nome = DBNull.Value;
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",nome),
                new SqlParameter("dado",model.Dado),
                new SqlParameter("Personagem_id",model.PersonagemId),
                new SqlParameter("is_damage",model.Dano)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(DadoViewModel model)
        {

            object nome = model.Nome;
            if (nome == null)
                nome = DBNull.Value;
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",nome),
                new SqlParameter("dado",model.Dado),
                new SqlParameter("Personagem_id",model.PersonagemId),
                new SqlParameter("is_damage",model.Dano)
            };
            return parametros;
        }

        protected override DadoViewModel MontaModel(DataRow registro)
        {
            var model = new DadoViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Dado = registro["dado"].ToString(),
                PersonagemId = Convert.ToInt32(registro["Personagem_id"]),
                Dano = Convert.ToBoolean(registro["dano"])
            };
            if (registro["nome"] != DBNull.Value)
                model.Nome = registro["nome"].ToString();

            return model;
        }
        public List<DadoViewModel> ListaDadosPorPersonagem(int personagemId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("Personagem_id", personagemId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaDado", parametro);
            var lista = new List<DadoViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        public void DeletarDadosPorPersonagem(int personagemId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", personagemId)
            };
            HelperDAO.ExecutaProcedure("spDeleteDados", parametro);
        }
        protected override void SetTabela()
        {
            Tabela = "Dados";
        }
    }
}
