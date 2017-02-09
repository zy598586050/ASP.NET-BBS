using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class HTClassY : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                string title = SQL.Execute("select * from TNIT_Class where ClassID=" + Convert.ToInt32(Request.QueryString["classid"])).Tables[0].Rows[0]["ClassName"].ToString();
                TextBox1.Text = title;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SQL.Preservation("update TNIT_Class set ClassName='" + TextBox1.Text + "' where ClassID=" + Convert.ToInt32(Request.QueryString["classid"]));
            Response.Redirect("HTClassX.aspx");
        }
    }
}