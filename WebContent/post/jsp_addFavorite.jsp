<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="java.util.*,post.PostClass,data.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      String redirectCause = "";
      String redirectUrl = "jsp_view.jsp?post_num=" + request.getParameter("post_num");
      User currentUser = (User)session.getAttribute(Constants.CURRENTUSER);
      String writerId = request.getParameter("writerId");
      boolean b = true; // 성공 여부 확인하기 위해
      String loginId = currentUser.getId(); //임시로 아이디 설정함.

      if (request.getParameter("writerId") == null) { //작성자 아이디 값이 없는 경우
         writerId = "";
         redirectCause = "잘못된 접근입니다.";
         b= false;
      }

      if (writerId.equals(loginId)) { //자기 아이디인 경우
         b = false;
         redirectCause = "본인의 아이디입니다.";
      }

      PostClass Post = new PostClass();
      List<Map> view = new ArrayList<Map>();
      
      view = Post.getFavoriteList(loginId); //즐겨찾기 목록을 가져옴
      Map row = view.get(0);
      List<String> l;
      if(row.get(UserColumn.FAVORITEMEMBERS.toString()) != null){
    	  l = Constants.splitComma(row.get(UserColumn.FAVORITEMEMBERS.toString()).toString());
    	  if(l.contains(writerId)){
    		  b = false;
    		  redirectCause = "이미 즐겨찾기 했습니다.";
    	  }
    	  if(b){
    		  if(Post.addFavorite(loginId, writerId)){
    			  l.add(writerId);
    	          currentUser.setF_list(l);
    	          redirectCause = "즐겨찾기 리스트에 추가되었습니다.";
    	          redirectUrl = "jsp_viewFavorite.jsp";
    		  }
      }

      }else{
    	  if(Post.addFavorite(loginId,writerId)){
    		  Map index = Post.getFavoriteList(loginId).get(0);
    		  String s = index.get(UserColumn.FAVORITEMEMBERS.toString()).toString();
    		  l = Constants.splitComma(s);
			  l.add(writerId);
	          currentUser.setF_list(l);
	          redirectCause = "즐겨찾기 리스트에 추가되었습니다.";
	          redirectUrl = "jsp_viewFavorite.jsp";
	          }
      }
          request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
          request.getRequestDispatcher(redirectUrl).forward(request, response);
   %>
</body>
</html>