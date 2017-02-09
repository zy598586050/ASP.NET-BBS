using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TNIT
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string str = ConfigurationManager.ConnectionStrings["smdbconn"].ConnectionString;
            if (DropDownList1.SelectedValue == "普通用户")
            {
                using (SqlConnection conn = new SqlConnection(str))
                {
                    try
                    {
                        conn.Open();
                        string cmdText = "select count(*) from TNIT_User where UserName=@user and Password=@pwd  and Enabled='用户'";
                        SqlCommand cmd = new SqlCommand(cmdText, conn);
                        SqlParameter[] ps = { new SqlParameter("user", TextBox1.Text), new SqlParameter("pwd", TextBox2.Text) };
                        cmd.Parameters.AddRange(ps);
                        if (((int)cmd.ExecuteScalar()) > 0)
                        {
                            Session["user"] = SQL.Execute("select * from TNIT_User where UserName='" + TextBox1.Text + "' and Enabled='用户'").Tables[0].Rows[0]["NickName"].ToString();
                            Session.Timeout = 1440;
                            Response.Redirect("PostList.aspx");
                        }
                        else
                        {
                            Response.Write("<script>layer.msg('登录失败!', function(){});</script>");
                        }
                    }
                    catch (SqlException es)
                    {
                        Response.Write("异常" + es);
                    }
                }
            }
            else {
                using (SqlConnection conn = new SqlConnection(str))
                {
                    try
                    {
                        conn.Open();
                        string cmdText = "select count(*) from TNIT_User where UserName=@user and Password=@pwd  and Enabled='管理员'";
                        SqlCommand cmd = new SqlCommand(cmdText, conn);
                        SqlParameter[] ps = { new SqlParameter("user", TextBox1.Text), new SqlParameter("pwd", TextBox2.Text) };
                        cmd.Parameters.AddRange(ps);
                        if (((int)cmd.ExecuteScalar()) > 0)
                        {
                            Session["admin"] = SQL.Execute("select * from TNIT_User where UserName='" + TextBox1.Text + "' and Enabled='管理员'").Tables[0].Rows[0]["NickName"].ToString();
                            Session.Timeout = 1440;
                            Response.Redirect("Backstage.aspx");
                        }
                        else
                        {
                            Response.Write("<script>layer.msg('登录失败!', function(){});</script>");
                        }
                    }
                    catch (SqlException es)
                    {
                        Response.Write("异常" + es);
                    }
                }
            }
        }
    }
}