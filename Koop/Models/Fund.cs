using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Fund
    {
        public Fund()
        {
            Cooperators = new HashSet<Cooperator>();
        }

        public long FundId { get; set; }
        public byte Value { get; set; }

        public virtual ICollection<Cooperator> Cooperators { get; set; }
    }
}
