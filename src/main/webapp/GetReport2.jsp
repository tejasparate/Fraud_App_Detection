
 
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
<body> 
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
 
%>
<div class="container ">
  <div class="jumbotron"> 
<h2>Analysis</h2>
     
<div class="row">
<%
String query1 ="select i.title, r.prediction,count(*) as total from inputcsv i inner join reviews r on i.dsId=r.inputid group by r.prediction,i.title" ;
JavaFuns  cf=new JavaFuns();
String qr="select r.prediction,count(*) as total from inputcsv i inner join reviews r on i.dsId=r.inputid group by r.prediction";
Vector v1=cf.getValue(qr, 2);
Vector v=cf.getValue(query1, 3);
%>
<div class="col-md-6"> 
    
 <table class="table table-bordered">
 <tr>
 <th>App Title</th>
 <th>Reviews Analysis</th>
 <th>Count</th> 
   
   
 </tr>
 <%
 for(int i=0;i<v.size();i=i+3)
 {%>
	<tr>
	<td><%=v.elementAt(i).toString().trim() %></td>
	<td><%=v.elementAt(i+1).toString().trim() %></td>
	<td><%=v.elementAt(i+2).toString().trim() %></td>
 
	</tr> 
 <%}
 %>
  </table>
  
   
  </div><div class="col-md-6">
 <table class="table table-bordered">
  <tr><th colspan="2">Total Apps Analysis</th></tr>
 <%
 for(int i=0;i<v1.size();i=i+2)
 {%>
	<tr>
	<th><%=v1.elementAt(i).toString().trim() %></td>
	<td><%=v1.elementAt(i+1).toString().trim() %></td>
	 
	</tr> 
 <%}
 %>
  </table>
		<%
                     
               DBConnector obj1=new DBConnector();
                Connection con =obj1.connect()  ; 
 String query ="select r.prediction,count(*) as total from inputcsv i inner join reviews r on i.dsId=r.inputid group by r.prediction";
 JDBCCategoryDataset dataset = new JDBCCategoryDataset(con);
dataset.executeQuery(query);

JFreeChart chart = ChartFactory.createBarChart("Reviews Analysis" , "Total Reviews", "Nos",dataset, PlotOrientation.HORIZONTAL, true, true,false);

try 
{ 
    File image = new File(getServletContext().getRealPath("/")+"images/Revenue1311.png"); 
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
File image = new File(getServletContext().getRealPath("/")+"images/Revenue13111.png"); 
ChartUtilities.saveChartAsPNG(image, chart1, 750, 350); 
} 
catch (java.io.IOException exc) 
{ 
out.print(exc.toString());
System.err.println("Erroring image to file"); 
}

            %> 
             <IMG SRC="images/Revenue1311.png" width="100%"  BORDER="0" USEMAP="#chart" /><br/>
              
         
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