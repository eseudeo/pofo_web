<%@ page language="java" contentType="text/html; charset=UTF-8" import="publications.RecommendedPublication,data.Constants,data.Category,java.util.*,data.PostColumn"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   request.setCharacterEncoding("utf-8");
   RecommendedPublication rePublication = new RecommendedPublication();
   int i = 0;
   Category[] categories = Category.values();
   String category,selected;
   if(request.getParameter(Constants.CATEGORY) == null){
      selected = "POLITICS";
      category = categories[0].toString();
   }else{
      selected = request.getParameter(Constants.CATEGORY);
      category = Category.valueOf(selected).toString();
   }
   List<Map> publications = rePublication.getPublications(category, 3);
%>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/pofo/css/reco_style.css">


</head>
<body>

<!-- Portfolio section
================================================== -->
<section id="portfolio">
   <div class="container">
      <div class="row">
         <div class="col-md-12 col-sm-12">
               <!-- iso section -->
               <div class="iso-section wow fadeInUp" data-wow-delay="2.6s">
                  <ul class="filter-wrapper clearfix">
<%
   while(i< categories.length){
      if(i==0){
%>
         <li><a href="/pofo/main/jsp_main_form.jsp?selected=<%=categories[i].name() %>" class="selected opc-main-bg" data-filter=".<%=categories[i].name()%>"><%=categories[i++] %></a></li>
<%      
         continue;
      }
%>
               <li><a href="/pofo/main/jsp_main_form.jsp?selected=<%=categories[i].name() %>" class="opc-main-bg" data-filter=".<%=categories[i].name()%>"><%=categories[i++] %></a></li>
<%
   }
%>
               <li><a href="/pofo/reco/jsp_reco_publication_category.jsp?selected=<%=selected %>" class="opc-main-bg" data-filter=".more">더보기</a></li>
                  </ul>

               </div>

         </div>

      </div>
      
<%    
   int indexNum = 0;
   while(indexNum < publications.size()){
      Map index = publications.get(indexNum++);
      String imgPath = index.get(PostColumn.POST_IMG.toString()).toString();
      String content = index.get(PostColumn.CONTENT.toString()).toString();
      int length = ((content.length() > 20) ? 15 : content.length());
%>
      <tr><td><a href="<%=((imgPath.contains("null"))? "" : imgPath )%>"></a><%=((imgPath.contains("null"))? "" : imgPath )%></td><td><a href=/pofo/post/jsp_view_form.jsp?post_num=<%=index.get(PostColumn.POST_NUM.toString())%>><%=index.get(PostColumn.TITLE.toString()) %></a></td>
      <td><%=index.get(PostColumn.CONTENT.toString()).toString().substring(0, length) %></td><br>
<%
   }
%>
   </div>
</section>
</body>
</html>

<script>
      function reload(x) {
         var target = x;
         var url = '/pofo/main/jsp_main_form.jsp?selected=' + target;
         window.location.href = url;
      }
</script>