using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class HTClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int uid = (int)SQL.Execute("select * from TNIT_User where NickName='" + Session["admin"] + "'").Tables[0].Rows[0]["UserID"];//userid
            SQL.Preservation("insert into TNIT_Class (ClassName,UserID) values ('"+TextBox1.Text+"',"+uid+")");
            Response.Redirect("HTClass.aspx");
        }
    }
}