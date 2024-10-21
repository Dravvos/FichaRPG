using FichaRPG.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class RelacaoRitualDAO : PadraoDAO<RelacaoRitualViewModel>
    {
        protected override SqlParameter[] CriaParametros(RelacaoRitualViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("Personagem_id",model.PersonagemId),
                new SqlParameter("Ritual_id",model.RitualId)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(RelacaoRitualViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("Personagem_id",model.PersonagemId),
                new SqlParameter("Ritual_id",model.RitualId)
            };
            return parametros;
        }

        protected override RelacaoRitualViewModel MontaModel(DataRow registro)
        {
            var model = new RelacaoRitualViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                PersonagemId = Convert.ToInt32(registro["Personagem_id"]),
                RitualId = Convert.ToInt32(registro["Ritual_id"])
            };
            return model;
        }

        public void Deletar(int personagemid,int ritualId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("personagem_id", personagemid),
                new SqlParameter("ritual_id", ritualId)
            };
            HelperDAO.ExecutaProcedure("spDeleteRelacaoRitual", parametro);
        }
        protected override void SetTabela()
        {
            Tabela = "Relacao_Ritual";
        }
    }
}
