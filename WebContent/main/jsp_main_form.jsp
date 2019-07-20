<%@ page language="java" contentType="text/html; charset=UTF-8"
   import="data.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   User currentUser = (User) session.getAttribute(Constants.CURRENTUSER);
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
   integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
   crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
   integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
   integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
   crossorigin="anonymous"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
   integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="/pofo/css/mainstyle.css">
<link rel="stylesheet" href="/pofo/css/side_nav.css">
<!-- Resource style -->
<title>Main Page</title>
</head>
<body>
   <script type="text/javascript">
      function openPage(pageURL) {
         window.location.href = pageURL;
      }
   </script>
   <script>
      function openNav() {
         document.getElementById("mySidenav").style.width = "250px";
         document.getElementById("main").style.marginRight = "250px";
      }

      function closeNav() {
         document.getElementById("mySidenav").style.width = "0px";
         document.getElementById("main").style.marginRight = "0px";
      }
      
     function clip() {
        //var url= window.location.href;
        var url= "http://localhost:8080/pofo/main/jsp_main_form.jsp";
        window.clipboardData.setData("Text", url);
        alert("URL이 클립보드에 복사되었습니다.\n\ CTRL+V하시면 URL이 입력됩니다");
     }
   </script>

   <div class="container-fluid">
      <div class="row" style="font-size: 30px; cursor: pointer; width:100%; margin-top:40px;">
      
         <div class="col-2">
            <span style="margin-left: 20%; text-align: left;"
               onclick=back(-1);">&laquo;</span>
 <%
 				if (!((currentUser == null) || currentUser.getId() == null || (currentUser.getId().equals("")))) {
 %>
               <span style="margin-left: 10%; text-align: left;"
               onclick="location.href='/pofo/post/jsp_write_form.jsp'">&#43;</span>
 <%
               } 
 %>
               

         </div>
         <div class="col-3 offset-3">
            <div class="brand">
            	<a href ="http://localhost:8080/pofo/main/jsp_main_form.jsp;">
               <img src="/pofo/img/pofomain.png" width="70%" height="35%"></a>
            </div>
         </div>
         
         <div class="col-2 offset-1">
            <div style="margin-left:30%">
            <%
               if (currentUser == null || currentUser.getId() == null || currentUser.getId().equals("")) {
            %>
            <form name=login>
                  <input type="button" class="btn btn-lg btn-set" value="Login" style="width:100%"
                     onclick="openPage('jsp_signIn_form.jsp')">
                  <h6 style="text-align:center; margin-top:5px;"><a href="/pofo/main/jsp_findid_form.jsp" class="no-uline">아이디</a>
                  <a href="/pofo/main/jsp_findpw_form.jsp" class="no-uline">비밀번호 찾기</a></h6>
            </form>
            <%
               } else {
                  currentUser = (User) session.getAttribute(Constants.CURRENTUSER);
                  //out.println(currentUser.getId());
            %>
            <input type="button" value="<%=currentUser.getId() %>" class="btn btn-set" style="width:100%; font-size:50%"
               onclick="openPage('/pofo/post/jsp_userPage.jsp?userId=<%=currentUser.getId() %>')">
            <%
               }
            %>
         </div> 
         </div>                 
         <div class="col-1">
            <span style="margin-right: 1%; text-align: right;"
               onclick="openNav()">&#9776;</span>
         </div>
      </div>
   </div>

   <div id="mySidenav" class="sidenav">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
      <br>
      <%
         if (!((currentUser == null) || currentUser.getId() == null || (currentUser.getId().equals("")))) {
      %>
      <a href="/pofo/profile/jsp_profile_form.jsp">Profile</a> <br>
      <a href="/pofo/post/jsp_postList.jsp">Post List</a> <br>
      <a href="/pofo/post/jsp_loadFavorite.jsp">즐겨찾기 목록</a> <br>
      <a href="jsp_signOut.jsp">Log Out</a> <br>
      <%
         }
      %>
      <a href="javascript:void(0)" class="btn" onclick="clip();" style="border:none; text-align:left; background: none;">Share</a> <br>
   </div>
   <div class="main" style="margin-top:20px;">
      <!-- Header section
   ================================================== -->
   <section id="header" class="header-one">
      <div class="container-fluid">
         <div class="row">
            <div class="col-6 offset-3">
                <div class="header-thumb">
                      <form name=search action="/pofo/search/jsp_search_result.jsp">
                      <div class="row" style="align:center">
                        <select name="category" class="col-2 offset-1 form-control">
                           <option value="total">전체</option>
                           <option value="title">제목</option>
                           <option value="date">날짜</option>
                           <option value="id">작성자</option>
                        </select>  
                        <input class="col-5 form-control" type="text" name=searchValue width="100%;"placeholder="검색어를 입력해주세요"> 
                        <input class="col-1.5 btn btn-set" type="submit" value="검색">
                        <input class="col-1.5 btn btn-set" type="button" value="상세검색"
                           onclick="openPage('/pofo/search/jsp_search_detail_form.jsp')">
                     </div>
                  </form>
                </div>
            </div>
         </div>
      </div>      
   </section>
   
      <%@include file="/reco/jsp_reco_publication.jsp"%>
   </div>
</body>
</html>