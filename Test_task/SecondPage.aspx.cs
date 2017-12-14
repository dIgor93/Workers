using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test_task {
    public partial class SecondPage : System.Web.UI.Page {

        Firm emp;

        protected void Page_Load(object sender, EventArgs e) {
            emp = new Firm();
        }

        /// <summary>
        /// Обработчик для RadioButton - выбраного пользователем разделителя из списка 
        /// </summary>
        protected void Symbols_CheckedChanged(object sender, EventArgs e) {
            string innerSeparator = "";
            if (Space.Checked) {
                innerSeparator = " ";
            } else if (NewLine.Checked) {
                innerSeparator = "<br />";
            } else if (Colon.Checked) {
                innerSeparator = ", ";
            }

            emp.separator = innerSeparator;
            Separator.Text = "";

            OutputList.Text = emp.printWorkersByDepartments();
        }

        /// <summary>
        /// Обработчик тектстового поля - работа с разделителем, введенным пользователем
        /// </summary>
        protected void Separator_TextChanged(object sender, EventArgs e) {
            emp.separator = Separator.Text;
            OutputList.Text = emp.printWorkersByDepartments();

            Space.Checked = false;
            NewLine.Checked = false;
            Colon.Checked = false;
        }


    }
}