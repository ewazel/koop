using System;
using System.Collections.Generic;

namespace Koop.Models.Repositories
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> GetAll(Func<T, bool> predicate = null);
        T GetDetail(Func<T, bool> predicate);
        void Add(T entity);
        void Delete(T entity);
    }
}