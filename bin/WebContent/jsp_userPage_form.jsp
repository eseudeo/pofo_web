<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "data.Constants,data.DatabaseAccess, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<title>post form</title>
</head>
<style>
	body {
	    font-family: 'Nanum Gothic', sans-serif;
	    font-weight: bold;
	}
</style>

<body>
   <form name=userPage method=post action=jsp_userPage.jsp>
      제목 : <input type=text name=title>
      중요도 : <select name=post_ipt>
      <% out.println(returnOptions(1, 5)); %>   </select>
      작성일 : <select name = selectYear>
		<%
			out.println(returnOptionsReverse(2018, 1930));
		%>
		</select>년
		<select name = selectMonth>
		<%
			out.println(returnOptions(1, 12));
		%>
		</select>월
		<select name = selectDay>
		<%
			out.println(returnOptions(1,31));
		%>
		</select>일
	<input type=submit value="게시물등록">
   </form>

</body>
</html>

<%-- <%
   if(request.getAttribute(Constants.REDIRECTCAUSE) != null){
      out.println("<script>alert('" + request.getAttribute(Constants.REDIRECTCAUSE) + "');</script>");
      request.removeAttribute(Constants.REDIRECTCAUSE);
   }
%> --%>
<%!
   private String returnOptions(int startNum, int endNum){
      StringBuffer count = new StringBuffer();
      do count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");      
      while(startNum++ < endNum);
      return count.toString();
   }

	private String returnOptionsReverse(int endNum, int startNum){
		StringBuffer count = new StringBuffer();
		do count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");		
		while(endNum-- >= startNum);
		return count.toString();
	}

%>