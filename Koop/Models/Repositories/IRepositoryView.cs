using System;
using System.Collections.Generic;

namespace Koop.Models.Repositories
{
    public interface IRepositoryView<T> where T : class
    {
        IEnumerable<T> GetAll(Func<T, bool> predicate = null);
    }
}