using FichaRPG.Models;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class CampanhaDAO : PadraoDAO<CampanhaViewModel>
    {
        protected override SqlParameter[] CriaParametros(CampanhaViewModel model)
        {
            object? imgByte = model.FotoCapaEmByte;

            SqlParameter[] parametros = new SqlParameter[4];
            parametros[0] = new SqlParameter("id", model.Id);
            parametros[1] = new SqlParameter("nome", model.Nome);
            parametros[2] = new SqlParameter("descricao", model.Descricao);

            if (imgByte == null)
            {
                imgByte = DBNull.Value;
                parametros[3] = new SqlParameter("fotoCapa", SqlDbType.VarBinary, -1);
                parametros[3].Value = imgByte;
            }
            else
                parametros[3] = new SqlParameter("fotoCapa", imgByte);
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(CampanhaViewModel model)
        {
            object? imgByte = model.FotoCapaEmByte;

            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = new SqlParameter("nome", model.Nome);
            parametros[1] = new SqlParameter("descricao", model.Descricao);

            if (imgByte == null)
            {
                imgByte = DBNull.Value;
                parametros[2] = new SqlParameter("fotoCapa", SqlDbType.VarBinary, -1);
                parametros[2].Value = imgByte;
            }
            else
                parametros[2] = new SqlParameter("fotoCapa", imgByte);
            return parametros;
        }

        protected override CampanhaViewModel MontaModel(DataRow registro)
        {

            var model = new CampanhaViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                Descricao = registro["descricao"].ToString()
            };
            if (registro["fotoCapa"] != DBNull.Value)
                model.FotoCapaEmByte = registro["fotoCapa"] as byte[];

            return model;
        }

        protected override void SetTabela()
        {
            Tabela = "Campanha";
        }

        public List<CampanhaViewModel> ObterCampanhasPorUsuario(int usuarioId)
        {
            var parametro = new SqlParameter[]
           {
                new SqlParameter("usuarioId", usuarioId),
           };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spListaCampanhas", parametro);
            var lista = new List<CampanhaViewModel>();
            foreach (DataRow registro in tabela.Rows)
                lista.Add(MontaModel(registro));

            return lista;
        }

    }
}
