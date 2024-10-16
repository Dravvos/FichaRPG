using FichaRPG.Models;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class CampanhaPersonagemDAO : PadraoDAO<CampanhaPersonagemViewModel>
    {
        protected override SqlParameter[] CriaParametros(CampanhaPersonagemViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("campanhaId",model.CampanhaId),
                new SqlParameter("personagemId",model.PersonagemId)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(CampanhaPersonagemViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("campanhaId",model.CampanhaId),
                new SqlParameter("personagemId",model.PersonagemId)
            };
            return parametros;
        }

        protected override CampanhaPersonagemViewModel MontaModel(DataRow registro)
        {
            var model = new CampanhaPersonagemViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                CampanhaId = Convert.ToInt32(registro["campanha_id"]),
                PersonagemId = Convert.ToInt32(registro["personagem_id"])
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Campanha_Personagem";
        }

        public List<CampanhaPersonagemViewModel> ObterPersonagensDeUmaCampanha (int campanhaId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("campanhaId", campanhaId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaPersonagensCampanha", parametro);
            var lista = new List<CampanhaPersonagemViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
    }
}
