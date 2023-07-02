using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public abstract class PadraoDAO<T> where T : PadraoViewModel
    {
        public PadraoDAO()
        {
            SetTabela();
        }
        protected string Tabela { get; set; }
        protected string NomeSpListagem { get; set; } = "spList";
        protected abstract SqlParameter[] CriaParametros(T model);
        protected abstract SqlParameter[] CriaParametrosSemId(T model);

        protected abstract T MontaModel(DataRow registro);
        protected abstract void SetTabela();
        public virtual void Insert(T model)
        {
            HelperDAO.ExecutaProcedure("spInsert_" + Tabela, CriaParametrosSemId(model));
        }
        public virtual void Update(T model)
        {
            HelperDAO.ExecutaProcedure("spUpdate_" + Tabela, CriaParametros(model));
        }
        public virtual void Delete(int id)
        {
            var parametros = new SqlParameter[]
            {
                new SqlParameter("id", id),
                new SqlParameter("tabela", Tabela)
            };
            HelperDAO.ExecutaProcedure("spDelete", parametros);
        }
        public virtual T Consulta(int id)
        {
            var parametros = new SqlParameter[]
            {
                new SqlParameter("id", id),
                new SqlParameter("tabela", Tabela)
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spSearch", parametros);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }
        public virtual List<T> Listagem()
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("tabela", Tabela),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect(NomeSpListagem, parametro);
            var lista = new List<T>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
        public virtual int ProximoId()
        {
            var parametros = new SqlParameter[]
            {
                new SqlParameter("tabela", Tabela)
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spProximoId", parametros);
            return Convert.ToInt32(tabela.Rows[0][0]);
        }
    }
}
