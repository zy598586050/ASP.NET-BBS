using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Session["user"] != null){
                string usid = SQL.Execute("select * from TNIT_User where NickName='" + Session["user"] + "'").Tables[0].Rows[0]["UserID"].ToString();//userid
                string str = "insert into TNIT_Feedback (UserID,Opinion) values ("+usid+",'"+TextBox1.Text+"')";
                SQL.Preservation(str);
                Response.Write("<script>alert('留言成功！');</script>");
            }else{
                Response.Write("<script>alert('请登录后发表！');</script>");
            }
        }
    }
}