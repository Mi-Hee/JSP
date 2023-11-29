<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function goPage (pageNo) {
		searchForm.pageNo.value = pageNo
		searchForm.submit();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<br>


<!--
	페이지 블럭을 출력하는 방법
	1. 요청 컨트롤러에서 pageDto를 request 영역에 저장한다.
	2. PageNavi.jsp를 include 해준다.
		- 리스트 페이지의 페이지 블럭을 출력하고 싶은 위치에
	3. searchForm을 생성한다.
		- searchForm안에는 pageNo 요소가 있어야 한다.
-->
<!-- 페이지네이션 -->
<nav aria-label="...">
  <ul class="pagination justify-content-center">
  	<!-- 앞으로 가기 버튼 시작 disabled : 비활성화 -->
    <li class="page-item ${pageDto.prev() ? '' : 'disabled'}">
      <a class="page-link" onclick="goPage(${pageDto.getStartNo() - 1})">Previous</a>
    </li>
    <!-- 앞으로가기 버튼 끝 -->
    
    <c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">

    <%--  <%for(int i=pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){%>  --%>
	    <li class="page-item">
	    <!-- href="..." 링크로 이동할 경우, 검색어가 유지되지 않는다. -->
	    <!-- 검색어를 유지하기 위해 searchForm을 전송하도록 goPage 함수를 생성. -->
	    <!-- 링크를 함수 호출로 변경 onClick 이벤트가 발생하면 goPage() 함수를 호출한다.
	    	 함수의 파라메터로 페이지 번호를 넣어 주어야 한다. -->
	    	 
	    	<a class="page-link ${pageDto.cri.pageNo eq i ? 'active' : '' }" 
				onclick="goPage(${i })"> ${i } </a>
	    </li>
     <%-- <%} %>  --%>
     
     </c:forEach>
        
    <!-- 뒤로가기 버튼 시작 -->
    <li class="page-item ${pageDto.next ? '' : 'disabled'}">
      <a class="page-link" onclick="goPage(${pageDto.endNo + 1})">Next</a>
    </li>
    <!-- 뒤로가기 버튼 끝 -->
  </ul>
</nav>


<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>