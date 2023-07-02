using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class ItensDAO : PadraoDAO<ItensViewModel>
    {
        protected override SqlParameter[] CriaParametros(ItensViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("descricao",model.Descricao),
                new SqlParameter("espaco",model.Espaco),
                new SqlParameter("categoria",model.Categoria),
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(ItensViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("descricao",model.Descricao),
                new SqlParameter("espaco",model.Espaco),
                new SqlParameter("categoria",model.Categoria),
                new SqlParameter("personagem_id",model.PersonagemId)
            };
            return parametros;
        }

        protected override ItensViewModel MontaModel(DataRow registro)
        {
            var model = new ItensViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Descricao = registro["descricao"].ToString(),
                Espaco = Convert.ToInt32(registro["espaco"]),
                Categoria = registro["categoria"].ToString(),
                PersonagemId = Convert.ToInt32(registro["personagem_id"]),
            };
            return model;
        }
        public List<ItensViewModel> ListarItensPorPersonagem(int personagemId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", personagemId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaItens", parametro);
            var lista = new List<ItensViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        protected override void SetTabela()
        {
            Tabela = "Itens";
        }
        public int PesoItens(int id)
        {
            var parametro = new SqlParameter[]
           {
                new SqlParameter("p_id",id)
           };
            var tabela = HelperDAO.ExecutaProcedureSelect("spListaPesoItens", parametro);
            if (tabela.Rows.Count == 0 || string.IsNullOrEmpty(tabela.Rows[0].ItemArray[0].ToString()))
                return 0;
            else
            {
                return Convert.ToInt32(tabela.Rows[0].ItemArray[0]);
            }
        }
        public void Deletar(int id)
        {
            var parametro = new SqlParameter[]
          {
                new SqlParameter("id", id)
          };
            HelperDAO.ExecutaProcedure("spDeletarItem", parametro);
        }
    }
}
