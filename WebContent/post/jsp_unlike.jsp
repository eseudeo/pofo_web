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
      String redirectCause = "?";
      String redirectUrl = "?";
      User currentUser = (User)session.getAttribute(Constants.CURRENTUSER);
      String writerId = request.getParameter("writerId");
      int post_num = Integer.valueOf(request.getParameter("post_num"));
      
      boolean b = true; // 성공 여부 확인하기 위해
      String loginId = currentUser.getId();

      if (request.getParameter("post_num") == null || loginId == null) { //작성자 아이디 값이 없는 경우
         writerId = "";
         redirectCause = "잘못된 접근입니다.";
         b= false;
      }


      PostClass Post = new PostClass();
      List<Map> view = new ArrayList<Map>();
      boolean hasPost_like_user = Post.hasPost_like_user(loginId, post_num);
        if ((hasPost_like_user) && (b)) {  //추천 목록에서 삭제
        	Post.unreco(loginId, post_num);
        	Post.unlike(post_num);  //추천수 -1
            redirectCause = "추천 취소하였습니다.";
            redirectUrl =  "jsp_view_form.jsp?post_num=" + post_num;

         } else {
            redirectUrl = "error.jsp?post_num" + post_num;
            

         }
         request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
         request.getRequestDispatcher(redirectUrl).forward(request, response);

   %>
</body>
</html>