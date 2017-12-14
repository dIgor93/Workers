using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Test_task {
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
            loadData();
        }

        /// <summary>
        /// Метод получения данных из БД, для дальнейшей работы с ними
        /// </summary>
        public void loadData() {
            ConnectionStringSettings connSetting = ConfigurationManager.ConnectionStrings["LocalDB"];
            if (connSetting == null || string.IsNullOrEmpty(connSetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");

            string connectionString = connSetting.ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                connection.Open();

                string queryString = "SELECT * FROM Employeers";
                SqlCommand command = new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read()) {
                    string _surname = reader["Surname"].ToString();
                    string _name = reader["Name"].ToString();
                    string _patronymic = reader["Patronymic"].ToString();
                    if (reader["DepartmentId"] != DBNull.Value) {
                        int _department = (int)reader["DepartmentId"];
                        personList.Add(new Person(_surname, _name, _patronymic, _department));
                    } else {
                        personList.Add(new Person(_surname, _name, _patronymic));
                    }
                }
                reader.Close();

                queryString = "SELECT * FROM Department";
                command.CommandText = queryString;
                reader = command.ExecuteReader();
                while (reader.Read()) {
                    int _id = (int)reader["Id"];
                    string _depName = reader["Name"].ToString();
                    departmentList.Add(new Department(_id, _depName));
                }
                command.Dispose();
                reader.Dispose();
            }
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
                foreach (Person p in personList.FindAll(delegate(Person prsn) { return prsn.department == d.Id; })) {
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
            foreach (Person p in personList.FindAll(delegate(Person prsn) { return prsn.department == -1; })) {
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