using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class HTxgyh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Request.QueryString["userid"]);
            string nickname = SQL.Execute("select * from TNIT_User where UserID=" + userid).Tables[0].Rows[0]["NickName"].ToString();
            string qq = SQL.Execute("select * from TNIT_User where UserID=" + userid).Tables[0].Rows[0]["QQ"].ToString();
            string pwd = SQL.Execute("select * from TNIT_User where UserID=" + userid).Tables[0].Rows[0]["Password"].ToString();

            if(!IsPostBack){
                TextBox1.Text = nickname;
                TextBox2.Text = qq;
                TextBox3.Text = pwd;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Request.QueryString["userid"]);
            string nickname = TextBox1.Text;
            string qq = TextBox2.Text;
            string pwd = TextBox3.Text;

            SQL.Preservation("update TNIT_User set NickName='"+nickname+"',QQ='"+qq+"',Password='"+pwd+"' where UserID="+userid);
            Response.Redirect("HTxsyh.aspx");
        }
    }
}