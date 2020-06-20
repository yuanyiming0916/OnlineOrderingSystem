<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submit_1").click(function() {
			var str = "";
			var name = $("#name").val();
			var password = $("#password").val();
			var password_1 = $("#password_1").val();
			var phone = $("#phone").val();
			var status = 0;
			
			if (name == null || name == "") {
				status = status + 1;
				str += status + ".请输入姓名\n";
			}
			if (password == null|| password == "") {
				status = status + 1;
				str += status + ".请输入密码\n";
			}
			if (password_1 == null|| password_1 == "") {
				status = status + 1;
				str += status + ".请输入密码\n";
			}
			if (phone == null || phone == "") {
				status = status + 1;
				str += status + "请输入手机号\n";
			}
			if (phone != null&& !(/^(13[0-9]|14[1|4|5|6|7|8]|15[0|1|2|3|5|6|7|8|9]|166|17[0|1|3|5|6|7|8]|18[0-9]|19[8|9])\\d{8}$/.test(phone))) {
				status = status + 1;
				str += status + ".请输入有效手机号\n";
			}
			if (password != password_1) {
				status = status + 1;
				str += status + ".两次密码输入不同\n";
			}
			if (status > 0) {
				alert(str);
			}
			if (password == password_1&& status == 0) {
				$.ajax({
					url : "${pageContext.request.contextPath }/UserController/doAdd",
					data : { //数据
						name : name,
						password : password,
						phone : phone
					},
					type : "POST", //请求方式
					dataType : "json", //数据返回类型
					async : false,//同步
					success : function(data) { //成功，回调函数
						alert(data.msg);
						if (data.msg == "注册成功") {
							$("#submit_1").attr("disabled",true);
						}
					},
					error : function() {
						alert("json返回数据失败");
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<div style="width: 1511px; height: 706px;">
		<input type="button" name="Submit"
			onclick="javascript:history.back(-1);" value="返回">
		<div align="center">
			<h3>用户注册</h3>
			<table>
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="name" id="name"
						autofocus="autofocus" autocomplete="off"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password_1" id="password_1"></td>
				</tr>
				<tr>
					<td>手机：</td>
					<td><input type="text" name="phone" id="phone" maxlength="11"
						autocomplete="off"></td>
				</tr>
				<tr>
					<td height="10px"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="提交"
						id="submit_1" name="submit_1" /></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>