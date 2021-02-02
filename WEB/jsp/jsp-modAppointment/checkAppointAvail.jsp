<%@  page import="modAppointment.appointmentDo.*,java.util.*"%>	
<%!
int check=0;
%>
<%
try
{
	cDCommonAppoint chkav=new cDCommonAppoint();
	check=chkav.checkavail(
			request.getParameter("facID").toString(),
			request.getParameter("fromDT").toString(),
			request.getParameter("toDT").toString(),
			request.getParameter("fromTime").toString(),
			request.getParameter("toTime").toString()
			);
}
catch(Exception e)
{
	//dept="Corporate";
}
%>
<%=check %>
	