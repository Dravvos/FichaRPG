using Microsoft.AspNetCore.Mvc;

namespace FichaRPG.Controllers
{
    public class TestController : Controller
    {
        public IActionResult Version()
        {
            System.Reflection.Assembly assembly = System.Reflection.Assembly.GetExecutingAssembly();
            System.Diagnostics.FileVersionInfo fvi = System.Diagnostics.FileVersionInfo.GetVersionInfo(assembly.Location);
            string? version = fvi.FileVersion;
            return Json(version);
        }
    }
}
