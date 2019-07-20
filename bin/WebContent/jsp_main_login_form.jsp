<%@ page language="java" contentType="text/html; charset=UTF-8" import = "sign.SignInClass,data.Constants,data.User,data.UserColumn"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="currentUser" class="data.User" scope="page" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
	<h1>POFO</h1>
<%=session.getAttribute(currentUser.getId()) %>님 반갑습니다.
	<form name=logout>
		<input type="button" value="로그아웃" onclick="openPage('jsp_signIn_success.jsp')"> 
		<input type="button" value="mypage" onclick="openPage('jsp_mypage.jsp')">
	</form>

	<script type="text/javascript">
		function openPage(pageURL) {
			window.location.href = pageURL;
		}
	</script>

	<form name=search>
		<fieldset>
			<select name="category">
				<option value="total">전체</option>
				<option value="title">제목</option>
				<option value="date">날짜</option>
				<option value="id">작성자</option>
			</select> <input type="text" placeholder="검색어를 입력해주세요"> <input
				type="submit" value="검색"> <input type="button" value="상세검색"
				onclick="openPage('jsp_search_detail_form.jsp')">
		</fieldset>
	</form>
</body>
</html>