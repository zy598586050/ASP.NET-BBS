using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace TNIT
{
    public partial class HTxstzX : System.Web.UI.Page
    {
        public static string text;//内容
        protected void Page_Load(object sender, EventArgs e)
        {
            int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
            DropDownList1.SelectedValue = SQL.Execute("select * from TNIT_Topic,TNIT_Class where TopicID=" + topicid +" and TNIT_Topic.ClassID=TNIT_Class.ClassID").Tables[0].Rows[0]["ClassName"].ToString();
            TextBox1.Text = SQL.Execute("select * from TNIT_Topic where TopicID=" + topicid).Tables[0].Rows[0]["Title"].ToString();
            demo.Value = SQL.Execute("select * from TNIT_Topic where TopicID=" + topicid).Tables[0].Rows[0]["Contentery"].ToString();
            string isfalse = SQL.Execute("select * from TNIT_Topic where TopicID=" + topicid).Tables[0].Rows[0]["IsClose"].ToString();
            if(isfalse == "已审核"){
                Button3.Visible = false;
            }
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
            else {
                int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
                string bkid = SQL.Execute("select * from TNIT_Class where ClassName='" + DropDownList1.SelectedValue + "'").Tables[0].Rows[0]["ClassID"].ToString();//版块ID
                string title = TextBox1.Text;//标题
                string usid = SQL.Execute("select * from TNIT_User where NickName='" + Session["admin"] + "'").Tables[0].Rows[0]["UserID"].ToString();//userid
                string str = "update TNIT_Topic set ClassID="+bkid+",UserID="+usid+",Title='"+title+"',Contentery='"+text+"' where TopicID="+topicid;

                if (TNIT.SQL.Preservation(str) > 0)
                {
                    string countstr = "select COUNT(*) from TNIT_Topic where UserID=" + usid;
                    int count = (int)SQL.Execute(countstr).Tables[0].Rows[0][0];
                    TNIT.SQL.Preservation("update TNIT_User set TopicCount=" + count + " where UserID=" + usid);
                    Response.Redirect("HTxstz.aspx");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('发表失败');</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
            SQL.Preservation("delete from TNIT_Topic where TopicID="+topicid);
            Response.Redirect("HTxstz.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
            SQL.Preservation("update TNIT_Topic set IsClose='已审核' where TopicID="+topicid);
            Response.Redirect("HTxstz.aspx");
        }
    }
}