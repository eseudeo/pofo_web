<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" %>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	List l = currentUser.getF_list();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i = 1; i < l.size(); i++){
		out.println(i + ". ID : <a href=\"jsp_gotoPostList.jsp?userId=" + l.get(i) + "\">" + l.get(i) + "</a><p>");
	}
%>
<INPUT type=button value="되돌아가기"onclick='history.back(-1); return false;'>
</body>
</html>