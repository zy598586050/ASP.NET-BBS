<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Backstage.aspx.cs" Inherits="TNIT.Backstage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>TNIT技术社区-后台</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" media="screen" />

    <!-- Bootstrap core CSS -->
    <link href="Backstage/css/bootstrap.min.css" rel="stylesheet">
    <link href="Backstage/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="Backstage/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="Backstage/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <link rel="stylesheet" href="Backstage/css/owl.carousel.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="Backstage/css/style.css" rel="stylesheet">
    <link href="Backstage/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
      .neirong{
        width: 100%;
        height: 550px;
        background: #ffffff;
        border: 1px solid #e6e6e6;
        border-radius: 5px;
      }
    </style>
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <header class="header white-bg">
            <div class="sidebar-toggle-box">
                <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
            </div>
            <!--logo start-->
            <a href="#" class="logo">TNIT<span>技术社区</span></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-tasks"></i>
                        </a>
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-alt"></i>
                            <span class="badge bg-important" runat="server" id="fkcount">5</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-red"></div>
                            <li>
                                <p class="red">有 <strong runat="server" id="fkcounta">5</strong> 条反馈消息</p>
                            </li>
<asp:Repeater ID="Repeater2" runat="server">
<ItemTemplate>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="Backstage/img/avatar-mini.jpg"></span>
                                    <span class="subject">
                                    <span class="from"><%#Eval("NickName")%></span>
                                    <span class="time"><%#Eval("Time")%></span>
                                    </span>
                                    <span class="message" style="text-overflow:ellipsis;overflow:hidden;">
                                        <%#Eval("Opinion")%>
                                    </span>
                                </a>
                            </li>
</ItemTemplate>
</asp:Repeater>
                            <li>
                                <a class="ht-fk" href="#">查看所有反馈内容</a>
                            </li>
                        </ul>
                    </li>
                    <!-- inbox dropdown end -->
                    <!-- notification dropdown start-->
                    <li id="header_notification_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-alt"></i>
                            <span runat="server" id="tzcount" class="badge bg-warning">7</span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-yellow"></div>
                            <li>
                                <p class="yellow">有 <strong runat="server" id="tzcounta">7</strong> 个新帖子等待审核</p>
                            </li>
<asp:Repeater ID="Repeater1" runat="server">
<ItemTemplate>
                            <li>
                                <a href="#">
                                    <span class="label label-warning"><i class="icon-bell"></i></span>
                                    <%#Eval("Title")%>
                                    <span class="small italic"><%#Eval("CreatedOn")%></span>
                                </a>
                            </li>
</ItemTemplate>
</asp:Repeater>
                            <li>
                                <a class="ht-shtz" href="#">查看所有未审核帖子</a>
                            </li>
                        </ul>
                    </li>
                    <!-- notification dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-nav ">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <li>
                        <input type="text" class="form-control search" placeholder="Search">
                    </li>
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="Backstage/img/avatar1_small.jpg">
                            <span runat="server" id="username" class="username"></span>
                        </a>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!--search & user info end-->
            </div>
        </header>
      <!--header end-->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">
                  <li class="active">
                      <a class="" href="Home.aspx">
                          <i class="icon-github-alt"></i>
                          <span>TNIT技术社区</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon-user"></i>
                          <span>用户管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="ht-tjadmin" href="#">增加管理员</a></li>
                          <li><a class="ht-xsyh" href="#">修改删除用户</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon-th-large"></i>
                          <span>版块管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="ht-class" href="#">增加版块</a></li>
                          <li><a class="ht-classx" href="#">修改删除版块</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon-pencil"></i>
                          <span>发帖管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="ht-zjtz" href="#">增加帖子</a></li>
                          <li><a class="ht-xstz" href="#">修改删除帖子</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon-comments-alt"></i>
                          <span>回复管理</span>
                          <span class="arrow"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="ht-ckfk" href="#">查看反馈</a></li>
                          <li><a class="ht-schf" href="#">删除回复</a></li>
                      </ul>
                  </li>
                  <li class="active">
                      <a class="" href="Login.aspx">
                          <i class="icon-signout"></i>
                          <span>退出后台</span>
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <iframe class="neirong" frameborder="0" id="frame" name="center" src="HTPublish.aspx">
              </iframe>
          </section>
      </section>
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="Backstage/js/jquery.js"></script>
    <script src="Backstage/js/jquery-1.8.3.min.js"></script>
    <script src="Backstage/js/bootstrap.min.js"></script>
    <script src="Backstage/js/jquery.scrollTo.min.js"></script>
    <script src="Backstage/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="Backstage/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="Backstage/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="Backstage/js/owl.carousel.js" ></script>
    <script src="Backstage/js/jquery.customSelect.min.js" ></script>

    <!--common script for all pages-->
    <script src="Backstage/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="Backstage/js/sparkline-chart.js"></script>
    <script src="Backstage/js/easy-pie-chart.js"></script>

  <script>

      //owl carousel

      $(document).ready(function () {
          $("#owl-demo").owlCarousel({
              navigation: true,
              slideSpeed: 300,
              paginationSpeed: 400,
              singleItem: true

          });
      });

      //custom select box

      $(function () {
          $('select.styled').customSelect();

          $('.ht-fk').click(function () {
              $('#frame').attr("src", "HTckhf.aspx");
          });

          $('.ht-shtz').click(function () {
              $('#frame').attr("src", "HTxstz.aspx");
          });

          $('.ht-zjtz').click(function () {
              $('#frame').attr("src","HTPublish.aspx");
          });

          $('.ht-xstz').click(function () {
              $('#frame').attr("src", "HTxstz.aspx");
          });

          $('.ht-ckfk').click(function () {
              $('#frame').attr("src", "HTckhf.aspx");
          });

          $('.ht-schf').click(function () {
              $('#frame').attr("src", "HTdeletehf.aspx");
          });

          $('.ht-class').click(function () {
              $('#frame').attr("src", "HTClass.aspx");
          });

          $('.ht-classx').click(function () {
              $('#frame').attr("src", "HTClassX.aspx");
          });

          $('.ht-tjadmin').click(function () {
              $('#frame').attr("src", "HTtjadmin.aspx");
          });

          $('.ht-xsyh').click(function () {
              $('#frame').attr("src", "HTxsyh.aspx");
          });
      });

  </script>

  </body>
</html>

