using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class OrigemDAO : PadraoDAO<OrigemViewModel>
    {
        protected override SqlParameter[] CriaParametros(OrigemViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("poder_nome",model.PoderNome),
                new SqlParameter("poder_resumo",model.PoderResumo),

            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(OrigemViewModel model)
        {
            SqlParameter[] parametros =
           {
                new SqlParameter("poder_nome",model.PoderNome),
                new SqlParameter("poder_resumo",model.PoderResumo),

            };
            return parametros; ;
        }

        protected override OrigemViewModel MontaModel(DataRow registro)
        {
            var model = new OrigemViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                PoderNome = registro["poder_nome"].ToString(),
                PoderResumo = registro["poder_resumo"].ToString()
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Origem";
        }
    }
}
