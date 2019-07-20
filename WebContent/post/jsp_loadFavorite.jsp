<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,post.PostClass,data.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String redirectCause = "";
		String redirectUrl = "";
		User currentUser = (User)session.getAttribute(Constants.CURRENTUSER);
		String writerId = request.getParameter("writerId");
		boolean b = true; // 성공 여부 확인하기 위해
		String loginId = currentUser.getId(); //임시로 아이디 설정함.

		PostClass post = new PostClass();
		List<Map> view = new ArrayList<Map>();
		List l;
		view = post.getFavoriteList(loginId); //즐겨찾기 목록을 가져옴
		Map row = view.get(0);
		if(row.get(UserColumn.FAVORITEMEMBERS.toString()) != null){
			l = Constants.splitComma(row.get(UserColumn.FAVORITEMEMBERS.toString()).toString());
			int numbers = l.size();
				if (l.contains(writerId)) { //이미 즐겨찾기한 경우
					b = false;
					redirectCause = "이미 즐겨찾기 했습니다.";
				}
			if (b) {
				currentUser.setF_list(l);
				session.setAttribute(Constants.CURRENTUSER, currentUser);
				redirectCause = "즐겨찾기 리스트에 추가되었습니다.";
				redirectUrl = "jsp_viewFavorite.jsp";

			} else {
				redirectUrl = "error.jsp";
			}

		}else{
			if(post.addFavorite(loginId, writerId)){
				currentUser.addF_list(loginId);
				redirectUrl = "jsp_viewFavorite.jsp";
			}else{
				redirectUrl = "error.jsp";
			}
		}
		request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	%>

</body>
</html>