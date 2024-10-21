using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class PoderTrilhaDAO : PadraoDAO<PoderTrilhaViewModel>
    {
        protected override SqlParameter[] CriaParametros(PoderTrilhaViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("descricao",model.Descricao),
                new SqlParameter("trilha_id",model.TrilhaId),
                new SqlParameter("nex",model.Nex)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(PoderTrilhaViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("descricao",model.Descricao),
                new SqlParameter("trilha_id",model.TrilhaId),
                new SqlParameter("nex",model.Nex)
            };
            return parametros;
        }

        protected override PoderTrilhaViewModel MontaModel(DataRow registro)
        {
            var model = new PoderTrilhaViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Descricao = registro["descricao"].ToString(),
                Nex = Convert.ToInt16(registro["nex"]),
                TrilhaId = Convert.ToInt32(registro["trilha_id"])
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Poder_Trilha";
        }
    }
}
