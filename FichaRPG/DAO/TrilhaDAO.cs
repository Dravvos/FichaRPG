using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class TrilhaDAO : PadraoDAO<TrilhaViewModel>
    {
        protected override SqlParameter[] CriaParametros(TrilhaViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("classe_id",model.ClasseId)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(TrilhaViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("classe_id",model.ClasseId)
            };
            return parametros;
        }

        protected override TrilhaViewModel MontaModel(DataRow registro)
        {
            var model = new TrilhaViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                ClasseId = Convert.ToInt32(registro["classe_id"])
            };
            return model;
        }
        public List<TrilhaViewModel> ListarTrilhasDeCombatente()
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("classe_id", 1),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaTrilhas", parametro);
            var lista = new List<TrilhaViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        public List<TrilhaViewModel> ListarTrilhasDeEspecialista()
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("classe_id", 2),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaTrilhas", parametro);
            var lista = new List<TrilhaViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        public List<TrilhaViewModel> ListarTrilhasDeOcultista()
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("classe_id", 3),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaTrilhas", parametro);
            var lista = new List<TrilhaViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        protected override void SetTabela()
        {
            Tabela = "Trilha";
        }
    }
}
