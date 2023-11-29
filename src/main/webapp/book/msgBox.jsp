<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 메세지 출력 후 다른 페이지를 요청하거나 뒤로가기 한다. -->
<script type="text/javascript">
	// 서버로부터 전달 받은 메세지를 출력한다.
	let msg = '${msg}';
	// 서버로부터 전달 받은 url로 이동한다.
	let url = '${url}';
	
	if (msg != '') {
		alert(msg);
		
	}
	
	if (url != '') {
		loaction.href = url;
	} else {
		history.go(-1);
	}
	
	// 웹브라우저객체 BOM : location
	// 페이지 요청
	// location.href = '/book/list';
	// 뒤로가기
	// history.go(-1);
</script>
</body>
</html>

