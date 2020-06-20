<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新品上架</title>
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
		window.location.href = "<%=request.getContextPath()%>/OrderController/findByIdPlus";
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
	//预览图
	function showMenuImg(pic){
		var fr = new FileReader();//创建文件读取对象
		var files = pic.files[0];//获取file组件中的文件
		fr.readAsDataURL(files);//文件读取转换为base64类型
		fr.onloadend = function(e){
			//加载完毕之后赋值
			$("#menu_img").attr('src',this.result);
		}
	}
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
						<td>新品上架</td>
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
						<td><form
								action="${pageContext.request.contextPath }/MenuController/doAdd"
								method="post" autocomplete="off" enctype="multipart/form-data">
								<table>
									<tr>
										<td style="width: 450px;"></td>
										<td>菜名：</td>
										<td><input type="text" name="dishName" id="dishName"
											autofocus="autofocus" required="required"
											oninvalid="setCustomValidity('请输入菜名');"
											oninput="setCustomValidity('');"></td>
									</tr>
									<tr>
										<td style="height: 6px;"></td>
									</tr>
									<tr>
										<td></td>
										<td>价格：</td>
										<td><input type="text" name="price" id="price"
											required="required" pattern="^\d+(\.\d+)?$"
											oninvalid="setCustomValidity('请输入价格，且价格必须大于等于0');"
											oninput="setCustomValidity('');"></td>
									</tr>
									<tr>
										<td style="height: 6px;"></td>
									</tr>
									<tr>
										<td></td>
										<td>类型：</td>
										<td><select name="type" id="type">
												<option value="1">热菜</option>
												<option value="2">凉菜</option>
												<option value="3">酒水</option>
												<option value="4">主食</option>
												<option value="5">羹汤</option>
												<option value="6">水果</option>
										</select></td>
									</tr>
									<tr>
										<td style="height: 6px;"></td>
									</tr>
									<tr>
										<td></td>
										<td>详情：</td>
										<td><input type="text" name="details" id="details"
											style="width: 100%;"></td>
									</tr>
									<tr>
										<td style="height: 6px;"></td>
									</tr>
									<tr>
										<td></td>
										<td>图片：</td>
										<td><input type="file" name="file" id="file"
											accept="image/*" required="required"
											oninvalid="setCustomValidity('请选择图片');"
											oninput="setCustomValidity('');" onchange="showMenuImg(this)"></td>
									</tr>
									<tr>
										<td style="height: 6px;"></td>
									</tr>
									<tr height="126px;">
										<td></td>
										<td>预览：</td>
										<td><img src="" alt="" id="menu_img" style="height: 120px;width: 180px;"></td>
									</tr>
									<tr>
										<td height="15px"></td>
									</tr>
									<tr>
										<td></td>
										<td colspan="2" align="center"><input type="submit"
											value="提交" /></td>
									</tr>
								</table>
							</form></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>