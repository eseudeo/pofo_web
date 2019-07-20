<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css"
   href="${pageContext.request.contextPath}/css/signUp_style.css"
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

<title>회원가입</title>
</head>
<body>

<script language="Javascript">
function email_change(){
        if (document.signUp.emaildomain_select.value == '') {
        	document.signUp.emaildomain.readOnly = false;
        	document.signUp.emaildomain.focus();
        }
        else {
        	document.signUp.emaildomain.readOnly = true;
        	document.signUp.emaildomain.value = document.signUp.emaildomain_select.value;
        }
    }
</script>

  <div class="container">
      <h1 class="well" style="text-align:center;">POFO</h1>
      <div class="well" style="width:80%;">
         <div class="row">
            <form name="signUp" method="post" action="jsp_signUp.jsp" style="width:100%;">
               <div class="form-group">
                  <label>아이디</label> <input type="text" name="id"
                     placeholder="아이디 (3자 이상)" class="form-control">
               </div>

               <div class="form-group">
                  <label>비밀번호</label> <input type="password" name="pw"
                     placeholder="비밀번호 (6자 이상)" class="form-control">
               </div>



               <label>이메일</label>
               <div class="row">

                  <div class="col-3 form-group">
                     <input type="text" name="emailid" class="form-control">
                  </div>
                  <div class="col-1" style="text-align:center;">@</div>
                  <div class="col-3 form-group">
                     <input type="text" name="emaildomain" class="form-control"> 
                  </div>
                  <div class="col-3 form-group">
                  <select
                        name="emaildomain_select" onchange="email_change()" class="form-control">
                     <option value=>직접입력</option>
                     <option value="naver.com">naver.com</option>
                     <option value="gmail.com">gmail.com</option>
                     <option value="daum.net">daum.net</option>
                     <option value="nate.com">nate.com</option>
                     </select>
                  </div>
               </div>
               
               <label>생년월일</label>
               <div class="row" style="text-align:left;">
               <div class="col-3">
                  <select name="selectYear" class="form-control">
                     <%
                        out.println(returnOptionsReverse(2018, 1930));
                     %>
                  </select></div><div class="col-1">년</div>
                  <div class="col-3">
                  <select name=selectMonth class="form-control">
                     <%
                        out.println(returnOptions(1, 12));
                     %>
                  </select></div><div class="col-1">월</div>
                  <div class="col-3">
                  <select name=selectDay class="form-control">
                     <%
                        out.println(returnOptions(1, 31));
                     %>
                  </select></div><div class="col-1">일</div>
               </div>

               <div class="form-group">
                  <label>이름</label> <input type=text name=name class="form-control">
               </div>

               <div>
                <input type="submit" value="회원가입하기" class="btn" />
                            </div>

</form>
         </div>
      </div>
   </div>
   
</body>
</html>
<%
	if(request.getAttribute(Constants.REDIRECTCAUSE) != null){
		out.println("<script>alert('" + request.getAttribute(Constants.REDIRECTCAUSE) + "');</script>");
		request.removeAttribute(Constants.REDIRECTCAUSE);
	}
%>
<%!private String returnOptions(int startNum, int endNum) {
      StringBuffer count = new StringBuffer();
      do
         count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");
      while (startNum++ < endNum);
      return count.toString();
   }

   private String returnOptionsReverse(int endNum, int startNum) {
      StringBuffer count = new StringBuffer();
      do
         count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");
      while (endNum-- > startNum);
      return count.toString();
   }%>
