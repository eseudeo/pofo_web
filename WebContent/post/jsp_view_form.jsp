<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass, data.PostColumn"
	pageEncoding="UTF-8"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	
	PostClass post = new PostClass();
	int post_num = Integer.parseInt(request.getParameter("post_num"));
	post.view(post_num);
	Map row = post.view(post_num).get(0);
	currentUser.getId();
%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/pofo/css/post_style.css">
<title>글보기</title>

<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
    function Delete()
    {
        if(confirm("정말 삭제하시겠습니까?") == true)
        {
        	
        	location.href = 'jsp_Delete.jsp?post_num=<%=post_num%>';
		}
	}
</script>
</head>
<body>
<div class="container-fluid">
<div class="form-box">

	<center>
	 	<a href ="http://localhost:8080/pofo/main/jsp_main_form.jsp;">
    	<img src="/pofo/img/pofomain.png" style="margin-top:2%"></a>
	<div class="head" style="margin-bottom:2%">게시물</div>
		<!-- 입력된 값을 다음 페이지로 넘기기 위해 FORM을 만든다. -->
		<table border=1 cellpadding=2 cellspacing=1 >

			<!-- 입력 부분 -->
			<tr>
				<td width=100 align=center>제 목</td>
				<td align=center colspan="7"><%=row.get(PostColumn.TITLE.toString()).toString()%></td>
				<td><input type="hidden" name="post_num"
					value="<%=row.get(PostColumn.POST_NUM.toString()).toString()%>"></td>

			</tr>
			<tr>
				<td width=100 colspan="1" align=center>작성자</td>
				<td width=100 colspan="1" align=center><%=row.get(PostColumn.ID.toString())%>
<%
	if(!(currentUser == null || currentUser.getId() == "")){
		if(currentUser.getF_list().contains(row.get(PostColumn.ID.toString()).toString())){
%>
				<input class="btn btn-set" type="button" value="즐겨찾기취소"
					onclick="goUrl('jsp_removeFavorite.jsp?writerId=<%=row.get(PostColumn.ID.toString())%>&post_num=<%=row.get(PostColumn.POST_NUM.toString())%>')">
<%			
		}else{
%>				
				<input class="btn btn-set" type="button" value="즐겨찾기"
					onclick="goUrl('jsp_addFavorite.jsp?writerId=<%=row.get(PostColumn.ID.toString())%>&post_num=<%=row.get(PostColumn.POST_NUM.toString())%>')">
<%
		}
	}
%>
					</td>

				<td width=100 colspan="1" align=center>작성날짜</td>
				<td width=100 colspan="4" align=center><%=row.get(PostColumn.REG_DATE.toString()).toString().substring(0, 10)%></td>
				<td width=100 colspan="1" align=center>추천수</td>
				<td width=100 colspan="1" align=center><H4><%=row.get(PostColumn.POST_LIKE.toString())%></H4>
<%
	if(!(currentUser == null || currentUser.getId() == "")){
		List<String> l;
		int numbers = 0;
		if(row.get(PostColumn.POST_LIKE_USER.toString()) == null){
			l = new ArrayList();
		}else{
		l = Constants.splitComma(row.get(PostColumn.POST_LIKE_USER.toString()).toString());
        numbers = l.size();
		}
		if (l.contains(currentUser.getId())) { //이미 추천한 경우
        	%>
        	<input class="btn btn-set" style="margin-right:1%;" type="button" value="추천 취소하기"
					onclick="goUrl('jsp_unlike.jsp?post_num=<%=row.get(PostColumn.POST_NUM.toString())%>&writerId=<%=row.get(PostColumn.ID.toString())%>')">
        	
        	<%
        } else {
%>	
					<input class="btn btn-set" style="margin-right:1%;" type="button" value="추천하기"
					onclick="goUrl('jsp_like.jsp?post_num=<%=row.get(PostColumn.POST_NUM.toString())%>&writerId=<%=row.get(PostColumn.ID.toString())%>')">
<%
			}
	}
%>
					</td>
			</tr>
			<tr>
				<td width=100 align=center>날짜</td>
				<td colspan="5" align=center><%=row.get(PostColumn.DATE.toString()).toString().substring(0, 10)%></td>
				<td width=100 align=center>분 야 : <%=row.get(PostColumn.CATEGORY.toString())%></td>
				<td width=200 align=center colspan="2">중요도 : <%=row.get(PostColumn.POST_IPT.toString())%></td>
			<tr>
				<td width=100 align=center>내용</td>
				<td align=left colspan="8" width=200 height=300 align="right"><%=row.get(PostColumn.CONTENT.toString()).toString() %></td>
			</tr>
			<tr>
				<td width=100 align=center>사진</td>
				<td align=left colspan="8"><img
				if()
					src="<%=row.get(PostColumn.POST_IMG.toString())%>"
					class="border border-dark rounded" width="100%" height="100"></td>
			</tr>
			<tr>
			
				<!-- 세션 아이디와 글 작성자 아이디를 비교해서 수정 삭제 버튼의 유무를 결정 -->
				<%
					session.setAttribute("login", currentUser.getId());
					if (session.getAttribute("login") != null) {
						if (session.getAttribute("login").equals(row.get(PostColumn.ID.toString()))) {
				%>
				<td colspan=10 align=center><INPUT class="btn btn-set" type=submit value="수정하기"
					onclick="goUrl('jsp_modify_form.jsp?post_num=<%=post_num%>');">
					&nbsp;&nbsp; <INPUT class="btn btn-set" type=button value="삭제하기" onclick="Delete();">
					&nbsp;&nbsp; <INPUT class="btn btn-set" type=button value="되돌아가기"
					onclick='history.back(-1); return false;'></td>
				<%
					} else {
						%>
						<td colspan=10 align=center><INPUT class="btn btn-set" type=button value="되돌아가기"
							onclick='history.back(-1); return false;'></td>
						<%
					}
					}
				%>

			</tr>

			<!-- 입력 부분 끝 -->
		</table>
	</center>
	</div>
	</div>
</body>
</html>
<%
	if(request.getAttribute(Constants.REDIRECTCAUSE) == null || request.getAttribute(Constants.REDIRECTCAUSE).equals("post view")){}
	else {
		out.print("<script type='text/javascript'>");
		out.print("alert('" + request.getAttribute(Constants.REDIRECTCAUSE).toString() + "'");
		out.print("</script>");
	}
%>