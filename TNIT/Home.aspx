﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TNIT.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="css/home.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/PostList.css">
<link rel="stylesheet" type="text/css" href="css/slider.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="lbt">
  <div id="slider">
	<a href="#"><img src="img/demo1.jpg"/></a>
	<a href="#"><img src="img/demo2.jpg"/></a>
	<a href="#"><img src="img/demo3.jpg"/></a>
	<a href="#"><img src="img/demo4.jpg"/></a>
	<a href="#"><img src="img/demo5.jpg"/></a>
	<a href="#"><img src="img/demo6.jpg"/></a>
  </div>
</div>
<div class="lbt-a">
   <div class="lbt-b">
     <a href="#"><img style="height:100%;width:100%;border-radius:7px;" src="img/s1.png"/></a>
   </div>
   <div class="lbt-b">
     <a href="#"><img style="height:100%;width:100%;border-radius:7px;" src="img/s2.jpg"/></a>
   </div>
   <div class="lbt-b" style="margin:0 0 0 0;">
     <a href="#"><img style="height:100%;width:100%;border-radius:7px;" src="img/s3.jpg"/></a>
   </div>
</div>

<!--**********************************************************************************-->
<div class="li">
<div class="li-left">
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
<!--动态内容-->
		<div class="li-left-a">
			<div class="li-left-b">
				<div class="portrait">
					<img width="100%" height="100%" src="images/01.jpg">
				</div>
				<div class="title">
					<div style="margin-top: 8px;"><a href='Post.aspx?topicid=<%#Eval("TopicID")%>'><%#Eval("Title")%></a></div>
					<span><%#Eval("NickName")%> | 浏览：<%#Eval("BrowseCount")%> | 回复：<%#Eval("ReplyCount")%> | <%#Eval("CreatedOn")%></span>
				</div>
			</div>
		</div>
<!--动态内容-->
</ItemTemplate>
</asp:Repeater>
</div>

	<div class="li-right">
		<div class="btn-clock">
           <div class="btn-clock-dk"><span>打卡</span></div>
        </div>
		<div class="modular">
           <div class="modular-title"><span>推荐版块</span></div>
           <div class="modular-ls"><a href="">HTML5</a></div>
           <div class="modular-ls"><a href="">CSS3</a></div>
           <div class="modular-ls"><a href="">JavaScript</a></div>
           <div class="modular-ls"><a href="">jQuery</a></div>
           <div class="modular-ls"><a href="">WebApp</a></div>
           <div class="modular-ls"><a href="">Node.js</a></div>
           <div class="modular-ls"><a href="">Vue.js</a></div>
           <div class="modular-ls"><a href="">Python</a></div>
           <div class="modular-ls"><a href="">PHP</a></div>
           <div class="modular-ls"><a href="">Bootscript</a></div>
        </div>
		<div class="codes">
           <div class="modular-title"><span>社区活动</span></div>
           <img width="220px" height="220px" style="margin-left:15px;" src="images/tnit.png" />
        </div>
		<div class="about">
           <div class="modular-title"><span>友情链接</span></div>
           <div class="about-nr">
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a" style="border:none;"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a" style="border:none;"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a" style="border:none;"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a"><a href="">慕课网</a></div>
              <div class="about-nr-a" style="border:none;"><a href="">慕课网</a></div>
           </div>
        </div>
	</div>

</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="js" Runat="Server">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script>	    window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script type="text/javascript" src="js/vmc.slider.full.min.js"></script>
	<script type="text/javascript">
	    $(function () {
	        $('#slider').vmcSlider({
	            width: 1000,
	            height: 350,
	            gridCol: 10,
	            gridRow: 5,
	            gridVertical: 20,
	            gridHorizontal: 10,
	            autoPlay: true,
	            ascending: true,
	            effects: [
					'fade', 'fadeLeft', 'fadeRight', 'fadeTop', 'fadeBottom', 'fadeTopLeft', 'fadeBottomRight',
					'blindsLeft', 'blindsRight', 'blindsTop', 'blindsBottom', 'blindsTopLeft', 'blindsBottomRight',
					'curtainLeft', 'curtainRight', 'interlaceLeft', 'interlaceRight', 'mosaic', 'bomb', 'fumes'
				],
	            ie6Tidy: false,
	            random: false,
	            duration: 2000,
	            speed: 900
	        });
	    });
	</script>
</asp:Content>