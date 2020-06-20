<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
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
	function hotDishesClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findHotDishes";
	};
	function coldDishesClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findColdDishes";
	};
	function soupClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findSoup";
	};
	function fruitClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findFruit";
	};
	function drinkClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findDrink";
	};
	function foodClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findFood";
	};	
	
	function reduceClick(dishId) {
		var id = "amount"+dishId;
		var amount= parseInt($("#"+ id).val());
		if(amount>0){
			$("#"+ id).val(amount-1);
			$.ajax({
				url : "${pageContext.request.contextPath }/CartController/reduce/"+dishId,
				data : { //数据
					
				},
				type : "get", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
			})
		}
	};
	
	function increaseClick(dishId){
		var id = "amount"+dishId;
		var amount= parseInt($("#"+ id).val()) + 1;
		$("#"+ id).val(amount);
		$.ajax({
			url : "${pageContext.request.contextPath }/CartController/increase/"+dishId,
			data : { //数据
				
			},
			type : "get", //请求方式
			dataType : "json", //数据返回类型
			async : false,//同步
		})
	};

</script>
<style type="text/css">
</style>
</head>
<body style="overflow: scroll; overflow-x: hidden;">
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
				<table style="width: 100px;">
					<tr>
						<td><input type="button" value="首页"
							style="width: 96px; background-color: #CD6600;"
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
				style="width: 1390px; height: 676px; background-color: #F0F0F0; float: left; overflow-y: auto;">
				<table>
					<tr>
						<td>首页</td>
					</tr>
					<tr>
						<td height="10px;"></td>
					</tr>
					<tr>
						<td width="150px"><input type="button" value="热菜"
							style="width: 100px;" onclick="hotDishesClick()" /></td>
						<td width="150px"><input type="button" value="凉菜"
							style="width: 100px;" onclick="coldDishesClick()" /></td>
						<td width="150px"><input type="button" value="羹汤"
							style="width: 100px;" onclick="soupClick()" /></td>
						<td width="150px"><input type="button" value="酒水"
							style="width: 100px;" onclick="drinkClick()" /></td>
						<td width="150px"><input type="button" value="水果"
							style="width: 100px;" onclick="fruitClick()" /></td>
						<td width="150px"><input type="button" value="主食"
							style="width: 100px;" onclick="foodClick()" /></td>
					</tr>
				</table>
				<hr>
				<div
					style="width: 1390px; height: 676px; overflow: scroll; overflow-x: hidden;">
					<table>
						<c:forEach items="${mm }" var="mm">
							<tr>
								<td width="20px;"></td>
								<td><img alt=""
									src="<%=request.getContextPath()%>/img/${mm.imagePath }"
									height="60px" width="90px" name="imagePath" id="imagePath"></td>
								<td width="20px;"></td>
								<td width="100px;" id="dishName">${mm.dishName }</td>
								<td width="20px;"></td>
								<td width="300px;">详情：${mm.details }</td>
								<td width="20px;"></td>
								<td width="100px;">单价：${mm.price }</td>
								<td width="20px;"></td>
								<td><input type="button" value="-" style="width: 25px;"
									onclick="reduceClick(${mm.id })" /></td>
								<td width="10px;"></td>
								<td><input type="text" name="amount${mm.id }"
									id="amount${mm.id }" value="${mm.amount }"
									style="width: 30px; background-color: #D3D3D3; text-align: right;"
									readonly="readonly"></td>
								<td width="10px;"></td>
								<td><input type="button" value="+" style="width: 25px;"
									onclick="increaseClick(${mm.id })" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>