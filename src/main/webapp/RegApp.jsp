<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
%>
<div class="col-md-6">
<h2>Register New Application</h2>
<form method="post" action="http://localhost:80/FraudAppDetectionPython/fileupload1.py" enctype="multipart/form-data" >
<table class="tblform">
<tr><td>App Name</td>
<td><input type="text" name="appname"  class="form-control"/></td>
</tr>
<tr><td>Owner Name</td>
<td><input type="text" name="appownername"  class="form-control"/></td>
</tr>
<tr><td>App Details</td>
<td><textarea name="appname"  class="form-control"></textarea></td>
</tr>
<tr><td>Upload Reviews in csv format</td>
<td><input type="file" name="file" /></td>
</tr>
<tr> 
<td colspan="2"><input type="submit" name="btn" value="Submit" class="btn btn-primary"/></td>
</tr>
</table></form></div><div class="col-md-6">
<img src="assets/images/reg.png" style="width:80%!important"  />
</div>
<%
//response.sendRedirect("ViewUsers.jsp");
}
catch(Exception ex)
{
	
}
%>
</body>
</html>