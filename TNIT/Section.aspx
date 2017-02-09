<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Section.aspx.cs" Inherits="TNIT.Section" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/section.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<div class="bk">
			<div class="bk-a" style="background: #5894f7;">
				<h1>Ajax</h1>
			</div>
			<div class="bk-a" style="background: #5c6269;">
				<h1>jQuery</h1>
			</div>
			<div class="bk-a" style="background: #f07171;">
				<h1>Python</h1>
			</div>
			<div class="bk-a" style="background: #66cc99;">
				<h1>Node.js</h1>
			</div>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<div class="mk"><a href=""><%#Eval("ClassName")%></a></div>
</ItemTemplate>
</asp:Repeater>
		</div>
</asp:Content>
