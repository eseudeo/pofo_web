<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants" pageEncoding="UTF-8"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans'
   rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="/pofo/css/post_style.css">
   
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	function boardWriteCheck() {
		var form = document.WriteForm;
		if (form.title.value == '') {
			alert('제목을 입력하세요.');
			form.title.focus();
			return false;
		}
		if (form.content.value == '') {
			alert('내용을 입력하세요');
			form.content.focus();
			return false;
		}
		return true;
	}
</script>
<title>글쓰기</title>
</head>

<body>
<div class="container">
	<center>
     	<a href ="http://localhost:8080/pofo/main/jsp_main_form.jsp;">
        <img src="/pofo/img/pofomain.png" style="margin-top:20px"></a>
        <br>
	<div class="form-box">
		<div class="head">글 쓰기</div>
		<!-- 입력된 값을 다음 페이지로 넘기기 위해 FORM을 만든다. -->
		<form name="WriteForm" action="jsp_write.jsp" method=post
			enctype="multipart/form-data" onsubmit="return boardWriteCheck();">

			<table class="table-write">
				<!-- 입력 부분 -->
				<tr>
					<td style="margin-top:2%">제 목</td>
					<td align=center colspan="5"><INPUT class="form-control" type=text name="title"
						size="70%"></td>
				</tr>
				<tr>
					<td style="margin-top:2%">날짜</td>
					<td>
					<div class=row style="margin-left:5%;">
					<select class="col-4 form-control" name="selectYear" style="text-align:center;">
							<%
								out.println(returnOptionsReverse(2018, 1929));
							%> </select><div style="margin-top:5%;">년</div> 
					<select class="col-3 form-control" name="selectMonth">
							<%
								out.println(returnOptions(1, 12, 1));
							%> </select><div style="margin-top:5%;">월 </div>
					<select class="col-3 form-control" name="selectDay">
							<%
								out.println(returnOptions(1, 31, 1));
							%> </select><div style="margin-top:5%;">일</div>
					</div></td></tr>
					<tr>
					<td style="margin-top:2%">분 야</td>
					<td><select class="form-control" name="category">
							<option value="정치">정치</option>
							<option value="경제">경제</option>
							<option value="사회">사회</option>
							<option value="교육">교육</option>
					</select></td>
					<td style="margin-top:2%">중요도</td>
					<td><select class="form-control" name="post_ipt">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>

					</select></td>
				</tr>	
				<tr>
					<td width=100 align=left>내용</td>
					<td align=left colspan="5"><TEXTAREA class="form-control" name="content" cols="20"
							rows="10" style="resize: none;"></TEXTAREA></td>
				</tr>
				<tr>
					<td width=100 align=left>사진 첨부</td>
					<td align=left colspan="5"><input type="file" name="post_img"></td>
				</tr>
				<tr>
					<td colspan=10 align=center style="margin-top:2%">
					<INPUT class="btn btn-set" type=submit value="글 쓰기">
						&nbsp;&nbsp; 
					<INPUT class="btn btn-set" type=reset value="다시 쓰기"> &nbsp;&nbsp;
					<INPUT class="btn btn-set" type=button value="돌아가기"
						onclick="history.back(-1);"></td>
				</tr>

				<!-- 입력 부분 끝 -->
			</table>
		</form>
		</div>
	</center>
</div>	
</body>
</html>
<%!private String returnOptions(int startNum, int endNum, int selectNum) {
		StringBuffer count = new StringBuffer();
		for (int i = startNum; startNum <= endNum; startNum++) {
			if (startNum == selectNum) {
				count.append("<option value=" + (startNum) + " selected=\"selected\" >" + (startNum) + "</option>\n");
				continue;
			}
			count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");
		}
		return count.toString();
	}

	private String returnOptionsReverse(int endNum, int startNum) {
		StringBuffer count = new StringBuffer();
		do
			count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");
		while (endNum-- >= startNum);
		return count.toString();
	}%>
