<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,data.*,profile.ProfileClass,java.util.*"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/pofo/css/post_style.css">
<title>프로필 수정</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = currentUser.getId();
	ProfileClass accessProfile = new ProfileClass(id);
	Profile profile = accessProfile.getProfile();
	String career = String.join(",",profile.getCareer());
%>
	<script language="javascript">
		// 자바 스크립트 시작
		function changeCheck() {
			var form = document.profileform;

			if (!form.name.value) // form 에 있는 name 값이 없을 때
			{
				alert("이름을 적어주세요"); // 경고창 띄움
				form.name.focus(); // form 에 있는 name 위치로 이동
				return;
			}

			if (!form.bday.value) {
				alert("생일을 적어주세요");
				form.bday.focus();
				return;
			}

			form.submit();
		}
	</script>
	
<div class="container">
	<div class="form-profileedit">
	<div class="head"> profile edit </div>
	<form name=profileform method=post action="change_ok.jsp?id=<%=id%>">
		<table class="table-write" style="margin-left:10%">
			<tr>
				<td>&nbsp;</td>
				<td align="center">사진</td>
				<td><input class="form-control" name="user_img" size="50" maxlength="100" value="<%=profile.getUser_img()%>"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">이름</td>
				<td><input class="form-control" name="name" size="50" maxlength="50" value="<%=profile.getName()%>"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">경력</td>
				<td><input class="form-control" name="career" size="50" maxlength="50" value="<%=career%>"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">이메일</td>
				<td><input class="form-control" name="email" size="50" maxlength="50" value="<%=profile.getEmail()%>"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">생일</td>
				<td><input class="form-control" name="bday" size="50" maxlength="50" type="date" value="<%=profile.getBday()%>"></td>
				<td>&nbsp;</td>
			</tr>
			<tr height="1" bgcolor="#dddddd">
				<td colspan="4"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="center">자기소개</td>
				<td><textarea class="form-control" name="intro" cols="50" rows="13" style="resize:none;"><%=profile.getIntro()%></textarea></td>
				<td>&nbsp;</td>
			</tr>
			<tr align="center">
				<td>&nbsp;</td>
				<td colspan="2">
					<input class="btn btn-set" type=button value="작성" OnClick="javascript:changeCheck();">
					<input class="btn btn-set" type=button value="취소" OnClick="javascript:history.back(-1)">
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>