using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Favority
    {
        public long FavoriteId { get; set; }
        public long CoopId { get; set; }
        public long ProductId { get; set; }

        public virtual Cooperator Coop { get; set; }
        public virtual Product Product { get; set; }
    }
}
