<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>模拟第三方登录</title>
</head>
<body>
<h1>模拟第三方登录</h1>
<p>请选择一个用户登录：</p>
<form action="${pageContext.request.contextPath}/index/mockLoginCallback" method="post">
    <select name="username">
        <option value="user1">用户1</option>
        <option value="user2">用户2</option>
        <option value="user3">用户3</option>
    </select>
    <input type="submit" value="登录">
</form>
</body>
</html>