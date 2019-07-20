<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,profile.ProfileClass,data.*,java.util.*"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />

<%
	request.setCharacterEncoding("UTF-8");
	ProfileClass accessProfile = new ProfileClass(currentUser.getId());
	Profile profile;
	String id = request.getParameter("id"); 
	String name = request.getParameter("name");
	String career = request.getParameter("career");
	String user_img = request.getParameter("user_img");
	String email = request.getParameter("email");
	String bday = request.getParameter("bday");
	String intro = request.getParameter("intro");
	List<String> careers = Constants.splitComma(career);
	profile = new Profile(id,name,user_img,email,bday,intro,careers);
	accessProfile.updateProfile(profile);
%>
<script language=javascript>
	self.window.alert("글이 수정되었습니다.");
	location.href="jsp_profile_form.jsp";
</script>
