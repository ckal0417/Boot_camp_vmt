using Reportes.WepApi.Models.Dto;
using System.Threading.Channels;

namespace Reportes.WepApi.Channels
{
    public class ReportesChannel
    {
        private readonly Channel<OrderDto> _channel = Channel.CreateBounded<OrderDto>(10);

        public ValueTask PublishAsync(OrderDto order)
        {
           return _channel.Writer.WriteAsync(order);
        }

        public IAsyncEnumerable<OrderDto>(OrderDto order)
        {
            return _channel.Writer.WriteAsync(order);
        }
    }
}
