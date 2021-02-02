<%@ page import="modFacility.facilityBo.cBFacilityManage,java.util.*"%>
<%!
int flag=0;
%>
<%
try
{
	cBFacilityManage objBoAddoptholiday=new cBFacilityManage();
	flag=objBoAddoptholiday.Addoptholiday(request.getParameter("date").toString(),request.getParameter("desc").toString(),Integer.parseInt(request.getParameter("facilityid")),request.getParameter("function").toString());
}
catch(Exception e)
{
	
}
%>
<%=flag %>
	