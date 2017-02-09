<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HTckhfX.aspx.cs" Inherits="TNIT.HTckhfX" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/publish.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <style>
        .text
        {
            width:98%;
            height:360px;
            padding-left:10px;
            padding-top:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:0px 10px 0px 20px;">
    <ul class="post-ul">
			<li class="post-li">查看反馈</li>
		</ul>
		<div class="post-title">
            <h1>反馈者：<strong runat="server" id="stron">123456</strong></h1>
		</div>
        <asp:TextBox ID="TextBox1" class="text" runat="server" TextMode="MultiLine"></asp:TextBox>
        <div class="post-btn">
            <asp:Button class="post-btn-btn" ID="Button1" runat="server" Text="标记为已读" 
                BorderStyle="None" onclick="Button2_Click" />
		</div>
        </div>
    </form>
</body>
</html>
