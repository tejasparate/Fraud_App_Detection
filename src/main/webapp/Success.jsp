<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="DefaultTop.jsp"></jsp:include>
<div class="container"><br/><br/><center> 
<%
if(request.getParameter("type").toString().trim().equals("Reg"))
{
	%><h2 class="h2">Your Registration Done Successfully....</h2>
	<br/>
	<a href="home">Home</a>
<%}
if(request.getParameter("type").toString().trim().equals("RegUser"))
{
	%><h2 class="h2">Your Registration Done Successfully....</h2>
	<br/>
	<a href="home">Home</a>
<%}
else if(request.getParameter("type").toString().trim().equals("DataSet"))
{
	%><h2 class="h2">DataSet Images Stored Successfully....</h2>
	<br/>
	<a href="admin">Home</a>
<%
}else if(request.getParameter("type").toString().trim().equals("DataSetReg"))
{
	%><h2 class="h2">Document Processed and Uploaded Successfully....</h2>
	<br/>
	<a href="admin">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("DocUpload"))
{
	%>
	<h2 class="h2">DataSet Uploaded Successfully...</h2>
	<br/>
	<a href="admin">continue...</a>
	<%
}
else if(request.getParameter("type").toString().trim().equals("InputUpload"))
{
	%>
	<h2 class="h2">  Input Uploaded Successfully...</h2>
	<br/>
	<a href="viewReviewInput">continue...</a>
	<%
}
else if(request.getParameter("type").toString().trim().equals("DataSetTrained"))
{
	%>
	<h2 class="h2">DataSet Trained Successfully...</h2>
	<br/>
	<a href="admin">continue...</a>
	<%
}
else if(request.getParameter("type").toString().trim().equals("InputPreprocessed"))
{
	%>
	<h2 class="h2">Reviews Preprocessed Successfully...</h2>
	<br/>
	<a href="viewReviewInput">continue...</a>
	<%
}
else if(request.getParameter("type").toString().trim().equals("DataSetPreprocessed"))
{
	%>
	<h2 class="h2">DataSet Preprocessed Successfully...</h2>
	<br/>
	<a href="admin">continue...</a>
	<%
}
else if(request.getParameter("type").toString().trim().equals("RegCategory"))
{
	%><h2 class="h2">Category Registered Successfully....</h2>
	<br/>
	<a href="admin">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("DocUpdated"))
{
	%><h2 class="h2"> Document Data Updated Successfully....</h2>
	<br/>
	<a href="admin">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("UserReg"))
{
	%><h2 class="h2"> User Registration Done Successfully....</h2>
	<br/>
	<a href="home">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("TrainDS"))
{
	%><h2 class="h2"> DataSet Trained Successfully....</h2>
	<br/>
	<a href="admin">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("ngram"))
{
	%><h2 class="h2"> N Grams Stored Successfully....</h2>
	<br/>
	<a href="admin">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("GroupReg"))
{
	%><h2 class="h2">Group Registered Successfully....</h2>
	<br/>
	<a href="/userHome">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("GroupMsgDel"))
{
	%><h2 class="h2">Group Message Deleted Successfully....</h2>
	<br/>
	<a href="/groupMsgHistory">continue...</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("UserMsgDel"))
{
	%><h2 class="h2"> Message Deleted Successfully....</h2>
	<br/>
	<a href="/MsgHistory">continue...</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("Doc"))
{
	%><h2 class="h2">Document Uploaded Successfully....</h2>
	<br/>
	<a href="userHome">Home</a>
<%
}
else if(request.getParameter("type").toString().trim().equals("GroupMemReg"))
{
	%><h2 class="h2">Group Member Added to Selected Group Successfully....</h2>
	<br/>
	<a href="AddMember?groupName=<%=request.getAttribute("groupName").toString() %>">continue...</a>
	
<%
}
else if(request.getParameter("type").toString().trim().equals("ShareMsg"))
{
	%><h2 class="h2">Message Shared with selected user Successfully....</h2>
	<br/>
	<a href="MsgHistory">continue...</a>
	
<%
}
else if(request.getParameter("type").toString().trim().equals("GroupMemDel"))
{
	%><h2 class="h2">Group Member Removed from Selected Group Successfully....</h2>
	<br/>
	<a href="ExistingMembers?groupName=<%=request.getAttribute("groupName").toString() %>">continue...</a>
	
<%
}
%>
</div>
</body>
</html>