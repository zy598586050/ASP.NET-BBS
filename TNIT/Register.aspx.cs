using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && TextBox2.Text == TextBox3.Text)
            {
                string str = "insert into TNIT_User (UserName,NickName,Password,QQ,Sex) values ('" + TextBox1.Text + "','" + TextBox4.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "','" + DropDownList1.SelectedValue + "')";
                if (TNIT.SQL.Preservation(str) > 0)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('注册失败');</script>");
                }
            }
            else {
                Response.Write("<script type='text/javascript'>alert('输入内容有误！');</script>");
            }
        }
    }
}