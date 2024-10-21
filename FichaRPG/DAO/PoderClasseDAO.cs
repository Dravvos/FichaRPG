using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class PoderClasseDAO : PadraoDAO<PoderClasseViewModel>
    {
        protected override SqlParameter[] CriaParametros(PoderClasseViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("descricao",model.Descricao),
                new SqlParameter("classe_id",model.ClasseId)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(PoderClasseViewModel model)
        {
            SqlParameter[] parametros =
                {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("descricao",model.Descricao),
                new SqlParameter("classe_id",model.ClasseId)
            };
            return parametros;
        }

        protected override PoderClasseViewModel MontaModel(DataRow registro)
        {
            var model = new PoderClasseViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Descricao = registro["descricao"].ToString(),
                ClasseId = Convert.ToInt32(registro["classe_id"])
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Poder_Classe";
        }
    }
}
