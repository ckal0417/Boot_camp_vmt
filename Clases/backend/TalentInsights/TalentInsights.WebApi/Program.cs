using TalentInsights.Application.Interfaces.Services;
using TalentInsights.Application.Models.DTOs;
using TalentInsights.Application.Services;
using TalentInsights.Domain.Database.SqlServer.Context;
using TalentInsights.Domain.Interfaces.Repositories;
using TalentInsights.Shared;

var builder = WebApplication.CreateBuilder(args);





// Services
builder.Services.AddScoped<ICollaboratorService, CollaboratorService>();

builder.Services.AddSingleton<Cache<CollaboratorDto>>();

//Database
builder.Services.AddTransient<TalentInsightsContext>(builder.Configuration.GetConnectionString("Database"));

//Database - Repositories
builder.Services.AddTransient<ICollaboratorRepository, ICollaboratorRepository() >;

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
