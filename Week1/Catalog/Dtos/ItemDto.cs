using System;

namespace Catalog.Dtos
{
        public record ItemDto
    {
        public Guid Id { get; init; }
        public String Name { get; init; }
        public decimal Price { get; init; }
        public DateTimeOffset CreatedDate { get; set; }
    }
}