using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class PoderParanormalDAO : PadraoDAO<PoderParanormalViewModel>
    {
        protected override SqlParameter[] CriaParametros(PoderParanormalViewModel model)
        {
            SqlParameter[] parametros =
             {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("elemento",model.Elemento),
                new SqlParameter("resumo",model.Resumo)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(PoderParanormalViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("elemento",model.Elemento),
                new SqlParameter("resumo",model.Resumo)
            };
            return parametros;
        }

        protected override PoderParanormalViewModel MontaModel(DataRow registro)
        {
            var model = new PoderParanormalViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Elemento = registro["elemento"].ToString(),
                Resumo = registro["resumo"].ToString()
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Poder_Paranormal";
        }
    }
}
