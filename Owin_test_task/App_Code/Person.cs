using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Owin_test_task {
    /// <summary>
    /// Класс хранит данные о сотруднике, предоставляет методы получения информации о нем
    /// </summary>
    public class Person {
        public int id { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string Patronymic { get; set; }
        public string DepartmentId { get; set; }

        public Person(string _surname, string _name, string _patronymic, string _department = "") {
            Surname = _surname;
            Name = _name;
            Patronymic = _patronymic;
            DepartmentId = _department;
        }

        /// <summary>
        /// Форматированый вывод данных о сотруднике
        /// </summary>
        /// <returns>Строка в формате Фамилия И.О.</returns>
        public string formatSNP() {
            Surname = Surname.Trim();
            Name = Name.Substring(0, 1).Trim();
            Patronymic = Patronymic.Substring(0, 1).Trim();
            return String.Format("{0}.{1}.{2}", Surname, Name, Patronymic);
        }
    }
}