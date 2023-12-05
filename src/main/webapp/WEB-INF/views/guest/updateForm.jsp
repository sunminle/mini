<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Form</title>
</head>
<body>

<h2>Update Form</h2>

<form method="post" action="/gu/updatePro">
    <input type="hidden" name="num" value="${guest.num}">
    ID: ${guest.id} <br/>
    Content: <textarea name="content">${guest.content}</textarea> <br/>
    Password: <input type="password" name="passwd"> <br/>
    <input type="submit" value="등록">
</form>

</body>
</html>
