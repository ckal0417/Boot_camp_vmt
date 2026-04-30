using Microsoft.EntityFrameworkCore;
using TalentInsights.Domain.Database.SqlServer.Context;
using TalentInsights.Domain.Database.SqlServer.Entities;
using TalentInsights.Domain.Interfaces.Repositories;

namespace TalentInsights.Infrastructure.Persistence.SqlServer.Repositories
{
    public class CollaboratorRepository(TalentInsightsContext context) : ICollaboratorRepository
    {
        public Task<Collaborator> Create(Collaborator collaborator)
        {
            throw new NotImplementedException();
        }

        public Task Delete(Guid collaborator)
        {
            throw new NotImplementedException();
        }

        public Task<Collaborator> Get(Guid collaborator)
        {
            throw new NotImplementedException();
        }

        public Task<bool> IfExists(Guid collaborator)
        {
            throw new NotImplementedException();
        }

        public IQueryable<Collaborator> Queryable()
        {
            throw new NotImplementedException();
        }

        public Task<Collaborator> Update()
        {
            throw new NotImplementedException();
        }
    }
}
