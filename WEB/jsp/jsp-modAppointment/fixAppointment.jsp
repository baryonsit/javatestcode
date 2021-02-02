<%
String username=(String) session.getAttribute("logedusername");
if(username==null)
{
	out.println("Loged-out");
	response.sendRedirect(request.getContextPath()+"WEB/jsp/jsp-modCommon/sessionExpired.jsp");
}
%>

<%String msg=""; %>

<%@ page import="modAppointment.appointmentBo.*,java.util.*"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
 <!-- DatePicker  jquery library implementation -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/jquery-ui.css" />
  <script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.10.2.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-ui.js"></script> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/calendar-blue.css" /> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/main.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/ajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery.timepickr.js"></script>

<% int p=4453545; %>

<%String fromDT= request.getParameter("fromdate");

StringTokenizer dt=new StringTokenizer(fromDT,"-");
String Year=dt.nextToken();
String Mon=dt.nextToken();
String Date=dt.nextToken();

String s = "";
s = String.valueOf(Integer.parseInt(Mon));

String dateFromTo=Year +"-"+ s +"-"+ Date ;

%>


<%  
request.getAttribute("hiddenfac_type");

	String user_id;
	
	user_id=session.getAttribute("logeduserid").toString();
	
	cBFixAppointment objcBcancelApp = new cBFixAppointment();
	ArrayList appointDetails = new ArrayList();
	try
	{
		appointDetails.clear();
		if(Integer.parseInt(request.getParameter("flagg"))!=1);
		{
			
			appointDetails=objcBcancelApp.getAppointmentDetails(user_id,request.getParameter("facilityid").toString(),dateFromTo);
			
		}
	}
	catch(Exception xxxx)
	{ 
		out.println("CATCH");

	}
	
		
%>
<%
	try
	{
  		session.getAttribute("message");
 		msg=session.getAttribute("message").toString();
  		session.removeAttribute("message");
 	}
 	catch(Exception e){}	
%>
<%
cBCommonFunctions obj = new cBCommonFunctions();
String fromdate = obj.getDateFormatter(dateFromTo);%>
<!-- ============ Content Panel ============== -->
<!-- <div class="Content"> -->

<div class="main-content well">
<html:form action="fix.do">
<font color="red"><div id="avail"></div></font>
<font color="blue"><p><%=msg%></p></font>
<div class="user_form">
<h3>Fix Appointment</h3>

<div class="row">
 		<div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
		               <label><span class="red">*</span> From Date</label>
		             </div>
		        </div>
		        <div class="col-md-8">
 					  <div class="form-group">
		                <input class="form-control"   name="appfromdate" type="text" value="<%=fromdate%>" id="date" readonly="true"/>
	                  </div>
	             </div>
	        </div>
	        </div>
            <div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">   
                       <label><span class="red">*</span> To Date</label>
                    </div>
                </div>
                 <div class="col-md-8">
 					  <div class="form-group">		
		                 <input class="form-control" name="apptodate" type="text"  id="date" value="<%=fromdate%>" readonly="true"  />
	                  </div>
	              </div>
	         </div>
	       </div>
	      </div>

    <div class="row">
 		<div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
		               <label><span class="red">*</span> Appointment Time From</label>
		             </div>
		        </div>
		          <div class="col-md-8">
 					  <div class="form-group">
		                   <input class="form-control" size="25" name="apptimefrom" id="demo-1" type="text" class="demo ui-timepickr" readonly="readonly"/></span></td>
	                   </div>
                   </div>
           </div>
	        </div>
	        <div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
		               <label><span class="red">*</span> Appointment Time To</label>
		             </div>
		        </div>
		        <div class="col-md-8">
 					  <div class="form-group">
		                   <input class="form-control" size="25" name="apptimeto" id="demo-2" type="text" class="demo ui-timepickr" readonly="readonly"/></span></td>
	             </div>
	             </div>
	</div>
</div>
</div>
	<%--  <%if(request.getParameter("fac_type").equals("private"))
			{%>		
	<div>  <label>Membership Id:</label>
	<input type=text class="form-control" size="30"  name="Membership_Id" id="Membership_Id"></div>
	      <%}%>  --%>
    
          <div class="btn_area text-center">
			<%
				if(request.getParameter("flagg").equals("1") && request.getParameter("fac_type").equals("public"))
				{
			%>
					<input name="fixapp" value="Fix Appointment" class="btn-primary btn" type="submit"/>
			<%}
			if(request.getParameter("flagg").equals("0") && request.getParameter("fac_type").equals("public")){
			%>
					<input name="appcancel" value="Cancel Appointment" class="btn-danger btn" type="submit"/>
			<%
				}
			%>
			<%
				if(request.getParameter("flagg").equals("1") && request.getParameter("fac_type").equals("private"))
				{
			%>
					<input name="fixapp" value="Fix Appointment"  class="btn-primary btn" type="submit"/>
			<%}
			    
				if(request.getParameter("flagg").equals("0") && request.getParameter("fac_type").equals("private"))
				{
			%>
					<input name="appcancel" value="Cancel Appointment"  class="btn-danger btn" type="submit"/>
			<%
				}
			%>
			<input name="Go Back" value="Cancel" type="button" class="btn-danger btn"  onclick="history.go(-1)"/>
</div>
<input type="hidden" name="appointment_Name" id="appointment_Name" value="<%=request.getParameter("fname")%>">
<input type="hidden" name="flag" id="flag" value="<%=request.getParameter("flagg")%>">
<input type="hidden" name="facid" id="facid" value="<%=request.getParameter("facilityid")%>">
<input type="hidden" name="uid" id="uid" value="<%=user_id%>">

	<%
		if(!request.getParameter("flagg").equals("1"))
		{
	%>
			<input type="hidden" name="appid_hidden"  id="appid_hidden" value="<%=appointDetails.get(0)%>">
	<%
		}
	%>
</div>	
</html:form>

<% if(user_id!="" && request.getParameter("flagg").equals("1")){ %>
<script>
document.fixappoint.appfromdate.value="<%=fromdate%>";
document.fixappoint.apptodate.value="<%=fromdate%>";
document.fixappoint.apptimefrom.value="<%=request.getParameter("fromtm")%>";
document.fixappoint.apptimeto.value="<%=request.getParameter("totm")%>"
</script>
<%} %>

<% if(user_id!="" && !request.getParameter("flagg").equals("1")){ %>
<script>
<%String startdate=obj.getDateFormatter(appointDetails.get(4).toString());
String enddate=obj.getDateFormatter(appointDetails.get(5).toString());
%>

document.fixappoint.appfromdate.value="<%=startdate%>";
document.fixappoint.apptodate.value="<%=enddate%>";
document.fixappoint.apptimefrom.value="<%=appointDetails.get(2)%>";
document.fixappoint.apptimeto.value="<%=appointDetails.get(3)%>"
</script>
<%} %>

</div>
 <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 
  