<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.util.*,sign.SignInClass,data.Constants,data.User,data.UserColumn"
    pageEncoding="UTF-8"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%
	String redirectCause = "";
	String redirectUrl = Constants.JSP_MAINPAGE;
	SignInClass signIn = new SignInClass();
	String id,password;
	id = request.getParameter(UserColumn.ID.toString());
	password = request.getParameter(UserColumn.PASSWORD.toString());
	List li = currentUser.getF_list();
	if(isEmpty(id,password)) {
		redirectCause = "빈칸을 작성하세요";
	}else if(!signIn.signIn(id,password)){
		redirectCause = "아이디나 비밀번호를 확인해주세요";
	}
%>
<html>
<head>
<meta charset="UTF-8">
<%
	if(signIn.getCurrentUser() !=null) {
		session.setAttribute(Constants.CURRENTUSER, signIn.getCurrentUser());
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	}else {
		redirectUrl = Constants.JSP_SIGNIN_FORM;
		request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	}
%>	
<title>로그인</title>
</head>
<body>
<form name=signOut method=post action=jsp_signOut.jsp>
<input type="submit" value="로그아웃" onclick="alert('로그아웃했습니다');" />
</form>
</body>
</html>
<%!
	private boolean isEmpty(String id, String password) {
		if((id != "") || (password != "")) return false;
		return true;
	}
%>