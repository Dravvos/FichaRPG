using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FichaRPG
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }


        public void ConfigureServices(IServiceCollection services)
        {
            // Add other services as needed
            services.AddControllersWithViews();
            services.AddSession(options =>
            {
                options.Cookie.IsEssential = true;
                options.IdleTimeout = TimeSpan.FromSeconds(1200);
            });
            services.AddRazorPages();
            services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.PropertyNamingPolicy = null;
            });
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            // Configure other middleware as needed
            app.UseSession();
            app.UseRouting();
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseEndpoints(endpoints =>
                {
                    endpoints.MapRazorPages();

                    endpoints.MapControllerRoute(
                       name: "default",
                       pattern: "{controller=Home}/{action=Index}/{id?}");
                    // Map other endpoints as needed
                });
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseEndpoints(endpoints =>
                {
                    endpoints.MapRazorPages();

                    endpoints.MapControllerRoute(
                       name: "default",
                       pattern: "FichaRPG/{controller=Home}/{action=Index}/{id?}");
                    // Map other endpoints as needed
                });
            }
            app.UseStaticFiles();
            app.UseSession();

            // Use other middleware as needed

            
        }

    }
}
