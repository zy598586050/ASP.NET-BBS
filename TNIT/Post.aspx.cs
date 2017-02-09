using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace TNIT
{
    public partial class Post : System.Web.UI.Page
    {
        public static string text;//内容
        int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.DataBind1();//将数据绑定到Repeater控件上
                this.DataBind2();
            }

            int ut = (int)SQL.Execute("select * from TNIT_Topic where TopicID=" + Convert.ToInt32(Request.QueryString["topicid"])).Tables[0].Rows[0]["BrowseCount"];
            count = ut;
            count += 1;
            SQL.Preservation("update TNIT_Topic set BrowseCount=" + count + " where TopicID=" + Convert.ToInt32(Request.QueryString["topicid"]));
        }

        public void DataBind1(){

            int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
            string str = "select * from TNIT_Topic,TNIT_User where TopicID=" + topicid + " and TNIT_User.UserID = TNIT_Topic.UserID";
            this.Repeater1.DataSource = TNIT.SQL.Execute(str);
            this.Repeater1.DataBind();
        }

        public void DataBind2()
        {
            int topicid = Convert.ToInt32(Request.QueryString["topicid"]);
            string str = "select * from TNIT_Reply,TNIT_User where TopicID=" + topicid + " and TNIT_User.UserID = TNIT_Reply.UserID";
            this.Repeater2.DataSource = TNIT.SQL.Execute(str);
            this.Repeater2.DataBind();
        }

        [WebMethod]
        public static string cz(string txt)
        {
            text = txt;
            return txt;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                if (text == "")
                {
                    Response.Write("<script>alert('内容为空！');</script>");
                }
                else {
                    int topicid = Convert.ToInt32(Request.QueryString["topicid"]);//topicid
                    string usid = SQL.Execute("select * from TNIT_User where NickName='" + Session["user"] + "'").Tables[0].Rows[0]["UserID"].ToString();//userid
                    string str = "insert into TNIT_Reply (TopicID,UserID,ReContentery) values ("+topicid+","+usid+",'"+text+"')";
                    if (TNIT.SQL.Preservation(str) > 0)
                    {
                        Response.Write("<script type='text/javascript'>alert('回复成功');</script>");
                        string countstr = "select COUNT(*) from TNIT_Reply where TopicID="+topicid;
                        int count = (int)SQL.Execute(countstr).Tables[0].Rows[0][0];
                        TNIT.SQL.Preservation("update TNIT_Topic set ReplyCount = "+count+" where TopicID = "+topicid);
                        Response.Redirect("Post.aspx?topicid="+topicid);
                    }
                    else
                    {
                        Response.Write("<script type='text/javascript'>alert('发表失败');</script>");
                    }
                }
            }
            else {
                Response.Write("<script>alert('请登录后发表！');</script>");
            }
        }
    }
}