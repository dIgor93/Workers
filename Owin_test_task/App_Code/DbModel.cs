using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Owin_test_task {
    /// <summary>
    /// Класс работы с базой данных
    /// </summary>
    public class DbModel {
        
        public DbModel() {}

        /// <summary>
        /// Формирование ответа для ajax запроса 
        /// </summary>
        /// <returns>json-строка со списком работников</returns>
        public string selectEmployeersToJson() {
            string result = "[";
            ConnectionStringSettings connSetting = ConfigurationManager.ConnectionStrings["LocalDB"];
            if (connSetting == null || string.IsNullOrEmpty(connSetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");

            string connectionString = connSetting.ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                connection.Open();

                string queryString = @"SELECT em.Id, em.Surname, em.Name, em.Patronymic, em.DepartmentId as DepId FROM Employeers em";
                SqlCommand command = new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read()) {
                    int _id = (int)reader["Id"];
                    string _surname = reader["Surname"].ToString();
                    string _name = reader["Name"].ToString();
                    string _patronymic = reader["Patronymic"].ToString();
                    int _department = -1;
                    if (reader["DepId"] != DBNull.Value) {
                        _department = (int)reader["DepId"];
                    }

                    result += String.Format(@"{{ 'id': {0}, 'surname': '{1}', 'name': '{2}', 'patronymic': '{3}', 'departmentId': {4} }},",
                        _id, _surname, _name, _patronymic, _department);
                }
            }
            result = result.TrimEnd(',');
            result += "]";
            return result;
        }

        /// <summary>
        /// Формирование ответа для ajax запроса
        /// </summary>
        /// <returns>json-строка со списком отделов</returns>
        public string selectDepartmentsToJson() {
            string result = "[";
            ConnectionStringSettings connSetting = ConfigurationManager.ConnectionStrings["LocalDB"];
            if (connSetting == null || string.IsNullOrEmpty(connSetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");

            string connectionString = connSetting.ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                connection.Open();

                string queryString = @"SELECT dp.Id, dp.Name FROM Department dp";
                SqlCommand command = new SqlCommand(queryString, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read()) {
                    int _id = (int)reader["Id"];
                    string _name = reader["Name"].ToString();

                    result += String.Format(@"{{ 'id': {0}, 'name': '{1}' }},", _id, _name );
                }
            }
            result = result.TrimEnd(',');
            result += "]";
            return result;
        }

        /// <summary>
        /// Выполенение простого запроса
        /// </summary>
        /// <param name="queryString">строка sql-запроса</param>
        private void executeSimpleQuery(string queryString) {
            ConnectionStringSettings connSetting = ConfigurationManager.ConnectionStrings["LocalDB"];
            if (connSetting == null || string.IsNullOrEmpty(connSetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");

            string connectionString = connSetting.ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                connection.Open();

                SqlCommand command = new SqlCommand(queryString, connection);
                command.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Обновление данных о сотрудниках 
        /// </summary>
        /// <param name="newPerson"></param>
        public void updateEmployee(Person newPerson) {
            int id = -1;
            string updatable_fields = "";
            foreach (var property in newPerson.GetType().GetProperties()) {
                var prop_name = property.Name;
                var prop_value = property.GetValue(newPerson, null);
                if (prop_name == "id") {
                    id = (int)prop_value;
                } else {
                    if (prop_value != null) {
                        updatable_fields += String.Format("{0}=N'{1}', ", prop_name, prop_value);
                    }
                }
            }
            updatable_fields = updatable_fields.TrimEnd(", ".ToCharArray());
            string queryString = String.Format(@"UPDATE Employeers  set {0} WHERE Id={1}", updatable_fields, id);

            if (updatable_fields != "") {
                executeSimpleQuery(queryString);
            }
        }

        /// <summary>
        /// Добавление новой записи о сотруднике
        /// </summary>
        /// <param name="newPerson"></param>
        public void insertEmployee(Person newPerson) {
            string value_fields = "(";
            string definition_fields = "(";
            
            foreach (var property in newPerson.GetType().GetProperties()) {

                var prop_name = property.Name;
                var prop_value = property.GetValue(newPerson, null);
                if (prop_name != "id") {
                    if ((prop_value != null) && (prop_value !="")) {
                        definition_fields += String.Format("{0}, ", prop_name);
                        value_fields += String.Format("N'{0}', ", prop_value);
                    }
                }
            }
            value_fields = value_fields.TrimEnd(", ".ToCharArray());
            definition_fields = definition_fields.TrimEnd(", ".ToCharArray());
            value_fields += ")";
            definition_fields += ")";
            string queryString = String.Format(@"INSERT INTO Employeers {0} VALUES {1}", definition_fields, value_fields);

            if (value_fields != "()") {
                executeSimpleQuery(queryString);
            }
        }

        /// <summary>
        /// Получение данных из БД, для дальнейшей работы с ними
        /// </summary>
        public void loadData(Firm frm) {
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
                    string _department = reader["DepartmentId"].ToString();
                    frm.personList.Add(new Person(_surname, _name, _patronymic, _department));
                }
                reader.Close();

                queryString = "SELECT * FROM Department";
                command.CommandText = queryString;
                reader = command.ExecuteReader();
                while (reader.Read()) {
                    int _id = (int)reader["Id"];
                    string _depName = reader["Name"].ToString();
                    frm.departmentList.Add(new Department(_id, _depName));
                }
                command.Dispose();
                reader.Dispose();
            }
        }
    }
}