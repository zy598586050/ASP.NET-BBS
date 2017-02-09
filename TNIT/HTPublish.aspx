<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HTPublish.aspx.cs" Inherits="TNIT.HTPublish" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/publish.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:0px 10px 0px 20px;">
    <ul class="post-ul">
			<li class="post-li">发表帖子</li>
		</ul>
		<div class="post-title">
            <asp:DropDownList class="post-select" ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                DataValueField="ClassName">
            </asp:DropDownList>
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="Data Source=.;Initial Catalog=TNIT_DBA;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT [ClassName] FROM [TNIT_Class]"></asp:SqlDataSource>
            <asp:TextBox class="post-t" placeholder="请输入一个标题" maxlength="20" ID="TextBox1" runat="server"></asp:TextBox>
            <span id="zf">还可输入<strong>--</strong>个字符</span>
		</div>
		<textarea id="demo" style="display: none;"></textarea>
		<div class="post-btn">
            <asp:Button class="post-btn-btn" ID="Button1" runat="server" Text="发表帖子" 
                BorderStyle="None" onclick="Button1_Click" />
		</div>
        </div>
    </form>
<script src="layui/layui.js"></script>
<script src="js/jquery.base64.js"></script>
<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        var index = layedit.build('demo', {
            height: 500 //设置编辑器高度
        });
        layedit.set({
            uploadImage: {
                url: '' //接口url
                , type: 'post' //默认post
            }
        });
        $(document).ready(function () {
            var counter = $(".post-t").val().length;
            $("#zf strong").text(20 - counter);
            $('.post-t').bind('input propertychange', function () {
                var text = $(".post-t").val();
                var counter = text.length;
                $("#zf strong").text(20 - counter);
            });
        });

        setInterval(function () {
            var tex = layedit.getContent(index);
            $.ajax({
                type: "post",
                url: "HTPublish.aspx/cz",
                data: "{'txt':'" + tex + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                },
                error: function (err) {
                }
            })
        }, 500);

    });
</script>
</body>
</html>
