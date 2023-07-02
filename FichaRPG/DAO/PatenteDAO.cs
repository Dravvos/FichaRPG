using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class PatenteDAO : PadraoDAO<PatenteViewModel>
    {
        protected override SqlParameter[] CriaParametros(PatenteViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(PatenteViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome)
            };
            return parametros;
        }

        protected override PatenteViewModel MontaModel(DataRow registro)
        {
            var model = new PatenteViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString()
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Patente";
        }
    }
}
