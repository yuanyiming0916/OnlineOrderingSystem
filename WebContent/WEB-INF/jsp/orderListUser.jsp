<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看订单</title>
</head>
<body>
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
	function lookOrder(id) {
		window.location.href = "<%=request.getContextPath()%>/OrderController/findById/"+id;
	};
	function backClick() {
		window.location.href = "<%=request.getContextPath()%>/OrderController/findAll";
	}
	//接单
	function receiveOrderClick(userId) {
		var dishIdStr="";
		$(".dishId").each(function(){
			dishIdStr+=$(this).html()+",";
		});
		var dishIdArr=dishIdStr.split(',');
		var dishId=new Array(dishIdArr.length-1);
		for(var i=0;i<dishIdArr.length-1;i++){
			dishId[i]=parseInt(dishIdArr[i]);
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/BusinessController/update_receive/"+userId,
			data : { //数据
				dishId : dishId
			},
			traditional:true,//防止深度序列化，用于传递数组
			type : "post", //请求方式
			dataType : "json", //数据返回类型
			async : false,//同步
			success : function(data) { //成功，回调函数
				alert(data.msg);
				if (data.msg == "已接单") {
					$("#receiveOrder").attr("disabled",true);
					$("#refuse").attr("disabled",true);
				}
			},
			error : function() {
				alert("json返回数据失败");
			}
		})
	};
	//拒接
	function refuseClick(userId) {
		if(confirm("您确定要拒接吗？")){
			$.ajax({
				url : "${pageContext.request.contextPath }/BusinessController/update_refuse/"+userId,
				data : { //数据
					
				},
				type : "post", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
				success : function(data) { //成功，回调函数
					alert(data.msg);
					if (data.msg == "已拒接") {
						$("#receiveOrder").attr("disabled",true);
						$("#refuse").attr("disabled",true);
					}
				},
				error : function() {
					alert("json返回数据失败");
				}
			});
		}
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
						<td><input type="button" value="订单"
							style="width: 96px; background-color: #CD6600;"
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
						<td>查看订单</td>
					</tr>
					<tr>
						<td height="10px;"></td>
					</tr>
				</table>
				<hr>
				<div>
					<table>
						<tr>
							<td><input type="button" name="back" id="back" value="返回"
								onclick="backClick()"></td>
						</tr>
						<tr>
							<td height="15px;"></td>
						</tr>
						<tr>
							<td><div style="width: 881px; float: left;">
									<table>
										<tr>
											<td>下单时间:</td>
											<td><input type="text" name="orderTime" id="orderTime"
												value="<fmt:formatDate
										value='${bm.orderTime }' pattern='yyyy-MM-dd HH:mm:ss' />"></td>
											<td style="width: 100px;"></td>
											<td>合计：</td>
											<td width="120px;"><input type="text" name="totalPrice"
												id="totalPrice" value="${bm.totalPrice }"
												style="width: 60%; text-align: right;">&nbsp;&nbsp;元</td>
											<td style="width: 100px;"></td>
											<td>用餐人数：</td>
											<td width="100px;"><input type="text" name="totalPrice"
												id="personCount" value="${bm.personCount }"
												style="width: 50%; text-align: right;">&nbsp;&nbsp;人</td>
										</tr>
									</table>
								</div></td>
							<td><div style="width: 500px; float: left;">
									<table>
										<c:if test="${user.role==2 }">
											<tr>
												<td><input type="button" name="receiveOrder"
													id="receiveOrder" value="接单"
													onclick="receiveOrderClick(${bm.userId})"
													style="width: 80px;"></td>
												<td style="width: 100px;"></td>
												<td><input type="button" name="refuse" id="refuse"
													value="拒接" onclick="refuseClick(${bm.userId})"
													style="width: 80px;"></td>
											</tr>
										</c:if>
									</table>
								</div></td>
						</tr>
						<tr>
							<td height="10px;"></td>
						</tr>
					</table>
				</div>
				<div style="overflow: scroll; overflow-x: hiddden;">
					<table border="1">
						<tr>
							<th>用户id</th>
							<th>用户名</th>
							<th>图片</th>
							<th>菜名</th>
							<th>单价</th>
							<th>数量</th>
						</tr>
						<c:forEach items="${om }" var="om">
							<tr hidden="hidden">
								<td class="dishId">${om.dishId }</td>
							</tr>
							<tr>
								<td style="text-align: center; width: 100px;">${om.userId }</td>
								<td style="width: 200px;">${om.name }</td>
								<td><img alt=""
									src="<%=request.getContextPath()%>/img/${om.imagePath }"
									style="height: 90px; width: 160px;"></td>
								<td style="width: 200px;">${om.dishName }</td>
								<td style="text-align: center; width: 100px;">${om.price }</td>
								<td style="text-align: center; width: 100px;">${om.amount }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>