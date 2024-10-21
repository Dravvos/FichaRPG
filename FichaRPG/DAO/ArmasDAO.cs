using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class ArmasDAO : PadraoDAO<ArmasViewModel>
    {
        protected override SqlParameter[] CriaParametros(ArmasViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("alcance",model.Alcance),
                new SqlParameter("critico",model.Critico),
                new SqlParameter("dano",model.Dano),
                new SqlParameter("tipo",model.Tipo),
                new SqlParameter("categoria",model.Categoria),
                new SqlParameter("espaco",model.Espaco)

            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(ArmasViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("alcance",model.Alcance),
                new SqlParameter("critico",model.Critico),
                new SqlParameter("dano",model.Dano),
                new SqlParameter("personagem_id",model.PersonagemId),
                new SqlParameter("tipo",model.Tipo),
                new SqlParameter("categoria",model.Categoria),
                new SqlParameter("espaco",model.Espaco)
            };
            return parametros;
        }

        protected override ArmasViewModel MontaModel(DataRow registro)
        {
            var model = new ArmasViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Dano = registro["dano"].ToString(),
                Alcance = registro["alcance"].ToString(),
                Critico = registro["critico"].ToString(),
                PersonagemId = Convert.ToInt32(registro["personagem_id"]),
                Tipo = registro["tipo"].ToString(),
                Categoria = registro["categoria"].ToString(),
                Espaco = Convert.ToInt32(registro["espaco"])
            };
            return model;
        }
        public List<ArmasViewModel> Listar(int id)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", id),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaArmas", parametro);
            var lista = new List<ArmasViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        protected override void SetTabela()
        {
            Tabela = "Armas";
        }
        public int PesoArmas(int id)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("p_id",id)
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaPesoArmas", parametro);
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
            HelperDAO.ExecutaProcedure("spDeletarArma", parametro);
        }
    }
}
