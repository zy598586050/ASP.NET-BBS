<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HTClassY.aspx.cs" Inherits="TNIT.HTClassY" %>

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
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:0px 10px 0px 20px;">
    <ul class="post-ul">
			<li class="post-li">修改/删除版块</li>
		</ul>
		<div class="post-title">
            <strong>版块名称：</strong>
            <asp:TextBox class="post-t" placeholder="请输入一个标题" maxlength="20" ID="TextBox1" runat="server"></asp:TextBox>
            <span id="zf">还可输入<strong>--</strong>个字符</span>
		</div>
		<div class="timg">图片上传</div>
		<div class="post-btn">
            <asp:Button class="post-btn-btn" ID="Button1" runat="server" Text="修改版块" 
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
