<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HTxgyh.aspx.cs" Inherits="TNIT.HTxgyh" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="css/publish.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<style>
    .timg
    {
        width:200px;
        height:200px;
        background:#eee;
        text-align:center;
        line-height:200px;
    }
    .textbox
    {
        width:100px;
        height:30px;
        border:1px solid #dddcdc;
        border-radius:5px;
        padding-left:10px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:0px 10px 0px 20px;">
    <ul class="post-ul">
			<li class="post-li">修改用户</li>
	</ul>
		<div class="post-title">
            <strong>昵称：</strong>
            <asp:TextBox class="textbox" ID="TextBox1" runat="server"></asp:TextBox>
		</div>
        <div class="post-title">
            <strong>QQ ：</strong>
            <asp:TextBox class="textbox" ID="TextBox2" runat="server"></asp:TextBox>
		</div>
        <div class="post-title">
            <strong>密码：</strong>
            <asp:TextBox class="textbox" ID="TextBox3" runat="server"></asp:TextBox>
		</div>
		<div class="timg">图片上传</div>
		<div class="post-btn">
            <asp:Button class="post-btn-btn" OnClientClick="return confirm('确定修改吗?')" ID="Button1" runat="server" Text="修改用户" 
                BorderStyle="None" onclick="Button1_Click" />
		</div>
        </div>
    </form>
<script>
    $(document).ready(function () {
        var counter = $(".post-t").val().length;
        $("#zf strong").text(20 - counter);
        $('.post-t').bind('input propertychange', function () {
            var text = $(".post-t").val();
            var counter = text.length;
            $("#zf strong").text(20 - counter);
        });
    });
</script>
</body>
</html>
