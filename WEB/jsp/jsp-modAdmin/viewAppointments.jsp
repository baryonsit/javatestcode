
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>

<%
String username=(String) session.getAttribute("logedusername");
if(username==null)
{
	response.sendRedirect(request.getContextPath()+"/WEB/jsp/jsp-modCommon/sessionExpired.jsp");  
	}
String roleid = session.getAttribute("logedroleid").toString();
int schoolId = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")) : 0;
%>


<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>

<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>
<%@ page import="modAdmin.adminBo.cBViewAppointments.*"%>
<%@ page import="modAdmin.adminVo.cVViewAppointments,java.util.*"%>
<%@ page import="modAdmin.adminVo.*"%>
<%@ page import="modAdmin.adminAction.*"%>

<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>
<!-- DatePicker  jquery library implementation -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/WEB/includes/css/jquery-ui.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-ui.js"></script>
<script>
var jq = $.noConflict(true);
</script>
<script>
jq(function() {	
	jq(".date1").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange: "1917:2050",
			dateFormat : "<%=EzAppointmentConstant.STRINGDATEFORMAT%>"
		});
	});
</script>
<div class="page-title">
<%if(roleid.equals("2")){ %>
 <h3>View Appointments</h3>
<%}else if(roleid.equals("3")){%>
 <h3>My Appointments</h3>
<%}%>
      
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
			<%
				if (roleid.equals("2")) {
			%>
			<li>View Appointments</li>
			<%
				} else if (roleid.equals("3")) {
			%>
			<li>My Appointments</li>
			<%
				}
			%>
	              </ol>
	         </div>
</div>
<%
	ArrayList<String> list1 = new ArrayList<String>();
	list1=new ArrayList();
	String id = session.getAttribute("logeduserid").toString();


	int val = 0;
	String up_status = request.getParameter("status_val");
	String up_uid = request.getParameter("userid");
	String appoint_id = request.getParameter("appoint_id");
	String rowno = request.getParameter("rowno");
	
%>



<%
	try
	{
		String up = request.getParameter("update");
		if(up.equals("yes"))
		{
			cBViewAppointments objcBUpdateStatus = new cBViewAppointments();
			val = objcBUpdateStatus.updateBusinessUserStatus(request,up_uid,up_status,appoint_id);
		}
		else
		{
			
		}

	}
	catch(Exception upe){ }

%>
	
<%

	int appointments=0;
	try
	{
		String search_key=request.getParameter("search_key");
		
		if(search_key.equals("loadall"))
		{
			search_key=request.getParameter("search_key");
				
			cBViewAppointments objcBAppointList = new cBViewAppointments();
		
			try
			{
				list1.clear();
				list1 = objcBAppointList.getAppointmentsList(search_key,id,roleid,schoolId);
				appointments=1;
			}
			catch(Exception xxxx)
			{ 
				
			}
		}

	}
	catch(Exception e)
	{
	
		int pppm=0;
		Hashtable<String, ArrayList<String>> arr;
		
		int cnt=0;
		int k=0;
	
		arr=(Hashtable)request.getAttribute("search1");
		list1.clear();
		Enumeration en = arr.keys();
		while(en.hasMoreElements())
		{
			cnt++;
			try
			{
				list1 = (ArrayList)arr.get(String.valueOf(en.nextElement()));
			}
			catch(Exception e1)
			{
				continue;
			}
		}
	}

	
%>


<%
	ArrayList facListarr = new ArrayList();
	cBViewAppointments objcBFacilityList = new cBViewAppointments();
	try
	{
		facListarr.clear();
		facListarr = objcBFacilityList.getFacilityList(id,roleid);
	}
	catch(Exception xxxx)
	{ 
		
	}
	cBCommonFunctions obj= new cBCommonFunctions();

%>

<%
	String msg = "";
%>
<%
	try
	{
		session.getAttribute("message");
		msg = session.getAttribute("message").toString();
		session.removeAttribute("message");

	}
	catch (Exception e){ }
%>

<!-- <div  class="Content"> -->
<div class="main-content well">
<div class="user_form">
<div class="fil_area app_fil_ar sr-ar">
<% if(msg!="") {%>
<div class="allresultmesg"><span><%=msg %></span></div>
<% }%>


<html:form action="viewappoperation.do">


<!-- <div class="seacrh_ar"> -->
<input type="hidden" name="businessuserid" value="<%=id %>">

<div class="row">
 		<div class="col-md-2 app_fil">
 			
 			  <div class="form-group">
			     <html:select  styleClass="form-control" property="filterfac" styleId="filterfac">
				  <html:option value="Select Facility">Select Appointment</html:option>
				<%
					for(int f=0;f<facListarr.size();f=f+2)
					{
				%>
						<html:option value="<%=facListarr.get(f).toString()%>"><%=facListarr.get(f+1)%></html:option>
				<%
					}
				%>
			</html:select>
			</div>
			
	  </div>
	 <div class="col-md-2">
    
 			  <div class="form-group">
			    <html:select  styleClass="form-control" property="filterstatus" styleId="filterstatus">
				<html:option value="Select Status">Select Status</html:option>
				<html:option value="Booked">Booked</html:option>
				<html:option value="Cancelled">Cancelled</html:option>
				<html:option value="Completed">Completed</html:option> 
			</html:select>
			</div>
	  </div>
	
    <div class="col-md-2">
			<input type="text" Class="date1 flat form-control"  name="fromdate" value="From Date" size="12" id="datef" />
	</div>
	<div class="col-md-2">
			<input type="text" Class="date1 flat form-control" name="todate" value="To Date" size="12" id="datet" />
	</div>
	<div class="col-md-2">
		    <input type="text" Class="flat form-control" name="search" id="search" size="15" placeholder="Username"/>
	</div>
	<div class="col-md-2">
			<input class="btn-success btn" type="submit" name="dosearch"  value="Search" />
    </div>
</div>
</div>
<table class="table table-striped table-condensed"">
  <tr>
    	<td rowspan="2"><b>User Name </b></td>
      	<td rowspan="2"><b>Appointment Name</b></td>
      	<td rowspan="2"><b>Category</b></td>
      	<td rowspan="2"><b>Class Name</b></td> 
      	<td rowspan="2"><b>Section Name</b></td> 
      	<td rowspan="2"><b>Status</b></td>
      	<td colspan="2"><b>Appointment Date</b></td>
      	<td colspan="2"><b>Appointment Time</b></td>
   </tr>
 
    <tr>
    	<td>From</td>
      	<td>To </td>
      	<td>From</td>
      	<td>To</td>
    </tr>
    <tr>
     
    <%try
		{
			if(list1.size()!=0)
			{
	   			for(int i=0,c=0;i<list1.size();i=i+12,c++)
    			{
	   				String startDate = obj.getDateFormatter(list1.get(i+3).toString());
	   				String endDate = obj.getDateFormatter(list1.get(i+4).toString());
    %>
					<%
						if (list1.get(i+2).equals("Cancelled")) {
					%>
					<td><%=list1.get(i)%></td>
					<%
						} else {
					%><td><a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAppointment/updateAppointmentStatus.jsp?facility_id=<%=list1.get(i + 7)%>&appointment_id=<%=list1.get(i + 9)%>">
							<%=list1.get(i + 0)%></a></td>
					<%}%>
					    <td><%=list1.get(i+8)%></td>
					    <td><%=list1.get(i+10)%></td>
					    <td><%=list1.get(i+1)%></td>
						<td><%=list1.get(i+11)%></td>
						<td><%=list1.get(i+2)%></td>
						<%-- <td>
							<%
								try
								{
									if(list1.get(i+2).equals("Booked"))
									{
										
							%>
										<select class="form-control" id="<%=c%>" name="statusval" onchange="change_businessuser_status(<%=list1.size()/10%>,<%=c%>,<%=list1.get(i)%>,'<%=request.getContextPath()%>','<%=request.getParameter("search_key")%>','<%=list1.get(i+9)%>');" >
										<%
											if(roleid.equals("2"))
											{
										%>
												<option value="<%=list1.get(i+2)%>"selected><%=list1.get(i+2)%></option>
												<option value="Cancelled">Cancelled</option>
												<option value="Completed">Completed</option>
												
										<%
											}
											else if(roleid.equals("3"))
											{
										%>
												<option value="<%=list1.get(i+2)%>"selected><%=list1.get(i+2)%></option>
												<option value="Cancelled">Cancelled</option>
												
										<%
											}
										%>
										</select>
							<%
										
									}
									else if(list1.get(i+2).equals("Cancelled"))
									{
							%>
										<label><%=list1.get(i+2)%></label>
							<%
									}
									else if(list1.get(i+2).equals("Completed"))
									{
							%>
										<label><%=list1.get(i+2)%></label>
							<%
									}
							%>
							            
							<%	
								}
								catch(Exception eee){}
							%>
							
							<%
								try
								{
									if(val==1)
									{
							%>
										<script type="text/javascript">
											document.getElementById(<%=rowno%>).value='<%=up_status %>';
										</script>
							<%
									}
								}
								catch(Exception set)
								{
								}
							%>
						</td> --%>
						<td><%=startDate%></td>
						<td><%=endDate%></td>
						<td><%=list1.get(i+5)%></td>
						<td><%=list1.get(i+6)%></td>
					</tr>
	
	<%
    			}
			}
			else
			{
				if(appointments==1 && list1.size()==0)
				{
	%>
	 		<tr>
						<td colspan="9">
							<center>
							<b>There are no Appointments to View. Thank You</b>
							</center>
						</td>
					</tr>
					 
	<%
				}
				else
				{
	%>
					<tr>
						<td colspan="9">
							<center>
							<b>There are no Appointments to View. Thank You</b>
							</center>
						</td>
					</tr>
	<%	
				}
			}
		}
		catch(Exception zz)
		{
	
		}	
	%>
	 
</table>
 
 <div class="btn_area text-center">
<input class="btn-danger btn" type="button" id="viewappcancel" value="Cancel" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />
</div>
</div>

</html:form>
</div>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 

</div>
</div>
</div>
</div>

<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>

<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp" %> --%>


	