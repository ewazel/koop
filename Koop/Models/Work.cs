using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Work
    {
        public long WorkId { get; set; }
        public DateTime WorkDate { get; set; }
        public double Duration { get; set; }
        public long CoopId { get; set; }
        public long WorkTypeId { get; set; }

        public virtual Cooperator Coop { get; set; }
        public virtual WorkType WorkType { get; set; }
    }
}
