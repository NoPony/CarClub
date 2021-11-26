using Autofac;
using AutofacSerilogIntegration;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using NoPony.CarClub.Api.Features.Auth;
using NoPony.CarClub.Api.Features.Board;
using NoPony.CarClub.Api.Features.Post;
using NoPony.CarClub.Api.Templates;
using Serilog;
using System;
using System.Text;

namespace NoPony.CarClub.Api
{
    public class Startup
    {
        private readonly IConfiguration _config;

        public Startup(IConfiguration config)
        {
            _config = config ?? throw new ArgumentNullException(nameof(config));
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddLogging();

            services.AddCors(options =>
            {
                options.AddDefaultPolicy(builder =>
                {
                    builder.WithOrigins("http://localhost:4200")
                        //.WithHeaders("Content-Type", "Accept", "Authorization")
                        //.WithMethods("POST", "GET", "PATCH", "DELETE", "OPTIONS");
                        .AllowAnyHeader()
                        .AllowAnyMethod()
                        .AllowCredentials();
                });
            });

            services.AddControllers()
                .AddJsonOptions(options =>
                {
                    options.JsonSerializerOptions.IgnoreNullValues = true;
                });

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.RequireHttpsMetadata = false;
                    options.SaveToken = true;
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = _config.GetValue<string>("Jwt:Issuer"),
                        ValidAudience = _config.GetValue<string>("Jwt:Audience"),
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetValue<string>("Jwt:Key"))),
                        ClockSkew = TimeSpan.FromSeconds(5),
                    };
                });

            services.AddAuthorization();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "NoPony CarClub Api", Version = "1.0" });
            });
        }

        public void ConfigureContainer(ContainerBuilder builder)
        {
            builder.RegisterLogger();

            builder.RegisterType<EF.Context>().InstancePerLifetimeScope();


            builder.RegisterType<RazorTemplateEngine>().As<ITemplateEngine>().SingleInstance();

            builder.RegisterType<AuthService>().As<IAuthService>();
            builder.RegisterType<AuthRepository>().As<IAuthRepository>();

            builder.RegisterType<BoardService>().As<IBoardService>();
            builder.RegisterType<BoardRepository>().As<IBoardRepository>();

            builder.RegisterType<PostService>().As<IPostService>();
            builder.RegisterType<PostRepository>().As<IPostRepository>();

            //builder.RegisterType<BoardService>().As<IBoardService>();
            //builder.RegisterType<BoardRepository>().As<IBoardRepository>();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory log)
        {
            log.AddSerilog();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "NoPony.CarClub.Api"));
            }

            app.UseHttpsRedirection();
            app.UseRouting();
            app.UseCors();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseSerilogRequestLogging();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers()
                    .RequireAuthorization();
            });
        }
    }
}
