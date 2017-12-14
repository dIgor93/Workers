using Nancy;
using Nancy.Extensions;
using Nancy.ModelBinding;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace Owin_test_task {

    /// <summary>
    /// Класс-роутер
    /// </summary>
    public class HomeModule : NancyModule {
        public HomeModule() {
            Get["/"] = x => {
                return View["FirstPage"];
            };
            
            Get["/FirstPage.html"] = x => {
                return View["FirstPage"];
            };
            
            Get["/SeconfPage.html"] = x => {
                return View["SeconfPage"];
            };

            ///Позвращает клиенту строку с данными о сотрудниках в html-формате
            Get["/ajax_employeers_get_list"] = x => {
                string result = "";
                try {
                    string separator = this.Request.Query.separator;
                    DbModel db = new DbModel();
                    Firm firm = new Firm(separator);
                    db.loadData(firm);
                    result = firm.printWorkersByDepartments();
                } catch (Exception e) {
                    System.Diagnostics.Debug.WriteLine(e.ToString());
                } 
                return result;
            };

            ///Позвращает клиенту строку с данными о сотрудниках в json-формате
            Get["/ajax_employeers_bind"] = x => {
                DbModel db = new DbModel();
                string result = db.selectEmployeersToJson();
                return result;
            };

            ///Позвращает клиенту строку с данными о сотрудниках в json-формате
            Get["/ajax_departments"] = x => {
                DbModel db = new DbModel();
                string result = db.selectDepartmentsToJson();
                return result;
            };

            ///Обновление данных
            Post["/ajax_employeers_bind"] = x => {
                var jsonString = this.Request.Body.AsString();
                Person p = JsonConvert.DeserializeObject<Person>(jsonString);
                DbModel db = new DbModel();
                db.updateEmployee(p);
                return "";
            };

            ///Добавление новой записи
            Post["/ajax_employeers_add"] = x => {
                var jsonString = this.Request.Body.AsString();
                Person p = JsonConvert.DeserializeObject<Person>(jsonString);

                DbModel db = new DbModel();
                db.insertEmployee(p);
                return "";
                ;
            };
        }
    }
}