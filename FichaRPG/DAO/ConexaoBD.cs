using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class ConexaoBD
    {
        public static SqlConnection GetConexao()
        {
            string cx = "Data Source=DESKTOP-M4BH5T6\\LOCALHOST; Database=RPG; user id=sa; password=123456";
            SqlConnection conexao = new SqlConnection(cx);
            conexao.Open();
            return conexao;
        }
    }
}
