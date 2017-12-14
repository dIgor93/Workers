using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//[assembly: OwinStartup(typeof(Owin_test_task.Startup))]

namespace Owin_test_task {
    public class Startup {
        public void Configuration(IAppBuilder app) {
            app.UseNancy();
        }
    }
}