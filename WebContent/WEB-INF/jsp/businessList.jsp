<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>历史记录</title>
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
						<td><input type="button" value="历史记录"
							style="width: 96px; background-color: #CD6600;"
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
				style="width: 1390px; height: 676px; background-color: #F0F0F0; float: left;; overflow-y: auto;">
				<table>
					<tr>
						<td>历史记录</td>
					</tr>
					<tr>
						<td height="10px"></td>
					</tr>
				</table>
				<hr>
				<div style="overflow: scroll; overflow-x: hidden;">
					<table border="1">
						<tr>
							<th>用户id</th>
							<th>用户名</th>
							<th>图片</th>
							<th>菜名</th>
							<th>单价</th>
							<th>数量</th>
							<th>时间</th>
						</tr>
						<c:forEach items="${bv }" var="bv">
							<tr>
								<td style="width: 150px; text-align: center;">${bv.userId }</td>
								<td style="width: 150px;">${bv.name }</td>
								<td><img alt=""
									src="<%=request.getContextPath()%>/img/${bv.imagePath }"
									height="90px" width="160px"></td>
								<td style="width: 150px;">${bv.dishName }</td>
								<td style="width: 100px; text-align: center;">${bv.price }</td>
								<td style="width: 100px; text-align: center;">${bv.amount }</td>
								<td style="width: 200px; align: center;"><fmt:formatDate
										value='${bv.orderReceiveTime }' pattern='yyyy-MM-dd HH:mm:ss' /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>