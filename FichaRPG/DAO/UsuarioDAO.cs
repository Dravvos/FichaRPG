using FichaRPG.Models;
using System;
using System.Data;
using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class UsuarioDAO : PadraoDAO<UsuarioViewModel>
    {
        protected override SqlParameter[] CriaParametros(UsuarioViewModel model)
        {
            SqlParameter[] parametros =
            {
                new SqlParameter("id",model.Id),
                new SqlParameter("nome",model.Nome),
                new SqlParameter("usuario_login",model.UsuarioLogin),
                new SqlParameter("senha",model.Senha)
            };
            return parametros;
        }

        protected override SqlParameter[] CriaParametrosSemId(UsuarioViewModel model)
        {
            SqlParameter[] parametros =
                {
                new SqlParameter("nome",model.Nome),
                new SqlParameter("usuario_login",model.UsuarioLogin),
                new SqlParameter("senha",model.Senha)
            };
            return parametros;
        }

        protected override UsuarioViewModel MontaModel(DataRow registro)
        {
            var model = new UsuarioViewModel
            {
                Id = Convert.ToInt32(registro["id"]),
                Nome = registro["nome"].ToString(),
                UsuarioLogin = registro["usuario_login"].ToString(),
                Senha = registro["senha"].ToString(),

            };
            return model;
        }
        public bool VerificaSeUsuarioEstaCadastrado(string usuarioEncriptografadao)
        {
            var nomeProcedure = "spVerificaUsuarioCadastrado";
            var parametro = new SqlParameter[]
            {
                new SqlParameter("UsuarioEncriptografado", usuarioEncriptografadao)
            }; 
            DataTable retornoDaProcedure = HelperDAO.ExecutaProcedureSelect(nomeProcedure,parametro);

            return Convert.ToBoolean(retornoDaProcedure.Rows[0]["Retorno"]);
        }
        public bool VerificaSeUsuarioESenhaCorrespondem(ref UsuarioViewModel model)
        {
            var nomeProcedure = "spVerificaUsuarioESenhaCorretos";
            DataTable retornoDaProcedure = HelperDAO.ExecutaProcedureSelect(nomeProcedure, new SqlParameter[]
            {
                new SqlParameter("@UsuarioEncriptografado", model.UsuarioLogin),
                new SqlParameter("@SenhaEncriptografada", model.Senha)
            });

            if (retornoDaProcedure == null || retornoDaProcedure.Rows.Count == 0)
                return false;
            else
            {
                model = MontaModel(retornoDaProcedure.Rows[0]);
                return true;
            }
        }
        public UsuarioViewModel Consultar(int id)
        {
            var parametro = new SqlParameter[]
            {
                new SqlParameter("id", id),
            };
            DataTable tabela = HelperDAO.ExecutaProcedureSelect("spSearchUsuario", parametro);
            if (tabela.Rows.Count == 0)
                return null;
            else
                return MontaModel(tabela.Rows[0]);
        }
        protected override void SetTabela()
        {
            Tabela = "Usuario";
        }
    }
}
