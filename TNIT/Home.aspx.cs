using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class Home : System.Web.UI.Page
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

            string str = "select top 13 * from TNIT_Topic,TNIT_User where IsClose='已审核' and TNIT_User.UserID = TNIT_Topic.UserID order by TNIT_Topic.CreatedOn desc";
            this.Repeater1.DataSource = TNIT.SQL.Execute(str);
            this.Repeater1.DataBind();
        }
    }
}