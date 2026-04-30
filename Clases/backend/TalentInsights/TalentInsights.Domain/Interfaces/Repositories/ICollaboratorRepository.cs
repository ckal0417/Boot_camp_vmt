using TalentInsights.Domain.Database.SqlServer.Entities;

namespace TalentInsights.Domain.Interfaces.Repositories
{
    public interface ICollaboratorRepository
    {
        Task<Collaborator> Create(Collaborator collaborator);
        Task<Collaborator> Get(Guid collaborator);
        IQueryable<Collaborator> Queryable();
        Task<bool> IfExists(Guid collaborator);

        Task<Collaborator> Update();
        Task Delete(Guid collaborator);
    }
}
