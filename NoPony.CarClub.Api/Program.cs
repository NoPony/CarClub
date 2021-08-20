using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Serilog;
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
#else
                .MinimumLevel.Override("Microsoft.AspNetCore", LogEventLevel.Warning)
                .MinimumLevel.Information()
#endif
                .WriteTo.Seq("http://localhost:5341")
                .CreateLogger();

            try
            {
                Log.Information("Start");

                CreateHostBuilder(args)
                    .Build()
                    .Run();
            }

            catch (Exception ex)
            {
                Log.Fatal(ex, "Failed to Start");
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
