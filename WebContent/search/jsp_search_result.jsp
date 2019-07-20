<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,search.SearchClass, data.PostColumn"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<%
	String msg = "";
	String searchValue = request.getParameter("searchValue");
	String category = request.getParameter("category");
	SearchClass search = new SearchClass();
	List<Map> view = new ArrayList<Map>();
	if(isEmpty(searchValue)){
		out.println("<script>alert('빈칸을 작성해주세요'); location.href='/pofo/main/jsp_main_form.jsp';</script>");

	}
	if (request.getParameter("isDetail") == null) { //상세검색이 아닌 경우

		if (category.equals("title")) { //제목 검색
			msg = "제목 검색 결과";
			view = search.searchTitle(searchValue);
		} else if (category.equals("id")) { //작성자 검색
			msg = "작성자 검색 결과";
			view = search.searchWriter(searchValue);
		} else if (category.equals("total")) {
			msg = "전체 검색 결과";
			view = search.searchTotal(searchValue);
		}

	} else { //상세검색인 경우

		if (request.getParameter("category") == null) { //상세검색(날짜)
			msg = "상세 검색(날짜) 결과";

			String month = request.getParameter("selectMonth");
			String day = request.getParameter("selectDay");
			String date = "";

			if (Integer.valueOf(month) < 10)
				month = "0" + month;
			if (Integer.valueOf(day) < 10)
				day = "0" + day;
			date = new StringBuffer(request.getParameter("selectYear")).append("-").append(month).append("-")
					.append(day).toString();

			view = search.searchDate(date);
		} else { //상세검색(분야)
			msg = "상세 검색(분야) 결과";
			view = search.searchCategory(category);
			
		}

	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
	function goUrl(url) {
		location.href = url;
	}
</script>
<link rel="stylesheet" href="/pofo/css/post_style.css">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<div class="form-box" >
	<div class="head" style="margin-bottom:3%;"><%=msg%></div>
	<%
		if (view.isEmpty()) {
			msg = "검색 결과가 없습니다.";
			out.print("<script type='text/javascript'>");
			out.print("alert('" + msg + "'); location.href='/pofo/main/jsp_main_form.jsp';");

			out.print("</script>");
		}
	%>
	<center>
		<table class="table-write" border=1; >
			<tr>
				<td><div style="font-size:20px;">제목</div></td>
				<td><div style="font-size:20px;">작성자</div></td>
				<td><div style="font-size:20px;">날짜</div></td>
				<td><div style="font-size:20px;">분야</div></td>
			</tr>

			<%
				for (int i = 0; i < view.size(); i++) {
					Map row = view.get(i);
			%><tr>
				<td><a href=/pofo/post/jsp_view_form.jsp?post_num=<%=row.get(PostColumn.POST_NUM.toString())%>><%=row.get(PostColumn.TITLE.toString())%></a></td>
				<td><%=row.get(PostColumn.ID.toString())%></td>
				<td><%=row.get(PostColumn.DATE.toString()).toString().substring(0,10)%></td>
				<td><%=row.get(PostColumn.CATEGORY.toString())%></td>
			</tr>
			<%
				}
			%>
			<tr>
			</tr>
		</table>
		<INPUT class="btn btn-set" type=button value="돌아가기" onclick="goUrl('/pofo/main/jsp_main_form.jsp')">
	</center>
	</div>
</div>	
</body>
</html>
<%!
	private boolean isEmpty(String searchValue) {
		if(searchValue == null || searchValue.equals("")) return true;
		return false;
	}
%>