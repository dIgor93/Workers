using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Test_task {
    /// <summary>
    /// Класс хранит данные о сотруднике, предоставляет методы получения информации о нем
    /// </summary>
    public class Person {
        public string surname { get; set; }
        public string name { get; set; }
        public string patronymic { get; set; }
        public int department { get; set; }

        public Person(string _surname, string _name, string _patronymic, int _department = -1) {
            surname = _surname;
            name = _name;
            patronymic = _patronymic;
            department = _department;
        }

        public string formatSNP() {
            surname = surname.Trim();
            name = name.Substring(0, 1).Trim();
            patronymic = patronymic.Substring(0, 1).Trim();
            return String.Format("{0}.{1}.{2}", surname, name, patronymic);
        }
    }
}