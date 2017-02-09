using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class HTdeletehf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.DataBind();//将数据绑定到Repeater控件上
            }
        }

        public void DataBind()
        {
            string str = "select NickName,ReContentery,Title,ReplyID from TNIT_User join TNIT_Reply on TNIT_User.UserID=TNIT_Reply.UserID join TNIT_Topic on TNIT_Topic.TopicID=TNIT_Reply.TopicID order by TNIT_Topic.CreatedOn desc";
            this.Repeater1.DataSource = TNIT.SQL.Execute(str);
            this.Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "del"){
                SQL.Preservation("delete from TNIT_Reply where ReplyID="+e.CommandArgument);
                Response.Redirect("HTdeletehf.aspx");
            }
        }
    }
}