using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace FichaRPG.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class TestController : Controller
    {
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Version()
        {
            System.Reflection.Assembly assembly = System.Reflection.Assembly.GetExecutingAssembly();
            System.Diagnostics.FileVersionInfo fvi = System.Diagnostics.FileVersionInfo.GetVersionInfo(assembly.Location);
            string? version = fvi.FileVersion;
            var options = new JsonSerializerOptions
            {
                WriteIndented = true,
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            };
            return new JsonResult(version, options);
        }
    }
}
