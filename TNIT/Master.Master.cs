using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace TNIT
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null){
                welcome.InnerText = "欢迎 " + Session["user"].ToString();
                LinkButton1.Text = "注销";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("Publish.aspx");
            }
            else {
                Response.Write("<script>alert('请登录后发表！');</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else {
                Session["user"] = null;
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PostList.aspx?cx="+ipt.Value);
        }
    }
}