package com.fraud.app;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import models.DataSet;
import models.Input;
import models.Login;
import models.Users;
import services.JavaFuns;

@Controller
public class FraudAppController implements ErrorController{
	@RequestMapping("/home")
	public String index()
	{
		return "index.jsp";
	}
	@RequestMapping("/viewUsers")
	@SessionScope
	public ModelAndView viewUsers() {
		
		List<Users> lst = new ArrayList<Users>();
		Users vs = new Users();
		lst=vs.getAllUsers();
		ModelAndView mv=new ModelAndView();
		mv.addObject("std",lst);
		mv.setViewName("ViewUsersReport.jsp");
		return mv;
	}
	@RequestMapping("/registeruser")
	public ModelAndView registeruser(Users stu,ServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		 
		 try {
			  
			  stu.setPath("NA");
			 String st=stu.addNewUser();
				if(st.equals("success"))
					mv.setViewName("Success.jsp?type=UserReg");
				else
					mv.setViewName("Failure.jsp?type=UserReg");
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 mv.setViewName("Failure.jsp");
		} 
		 mv.addObject("activity","UserReg");
		 return mv;
		
	}
	@RequestMapping("/error")
    public String handleError() {
        //do something like logging
		return "home";
    }
  
    public String getErrorPath() {
        return "/error";
    }
    @RequestMapping("/admin")
	public String admin()
	{
		return "admin.jsp";
	}
    @RequestMapping("/user")
   	public String user()
   	{
   		return "user.jsp";
   	}
    @RequestMapping("/")
	public String home1()
	{
		return "index.jsp";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
        session.invalidate();
		return "index.jsp";
	}
	@RequestMapping("/adminHome")
	public String adminHome()
	{
		return "admin.jsp";
	}
	
	@RequestMapping("/viewReviewInput")
	public ModelAndView viewTwitterInput(HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		Input ds=new Input();
		ds.setUserid(ses.getAttribute("userid").toString().trim());
		List<Input> lstds=new ArrayList<Input>();
		lstds=ds.getTwDataSet();
		mv.setViewName("viewReviewInput.jsp");
		mv.addObject("lst",lstds);
		return mv;
	}
	@RequestMapping("/viewrReviewsDataSet")
	public ModelAndView viewDataSet()
	{
		ModelAndView mv=new ModelAndView();
		DataSet ds=new DataSet();
		List<DataSet> lstds=new ArrayList<DataSet>();
		lstds=ds.getTwDataSet();
		mv.setViewName("viewReviewsDataSet.jsp");
		mv.addObject("lst",lstds);
		return mv;
	}
	@RequestMapping("/RegDataSet")
	public String RegDataSet()
	{
		return "RegDataSet.jsp";
	}
	@RequestMapping("/RegDataSet1")
	public String RegDataSet1()
	{
		return "RegDataSet1.jsp";
	}
	@RequestMapping("/frompython1")
	public String frompython1()
	{
		return "Success.jsp?type=TrainDS";
	}
	@RequestMapping("/frompython")
	public String frompython()
	{
		return "Success.jsp?type=DataSet";
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request)
	{
		 Login obj=new Login();
		 try
		 {
			 jakarta.servlet.http.HttpSession ses=request.getSession(true);
			 
			 if(obj.chkAuthentication(request.getParameter("userid").trim(), request.getParameter("pass").trim()))
			 {
				 ses.setAttribute("userid", obj.getUserid());
				 System.out.println("userid="+obj.getUserid());
				 System.out.println("userid="+obj.getuType());
				 System.out.println("userid="+obj.getUserName());
				 ses.setAttribute("utype", obj.getuType());
				 ses.setAttribute("email", obj.getEmail());
				 ses.setAttribute("username", obj.getUserName());
				 return obj.getuType()+".jsp";
			 }
			 else
			 { 
				 return "Failure.jsp?type=Auth";
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 return("Failure.jsp?type=Auth");
		}
		 
	}
	@RequestMapping("/datasetPreprocessingPython1")
   	public ModelAndView datasetPreprocessingPython1(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("sts").toString().trim();
   				if(st.equals("success"))
   				{
   					String id=request.getParameter("id").toString().trim();
   					JavaFuns jf=new JavaFuns();
   					if(jf.execute("update dataset set sts='trained' where dsId="+id)) {}
   					mv.setViewName("Success.jsp?type=DataSetTrained");
   				}
   				else
   					mv.setViewName("Failure.jsp?type=DocUpload");
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		  
   		 return mv;
   		
   	}	
 	@RequestMapping("/showResult")
   	public ModelAndView showResult(ServletRequest request)
   	{
 		ModelAndView mv=new ModelAndView();  
  		 try {
  			 
  			 mv.setViewName("download.jsp");
  			    }
  		 catch (Exception e) {
  			// TODO: handle exception
  			 mv.setViewName("Failure.jsp");
  		} 
  		  
  		 return mv;
   	}
   	@RequestMapping("/ReviewsPreprocessingPython")
   	public ModelAndView ReviewsPreprocessingPython(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("sts").toString().trim();
   				if(st.equals("success"))
   				{
   					String id=request.getParameter("id").toString().trim();
   					JavaFuns jf=new JavaFuns();
   					if(jf.execute("update inputCSV set sts='processed' where dsId="+id)) {}
   					mv.setViewName("Success.jsp?type=InputPreprocessed");
   				}
   				else
   					mv.setViewName("Failure.jsp?type=DocUpload");
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		  
   		 return mv;
   		
   	}	
	@RequestMapping("/datasetPreprocessingPython")
   	public ModelAndView datasetPreprocessingPython(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("sts").toString().trim();
   				if(st.equals("success"))
   				{
   					String id=request.getParameter("id").toString().trim();
   					JavaFuns jf=new JavaFuns();
   					if(jf.execute("update dataset set sts='processed' where dsId="+id)) {}
   					mv.setViewName("Success.jsp?type=DataSetPreprocessed");
   				}
   				else
   					mv.setViewName("Failure.jsp?type=DocUpload");
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		  
   		 return mv;
   		
   	}	
	@RequestMapping("/datasetDownloadPython")
   	public ModelAndView datasetDownloadPython(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("sts").toString().trim();
   			String title=request.getParameter("title").toString().trim();
   				if(st.equals("success"))
   					mv.setViewName("download1.jsp?title="+title);
   				else
   					mv.setViewName("Failure.jsp?type=datasetdownload");
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		  
   		 return mv;
   		
   	}
	@RequestMapping("/datasetInsrtPython")
   	public ModelAndView datasetInsrtPython(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("sts").toString().trim();
   				if(st.equals("success"))
   					mv.setViewName("Success.jsp?type=DocUpload");
   				else
   					mv.setViewName("Failure.jsp?type=DocUpload");
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		  
   		 return mv;
   		
   	}	
	@RequestMapping("/datasetInsrtPython1")
   	public ModelAndView datasetInsrtPython1(ServletRequest request)
   	{
   		ModelAndView mv=new ModelAndView();  
   		 try {
   			  
   			 
   			 String st=request.getParameter("sts").toString().trim();
   				if(st.equals("success"))
   					mv.setViewName("Success.jsp?type=InputUpload");
   				else
   					mv.setViewName("Failure.jsp?type=DocUpload");
   		 }
   		 catch (Exception e) {
   			// TODO: handle exception
   			 mv.setViewName("Failure.jsp");
   		} 
   		  
   		 return mv;
   		
   	}	
}
