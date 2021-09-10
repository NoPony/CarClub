using RazorEngine;
using RazorEngine.Templating;
using System.IO;

namespace NoPony.CarClub.Api.Templates
{
    public class RazorTemplateEngine : ITemplateEngine
    {
        public RazorTemplateEngine()
        {

        }

        public string Process<TModel>(string identifier, TModel model)
        {
            string template = File.ReadAllText($"Templates\\{identifier}\\{identifier}Template.cshtml");

            return Engine.Razor.RunCompile(template, identifier, typeof(TModel), model);
        }
    }
}
