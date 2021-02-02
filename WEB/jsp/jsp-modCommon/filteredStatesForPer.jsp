<%@  page import="java.util.*"%>
<%@ page import="modCommon.commonBo.cBSearch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="<%=request.getContextPath() %>/WEB/includes/js/ajax.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>

		<%-- <%
		String username=(String) session.getAttribute("username");
		if(null==username)
		{
			response.sendRedirect("../jsp-modCommon/sessionExpired.jsp");
			return;
		}
	%>
 --%>
	<%
		String option="";
		try
		{
			option=request.getParameter("option").toString();
		}
		catch(Exception e){
			option="";
		}

		if(option.equals("fetchstates"))
		{	
			%>
			<select  class="form-control" name="state" id="state"
				onchange="filterforCity('<%=request.getContextPath()%>')">
			<%
			String country="";
			try
			{
				country=request.getParameter("per_add_country").toString();
			}
			catch(Exception e)
			{
				country="";
			}
			cBCommonFunctions objcBCommon=new cBCommonFunctions();
			ArrayList statelistarr = objcBCommon.getStates(country);

			for(int i=0;i<statelistarr.size();i=i+2)
			{
				if(statelistarr.get(i).equals(objcBCommon.getdefault_locations("default_state")))
				{
					%>
					<option value="<%=statelistarr.get(i).toString()%>" selected="selected"><%=statelistarr.get(i+1).toString()%></option>
					<%
				}
				else
				{%>	
					<option value="<%=statelistarr.get(i).toString()%>"><%=statelistarr.get(i+1).toString()%></option>
			  <%} 
			}%>
	</select>
	<%
	} %>




	<% 
	String state="";
	try
	{
		state=request.getParameter("fac_state").toString();
	}
	catch(Exception e){
		state="";
	}

	if(option.equals("fetchcities")){	
		cBCommonFunctions objcBCommon=new cBCommonFunctions();
		ArrayList citylistarr = objcBCommon.getCities(state); 
	%>
	<select class="form-control" name="city" id="city">
	<% for(int i=0;i<citylistarr.size();i=i+2)
	{
	if(citylistarr.get(i).equals(objcBCommon.getdefault_locations("default_city")))	
	{	
	%>
		<option value="<%=citylistarr.get(i).toString()%>"
			selected="selected"><%=citylistarr.get(i+1).toString()%></option>
		<% }
	else
	{%>
		<option value="<%=citylistarr.get(i).toString()%>"><%=citylistarr.get(i+1).toString()%></option>
		<%
	}
	}%>
	</select>
	<%} %>






