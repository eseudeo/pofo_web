<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="data.Constants, java.util.*,post.PostClass,data.PostColumn,data.User"
   pageEncoding="UTF-8"%>
   
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String userId;
	if(request.getParameter("userId") != null) {
   		userId = request.getParameter("userId");
	}else {
		userId = currentUser.getId();
	}
   %>
<head>
<!-- Required meta tags -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <link rel="stylesheet" href="/pofo/css/post_style.css">
<title>게시판</title>
</head>

<script type="text/javascript">
   
</script>
<body>
<div class="container-fluid">
   <%
      if (request.getAttribute(Constants.REDIRECTCAUSE) != null) {
         String rc = (String) request.getAttribute(Constants.REDIRECTCAUSE);
         if (rc.equals("write")) {
            out.print("<script type='text/javascript'>");
            out.print("alert('등록되었습니다.'); ");
            out.print("</script>");
         } else if (rc.equals("modify")) {
            out.print("<script type='text/javascript'>");
            out.print("alert('수정되었습니다.'); ");
            out.print("</script>");
         } else if (rc.equals("delete")) {
            out.print("<script type='text/javascript'>");
            out.print("alert('삭제되었습니다.'); ");
            out.print("</script>");
         } else if (rc.equals("favorite")) {
            out.print("<script type='text/javascript'>");
            out.print("alert('즐겨찾기 추가되었습니다.'); ");
            out.print("</script>");
         } else if (rc.equals("error")) {
            out.print("<script type='text/javascript'>");
            out.print("alert('에러입니다.'); ");
            out.print("</script>");
         } 
      }
   %>
   <center>
   
   <div class="form-box">
      <table class="table-write" border=1 cellpadding=2 cellspacing=1>
         <div class="head" style="margin-bottom:3%;"><%=userId %>님의 게시판</div>
         <tr >
            <td>글번호</td>
            <td>글제목</td>
            <td>작성자</td>
            <td>작성날짜</td>
            <td>분야</td>
            <td>추천수</td>
            <td>조회수</td>
         </tr>
         <%
            PostClass Post = new PostClass();
            List<Map> view = new ArrayList<Map>();
            view = Post.postList(userId);
            for (int i = 0; i < view.size(); i++) {
               Map row = view.get(i);
         %>
         <tr>
            <td><%=row.get(PostColumn.POST_NUM.toString())%></td>
            <td><a
               href="jsp_view.jsp?post_num=<%=row.get(PostColumn.POST_NUM.toString())%>"><%=row.get(PostColumn.TITLE.toString())%></a></td>
            <td><%=row.get(PostColumn.ID.toString())%></td>
            <td><%=row.get(PostColumn.REG_DATE.toString())%></td>
            <td><%=row.get(PostColumn.CATEGORY.toString())%></td>
            <td><%=row.get(PostColumn.POST_LIKE.toString())%></td>
            <td><%=row.get(PostColumn.POST_HIT.toString())%></td>
            <%
               }
            %>
         
      </table>
<% 
	if(userId == currentUser.getId()){
%>
      <a href="jsp_write_form.jsp">작성하기</a>
<%
	}
%>
      <INPUT class="btn btn-set" type=button value="되돌아가기"
                     onclick='history.back(-1); return false;'>
	</div>                    
   </center>
  </div> 
</body>
</html>