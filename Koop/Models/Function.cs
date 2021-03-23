using System;
using System.Collections.Generic;

#nullable disable

namespace Koop.Models
{
    public partial class Function
    {
        public Function()
        {
            Cooperators = new HashSet<User>();
        }

        public Guid FunctionId { get; set; }
        public string FunctionName { get; set; }

        public virtual ICollection<User> Cooperators { get; set; }
    }
}
