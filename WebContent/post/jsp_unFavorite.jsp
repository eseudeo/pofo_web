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
      String redirectUrl = "";
      User currentUser = (User)session.getAttribute(Constants.CURRENTUSER);
      String writerId = request.getParameter("writerId");
      boolean b = true; // 성공 여부 확인하기 위해
      String loginId = currentUser.getId(); //임시로 아이디 설정함.

      if (request.getParameter("writerId") == null || loginId == null) { //작성자 아이디 값이 없는 경우
          writerId = "";
          redirectCause = "잘못된 접근입니다.";
          b= false;
       }
      
      PostClass Post = new PostClass();
      List<Map> view = new ArrayList<Map>();

      view = Post.getFavoriteList(loginId); //즐겨찾기 목록을 가져옴

         if (Post.unFavorite(loginId, writerId) && b) {  //즐겨찾기에 추가
            view = Post.getFavoriteList(loginId);
            Map row = view.get(0);
            List l = Constants.splitComma(row.get(UserColumn.FAVORITEMEMBERS.toString()).toString());
            currentUser.setF_list(l);
            session.setAttribute(Constants.CURRENTUSER, currentUser);
            redirectCause = "즐겨찾기가 취소되었습니다.";
            redirectUrl = "jsp_viewFavorite.jsp";

         } else {
            redirectUrl = "error.jsp";
            

         }
         request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
         request.getRequestDispatcher(redirectUrl).forward(request, response);

   %>

//즐겨찾기 로드 페이보릿


</body>
</html>