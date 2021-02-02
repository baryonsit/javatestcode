<%@  page import="java.util.*"%>

<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="modUser.userBo.cBBusinessOwner"%>
<%@page import="modCommon.commonBo.cBCommonFunctions"%>




<%
String option="";
try
{
	option=request.getParameter("option").toString();
	
}
catch(Exception e){
	option="";
}

%>


<% 
if(option.equals("usernameavailable"))
{	

	String user_n="";
	try
	{
		user_n=request.getParameter("un").toString();
	}
	catch(Exception e){
		user_n="";
	}
	cBBusinessOwner objBoGetAvailable = new cBBusinessOwner();
	
	int result = objBoGetAvailable.checkAvailability(user_n);
	
	if(result==0){
		out.println("Not Available");
	}
	if(result==1){
		out.println("Available");
	}

}
%>


<% 
if(option.equals("getbusinessofcategory"))
{	
	String categoryName = request.getParameter("categoryName").toString();
	ArrayList businessList = new ArrayList();
	try
	{
		cBCommonFunctions locObj=new cBCommonFunctions();
		businessList = locObj.getBusinessOfCategory(categoryName);
		//out.println(businessList);
		String businesses= "";
		for (int val=0; val < businessList.size(); val++)
		{
			businesses+=businessList.get(val)+"^^";
		}
		out.println(businesses);
	}
	catch(Exception e)
	{
		
	}

}
%>










