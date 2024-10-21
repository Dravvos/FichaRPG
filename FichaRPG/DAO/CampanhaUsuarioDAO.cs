using FichaRPG.Models;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class CampanhaUsuarioDAO : PadraoDAO<CampanhaUsuarioViewModel>
    {
        protected override SqlParameter[] CriaParametros(CampanhaUsuarioViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("campanhaId",model.CampanhaId),
                new SqlParameter("usuarioId",model.UsuarioId)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(CampanhaUsuarioViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("campanhaId", model.CampanhaId),
                new SqlParameter("usuarioId", model.UsuarioId)
            };
            return parametros;
        }

        protected override CampanhaUsuarioViewModel MontaModel(DataRow registro)
        {
            var model = new CampanhaUsuarioViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                CampanhaId = Convert.ToInt32(registro["campanha_id"]),
                UsuarioId = Convert.ToInt32(registro["usuario_id"])
            };
            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Campanha_Usuario";
        }

        public List<CampanhaUsuarioViewModel> ObterCampanhasUsuarioPorUsuario(int usuarioId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("usuarioId", usuarioId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaCampanhasUsuario", parametro);
            var lista = new List<CampanhaUsuarioViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }

        public List<CampanhaUsuarioViewModel> ObterUsuariosDeUmaCampanha(int campanhaId)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("campanhaId", campanhaId),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaUsuariosCampanha", parametro);
            var lista = new List<CampanhaUsuarioViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }
    }
}
