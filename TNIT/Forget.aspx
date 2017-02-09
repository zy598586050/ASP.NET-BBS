<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="TNIT.Forget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" class="no-js">

    <head>

        <meta charset="utf-8">
        <title>TNIT技术社区</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" media="screen" />
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <style>
            .ddlist
            {
                width:300px;
                height:42px;
                line-height:42px;
                margin-top:25px;
                padding:0 15px;
                background:rgba(45,45,45,.15);
                border-radius:6px;
                border: 1px solid rgba(255,255,255,.15);
                box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
                font-family: 'PT Sans', Helvetica, Arial, sans-serif;
                font-size: 14px;
                color: #fff;
                text-shadow: 0 1px 2px rgba(0,0,0,.1);
                outline:none;
            }
            .ddlist option
            {
                height:42px;
                background:#FF5126;
            }
        </style>

    </head>

    <body oncontextmenu="return false">

        <div class="page-container">
            <h1>TNIT技术社区</h1>
            <form id="Form1" action="" runat="server" method="post">
				<div>
					<!--<input type="text" name="username" class="username" placeholder="Username" autocomplete="off"/>-->
                    <asp:TextBox type="text" name="username" class="username" placeholder="用户名" autocomplete="off" ID="TextBox1" runat="server"></asp:TextBox>
				</div>
                <div>
                    <asp:TextBox type="password" style="width:150px;float:left;margin-right:5px;" name="password" class="password" placeholder="验证码" oncontextmenu="return false" onpaste="return false" ID="TextBox3" runat="server"></asp:TextBox>
                    <input id="Button1" style="width:110px;background:#f04b0b;" type="button" value="发送验证码" />
                </div>
                <div>
                    <asp:TextBox type="password" name="password" class="password" placeholder="新密码" oncontextmenu="return false" onpaste="return false" ID="TextBox2" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:TextBox type="password" name="password" class="password" placeholder="确认密码" oncontextmenu="return false" onpaste="return false" ID="TextBox4" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="submit" class="button" runat="server" Text="修 改" BorderStyle="None" 
                    onclick="submit_Click" />
                <div>
                    <div style="margin-top:25px;margin-bottom:10px;float:left;"><a href="Login.aspx" style="color:#fff;">已有账号</a></div>
                    <div style="margin-top:25px;margin-bottom:10px;float:right;"><a href="Register.aspx" style="color:#fff;">用户注册</a></div>
                </div>
            </form>
            <div class="connect">
                <p>There are no secrets to success. It is the result of preparation, hard work, and learning from failure.</p>
				<p style="margin-top:20px;">成功没有诀窍，它是筹备，苦干以及在失败中汲取教训的结果。</p>
            </div>
        </div>

        <!-- Javascript -->
		<script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
		<script>
		    $(".btn").click(function () {
		        is_hide();
		    })
		    var u = $("input[name=username]");
		    var p = $("input[name=password]");
		    $("#submit").live('click', function () {
		        if (u.val() == '' || p.val() == '') {
		            $("#ts").html("用户名或密码不能为空~");
		            is_show();
		            return false;
		        }
		        else {
		            var reg = /^[0-9A-Za-z]+$/;
		            if (!reg.exec(u.val())) {
		                $("#ts").html("用户名错误");
		                is_show();
		                return false;
		            }
		        }
		    });
		    window.onload = function () {
		        $(".connect p").eq(0).animate({ "left": "0%" }, 600);
		        $(".connect p").eq(1).animate({ "left": "0%" }, 400);
		    }
		    function is_hide() { $(".alert").animate({ "top": "-40%" }, 300) }
		    function is_show() { $(".alert").show().animate({ "top": "45%" }, 300) }
		</script>
    </body>

</html>
