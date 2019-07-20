<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.util.*,post.PostClass,data.*,java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String redirectCause = "";
	String redirectUrl = "jsp_viewFavorite.jsp";
	String writerId = request.getParameter("writerId");
	String loginId = currentUser.getId();
	PostClass post = new PostClass();
	if(post.hasFavoriteUser(loginId,writerId)){
		post.unFavorite(loginId,writerId);
		List<Map> list = post.getFavoriteList(currentUser.getId());
		String s = list.get(0).get(UserColumn.FAVORITEMEMBERS.toString()).toString();
		List<String> f_list = Constants.splitComma(s);
		currentUser.setF_list(f_list);
	}else{
		redirectCause = "이미 취소하였습니다";
		redirectUrl = "jsp_view.jsp?post_num=" + request.getParameter("post_num");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

</body>
</html>
<%
	request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
	request.getRequestDispatcher(redirectUrl).forward(request, response);
%>