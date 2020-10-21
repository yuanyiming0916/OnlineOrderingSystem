<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
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
		window.location.href = "<%=request.getContextPath()%>/MenuController/findHotDishes_Manager";
	};
	function coldDishesClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findColdDishes_Manager";
	};
	function soupClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findSoup_Manager";
	};
	function fruitClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findFruit_Manager";
	};
	function drinkClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findDrink_Manager";
	};
	function foodClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/findFood_Manager";
	};	
	function menuUpdateClick(id) {
		location.href = " <%=request.getContextPath()%>/MenuController/update/"+ id;
	};
	function menuDelClick(id) {
		alert(id);
		if(confirm("您确定要删除该商品吗？")){
			$.ajax({
				url : "${pageContext.request.contextPath }/MenuController/del/"+id,
				data : { //数据
					
				},
				type : "get", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
				success : function(data) { //成功，回调函数
					alert(data.msg);
					if (data.msg == "已删除") {
						$("#update"+id).attr("disabled",true);
						$("#del"+id).attr("disabled",true);
					}
				},
				error : function() {
					alert("json返回数据失败");
				}
			})
		}
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
		<div style="width: 1511px;">
			<div
				style="width: 100px; height: 676px; background-color: #B0B0B0; float: left;">
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
							<td><input type="button" value="菜谱管理"
								style="width: 96px; background-color: #CD6600;"
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
				<div style="width: 1390px; overflow: hidden;">
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
				</div>
				<hr>
				<div
					style="width: 1390px; height: 676px; overflow: scroll;; overflow-x: hidden;">
					<table border="1">
						<tr>
							<th>图片</th>
							<th>菜名</th>
							<th>价格</th>
							<th>详情</th>
							<th>上架时间</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
						<c:forEach items="${mm }" var="mm">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/img/${mm.imagePath }"
									height="60px" width="90px"></td>
								<td width="200px;">${mm.dishName }</td>
								<td width="100px;">${mm.price }</td>
								<td width="450px;">${mm.details }</td>
								<td style="width: 200px; text-align: center;"><fmt:formatDate
										value='${mm.shelfTime }' pattern='yyyy-MM-dd HH:mm:ss' /></td>
								<td><input type="button" value="修改" id="update${mm.id }"
									onclick="menuUpdateClick(${mm.id })" /></td>
								<td><input type="button" value="删除" id="del${mm.id }"
									onclick="menuDelClick(${mm.id })" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>