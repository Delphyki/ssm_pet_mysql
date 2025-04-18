<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户登录</title>
    <script>
        window.onload = function() {
            var thirdPartyUsername = '<%= session.getAttribute("thirdPartyUsername") %>';
            if (thirdPartyUsername) {
                document.getElementById('username').value = thirdPartyUsername;
                sessionStorage.removeItem('thirdPartyUsername');
            }
        };
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/simpleCart.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<!--account-->
<div class="account">
    <div class="container">
        <div class="register">
            <c:if test="${msg!=null}"><div class="alert alert-danger">${msg}</div></c:if>
            <form action="${pageContext.request.contextPath}/index/login" method="post">
                <div class="register-top-grid">
                    <h3>用户登录</h3>
                    <div class="input">
                        <span>用户名 <label style="color:red;">*</label></span>
                        <input type="text" id="username" name="username" placeholder="请输入用户名" required="required">
                    </div>
                    <div class="input">
                        <span>密码 <label style="color:red;">*</label></span>
                        <input type="password" name="password" placeholder="请输入密码" required="required">
                    </div>
                    <div class="clearfix"> </div>
                </div>

                <p>或者使用模拟第三方登录:</p>
                <a href="${pageContext.request.contextPath}/mock_third_party.jsp">使用模拟第三方登录</a>

                <div class="register-but text-center">
                    <input type="submit" value="提交">
                    <div class="clearfix"> </div>
                </div>
            </form>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--//account-->

<jsp:include page="footer.jsp"/>

</body>
</html>