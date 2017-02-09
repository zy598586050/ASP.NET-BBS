using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace TNIT
{
    public class SQL
    {
        static string str = "Data Source=.;Initial Catalog=TNIT_DBA;Integrated Security=True";

        public static DataSet Execute(string sql){

            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sa.Fill(ds, "test");
            conn.Close();
            return ds;

        }

        public static int Preservation(string sql)
        {
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            int i = (int)cmd.ExecuteNonQuery();
            conn.Close();
            return i;
        }
    }
}