<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.text.*, data.Constants,data.PostColumn ,data.DatabaseAccess, post.PostClass, java.util.*, java.sql.Date,data.User"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%   
  	PostClass post = new PostClass();
	String userId = request.getParameter("userId");
	if(userId == null){
		userId = request.getAttribute("userId").toString();
	}
	List<Map> view = new ArrayList<Map>();
	view = post.postList(userId);
%>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=2">
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

   <link href='https://fonts.googleapis.com/css?family=Playfair+Display:700,900|Fira+Sans:400,400italic' rel='stylesheet' type='/pofo/text/css'>
   <link rel="stylesheet" href="/pofo/css/reset.css"> <!-- CSS reset -->
   <link rel="stylesheet" href="/pofo/css/style.css"> <!-- Resource style -->
   <link rel="stylesheet" href="/pofo/css/post_style.css"> <!-- Resource style -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
   <script src="/pofo/js/modernizr.js"></script> <!-- Modernizr -->
   <title>User Page</title>
</head>
<body>
   <div class="head row">
   	<div class="col-2 offset-5" style="margin-top:2%;" >
   	  <a href ="http://localhost:8080/pofo/post/jsp_postList.jsp;" style=" color:white;"> <%=currentUser.getId() %></a></div>
      <div class="col-2 offset-2" style="margin-right:3%">
      <a href ="http://localhost:8080/pofo/main/jsp_main_form.jsp;">
      <img src="/pofo/img/pofomain.png"></a></div>
   </div>
	

<div class="row" style="font-size:30px; cursor:pointer; margin-top:2%">
	<div class="col-2">
		<span style="margin-left: 20%; text-align:left;" onclick="history.back(-1);">&laquo;</span>
		<span style="margin-left: 10%; text-align:left;" onclick="location.href='jsp_write_form.jsp'">&#43;</span>
	</div>
	<div class="col-2 offset-8">
		<input class="btn btn-set" type=button value="즐겨찾기 목록" onclick="/pofo/post/jsp_loadFavorite.jsp" style="font-size:50%; width:80%; margin-right:2%;">
	</div>
</div>

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
						<li><a href=#0 data-date= <%=s %> class="selected"><%=s%></a></li>
	<%			    		
				    	}
	%>
					<li><a href=#0 data-date= <%=s %> ><%=s%></a></li>
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
				    	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				    	String s = sdf.format(view.get(i).get(Constants.DATE));
				    	String s2 = sdf2.format(view.get(i).get(Constants.DATE));
				    	if(i == 0){
				%>
						<li data-date= <%=s %> class="selected"><h2><%=view.get(i).get(PostColumn.TITLE.toString()).toString()%></h2>
						<em><%=s2%></em></li>
				<%			    		
				    	}
				%>
					<li data-date= <%=s %>><h2><%=view.get(i).get(PostColumn.TITLE.toString()).toString()%></h2>
					<em><%=s2%></em></li>
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


<script src="/pofo/js/jquery-2.1.4.js"></script>
<script src="/pofo/js/jquery.mobile.custom.min.js"></script>
<script src="/pofo/js/main.js"></script> <!-- Resource jQuery -->   

</body>
</html>