<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="post.PostClass,data.Constants,java.sql.Date"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.File, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.util.Enumeration,data.PostColumn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String redirectCause = "";
	String redirectUrl = "";

	String writerId = "newlhh";

	String uploadPath = request.getRealPath("/post/upload");

	int size = 10 * 1024 * 1024;
	String post_img = "";
	String origfilename = "";

	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
			new DefaultFileRenamePolicy());

	Enumeration files = multi.getFileNames();

	String file1 = (String) files.nextElement();
	post_img = multi.getFilesystemName(file1);
	origfilename = multi.getOriginalFileName(file1);

	int post_num = Integer.parseInt(request.getParameter("post_num"));
	String month = multi.getParameter("selectMonth");
	String day = multi.getParameter("selectDay");
	String date;
	String title, category, content;
	title = multi.getParameter(PostColumn.TITLE.toString());
	category = multi.getParameter(PostColumn.CATEGORY.toString());
	content = multi.getParameter(PostColumn.CONTENT.toString()).replaceAll("\n", "<br>");
	int post_ipt = Integer.parseInt(multi.getParameter(PostColumn.POST_IPT.toString()));

	if (Integer.valueOf(month) < 10)
		month = "0" + month;
	if (Integer.valueOf(day) < 10)
		day = "0" + day;
	date = new StringBuffer(multi.getParameter("selectYear")).append("-").append(month).append("-").append(day)
			.toString();

	PostClass Write = new PostClass();
	//Write.write(title,content);
	if (Write.modify(title, writerId, Date.valueOf(date), category, content, "./upload/" + post_img,
			post_ipt, post_num)) {
		redirectCause = "modify";
		redirectUrl = "jsp_view.jsp?post_num=" + request.getParameter("post_num") ;
	} else {
		redirectCause = "error";
		redirectUrl = "error.jsp?post_num=" + request.getParameter("post_num");
	}
	request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
	request.getRequestDispatcher(redirectUrl).forward(request, response);
%>
<html>
<head>
<title></title>
</head>
<body>
</body>
</html>