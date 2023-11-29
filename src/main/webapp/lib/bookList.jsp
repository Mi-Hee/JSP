<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookList</title>
</head>
<body>
<!-- header 외부파일 인클루드 -->
<%@ include file="common/header.jsp" %>

<!-- 도서 목록을 출력 -->
도서목록 출력
<br/>${list }

<!-- footer 외부파일 인클루드 -->
<%@ include file="common/footer.jsp" %>
</body>
</html>