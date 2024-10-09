using System.Data.SqlClient;
using System.Configuration;
using System;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace FichaRPG.DAO
{
    public class ConexaoBD
    {
        public static string? Conexao { get; set; }
        public static SqlConnection GetConexao()
        {
            string? cx = Conexao;
            SqlConnection conexao = new SqlConnection(cx);
            conexao.Open();
            return conexao;
        }
    }
}
