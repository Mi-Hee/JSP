<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload = function () {
		// alert('test');
		submitBtn.addEventListener('click', function () {
			// alert ('버튼이 클릭되었습니다.');
			
			// 콘솔에 로그를 찍을 때 ','로 연결.
			// 'test' + event
			// 스크립트는 이벤트에 의해서 동작되는 경우가 많다.
			console.log('event', event);
			console.log('event' + event);
			console.log(==========================);
			
			
			// 기본이벤트를 제거하는 함수
			event.preventDefault();
			console.log('기본 이벤트를 제거했습니다.');
			
			// 유효성 검사 
			let res = validateForm(testForm);
			if (res) {
				// 폼 전송
				testForm.submit();
			}
			
		});
	}
	/*
	 유효성검사 validateForm
	 form 요소를 매개변수로 받아서 form이 가지고 있는 요소의 값을 체크
	 
	 함수 정의
	 type 매개변수명
	 function 함수이름 (매개변수) {
		
	 }
	
	 form : 변수이름
	*/
	function validateForm (form) {
		// 유효성 검사 validation check
		// 유효성 검사 결과 testForm을 submit
		// 체크로직을 모두 통과 했다면 서버에 요청, 체크로직을 통과하지 못했다면 메세지 처리
		console.log(form.kor.value)
		if (form.kor.value == '') {
			alert('국어 점수 입력');
			form.kor.focus();
			return false;

		}
		
		console.log(form.eng.value)
		if (form.eng.value == '') {
			alert('영어 점수 입력');
			form.eng.focus();
			return false;
		}
		
		console.log(form.math.value)
		if (form.math.value == '') {
			alert('수학 점수 입력');
			form.math.focus();
			return false;
		}
		
		return true;
		
	}
</script>

</head>
<body>
<h2>다중 조건문</h2>

<p>홀짝 판단하기</p>
<!-- 변수선언 -->
<c:set var="num" value="101"/>

<!-- 다중 조건문 사용하기 -->
<c:choose>
	<c:when test="${num mod 2 eq 0}">
		num(${num })은 짝수 입니다.
	</c:when>
	
	<c:otherwise>
		num(${num })은 홀수 입니다.
	</c:otherwise>
</c:choose>

<!-- form에 action을 주지 않은경우, 동일한 페이지를 다시 요청 합니다. -->
<form name="testForm">
	이름 : <input type="text" name="name" value="maru"> <br/>
	국어 : <input type="text" name="kor" value="50"> <br/>
	영어 : <input type="text" name="eng" value="50"> <br/>
	수학 : <input type="text" name="math" value="50"> <br/>
	<!--
		 폼에 버튼이 하나만 있다면 이 버튼은 서브밋 버튼이 된다.
		 서브밋 버튼은 폼을 전송하는 기본 이벤트가 정의되어 있다.
		 
		 유효성검사 (validation체크를 진행하기 위해서는
		 기본 이벤트를 제거하는 작업을 해야 한다.
	 -->
	<button id="submitBtn">전송</button>
</form>
<!-- 동일한 페이지가 다시 요청되어 form태그 안에 요소를 출력 -->
<!-- 국어, 영어, 수학 점수가 모두 입력되었을 때만 출력. -->
<c:if test="${not (empty param.kor or empty param.eng or empty param.math)}">
	<h2> 입력 받은 값 </h2>
	이름 : ${param.name } <br/>
	국어 : ${param.kor } <br/>
	영어 : ${param.eng } <br/>
	수학 : ${param.math } <br/>
	점수 합계 : ${param.kor + param.eng + param.math } <br/>
	평균 점수 : ${(param.kor + param.eng + param.math) / 3}  <br/>

	<!-- 변수로 저장 후 사용 -->
	<c:set var="avg" value="${(param.kor + param.eng + param.math) / 3}"></c:set>
	<p>평균 : ${avg }</p>

	<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
	<p>>=90 : A학점, >=80 : B학점, >=70 : C학점, >=60 : D학점</p>
	${param.name }님의 학점은
	<c:choose>
		<c:when test="${avg >=90 }">A학점</c:when>
		<c:when test="${avg >=80 }">B학점</c:when>
		<c:when test="${avg >=70 }">C학점</c:when>
		<c:when test="${avg >=60 }">D학점</c:when>
		
		<c:otherwise>F학점</c:otherwise>
	</c:choose>
	입니다.
</c:if>



<%-- <form onsubmit="return validateForm(this);">--%>
<form name="testForm1">
	국어 : <input type="text" name="kor" value=""> <br/>
	영어 : <input type="text" name="eng" value="50"> <br/>
	수학 : <input type="text" name="math" value="60"> <br/>
	<button onClick="return validateForm(testForm1);">전송</button>
</form>

<form name="testForm2" onsubmit="return validateForm(testForm2);">
	국어 : <input type="text" name="kor" value=""> <br/>
	영어 : <input type="text" name="eng" value="50"> <br/>
	수학 : <input type="text" name="math" value="60"> <br/>
	<button>전송</button>
</form>


</body>
</html>