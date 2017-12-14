using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Test_task {
    /// <summary>
    /// Класс хранит данные об отделе, не содержит информации о сотрудниках отдела
    /// </summary>
    public class Department {
        public int Id { get; private set; }
        public string Name { get; private set; }

        public Department(int _Id, string _Name) {
            Id = _Id;
            Name = _Name;
        }
    }
}