<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
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
	function increaseClick(dishId) {
		var id = "amount"+dishId;
		var amount= parseInt($("#"+ id).val()) + 1;
		$("#"+ id).val(amount);
		checkboxClick();
		$.ajax({
			url : "${pageContext.request.contextPath }/CartController/increase/"+dishId,
			data : { //数据
				
			},
			type : "get", //请求方式
			dataType : "json", //数据返回类型
			async : false,//同步
		})
	};
	function reduceClick(dishId) {
		var id = "amount"+dishId;
		var amount= parseInt($("#"+ id).val());
		var id_tr="tr"+dishId;
		if(amount==1){
			$("#"+ id_tr).remove();
		}
		$("#"+ id).val(amount-1);
		checkboxClick();
		if(amount>0){
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
	//页面加载的时候,所有的复选框都是未选中的状态
	function checkOrCancelAll(){
		var totalPrice=0;
		//1.获取checkbox的元素对象
		var chElt=document.getElementById("selectAll");
		//2.获取选中状态
		var checkedElt=chElt.checked;
		//3.若checked=true,将所有的复选框选中,checked=false,将所有的复选框取消
		var allCheck=document.getElementsByName("dishId");
		//4.循环遍历取出每一个复选框中的元素
		var mySpan=document.getElementById("mySpan");
		
		if(checkedElt){
			//全选
			for(var i=0;i<allCheck.length;i++){
				//设置复选框的选中状态
				allCheck[i].checked=true;
			}
			$("#totalPrice").val(totalPrice);
			mySpan.innerHTML="取消全选";
		}else{
			//取消全选
			for(var i=0;i<allCheck.length;i++){
				allCheck[i].checked=false;
			}
			$("#totalPrice").val(totalPrice);
			mySpan.innerHTML="全选";
		}
		//计算总价
		checkboxClick();
	};
	function checkboxClick(){
		var totalPrice=0;
		var price=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(8)').map(function(){return this.innerHTML}).get().join();
		var amount=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(12) input').map(function(){return this.value}).get().join();
		var arr_price = price.split(',');
		var arr_amount = amount.split(',');
		
		for(var i=0;i<arr_price.length;i++){
	    	totalPrice=arr_price[i] * arr_amount[i] + totalPrice;
		}
		
		$("#totalPrice").val(totalPrice);
	};
	function order_onClick(userId){
		//订单信息
		var dishIdStr=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(0)').map(function(){return this.innerHTML}).get().join();
		var dishIdArr=dishIdStr.split(',');
		var dishId=new Array(dishIdArr.length);
		for(var i=0;i<dishIdArr.length;i++){
			dishId[i]=parseInt(dishIdArr[i]);
		}
		
		var dishNameStr=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(6)').map(function(){return this.innerHTML}).get().join();
		var dishName = dishNameStr.split(',');
		
		var priceStr=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(8)').map(function(){return this.innerHTML}).get().join();
		var priceArr = priceStr.split(',');
		var price = new Array(priceArr.length);
		for(var i=0;i<priceArr.length;i++){
			price[i] = parseFloat(priceArr[i]);
		}
		
		var amountStr=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(12) input').map(function(){return this.value}).get().join();
		var amountArr = amountStr.split(',');
		var amount=new Array(amountArr.length);
		for(var i=0;i<amountArr.length;i++){
			amount[i]=parseInt(amountArr[i]);
		}
		
		//用餐人数
		var personCount=$('#personCount option:selected') .val();
		//money
		var totalPrice=	$("#totalPrice").val();
		//系统时间
		var sysTime = new Date();
		//系统时间（时间戳:单位（毫秒））
		var sysTimestamp = Date.parse(sysTime);
		//用餐时间（时间戳:单位（毫秒））
		var scheduledTime = Date.parse(sysTime.toLocaleDateString()+" "+ $("#hour").val() +":"+ $("#minute").val());
		//配送时长（单位:分）
		var deliveryTime = (scheduledTime - sysTimestamp) /1000 /60;
		
		//信息check
		var status=0;
		var str="";
		if(totalPrice<=0){
			status=status+1;
			str+=status+".请选择之后再下单\n";
		}
		if(personCount<1){
			status=status+1;
			str+=status+".请选择用餐人数之后再下单\n";
		}
		if(deliveryTime<40){
			status=status+1;
			str+=status+".配送时长低于40分钟，请修改用餐时间";
		}
		if(status>0){
			alert(str);
		}
		if(status==0){
			$.ajax({
				url : "${pageContext.request.contextPath }/OrderController/add",
				data : { //数据
					//交易数据
					userId : userId,
					personCount : personCount,
					totalPrice : totalPrice,
					scheduledTime : scheduledTime,
					//订单数据（数组）
					dishName : dishName,
					price : price,
					amount : amount,
					//购物车数据（数组）
					dishId : dishId
				},
				traditional:true,//防止深度序列化，用于传递数组
				type : "post", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
				success : function(data) { //成功，回调函数
					alert(data.msg);
					if (data.msg == "下单成功") {
						$("#order").attr("disabled",true);
					}
				},
				error : function() {
					alert("json返回数据失败");
				}
			})
		}
	};
	function order_del_onClick(userId){
		if(confirm("您确定要退单吗？")){
			var dishIdStr=$("input[type='checkbox'][name='dishId']:checked").closest('tr').find('td:eq(0)').map(function(){return this.innerHTML}).get().join();
			var dishIdArr=dishIdStr.split(',');
			var dishId=new Array(dishIdArr.length);
			for(var i=0;i<dishIdArr.length;i++){
				dishId[i]=parseInt(dishIdArr[i]);
			}
			$.ajax({
				url : "${pageContext.request.contextPath }/OrderController/update",
				data : { //数据
					dishId : dishId
				},
				traditional:true,//防止深度序列化，用于传递数组
				type : "post", //请求方式
				dataType : "json", //数据返回类型
				async : false,//同步
				success : function(data) { //成功，回调函数
					alert(data.msg);
					if (data.msg == "退单成功") {
						$("#order_del").attr("disabled",true);
					}
				},
				error : function() {
					alert("json返回数据失败");
				}
			});
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
						<td><input type="button" value="购物车"
							style="width: 96px; background-color: #CD6600;"
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
						<td>购物车</td>
					</tr>
					<tr>
						<td height="10px;"></td>
					</tr>
				</table>
				<hr>
				<table>
					<tr>
						<td width="20px;"></td>
						<td width="100px;"><input type="checkbox" id="selectAll"
							onclick="checkOrCancelAll();"> <span id="mySpan">全选</span></td>
						<td width="20px;"></td>
						<td>合计：</td>
						<td width="120px;"><input type="text" name="totalPrice"
							id="totalPrice" style="width: 75%;" value="0">元</td>
						<td width="20px;"></td>
						<td>用餐人数：</td>
						<td><select name="personCount" id="personCount">
								<c:forEach var="personCount" begin="1" end="50">
									<option value="${personCount }">${personCount }</option>
								</c:forEach>
						</select>人</td>
						<td width="20px;"></td>
						<td>用餐时间：</td>
						<td><select name="hour" id="hour">
								<c:forEach var="hour" begin="0" end="23">
									<c:if test="${hour < 10}">
										<option value="0${hour }">0${hour }</option>
									</c:if>
									<c:if test="${hour > 9}">
										<option value="${hour }">${hour }</option>
									</c:if>
								</c:forEach>
						</select> :</td>
						<td><select name="minute" id="minute">
								<c:forEach var="minute" begin="0" end="59" step="1">
									<c:if test="${minute < 10}">
										<option value="0${minute }">0${minute }</option>
									</c:if>
									<c:if test="${minute > 9}">
										<option value="${minute }">${minute }</option>
									</c:if>
								</c:forEach>
						</select></td>
						<td width="450px;"></td>
						<td><input type="button" name="order" id="order" value="下单"
							onclick="order_onClick(${user.id })"></td>
						<td width="100px;"></td>
						<td><input type="button" name="order_del" id="order_del"
							value="退单" onclick="order_del_onClick(${user.id })"></td>
					</tr>
					<tr>
						<td height="30px;"></td>
					</tr>
				</table>
				<div
					style="width: 1390px; height: 676px; overflow: scroll; overflow-x: hidden;">

					<table>
						<c:forEach items="${cv }" var="cv">
							<tr id="tr${cv.dishId }">
								<td hidden="hidden">${cv.dishId }</td>
								<td width="20px;"></td>
								<td><input type="checkbox" name="dishId" id="dishId"
									value="${cv.dishId }" onclick="checkboxClick()"></td>
								<td width="20px;"></td>
								<td><img alt=""
									src="<%=request.getContextPath()%>/img/${cv.imagePath }"
									height="60px" width="90px"></td>
								<td width="20px;"></td>
								<td width="100px;">${cv.dishName }</td>
								<td width="20px;"></td>
								<td width="50px;">${cv.price }</td>
								<td width="20px;"></td>
								<td><input type="button" value="-" style="width: 25px;"
									onclick="reduceClick(${cv.dishId })" /></td>
								<td width="10px;"></td>
								<td><input type="text" name="amount" readonly="readonly"
									id="amount${cv.dishId }" value="${cv.amount }"
									style="width: 30px; background-color: #D3D3D3; text-align: right;"></td>
								<td width="10px;"></td>
								<td><input type="button" value="+" style="width: 25px;"
									onclick="increaseClick(${cv.dishId })" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>