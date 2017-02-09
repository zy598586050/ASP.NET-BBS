using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class HTckhfX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Request.QueryString["userid"]);
            int opinid = Convert.ToInt32(Request.QueryString["opinionid"]);
            stron.InnerText = SQL.Execute("select * from TNIT_User where UserID="+userid).Tables[0].Rows[0]["NickName"].ToString();
            TextBox1.Text = SQL.Execute("select * from TNIT_Feedback where OpinionID=" + opinid).Tables[0].Rows[0]["Opinion"].ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int opinid = Convert.ToInt32(Request.QueryString["opinionid"]);
            SQL.Preservation("update TNIT_Feedback set IsSee='已查看' where OpinionID="+opinid);
            Response.Redirect("HTckhf.aspx");
        }
    }
}