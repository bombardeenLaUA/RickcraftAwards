using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace library
{
    public class Class1
    {
        private string constring;

        public Class1()
        {
            constring = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;
        }
    }
}