<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>숫자 포맷 설정</h2>
<!-- 
    formatNumber
    	var 	: 변수명 (변수명을 지정하지 않으면 바로 출력)
    	value 	: 출력할 숫자
    	pattern : 숫자패턴
    	scope 	: 영역
    	
    	type 	: 출력양식을 설정
    		- percent 	: 퍼센트
    		- currency 	: 통화
    		- number 	: 기본값, 일반숫자
    
    	groupingUsed : 구분기호(,) 사용여부
-->

<c:set var="num" value="12345"></c:set>
<!-- 
	화면에 출력을 할 때 문자의 정렬
	숫자의 정렬 : 오른쪽 정렬, 세자리 컴마 -> 자격증 시험. 금액을 표현하거나 수량을 표현
-->

콤마 출력 : <fmt:formatNumber value="${num }"></fmt:formatNumber>
<br/>콤마 출력 안함 : <fmt:formatNumber value="${num }" groupingUsed="false"></fmt:formatNumber>

<!-- 변수에 저장후 출력 -->
<fmt:formatNumber value="${num }" var="saveVar" type="currency"></fmt:formatNumber>
<br/>변수에 저장된 값을 출력 : ${saveVar }

<br/>타입 지정 : <fmt:formatNumber value="0.3" type="percent"></fmt:formatNumber>

<h2>패턴을 지정해서 숫자를 활용</h2>
0, # : 자릿수를 의미
<br/>0 : 자리수를 지정했는데 해당 자리에 수가 없으면 0을 출력
<br/># : 자리수를 지정했는데 해당 자리에 수가 없으면 출력하지 않음
<!-- 
300
00000 - 00300 : 자릿수를 맞추고 싶을 때 (코드값을 출력)
##### - 300
-->

<!-- 출력 형식을 지정하는 것은 매우 중요하지만
	 보통은 쿼리를 실행하면서 포맷을 지정해 dto에 담기 때문에
	 jstl 태그를 이용한 출력 형식 지정은 매우 드물게 사용될 수 있다.
-->
<c:set var="num1" value="12345.0111"/>
<br/> 형식 없음 : <fmt:formatNumber value="${num1 }"/> <br/>
<br/> 0,00.0 : <fmt:formatNumber value="${num1 }" pattern="0,00.0"/> <br/>
<br/> 0,000,00.0 : <fmt:formatNumber value="${num1 }" pattern="0,000,00.0"/> <br/>
<br/> #,##.# : <fmt:formatNumber value="${num1 }" pattern="#,##.#"/> <br/>
<br/> ###,###.0000000 : <fmt:formatNumber value="${num1 }" pattern="###,###.0000000"/> <br/>

<fmt:parseNumber value="${num1 }" integerOnly="true" var="saveVar"/><br/>
정수 부분만 : ${saveVar }






</body>
</html>















