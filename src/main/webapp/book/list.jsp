<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl의 core태그를 사용하기 위해 태그라이브러리 지시자 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
	.pointer {
		cursor : pointer;
	}
	
</style>
<script type="text/javascript">

window.onload = function () {
	// 요소 선택
	let regBtn = document.querySelector ("#regBtn");
	
	// 이벤트 부여
	regBtn.addEventListener('click', function () {
		location.href = "/book/reg.jsp";
	});
	
	searchBtn.addEventListener ('click', function () {
		searchForm.action = "/book/list";
		searchForm.submit();
	});
	
}

/*
	스크립트에서 함수를 정의하는 방법
	function 함수명 (파람0, 파람1, ...) {
		
	}
	
	함수 호출
	함수명 (파람0, 파람1, ...);
*/

	function msg (str) {
		alert(str);
	}
	
	// msg ("안녕");
	// msg ("반가워");
	
	function view (no) {
		// 화면 요청
		location.href = "/book/view?no = " + no;
	}

</script>

</head>
<body>

<%@ include file="../header.jsp" %>



<!-- 메인컨텐츠 영역 -->

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">도서관</h1>
    <p class="mb-4">이대 도서관에 오신걸 환영합니다. <br/>이대 도서관에서는 다양한 학술 자료와 서적을 수장하고 학문적 활동을 지원합니다.</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
    	<div class="card-header py-3">
        	<h6 class="m-0 font-weight-bold text-primary">도서 목록</h6>
        </div>
        <div class="card-body">
        <div class="table-responsive">
                            
<!-- form submit()
	폼이 가지고 있는 요소를 파라메터로 서버에 요청 (action)을 하는 것
	(action이 등록되어 있지 않은 경우 현재 페이지를 다시 요청함) -->

<form name="searchForm">
<%-- 
pageNo : <input type="text" name="pageNo" value="${pageDto.cri.pageNo }">
num : <input type="text" name="num" value="">
--%>
<div class="input-group">
  <select class="form-select" name="searchField" id="inputGroupSelect04" aria-label="Example select with button addon">
	<!-- 선택된 요소의 value값이 서버로 넘어간다. -->
	<option value="title"
			${pageDto.cri.searchField eq 'title' ? 'selected' : ''}>
			도서명 </option>
			
	<option value="author"
			${pageDto.cri.searchField eq 'author' ? 'selected' : ''}>
			작가명 </option>
  </select>
  <input type="text" name="searchWord" value="${pageDto.cri.searchWord }" class="form-control" aria-label="Text input with dropdown button">
  <button class="btn btn-outline-secondary" type="button" id="searchBtn">검색</button>
</div>
</form>
<br/>
<p><button type="button" class="btn btn-dark" id = "regBtn">도서등록</button></p>

<!-- id="dataTable"를 삭제해주면 페이징 및 검색이 생성되지 않는다.  -->
<table class="table table-bordered" width="100%" cellspacing="0">
<thead>
	<tr>
		<th>도서번호</th>
		<th>도서명</th>
        <th>작가</th>
        <th>대여여부</th>
     </tr>
</thead>
                                    
<tbody>
<!-- 리스트가 비어 있다면 메세지 출력 -->
<c:if test="${empty list }" var="res">
	<tr>
		<td colspan="4"> 도서 목록이 존재하지 않습니다. </td>
	</tr>
</c:if>

<!-- 리스트가 비어있지 않다면 도서 목록 출력 -->
<c:if test="${not res }">
	<c:forEach items="${list }" var="dto">
	<tr>
      <th scope="row">${dto.no }</th>
	  <%--<td><a href="/book/view?no=${dto.no}">${dto.title }</a></td>--%>
      <%--<td><a href="/book/view?no=${dto.no}"
      			onclick="msg('제목이 클릭 되었습니다.')">${dto.title }</a></td>--%>
      <td class = "pointer" onclick="view(${dto.no })">${dto.title }</td>
      <td>${dto.author }</td>
      <!-- Y/N -> 대여/대여중 -->
      <td>${dto.rentYnStr }</td>
    </tr>
    </c:forEach>
</c:if>                    
</tbody>
</table>

<!-- page navi -->
<!-- pageDto가 request 영역에 저장되어 있으면 페이지 블럭을 출력한다. -->
<%@ include file="/06session/servletEx/PageNavi.jsp" %>
                            
        	</div>
    	</div>
	</div>
</div>
<!-- 메인컨텐츠 영역 끝 -->




<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>

<%@ include file="../footer.jsp" %>
</body>
</html>
