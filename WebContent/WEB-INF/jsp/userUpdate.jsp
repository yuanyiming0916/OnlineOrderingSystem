<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新用户信息</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
</head>
<script type="text/javascript">
	//页面加载
	$(function() { 	
		var sex = $("#sex_hidden").val();
		if(sex == "男"){
			$("#man").attr("checked","checked");
			$("#woman").removeAttr("checked");
		}else{
			$("#woman").attr("checked","checked");
			$("#man").removeAttr("checked");
		}
	});
	function homePageClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findAll";
	};
	function removeClick() {		
		window.location.href = "<%=request.getContextPath()%>/UserController/remove";
	};
	function cartClick() {
		window.location.href = "<%=request.getContextPath()%>/CartController/findByIdPlus";
	};
	function orderClick() {
		window.location.href = "<%=request.getContextPath()%>/OrderController/findAll";
	};
	function historyClick() {
		window.location.href = "<%=request.getContextPath()%>/BusinessController/findByIdPlus";
	};
	function orderManageClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findAll";
	};
	function setClick() {
		window.location.href = "<%=request.getContextPath()%>/SetController/set";
	};
	function backClick() {
		window.location.href = "<%=request.getContextPath()%>/SetController/set";
	};
	/* function selectMan(){
 		$("#woman").removeAttr("checked");
		$("#man").attr("checked","checked");
	};
	function selectWoman(){
 		$("#man").removeAttr("checked");
		$("#woman").attr("checked","checked");
	}; */	
	function saveClick(id){
		var password = $("#password").val().trim();
		var phone = $("#phone").val().trim();
		var sex = $('input:radio:checked').val().trim();
		var address = $("#address").val().trim();
		var email = $("#email").val().trim();
		var status = 0 ;
		var str="";
		
		if (password == null|| password == "") {
			status = status + 1;
			str += status + ".请输入密码\n";
		}
		if (phone == null || phone == "") {
			status = status + 1;
			str += status + "请输入手机号\n";
		}
		if (phone != ""&& !(/^1[34578]\d{9}$/.test(phone))) {
			status = status + 1;
			str += status + ".请输入有效手机号\n";
		}
		if(email!=""||email!=null){//非空进入
			var atpos=email.indexOf("@");//@首次出现的位置
			var dotpos=email.lastIndexOf(".");//“.”最后出现的位置
			if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length){
				status = status + 1;
				str += status+"."+email+"不是一个有效的 e-mail 地址";
			}			
		}
		if(status>0){
			alert(str);
		}
		if(status==0){
			$.ajax({
				url : "${pageContext.request.contextPath }/UserController/doUpdate",
				data : { //数据
					id : id,
					password : password,
					phone : phone,
					sex : sex,
					address : address,
					email : email
				},
				type : "post", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
				success : function(data) { //成功，回调函数
					alert(data.msg);
					if (data.msg == "修改成功") {
						$("#save").attr("disabled",true);
					}
				},
				error : function() {
					alert("系统错误");
				}
			})
		}
	};
</script>
<style type="text/css">
</style>
</head>
<body>
	<div style="width: 1511px; height: 706px;">
		<div style="width: 1511px; height: 30px; background-color: #606060;">
			<table>
				<tr>
					<td width="1251px">Welcome</td>
					<td width="60px">用戶：</td>
					<td width="100px">${user.name }</td>
					<td width="100px"><input type="button" style="width: 100px;"
						value="退出" onclick="removeClick()" /></td>
				</tr>
			</table>
		</div>
		<div style="width: 1511px; height: 676px;">
			<div
				style="width: 100px; height: 676px; background-color: #B0B0B0; float: left;">
				<table>
					<tr>
						<td><input type="button" value="首页" style="width: 96px;"
							onclick="homePageClick()" /></td>
					</tr>
					<tr>
						<td><input type="button" value="购物车" style="width: 96px;"
							onclick="cartClick()" /></td>
					</tr>
					<tr>
						<td><input type="button" value="订单" style="width: 96px;"
							onclick="orderClick()" /></td>
					</tr>
					<tr>
						<td><input type="button" value="历史记录" style="width: 96px;"
							onclick="historyClick()" /></td>
					</tr>
					<c:if test="${user.role==2 }">
						<tr>
							<td><input type="button" value="菜谱管理" style="width: 96px;"
								onclick="orderManageClick()" /></td>
						</tr>
					</c:if>
					<tr>
						<td><input type="button" value="设置" style="width: 96px;"
							onclick="setClick()" /></td>
					</tr>
				</table>
			</div>
			<div
				style="width: 21px; height: 676px; background-color: #F0F0F0; float: left;"></div>
			<div
				style="width: 1390px; height: 676px; background-color: #F0F0F0; float: left;">
				<table>
					<tr>
						<td>修改/完善信息</td>
					</tr>
					<tr>
						<td height="10px;"></td>
					</tr>
				</table>
				<hr>
				<table>
					<tr>
						<td><input type="button" name="Submit" onclick="backClick()"
							value="返回"></td>
					</tr>
					<tr>
						<td style="height: 10px;"></td>
					</tr>
					<tr>
						<td>
							<table>
								<tr>
									<td style="width: 450px;"></td>
									<td>姓名：</td>
									<td><input type="text" name="name" id="name"
										value="${user.name }" readonly="readonly" style="color: gray;"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>密码：</td>
									<td><input type="password" name="password" id="password"
										value="${user.password }"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>手机：</td>
									<td><input type="text" name="phone" id="phone"
										value="${user.phone }" maxlength="11" autocomplete="off"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>性别：</td>
									<td><input type="radio" id="man" name="sex" value="男"
										onclick="selectMan()" />男 <input type="radio" id="woman"
										name="sex" value="女" onclick="selectWoman()" />女</td>
								</tr>
								<tr style="display: none;">
									<td></td>
									<td></td>
									<td><input type="text" value="${user.sex }"
										id="sex_hidden" /></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>住址：</td>
									<td><input type="text" name="address" id="address"
										value="${user.address }" autocomplete="off"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>邮箱：</td>
									<td><input type="text" name="email" id="email"
										value="${user.email }" autocomplete="off"></td>
								</tr>
								<tr>
									<td height="15px"></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2" align="center"><input type="button"
										name="save" id="save" onClick="saveClick(${user.id })"
										value="保存" /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>