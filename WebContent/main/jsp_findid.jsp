<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="sign.FindIdClass,data.*, java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String redirectCause = "";
	String redirectUrl = Constants.JSP_FINDID_FORM;
	FindIdClass FindId = new FindIdClass();
	String name, email, id = "";
	name = request.getParameter("name");
	email = request.getParameter("email");

	List<Map> view = new ArrayList<Map>();
	if (isEmpty(name, email))
		redirectCause = "빈칸을 작성하세요";
	else {
		view = FindId.findId(name, email);
		if (view.size() > 0) {
			Map row = view.get(0);
			id = row.get(UserColumn.ID.toString()).toString();
		}
	}
%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>아이디 찾기</title>
<!--=======Font Open Sans======-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<!--=======Custom Style======-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/find_style.css">

<script type="text/javascript">
	function openPage(pageURL) {
		window.location.href = pageURL;
	}
</script>
</head>
<body>
	<div class="jumbotron">
		<h1 class="display-4">아이디 찾기</h1>
		<hr class="my-4">

		<div style="width: 40%;">
			<div>
				<%
					if (id.equals("")) {
				%>
				<p class="lead">아이디를 찾지 못했습니다.</p>
				<div>
					<input type="button" value="아이디 다시 찾기"  class="btn"
						onclick="openPage('jsp_findid_form.jsp')"> <input
						type="button" value="회원가입하기"  class="btn"
						onclick="openPage('jsp_signUp_form.jsp')">
				</div>
			</div>
			<div>
				<%
					} else {
				%>

				<p class="lead">고객님의 정보와 일치하는 아이디입니다.</p>
				<div class="panel pansel-default">
					<div class="panel-body"><%=id%></div>
				</div>
				<div>
					<input type="button" value="로그인"  class="btn"
						onclick="openPage('jsp_signIn_form.jsp')"> <input
						type="button" value="비밀번호 찾기"  class="btn"
						onclick="openPage('jsp_findpw_form.jsp')">
				</div>


				<%
					}
				%>
			</div>
		</div>

	</div>

</body>
</html>
<%
	if (redirectCause.equals("빈칸을 작성하세요")) {
		request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	}
%>
<%!private boolean isEmpty(String name, String email) {
		if ((name.equals("")) || (email.equals("")))
			return true;
		return false;
	}%>