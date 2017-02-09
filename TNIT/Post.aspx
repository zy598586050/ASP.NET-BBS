<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="TNIT.Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/post.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="layui/css/layui.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
	<div class="post-a">
			<div class="post-left">
				<div class="post-left-portrait">
					<img style="width: 100%;height: 100%;" src="images/02.jpg">
				</div>
				<div class="n-a">昵称：<%#Eval("NickName")%></div>
				<div class="n-b">性别：<%#Eval("Sex")%></div>
				<div class="n-b">QQ：<%#Eval("QQ")%></div>
			</div>
			<div class="post-right">
				<div class="post-right-a">
					<h1 style="float: left;font-size:20px;font-family:'黑体';color:#000;font-weight:700;"><%#Eval("Title")%></h1>
					<h1 style="float: right;margin-right: 20px;">楼主</h1>
				</div>
                <div class="lh">浏览：<%#Eval("BrowseCount")%> | 回复：<%#Eval("ReplyCount")%> | 发表于：<%#Eval("CreatedOn")%></div>
				<div class="post-right-b">
					<p><%#Eval("Contentery") %></p>
				</div>
				<div class="post-right-c">
					<h1 style="float: left;">回复</h1>
					<h1 style="float: right;">举报</h1>
				</div>
			</div>
		</div>
</ItemTemplate>
</asp:Repeater>

<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
	<div class="post-a">
			<div class="post-left">
				<div class="post-left-portrait">
					<img style="width: 100%;height: 100%;" src="images/02.jpg">
				</div>
				<div class="n-a">昵称：<%#Eval("NickName")%></div>
				<div class="n-b">性别：<%#Eval("Sex")%></div>
				<div class="n-b">QQ：<%#Eval("QQ")%></div>
			</div>
			<div class="post-right">
				<div class="post-right-a">
					<h1 style="float: left;">发表于 <%#Eval("CreatedOn")%></h1>
					<h1 style="float: right;margin-right: 20px;">小白</h1>
				</div>
				<div class="post-right-b-b">
					<p><%#Eval("ReContentery") %></p>
				</div>
				<div class="post-right-c">
					<h1 style="float: left;">回复</h1>
					<h1 style="float: right;">举报</h1>
				</div>
			</div>
		</div>
</ItemTemplate>
</asp:Repeater>

		<div class="post-a" style="min-height: 180px;">
			<div class="post-left" style="min-height: 180px;">
				<div class="post-left-portrait">
					<img style="width: 100%;height: 100%;" src="images/02.jpg">
				</div>
			</div>
			<div class="post-right">
				<textarea id="demo" style="display: none;"></textarea>
                <asp:Button class="hf-c" ID="Button1" runat="server" Text="发表回复" 
                    BorderStyle="None" onclick="Button1_Click" />
			</div>
		</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" Runat="Server">
<script src="layui/layui.js"></script>
<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit;
        var index = layedit.build('demo', {
            height: 88, //设置编辑器高度
            tool: ['face', 'image', 'link']
        });
        layedit.set({
            uploadImage: {
                url: '' //接口url
                , type: 'post' //默认post
            }
        });

        setInterval(function () {
            var tex = layedit.getContent(index);
            $.ajax({
                type: "post",
                url: "Post.aspx/cz",
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
</asp:Content>