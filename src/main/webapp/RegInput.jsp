
 
<%@page import="services.JavaFuns"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>

<%@page import="java.util.Date"%>
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
<div class="container">
   
     
<div class="row jumbotron">
<%
Date dt1=new Date();
String dt=(dt1.getDate())+"/"+(dt1.getMonth()+1)+"/"+(dt1.getYear()+1900);
String tm=dt1.getHours()+":"+dt1.getMinutes();
JavaFuns jf=new JavaFuns();
Vector v=jf.getValue("select title,dsId from dataset", 2);
%>
<div class="col-md-6"> <h2>Input Reviews</h2>
   <div class="form-group"> 
    <form method="post" name="frm" action="http://localhost:80/FraudAppDetectionPython/fileupload2.py" enctype="multipart/form-data" >
<table class="tblform"><tr><td>Title </td><td>
    <input type="text" name="title" class="form-control" required></input>
     </td></tr> 
      <tr>
     <td>Input CSV</td>
     <td>
     <input type="file" name="file" class="form-control">
      
     </td>
     </tr>
     <tr>
     <td>DataSet</td>
     <td>
     <select name="dataset" class="form-control">
     <%
     for(int i=0;i<v.size();i=i+2)
     {
    	 %>
    	 <option value="<%=v.elementAt(i+1).toString().trim() %>"><%=v.elementAt(i).toString().trim() %></option>
    	 <%
     }
     %>
     </select>
     </td>
     </tr>
      
     <tr><td colspan="2">
       <input type="hidden" name="dt" value="<%=dt %>"/>
       <input type="hidden" name="userid" value="<%=session.getAttribute("userid").toString().trim() %>"/>
		            <input type="hidden" name="tm" value="<%=tm %>"/>
    <input type="submit" class="btn btn-primary" value="Submit" />
    </td></tr>
 
</table></form>
 
</div></div>
 <div class="col-md-6">
 <img src="assets/images/upload.png" style="width:300px!important"/>
 </div>
</div>
</div>
<%}
catch(Exception ex)
{
	System.out.println("err="+ex.getMessage());
} %>

</div>
</body>
</html>