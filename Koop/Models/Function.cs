using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Function
    {
        public Function()
        {
            Cooperators = new HashSet<Cooperator>();
        }

        public long FunctionId { get; set; }
        public string FunctionName { get; set; }

        public virtual ICollection<Cooperator> Cooperators { get; set; }
    }
}
