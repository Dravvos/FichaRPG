using System.Text;
using System.Security.Cryptography;

namespace FichaRPG.Services
{
    public static class EncriptionService
    {
        public static string EncriptarString(string dado)
        {
            SHA512 hash = SHA512.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] array = encoding.GetBytes(dado);
            var result = encoding.GetString(array);
            
            array=hash.ComputeHash(array);
            
            StringBuilder sb= new StringBuilder();
            
            foreach(byte item in array)
            {
                sb.Append(item.ToString("x2"));
            }
            return sb.ToString();
        }
    }
}
