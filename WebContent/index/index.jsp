<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>商城首页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript" src="js/cart.js"></script>
	<!-- 引入 jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 引入 jQuery UI -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<!--banner-->
	<c:forEach var="top" items="${top1List}" end="0">
		<div class="banner">
			<div class="container">
				<h2 class="hdng"><a href="detail?goodid=${top.good.id}">${top.good.name}</a><span></span></h2>
				<p>今日精选推荐</p>
				<a class="banner_a" href="javascript:;" onclick="buy(${top.good.id})">加入购物车</a>
				<div class="banner-text">		
					<a href="detail?goodid=${top.good.id}">
						<img src="../${top.good.cover}" alt="${top.good.name}" width="348" height="350">
					</a>	
				</div>
			</div>
		</div>
	</c:forEach>			
	<!--//banner-->
	
	<div class="subscribe2"></div>
	
	<!--gallery-->
	<div class="gallery">
		<div class="container">
			<div class="alert alert-danger">热销推荐</div>
			<div class="gallery-grids">
				<c:forEach var="top" items="${top2List}" end="5">
					<div class="col-md-4 gallery-grid glry-two">
						<a href="detail?goodid=${top.good.id}">
							<img src="../${top.good.cover}" class="img-responsive" alt="${top.good.name}" width="350" height="350"/>
						</a>
						<div class="gallery-info galrr-info-two">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								<a href="detail?goodid=${top.good.id}">查看详情</a>
							</p>
							<a class="shop" href="javascript:;" onclick="buy(${top.good.id})">加入购物车</a>
							<div class="clearfix"> </div>
						</div>
						<div class="galy-info">
							<p>${top.good.type.name} > ${top.good.name}</p>
							<div class="galry">
								<div class="prices">
									<h5 class="item_price">¥ ${top.good.price}</h5>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="clearfix"></div>
			<div class="alert alert-info">新品推荐</div>
			<div class="gallery-grids">	
				<c:forEach var="top" items="${top3List}" end="7">
					<div class="col-md-3 gallery-grid ">
						<a href="detail?goodid=${top.good.id}">
							<img src="../${top.good.cover}" class="img-responsive" alt="${top.good.name}"/>
						</a>
						<div class="gallery-info">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 
								<a href="detail?goodid=${top.good.id}">查看详情</a>
							</p>
							<a class="shop" href="javascript:;" onclick="buy(${top.good.id})">加入购物车</a>
							<div class="clearfix"> </div>
						</div>
						<div class="galy-info">
							<p>${top.good.type.name} > ${top.good.name}</p>
							<div class="galry">
								<div class="prices">
									<h5 class="item_price">¥ ${top.good.price}</h5>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>	
		</div>
	</div>
	<!--//gallery-->
	
	<!--subscribe-->
	<div class="subscribe"></div>
	<!--//subscribe-->



	<!-- 搜索框 -->
	<input type="text" id="search-input" placeholder="搜索商品">

	<script>
		$(document).ready(function() {
			// 初始化自动补全功能
			$("#search-input").autocomplete({
				source: function(request, response) {
					// 发送 AJAX 请求到后端获取补全建议
					$.ajax({
						url: "/index/searchSuggestion",
						dataType: "json",
						data: {
							term: request.term
						},
						success: function(data) {
							response(data);
						}
					});
				},
				minLength: 1 // 输入至少 1 个字符时开始请求补全建议
			});
		});
	</script>





	
	
	<jsp:include page="footer.jsp"/>

</body>
</html>