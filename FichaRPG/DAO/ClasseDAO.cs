using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class ClasseDAO : PadraoDAO<ClasseViewModel>
    {
        protected override SqlParameter[] CriaParametros(ClasseViewModel model)
        {
            SqlParameter[] parametros =
             {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(ClasseViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("nome",model.Nome)
            };
            return parametros;
        }

        protected override ClasseViewModel MontaModel(DataRow registro)
        {
            var model = new ClasseViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString()
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Classe";
        }
    }
}
