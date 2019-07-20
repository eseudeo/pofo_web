<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,data.*,profile.ProfileClass"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<%
	String id = currentUser.getId();
	ProfileClass accessProfile = new ProfileClass(id);
	Profile profile = accessProfile.getProfile();
	List<String> careers = profile.getCareer();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/pofo/css/post_style.css">
<head>
<title>프로필</title>
</head>
<body>
<div class="container-fluid">
<center>
<div class="form-profile">
	<div class="head"> Profile </div>
	<table class="table-write" style="margin-top:2%;">
		<tr>
			<td>
				<table>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">사진</td>
						<td width="319"><%=profile.getUser_img()%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">이름</td>
						<td width="319"><%=profile.getName()%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
<%
	if(careers.size() < 1) {
%>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">경력</td>
						<td width="319"></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
<%		
	}else{
		for(int i = 0; i < careers.size(); i++){
%>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">경력</td>
						<td width="319"><%=careers.get(i)%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
<%
		}
	}
%>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">이메일</td>
						<td width="319"><%=profile.getEmail()%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0">&nbsp;</td>
						<td align="center" width="76">생일</td>
						<td width="319"><%=profile.getBday()%></td>
						<td width="0">&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>
					<tr>
						<td width="0"></td><td align="center" width="76">자기소개</td>
						<td width="399" colspan="2" height="200"><%=profile.getIntro()%>
					</tr>
					<tr height="1" bgcolor="#dddddd">
						<td colspan="4" width="407"></td>
					</tr>

					<tr align="center">
						<td width="0">&nbsp;</td>
						<td colspan="3" width="399">
<%
	if(id.equals(currentUser.getId())){
%>
							<input class="btn btn-set" type=button value="수정" OnClick="window.location='change.jsp?userId=<%=id%>'">
<%
	} 
%>
							<input class="btn btn-set" type=button value="뒤로가기 " OnClick="javascript:history.back(-1)">
							<input class="btn btn-set" type=button value="홈 " OnClick="window.location='/pofo/main/jsp_main_form.jsp'">
						<td width="0">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
	</center>
</div>
</body>

</html>