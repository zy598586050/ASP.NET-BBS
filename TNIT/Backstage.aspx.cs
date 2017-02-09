using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TNIT
{
    public partial class Backstage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                if (!Page.IsPostBack)
                {
                    this.DataBind1();
                    this.DataBind2();
                    if (Session["admin"] != null)
                    {
                        username.InnerText = Session["admin"].ToString();
                        tzcount.InnerText = gettzcount().ToString();
                        tzcounta.InnerText = gettzcount().ToString();
                        fkcount.InnerText = getfkcount().ToString();
                        fkcounta.InnerText = getfkcount().ToString();
                    }
                }
            }
            else {
                Response.Redirect("Login.aspx");
            }
        }

        public void DataBind1()
        {
            string str = "select top 4 * from TNIT_Topic where IsClose='未审核' order by CreatedOn desc";
            this.Repeater1.DataSource = TNIT.SQL.Execute(str);
            this.Repeater1.DataBind();
        }

        public void DataBind2()
        {
            string str = "select top 4 * from TNIT_Feedback,TNIT_User where IsSee='未查看' and TNIT_User.UserID=TNIT_Feedback.UserID order by Time desc";
            this.Repeater2.DataSource = TNIT.SQL.Execute(str);
            this.Repeater2.DataBind();
        }

        public int gettzcount() {
            string countstr = "select COUNT(*) from TNIT_Topic where IsClose='未审核'";
            int count = (int)SQL.Execute(countstr).Tables[0].Rows[0][0];
            return count;
        }

        public int getfkcount() {
            string countstr = "select COUNT(*) from TNIT_Feedback where IsSee='未查看'";
            int count = (int)SQL.Execute(countstr).Tables[0].Rows[0][0];
            return count;
        }
    }
}