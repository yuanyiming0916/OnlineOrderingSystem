<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆页面</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script type="text/javascript">
	//页面加载获取验证码图片    
	$(function() { 	
		updateCaptcha();
	});
	
	//注册
	function registerClick() {
		window.location.href = "<%=request.getContextPath()%>/UserController/add";
	};
	
	//登录
	function loginClick() {
		var name = $("#name").val().trim();
		var password = $("#password").val().trim();
		var captcha = $("#captcha").val().toUpperCase().trim(); //转换为大写（验证码不区分大小写）
		var captcha_input = $("#captcha_input").val().toUpperCase().trim();
		if(name == ""){
			$("#name").focus();
			return;
		}
		if(password == ""){
			$("#password").focus();
			return;
		}
		if(captcha == ""){
			$("#captcha").focus();
			return;
		}
		if(captcha != captcha_input){
			alert("验证码输入错误，请重新输入");
			$("#captcha").val("");
			$("#captcha").focus();
			updateCaptcha(); //刷新验证码
			return;
		}
		$.ajax({
			url : "${pageContext.request.contextPath }/UserController/login",
			data : { //数据
				name : name,
				password : password,
			},
			type : "POST", //请求方式
			dataType : "json", //数据返回类型
			async : false,//同步
			success : function(data) { //成功，回调函数
				if (data.msg == null) {
					window.location.href = "<%=request.getContextPath()%>/MenuController/findAll"; //进入首页
				}
				if (data.msg == "-1") {
					alert("用户名和密码不正确");
				}
			},
			error : function() {
				alert("系统错误");
			}
		});
	};
	
	//生成验证码
	function setCaptcha(){
		var arr_char = ['0','1','2','3','4','5','6','7','8','9',
						'a','b','c','d','e','f','g',
						'h','i','j','k','l','m','n',
						'o','p','q','r','s','t',
						'u','v','w','x','y','z',
						'A','B','C','D','E','F','G',
						'H','I','J','K','L','M','N',
						'O','P','Q','R','S','T',
						'U','V','W','X','Y','Z'];
		var captcha = "";
		for(var i = 0 ; i < 4 ; i++){
			var rad_int = parseInt(Math.random() * 62);
			captcha += arr_char[rad_int];
		}
		return captcha;
	}
	
	//更新验证码
	function updateCaptcha() {
	    var random = new Date().getTime()+''+Math.floor(Math.random() * Math.pow(10, 8)); //时间戳
	    var cap = setCaptcha();
		$("#captcha_input").val(cap);
		//将验证码传至后台生成验证码图片并返回
		$("#captcha_img").attr('src',"<%=request.getContextPath()%>/CaptchaController/outputCaptcha?rad=" + random + "&captcha=" + cap);
	}
</script>
</head>
<body>
	<div style="width: 1511px; height: 706px;" align="center">
		<h3>系统登录</h3>
		<table>
			<tr>
				<td>用&nbsp;&nbsp;&nbsp;户：</td>
				<td colspan="2"><input type="text" name="name" id="name"
					value="张三" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td height="12px;"></td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;&nbsp;码：</td>
				<td colspan="2"><input type="password" name="password"
					id="password" value="zhangsan" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td height="10px;"></td>
			</tr>
			<tr>
				<td>验证码：</td>
				<td><input type="text" name="captcha" id="captcha"
					placeholder="请输入验证码" style="width: 90px;" /></td>
				<td height="40px;"><a href="javascript:void(0);" onclick="updateCaptcha()"
					style="float: right;"> <img src="" alt="" id="captcha_img">
				</a></td>
			</tr>
			<tr>
				<td height="12px;"></td>
			</tr>
		</table>
		<table style="width: 277px;">
			<tr>
				<td align="center"><input type="button" value="注册" onclick="registerClick()" /></td>
				<td align="center"><input type="button" value="登录" onclick="loginClick()" /></td>
			</tr>
			<tr style="display: none;">
				<td><input type="text" value="" id="captcha_input" /></td>
			</tr>
		</table>
	</div>
</body>
</html>