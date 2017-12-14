using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Owin_test_task {
    /// <summary>
    /// Класс хранит информацию о сотрудниках отдела и список отделов фирмы, а так же способ представления данных
    /// </summary>
    public class Firm {
        public string separator { get; set; }
        public List<Person> personList;
        public List<Department> departmentList;
        
        public Firm(string _separator = "") {
            personList = new List<Person>();
            departmentList = new List<Department>();
            separator = _separator;
            printWorkersByDepartments();
        }

        /// <summary>
        /// Формирует список сотрудников в читабельном виде
        /// </summary>
        /// <returns>Строка, для передачи в представление</returns>
        public string printWorkersByDepartments() {
            string result = "";
            int personCountInDep;
            foreach (Department d in departmentList) {
                result += String.Format("<h4>{0}:</h4>", d.Name);
                personCountInDep = 0;
                foreach (Person p in personList.FindAll(delegate(Person prsn) { return prsn.DepartmentId == d.Id.ToString(); })) {
                    result += String.Format("{0}{1}", p.formatSNP(), separator);
                    personCountInDep++;
                }
                if (personCountInDep == 0) {
                    result += "Нет сотрудников";
                }
                result = result.TrimEnd(separator.ToCharArray());
            }
            result += "<h4>Сотрудники без отделов</h4>";
            personCountInDep = 0;
            foreach (Person p in personList.FindAll(delegate(Person prsn) { return prsn.DepartmentId == ""; })) {
                result += String.Format("{0}{1}", p.formatSNP(), separator);
                personCountInDep++;
            }
            if (personCountInDep == 0) {
                result += "Нет сотрудников";
            }
            result = result.TrimEnd(separator.ToCharArray());
            return result;
        }
    }
}