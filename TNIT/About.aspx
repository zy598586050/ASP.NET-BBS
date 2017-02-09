<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TNIT.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/about.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="abt">

<div class="abt-a">
<img src="images/logo.png" />
</div>

<div class="abt-b">
<h1>www.tnit.com</h1>
</div>

<div class="abt-c">
    <asp:TextBox style="width:100%;height:100%;border-radius: 5px;padding-left:13px;padding-top:10px;" ID="TextBox1" placeholder="您的意见将会使我们进步······" runat="server" TextMode="MultiLine"></asp:TextBox>
</div>

<div>
    <asp:Button class="btn" ID="Button1" runat="server" Text="意见提交" 
        onclick="Button1_Click" />
</div>

</div>
</asp:Content>
