using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class HTtjadmin : System.Web.UI.Page
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
            string str = "select * from TNIT_User order by RegistrationTime desc";
            this.Repeater1.DataSource = TNIT.SQL.Execute(str);
            this.Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                SQL.Preservation("update TNIT_User set Enabled='管理员' where UserID=" + e.CommandArgument);
                Response.Redirect("HTtjadmin.aspx");
            }
            else if (e.CommandName == "dell")
            {
                SQL.Preservation("update TNIT_User set Enabled='用户' where UserID=" + e.CommandArgument);
                Response.Redirect("HTtjadmin.aspx");
            }
        }
    }
}