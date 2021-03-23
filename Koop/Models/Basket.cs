using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Basket
    {
        public Guid BasketId { get; set; }
        public Guid? CoopId { get; set; }

        public virtual User Coop { get; set; }
    }
}
