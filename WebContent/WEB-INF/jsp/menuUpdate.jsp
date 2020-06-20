<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品更新</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.0.js"></script>
</head>
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
	function setClick() {
		window.location.href = "<%=request.getContextPath()%>/SetController/set";
	};
	function backClick() {
		window.location.href = "<%=request.getContextPath()%>/MenuController/menuManage";
	};
	function saveClick() {
		var id = $("#id").val();
		var dishName = $("#dishName").val();
		var price = $("#price").val();
		var details = $("#details").val();
		var status = 0;

		if (price == null || price == "" || !(/^\d+(\.\d+)?$/.test(price))) {
			alert("请输入价格，且价格必须大于等于0");
			status++;
		}
		if (status == 0) {
			$.ajax({
				url : "${pageContext.request.contextPath }/MenuController/doUpdate",
				data : { //数据
					id : id,
					dishName : dishName,
					price : price,
					details : details
				},
				type : "get", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
				success : function(data) { //成功，回调函数
					alert(data.msg);
					if (data.msg == "修改成功") {
						$("#save").attr("disabled", true);
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
						<td>商品修改</td>
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
									<td>id&nbsp;：</td>
									<td><input type="text" style="color: gray;" name="id"
										id="id" value="${mm.id }" readonly="readonly"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>菜名：</td>
									<td><input type="text" style="color: gray;"
										name="dishName" id="dishName" value="${mm.dishName }"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>价格：</td>
									<td><input type="text" name="price" id="price"
										value="${mm.price }" autocomplete="off"></td>
								</tr>
								<tr>
									<td style="height: 6px;"></td>
								</tr>
								<tr>
									<td></td>
									<td>详情：</td>
									<td style="width: 400px;"><input type="text"
										name="details" id="details" value="${mm.details }"
										style="width: 100%; autocomplete: off;"></td>
								</tr>
								<tr>
									<td height="15px"></td>
								</tr>
								<tr>
									<td></td>
									<td colspan="2" align="center"><input type="button"
										name="save" id="save" value="保存" onClick="saveClick()" /></td>
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