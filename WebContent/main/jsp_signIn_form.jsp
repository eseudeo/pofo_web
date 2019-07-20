<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants,data.User"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.removeAttribute(Constants.CURRENTUSER);
	String redirectUrl = Constants.JSP_SIGNIN_SUCCESS;
	if(session.getAttribute(Constants.CURRENTUSER) != null){
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	}
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>로그인</title>
<!--=======Font Open Sans======-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
   rel='stylesheet' type='text/css'>
<!--=======Custom Style======-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signIn_style.css">
</head>
<body>
   <div class="form-box">
      <div class="head">Welcome Back</div>

      <form name=signIn method=post action=jsp_signIn_success.jsp id="login-form">
         <div class="form-group">
            <label class="label-control"> 
            </label> <input type="text" name="id" class="form-control" placeholder="아이디" />
         </div>
         <div class="form-group">
            <label class="label-control"> 
            </label> <input type="password" name="pw" class="form-control"  placeholder="비밀번호" />
         </div>
         <input type="submit" value="로그인" class="btn" />
         <p class="text-p">
            회원이 아니신가요? <a href="jsp_signUp_form.jsp">회원가입</a>
         </p>
         <p class="text-p">
         <a href="jsp_findid_form.jsp">아이디</a>
         <a href="jsp_findpw_form.jsp">비밀번호 찾기</a>
         </form>
   </div>
</body>
</html>
<%
	if(request.getAttribute(Constants.REDIRECTCAUSE) != null){
		out.println("<script>alert('" + request.getAttribute(Constants.REDIRECTCAUSE) + "');</script>");
		request.removeAttribute(Constants.REDIRECTCAUSE);
	}
%>
