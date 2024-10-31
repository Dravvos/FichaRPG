using System.Data.SqlClient;

namespace FichaRPG.DAO
{
    public class ConexaoBD
    {
        public static string? Conexao { get; set; }
        public static SqlConnection GetConexao()
        {
            Conexao = Environment.GetEnvironmentVariable("RPGConnection");
            string? cx = Conexao;
            if (string.IsNullOrEmpty(cx))
                throw new Exception("Não foi encontrada string de conexão");
            SqlConnection conexao = new SqlConnection(cx);
            conexao.Open();
            return conexao;
        }
    }
}
