using TalentInsights.Domain.Database.SqlServer.Context;

namespace TalentInsights.WebApi.Extensions
{
    public static class ServiceCollectionExtension
    {
        /// <summary>
        /// Metodo que servie par añadir todos losservicios de la aplicaciom
        /// </summary>
        /// <param name="services"></param>
        public static void AddServices(this IServiceCollection services) 
        { 
        
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="services"></param>
        public static void AddRepositories(this IServiceCollection services)
        {

        }

        public static void AddCore(this IServiceCollection services)
        {
            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
            Services.AddOpenApi();
            Services.AddTransient<TalentInsightsContext>(services.Configuration.GetConnectionString("Database"));
            Servicies.AddRepositories;
            Servicies.
        }
    }
}
