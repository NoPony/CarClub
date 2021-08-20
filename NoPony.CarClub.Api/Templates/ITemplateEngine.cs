namespace NoPony.CarClub.Api.Templates
{
    public interface ITemplateEngine
    {
        string Process<TModel>(string identifier, TModel model);
    }
}
