<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.5.0.js"></script>
<style type="text/css">
</style>
</head>
<body>

<c:if test="${userId eq null }">
	<div style="height: 100%; width:100%; display: flex; justify-content: center; align-items: center;">
		<img class='kakao-login' alt="kakao" src="images/kakao_login_btn_medium_narrow.png" style="cursor: pointer;" />
	</div>
</c:if>

<c:if test="${userId ne null }">
	<c:import url="/WEB-INF/views/profile/profile.jsp"></c:import>
	<div class='api-btn'>ds</div>
</c:if>

<script type="text/javascript">
$(document).ready(function() {
	Kakao.init("8a1b28085cc51888fa5f63bd32888243")
	
	console.log(Kakao.isInitialized());
	
	$('.kakao-login').on('click', function(e) {
		window.location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=8a1b28085cc51888fa5f63bd32888243&redirect_uri=http://localhost:8080/login&response_type=code';
	});

	$(".api-btn").on('click', function(e) {
		Kakao.API.request({
			  url: '/v1/api/talk/friends',
			  success: function(response) {
			    console.log(response);
			  },
			  fail: function(error) {
			    console.log(error);
			  }
			});
	});

});
</script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</body>
</html>