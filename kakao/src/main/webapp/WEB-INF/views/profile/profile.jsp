<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.profile-container {
	width: 768px;
	margin: 0 auto;
	color: #4c4c4c;
}

.profile-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-left: 0.5rem;
	padding-right: 0.5rem;
}

.kakao-logout {
	background-color: rgba(255,238,51,0.99);
	border-radius: 20px;
	padding: 8px 16px;
	font-weight: 800;
	font-size: 0.715rem;
	text-align: center;
	margin: 4px 2px;
	transition: 0.1s;
	cursor: pointer;
}

.kakao-logout:hover {
	background-color: rgba(255, 234, 0, 0.99);
	font-size: 0.925rem;
	color: black;
}

.profile-wrapper {
	display: flex;
	flex-direction: row;
}

.profile-wrapper>div {
	height: 80px;
}

.thumbnail_image-wrapper {
	overflow: hidden;
	border-radius: 50%;
}

.user-wrapper {
	padding-left: 1rem;
	display: flex;
	flex: 1;
	justify-content: center;
	flex-direction: column;
	justify-content: center;
}

.thumbnail_image_url {
	width: 80px;
	height: 80px;
}

.nickname-txt {
	font-size: 0.725rem;
	font-weight: 800;
}

.nickname {
	margin-top: 0.375rem;
	font-weight: 800;
	padding-bottom: 0.375rem;
	border-bottom: 1px solid #898989;
}
</style>
</head>
<body>

	<div class='profile-container'>
		<div class='profile-header'>
			<h3>프로필</h3>
			<div class='kakao-logout'>로그아웃</div>
		</div>
		<hr />
		<div class='profile-wrapper'>
			<div class='thumbnail_image-wrapper'>
				<img class='thumbnail_image_url' alt="thumbnail_image_url"
					src="${userInfo.thumbnail_image_url }" />
			</div>
			<div class='user-wrapper'>
				<div class='nickname-txt'>닉네임</div>
				<div class='nickname'>${userInfo.nickname }</div>
			</div>
		</div>
		<div class='profile-wrapper'>
			<div class='user-wrapper'>
				<div class='nickname-txt'>성별</div>
				<div class='nickname'>
					<c:choose>
						<c:when test="${userInfo.gender eq 'male' }">남성</c:when>
						<c:when test="${userInfo.gender eq 'female' }">여성</c:when>
						<c:otherwise>?</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class='profile-wrapper'>
			<div class='user-wrapper'>
				<div class='nickname-txt'>연령</div>
				<div class='nickname age-range'>${userInfo.age_range }</div>
			</div>
		</div>
		<div class='profile-wrapper'>
			<div class='user-wrapper'>
				<div class='nickname-txt'>생일</div>
				<div class='nickname birthday'>${userInfo.birthday }</div>
			</div>
		</div>
		<div class='profile-wrapper'>
			<div class='user-wrapper'>
				<div class='nickname-txt'>이메일</div>
				<div class='nickname'>${userInfo.email}</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
$(document).ready(function() {
	$(".kakao-logout").on('click', function(e) {
		window.location.href = '<c:url value="/logout" />';
	});

	const ageRange = $('.age-range').text();
	$('.age-range').text(ageRange.substring(0, 2) + '대');
	const birthday = $('.birthday').text();
	$('.birthday').text(birthday.substring(0, 2) + '월 ' + birthday.substring(2) + '일');

});
</script>
</html>