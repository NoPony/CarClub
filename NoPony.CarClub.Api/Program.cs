using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Events;
using System;

namespace NoPony.CarClub.Api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Log.Logger = new LoggerConfiguration()
                .Enrich.WithProperty("Application", "NoPony.CarClub")
                .Enrich.FromLogContext()
#if DEBUG
                .MinimumLevel.Verbose()
                .WriteTo.Seq("http://localhost:5341")
#else
                .MinimumLevel.Information()
                .WriteTo.Seq("http://localhost:5341")
#endif
                .MinimumLevel.Override("Microsoft.AspNetCore", LogEventLevel.Warning)
                .MinimumLevel.Override("Microsoft.Extensions.Hosting.Internal.Host", LogEventLevel.Warning)
                .MinimumLevel.Override("Microsoft.Hosting.Lifetime", LogEventLevel.Warning)

                .CreateLogger();

            try
            {
                Log.Information("Start");

                CreateHostBuilder(args)
                    .UseServiceProviderFactory(new AutofacServiceProviderFactory())
                    .ConfigureAppConfiguration((hostContext, builder) =>
                    {
                        if (hostContext.HostingEnvironment.IsDevelopment())
                        {
                            builder.AddUserSecrets<Program>();
                        }
                    })
                    .Build()
                    .Run();
            }

            catch (Exception ex)
            {
                Log.Fatal(ex, "Unhandled Exception in Main");
            }

            finally
            {
                Log.Information("Stop");
                Log.CloseAndFlush();
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .UseSerilog()
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
