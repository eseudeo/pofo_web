<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.text.*, data.Constants, data.DatabaseAccess, post.PostClass, java.util.*, java.sql.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("utf-8"); %>
<%-- <% 
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   List <Map> date_view = new ArrayList<Map>();
   Map im;
%> --%>
<%   
   String title = request.getParameter("title");
   String post_ipt = request.getParameter("post_ipt");
   String post_month = request.getParameter("selectMonth");
   String post_day = request.getParameter("selectDay");
   String date;
   
	if(Integer.valueOf(post_month) < 10) post_month = "0" + post_month;
	if(Integer.valueOf(post_day) < 10) post_day = "0" + post_day;
	date = new StringBuffer(request.getParameter("selectYear")).append("-")
			.append(post_month).append("-")
			.append(post_day).toString();
   
  	PostClass post = new PostClass();
	//post.write(title, post_ipt, Date.valueOf(date));

	List<Map> view = new ArrayList<Map>();
	view = post.postCount();
//    StringBuilder string = new StringBuilder();
//    for(int i =0; i < view.size(); i++){
//    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//    	String s = sdf.format(view.get(i).get(Constants.DATE));
//   	string.append("<li><a href=#0 data-date=" + s + " class=selected>" +view.get(i).get(Constants.TITLE).toString() + "</a></li>\n");
//    }
%>
<%--<%   //순서 대로 출력
   try{
   // select 문장을 문자열 형태로 구성한다.
   String sql = "select post_num, title, post_ipt from post";

   pstmt = conn.prepareStatement(sql);

   // select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
   ResultSet rs = pstmt.executeQuery();
   
   int i=0;
         
   // 마지막 데이터까지 반복함.
   while(rs.next()) {
      Map postc = new HashMap();
      postc.put(rs.getString("post_num"), rs.getString("title"));
      date_view.add(postc);
   }
   
         // 사용한 자원의 반납.
   rs.close();
   pstmt.close();
   conn.close();
}
catch(Exception e) {
   System.out.println(e);
}
%> --%>

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=2">
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

   <link href='https://fonts.googleapis.com/css?family=Playfair+Display:700,900|Fira+Sans:400,400italic' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
   <link rel="stylesheet" href="css/style.css"> <!-- Resource style -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
   <script src="js/modernizr.js"></script> <!-- Modernizr -->
   <title>User Page</title>
</head>
<body>
	<h2 style="text-align:center">개인페이지</h2>

<div class="row" style="font-size:30px; cursor:pointer;">
	<div class="col-2">
		<span style="margin-left: 20%; text-align:left;" onclick="history.back(-1);">&laquo;</span>
		<span style="margin-left: 10%; text-align:left;" onclick="location.href='jsp_userPage_form.jsp'">&#43;</span>
	</div>
		
	<div class="col-1 offset-9">
		<span style="margin-right: 1%; text-align:right;" onclick="openNav()">&#9776;</span>
	</div>
</div>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <br>
  <a href="#">Profile</a> <br>
  <a href="#">즐겨찾기 목록</a> <br>
  <a href="#">Share</a> <br>
  <a href="#">Setting</a> <br>
  <a href="#">Log Out</a> <br>
</div>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginRight = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0px";
    document.getElementById("main").style.marginRight = "0px";
}
</script>

<div id="main">
	<section class="cd-horizontal-timeline">
	   <div class="timeline">
	      <div class="events-wrapper">
	         <div class="events">
	            <ol>
	<%
					for(int i =0; i < view.size(); i ++){
				    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				    	String s = sdf.format(view.get(i).get(Constants.DATE));
				    	if(i == 0){
	%>
						<li><a href=#0 data-date= <%=s %> class="selected"><%=view.get(i).get(Constants.DATE).toString()%></a></li>
	<%			    		
				    	}
	%>
					<li><a href=#0 data-date= <%=s %> ><%=view.get(i).get(Constants.DATE).toString()%></a></li>
	<%					
					}
	%>
	            </ol>
	
	            <span class="filling-line" aria-hidden="true"></span>
	         </div> <!-- .events -->
	      </div> <!-- .events-wrapper -->
	         
	      <ul class="cd-timeline-navigation">
	         <li><a href="#0" class="prev inactive">Prev</a></li>
	         <li><a href="#0" class="next">Next</a></li>
	      </ul> <!-- .cd-timeline-navigation -->
	   </div> <!-- .timeline -->
	
	   <div class="events-content">
	      <ol>
	      		<%
					for(int i=0 ; i<view.size() ; i++){
				    	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				    	String s = sdf.format(view.get(i).get(Constants.DATE));
				    	if(i == 0){
				%>
						<li data-date= <%=s %> class="selected"><h2><%=view.get(i).get(Constants.TITLE).toString()%></h2>
						<em><%=view.get(i).get(Constants.DATE).toString()%></em></li>
				<%			    		
				    	}
				%>
					<li data-date= <%=s %>><h2><%=view.get(i).get(Constants.TITLE).toString()%></h2>
					<em><%=view.get(i).get(Constants.DATE).toString()%></em></li>
				<%					
						}
				%>

<!-- 	         <li data-date="16/01/2014">
	            <h2>Horizontal Timeline</h2>
	            <em>January, 2014</em>
	            <p>   
	               1
	            </p>
	         </li>
	
	         <li data-date="28/02/2014">
	            <h2>Event title here</h2>
	            <em>February 28th, 2014</em>
	            <p>   
	               2
	            </p>
	         </li>
	
	         <li data-date="20/04/2014">
	            <h2>Event title here</h2>
	            <em>March 20th, 2014</em>
	            <p>   
	               3
	            </p>
	         </li> -->
	         
	      </ol>
	   </div>
	</section>
</div>

<script src="js/jquery-2.1.4.js"></script>
<script src="js/jquery.mobile.custom.min.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->   

</body>
</html>