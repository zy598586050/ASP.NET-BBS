<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HTdeletehf.aspx.cs" Inherits="TNIT.HTdeletehf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server" visible="True">
    <title></title>
    <link rel="stylesheet" href="css/PostList.css">
    <style>
        .title a
        {
            color:#000;
            text-decoration:none;
            font-family:'黑体';
            font-size:18px;
        }
        .spana
        {
            color:#ff6c60;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:0 10px 0 10px">
<asp:Repeater ID="Repeater1" runat="server" onitemcommand="Repeater1_ItemCommand">
<ItemTemplate>
<!--动态内容-->
		<div class="li-left-a">
			<div class="li-left-b">
				<div class="portrait">
					<img width="100%" height="100%" src="images/01.jpg">
				</div>
				<div class="title">
					<div style="margin-top: 8px;"><a href='#'><%#Eval("NickName")%></a><span class="spana">【<%#Eval("Title")%>】</span>
                        <asp:Button ID="Button1" OnClientClick="return confirm('确定要删除吗?')" CommandName="del" CommandArgument='<%#Eval("ReplyID")%>' style="width:70px;height:30px;border:1px solid #e6e6e6;border-radius:5px;background:#555555;color:#ffffff;cursor:pointer;" runat="server" Text="删除回复" BorderStyle="None" />
                    </div>
					<span style="text-overflow:ellipsis;overflow:hidden;"><%#Eval("ReContentery")%></span>
				</div>
			</div>
		</div>
<!--动态内容-->
</ItemTemplate>
</asp:Repeater>
    </div>
    </form>
</body>
</html>
