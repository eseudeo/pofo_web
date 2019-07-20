<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link type="text/css"
	href="${pageContext.request.contextPath}/css/searchform.css"
	rel="stylesheet" id="bootstrap-css">

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	function goUrl(url) {
		location.href = url;
	}
</script>

<title>상세 검색</title>


</head>
<body>
	<div class="container">
		<h1 class="display-4">상세 검색</h1>
		<hr class="my-4">
		<div>
			<form name=searchDate action="jsp_search_result.jsp" method="get">
				<input type="hidden" name="isDetail" value="true">
				<br>
				<legend>날짜 검색</legend>
				<div class="row">
					<div class="col-2"  >
						<select name="selectYear" class="form-control" style="height:100%;">
							<%
								out.println(returnOptionsReverse(2018, 1930));
							%>
						</select>

					</div>
					<div class="col-1" >년</div>
					<div class="col-2">

						<select name="selectMonth" class="form-control" style="height:100%;">
							<%
								out.println(returnOptions(1, 12, 1));
							%>
						</select>
					</div>
					<div class="col-1">월</div>
					<div class="col-2">

						<select name="selectDay" class="form-control" style="height:100%;">
							<%
								out.println(returnOptions(1, 31, 1));
							%>
						</select>
					</div>
					<div class="col-1">일</div>
					
					<div class="col-3">

						<input type="submit" value="검색" class="btn">
					</div>
				</div>
			</form>

		</div><br>
		<div>
			<form name=searchCategory action="jsp_search_result.jsp" method="get">
				<input type="hidden" name="isDetail" value="true">
				<legend>분야별 검색</legend>
				<div class="row">
					<div class="col-2">
						<select name="category" class="form-control" style="height:100%;">
							<option value="정치">정치</option>
							<option value="경제">경제</option>
							<option value="사회">사회</option>
							<option value="과학">과학</option>
							<option value="IT">IT</option>
							<option value="예술">예술</option>
							<option value="교육">교육</option>
							<option value="기타">기타</option>

						</select>
					</div>
					<div class="col-3 offset-1">
						<input type="submit" value="검색" class="btn">
					</div>
				</div>
			</form>
		</div><br>
		<div>
			<INPUT type=button value="돌아가기"
				onclick="goUrl('/pofo/main/jsp_main_form.jsp')" class="btn">
		</div>
	</div>
</body>
</html>
<%!private String returnOptions(int startNum, int endNum, int selectNum) {
		StringBuffer count = new StringBuffer();
		for (int i = startNum; startNum <= endNum; startNum++) {
			if (startNum == selectNum) {
				count.append("<option value=" + (startNum) + " selected=\"selected\" >" + (startNum) + "</option>\n");

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