
 
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="services.JavaFuns"%>
<%@page import="java.util.Vector"%>
<%@page import="services.DBConnector"%>
 
<%@page import="java.util.List"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
 
<%@page import="java.util.List"%>
 
 <%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> </title>
</head>
<body> <jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("home");
}
%>
<div class="container ">
  <div class="jumbotron"> 

     
<div class="row">
<%
String query1 ="select review_txt,postive,negative,neutral,fraudwords from reviews where inputid="+request.getParameter("dsId").toString().trim();
JavaFuns  cf=new JavaFuns();

Vector v=cf.getValue(query1, 5);
%>
<div class="col-md-12"> <h2>Analysis of Reviews of <%=request.getParameter("title").toString().trim() %></h2>
    
 <table class="table table-bordered">
 <tr>
 <th>Total Reviews</th>
 <th>Positive Reviews</th>
 <th>Negative Reviews</th> 
  <th>Neutral Reviews</th> 
   <th>Fraud Words</th> 
   
 </tr>
 <%
 for(int i=0;i<v.size();i=i+5)
 {%>
	<tr>
	<td><%=v.elementAt(i).toString().trim() %></td>
	<td><%=v.elementAt(i+1).toString().trim() %></td>
	<td><%=v.elementAt(i+2).toString().trim() %></td>
	<td><%=v.elementAt(i+3).toString().trim() %></td>
	<td><%=v.elementAt(i+4).toString().trim() %></td>
	 
	</tr> 
 <%}
 %>
  </table></div><div class="col-md-12">
		<%
                     
               DBConnector obj1=new DBConnector();
                Connection con =obj1.connect()  ; 
 String query ="select review_txt,postive,negative,neutral,fraudwords from reviews  where inputid="+request.getParameter("dsId").toString().trim();
 JDBCCategoryDataset dataset = new JDBCCategoryDataset(con);
dataset.executeQuery(query);

JFreeChart chart = ChartFactory.createBarChart("Reviews Analysis" , "Total Reviews", "Nos",dataset, PlotOrientation.HORIZONTAL, true, true,false);

try 
{ 
    File image = new File(getServletContext().getRealPath("/")+"images/Revenue13.png"); 
    ChartUtilities.saveChartAsPNG(image, chart, 750, 350); 
} 
catch (java.io.IOException exc) 
{ 
    out.print(exc.toString());
    System.err.println("Erroring image to file"+exc.getMessage()); 
}







//DBConnector obj1=new DBConnector();
//Connection con =obj1.connect()  ; 
//String query ="select tweet,postive,negative,neutral,joy,fear,surprise from Reviews where inputid="+request.getParameter("dsId").toString().trim();
//JDBCCategoryDataset dataset = new JDBCCategoryDataset(con);
//dataset.executeQuery(query);
 DefaultPieDataset dataset1 = new DefaultPieDataset();
        dataset1.setValue("Positive", new Double(3));
        dataset1.setValue("Negative", new Double(2));
        dataset1.setValue("Neutral", new Double(73));
        dataset1.setValue("FraudWords", new Double(8));
       
JFreeChart chart1 = ChartFactory.createPieChart("Reviews Analysis", dataset1);
 
try 
{ 
File image = new File(getServletContext().getRealPath("/")+"images/Revenue131.png"); 
ChartUtilities.saveChartAsPNG(image, chart1, 750, 350); 
} 
catch (java.io.IOException exc) 
{ 
out.print(exc.toString());
System.err.println("Erroring image to file"); 
}

            %><br/></div><div id="content" class="container"><div  class="row">
             
             <div class="col-md-12">
             <IMG SRC="images/Revenue13.png"  BORDER="0" USEMAP="#chart" /><br/>
              
        </div> 
        
        </div>
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