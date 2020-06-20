<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
<script type="text/javascript">
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
		window.location.href = "<%=request.getContextPath()%>/MenuController/findAll_Manager";
	};
	function setClick() {
		window.location.href = "<%=request.getContextPath()%>/SetController/set";
	};
	function userUpdateClick() {
		window.location.href = "<%=request.getContextPath()%>/UserController/update";
	};
	function userDeleteClick() {
		if(confirm("您确定要注销此账号吗？")){
			window.location.href = "<%=request.getContextPath()%>/UserController/del";
		}else{
			window.location.href = "<%=request.getContextPath()%>/SetController/set";
		}
	};
	function menuAddClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/add";
	};
</script>
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
		<div style="width: 1511px;">
			<div
				style="width: 100px; height: 676px; float: left; background-color: #B0B0B0;">
				<table
					style="width: 100px; border: 0; cellspacing: 0; cellpadding: 0">
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
						<td><input type="button" value="设置"
							style="width: 96px; background-color: #CD6600;"
							onclick="setClick()" /></td>
					</tr>
				</table>
			</div>
			<div
				style="width: 21px; height: 676px; background-color: #F0F0F0; float: left;"></div>
			<div
				style="width: 1390px; height: 676px; background-color: #F0F0F0; float: left; overflow-y: auto;">
				<table>
					<tr>
						<td>设置</td>
					</tr>
					<tr>
						<td height="10px;"></td>
					</tr>
				</table>
				<hr>
				<div style="width: 1390px; height: 676px; overflow: scroll;">
					<table>
						<tr>
							<td style="width: 20px;"></td>
							<td><input type="button" value="完善/修改信息"
								style="width: 100px;" onclick="userUpdateClick()" /></td>
						</tr>
						<tr>
							<td></td>
							<td style="height: 10px;"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="button" value="注销用户" style="width: 100px;"
								onclick="userDeleteClick()" /></td>
						</tr>
						<tr>
							<td></td>
							<td style="height: 10px;"></td>
						</tr>
						<c:if test="${user.role==2 }">
							<tr>
								<td></td>
								<td><input type="button" value="新品上架" style="width: 100px;"
									onclick="menuAddClick()" /></td>
							</tr>
						</c:if>
						<tr>
							<td></td>
							<td style="height: 10px;"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>