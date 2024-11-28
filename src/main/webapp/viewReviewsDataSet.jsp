<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="models.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
 <link rel="stylesheet" href="css/cust.css">

<title></title>
</head>
 
<body><jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
 
String userid=String.valueOf(session.getAttribute("userid"));

if(!userid.equalsIgnoreCase("null")){	
	
session.setMaxInactiveInterval(10*60);

%>  <div class="container"><div class="row">
<div class="col-md-12">

<h2>Reviews DataSet  
 
</h2>    

<%
List<DataSet> lst=(List)request.getAttribute("lst");
%>
<table class="table table-bordered"> 
<tr>
<th>Title</th>
<th>Date</th>
<th>Time</th>
<th></th>
</tr>
 <c:forEach var="userdsc" items="${lst}">
 <tr>
 <td>${userdsc.getTitle()}</td>
 <td>${userdsc.getDt()}</td>
 <td>${userdsc.getTm()}</td>
 <c:if test="${userdsc.getSts()==('pending')}">
  
 <td><a  href="http://localhost:80/FraudAppDetectionPython\DataSetPreProcessing.py?id=${userdsc.getDsId()}&path=${userdsc.getPath()}" target="_blank"> PreProcess DataSet</a></td>
</c:if>
<c:if test="${userdsc.getSts()==('processed')}">
  
 <td><a  href="http://localhost:80/FraudAppDetectionPython\TrainRF.py?id=${userdsc.getDsId()}&path=${userdsc.getPath()}" target="_blank"> Train DataSet</a></td>
</c:if>
<c:if test="${userdsc.getSts()==('trained')}">
  
 <td>DataSet Trained</td>
</c:if>
 <td><a  href="http://localhost:80/FraudAppDetectionPython\Sentiment\ReviewsDataSet/${userdsc.getPath()}" target="_blank"> Open</a></td>
  
  
  
</c:forEach>
</table>
 </div>
</div>
<%
}
else{
	%>
	<h2>Invalid Session...Login again</h2>
	<br>
	<a href="index.jsp">Login</a>
	
	<%
}}
catch(Exception ex)
{
	System.out.println("err="+ex.getMessage());
}
%>
 
</body>
</html>