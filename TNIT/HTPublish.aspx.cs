using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace TNIT
{
    public partial class HTPublish : System.Web.UI.Page
    {
        public static string text;//内容
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string cz(string txt)
        {
            text = txt;
            return txt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || text == "")
            {
                Response.Write("<script type='text/javascript'>alert('内容或标题为空');</script>");
            }
            else
            {
                string bkid = SQL.Execute("select * from TNIT_Class where ClassName='" + DropDownList1.SelectedValue + "'").Tables[0].Rows[0]["ClassID"].ToString();//版块ID
                string title = TextBox1.Text;//标题
                string usid = SQL.Execute("select * from TNIT_User where UserName='" + Session["admin"] + "'").Tables[0].Rows[0]["UserID"].ToString();//userid
                string str = "insert into TNIT_Topic (ClassID,UserID,Title,Contentery,IsClose) values (" + bkid + "," + usid + ",'" + title + "','" + text + "','已审核')";

                if (TNIT.SQL.Preservation(str) > 0)
                {
                    string countstr = "select COUNT(*) from TNIT_Topic where UserID=" + usid;
                    int count = (int)SQL.Execute(countstr).Tables[0].Rows[0][0];
                    TNIT.SQL.Preservation("update TNIT_User set TopicCount=" + count + " where UserID=" + usid);
                    Response.Write("<script type='text/javascript'>alert('发表成功！');</script>");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('发表失败');</script>");
                }
            }
        }
    }
}