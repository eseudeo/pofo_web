<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<title>아이디 찾기</title>
<!--=======Font Open Sans======-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<!--=======Custom Style======-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/find_style.css">
</head>
<body>
<center>
            	<a href ="http://localhost:8080/pofo/main/jsp_main_form.jsp;">
               <img src="/pofo/img/pofomain.png" style="margin-top:2%"></a>
</center>
	<div class="form-box">
		<div class="head">아이디 찾기</div>

		<form name="findid" method="post" action="jsp_findid.jsp"
			id="login-form">
			<div class="form-group">
				<label class="label-control"> </label> <input type="text"
					name="name" class="form-control" placeholder="이름" />
			</div>
			<div class="form-group">
				<label class="label-control"> </label> <input type="text"
					name="email" class="form-control" placeholder="이메일주소" />
			</div>
			<input type="submit" value="아이디 찾기" class="btn" />
		</form>
	</div>
	
</body>
</html>
<%
	if (request.getAttribute(Constants.REDIRECTCAUSE) != null) {
		out.println("<script>alert('" + request.getAttribute(Constants.REDIRECTCAUSE) + "');</script>");
		request.removeAttribute(Constants.REDIRECTCAUSE);
	}
%>