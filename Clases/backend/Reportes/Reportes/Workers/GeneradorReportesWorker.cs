using Reportes.WepApi.Channels;
using System.Threading.Channels;

namespace Reportes.WepApi.Workers
{
    public class GeneradorReportesWorker (ReportesChannel): BackgroundService
    {
        protected override async Task ExecuteAsync(CancellationToken cancellationToken)
        {
            await foreach (var order in Channel.ReadAllAsync(stoppingToken))
            {
                order.Status
            }
        }

    }

    
}
