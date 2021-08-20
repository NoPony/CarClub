using RazorEngine;
using RazorEngine.Templating;

namespace NoPony.CarClub.Api.Templates
{
    public class RazorTemplateEngine : ITemplateEngine
    {

        public string Process<TModel>(string identifier, TModel model)
        {
            string template = "Hello @Model.Name, welcome to RazorEngine!";

            return Engine.Razor.RunCompile(template, "templateKey", null, new { Name = "World" });
        }
    }
}
