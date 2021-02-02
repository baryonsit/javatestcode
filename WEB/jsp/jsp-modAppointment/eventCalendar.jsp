<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>

<%
String username=(String) session.getAttribute("logedusername");
if(username==null)
{
	out.println("Loged-out");
	response.sendRedirect(request.getContextPath()+"/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
}
%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>
<%@ page import="modFacility.facilityBo.cBCommon"%>
<%@page import="modAppointment.appointmentBo.*"%>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%String categoryName = request.getParameter("category_name");
String category_Id = request.getParameter("category_id");%>
<div class="page-title">
       <h3>Appointment Calendar</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                   <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=category_Id%>&category_name=<%=categoryName%>">Available Appointments</a></li>
	                   <li>Appointment Calendar</li>
	                   
	              </ol>
	         </div>
 </div>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/calenderEvent.js">
</script>

<%
	ArrayList<String> facilityList = new ArrayList<String>();
	ArrayList timeslots = new ArrayList();
	Hashtable timeDateList =new Hashtable();
	String facility_id = "",startdt="",st="";
	String userID="";
	timeslots.clear();
	facilityList.clear();
	//String business_id="1";
	
	facility_id=request.getParameter("facility_id");
	if(facility_id!=null)
	{
		session.setAttribute("facility",facility_id);
		
	}
	else
	{
		facility_id=session.getAttribute("facility").toString();
	}
	userID=request.getParameter("user_id");
		
	cBCommon facility = new cBCommon();
	cBCommon appoint = new cBCommon();
	cBCommonAppoint app = new cBCommonAppoint();
	
	String weekholiday= facility.getweekholiday(facility_id);
	Hashtable optholidays = new Hashtable();
	try{
	optholidays = facility.getoptholidays(facility_id);
	}catch(Exception ee){
		
	}
	
	sendingMail mail = new sendingMail();
	facilityList = facility.cBgetFacilityDetails(facility_id);
	timeslots = facility.cBgetTimeSlotDetails(facility_id);
	int presentmonth = 0;
	int h = 0, incr = 0;
	int presentyear = 0;
	int flag = 0;
	int presentdt = 0;
	GregorianCalendar gc = new GregorianCalendar();
	Calendar c2 = Calendar.getInstance();
	Calendar c1 = Calendar.getInstance();

%>

<%!int newMon = 0, newYear = 0, newDay = 0, checkmon, checkyear;%>

<%
	try {
		if(request.getParameter("mon")==null){
			
			presentmonth = c2.get(Calendar.MONTH);
			newMon = presentmonth;
			presentyear = c2.get(Calendar.YEAR);
			newYear = presentyear;
			presentdt = c2.get(Calendar.DATE);
			newDay = presentdt;
			
		}
		else{
			newMon=Integer.parseInt(request.getParameter("mon"));
			newYear=Integer.parseInt(request.getParameter("year"));
		}
			
		} catch (Exception exx) {
			
		}
	
%>
<%
	String empidList = "";
	int[] daysInMonths = new int[12];
	String[] monthName = new String[12];
	String[] days = new String[12];
	String[] day = new String[12];
	for (int i = 0; i <12; i++) {
		monthName[i] = "";
		daysInMonths[i] = 0;
		days[i] = "";
	}
	
	monthName[0] = "JANUARY";
	monthName[1] = "FEBRUARY";
	monthName[2] = "MARCH";
	monthName[3] = "APRIL";
	monthName[4] = "MAY";
	monthName[5] = "JUNE";
	monthName[6] = "JULY";
	monthName[7] = "AUGUST";
	monthName[8] = "SEPTEMBER";
	monthName[9] = "OCTOBER";
	monthName[10] = "NOVEMBER";
	monthName[11] = "DECEMBER";

	daysInMonths[0] = 31; 
	daysInMonths[1] = 28;
	daysInMonths[2] = 31;
	daysInMonths[3] = 30;
	daysInMonths[4] = 31;
	daysInMonths[5] = 30;
	daysInMonths[6] = 31;
	daysInMonths[7] = 31;
	daysInMonths[8] = 30;
	daysInMonths[9] = 31;
	daysInMonths[10] = 30;
	daysInMonths[11] = 31;

	days[1] = "Sun";
	days[2] = "Mon";
	days[3] = "Tues";
	days[4] = "Wed";
	days[5] = "Thu";
	days[6] = "Fri";
	days[7] = "Sat";

	day[1] = "Sunday";
	day[2] = "Monday";
	day[3] = "Tuesday";
	day[4] = "Wednesday";
	day[5] = "Thursday";
	day[6] = "Friday";
	day[7] = "Saturday";
	c1.set(newYear, newMon, newDay);
	h = 0;
	int month = c1.get(Calendar.MONTH);
	int year = c1.get(Calendar.YEAR);
	int dt = c1.get(Calendar.DATE);
	String month1 = monthName[month];
	String toDay = "";
	String flg="1";

	if (dt < 10){
		toDay = newYear + "/" + (newMon + 1) + "/" + "0" + newDay;
    }
	else{
		toDay = newYear + "/" + (newMon + 1) + "/" + newDay;
	daysInMonths[1] += gc.isLeapYear(year) ? 1 : 0;
	}
%>
<div class="main-content well">
<div>

<div class="user_form">
	<h3>Registration 
	Form</h3>

<!-- START of show business and facility details on this page -->
<%
String bname = "";
String fname = "";
String fac_type="";
try{
	if(!request.getParameter("bname").equals(null)){
		bname = request.getParameter("bname");
	}
	if(!request.getParameter("fname").equals(null)){
		fname = request.getParameter("fname");
	}
	if(!request.getParameter("fac_type").equals(null)){
		fac_type = request.getParameter("fac_type");
	}
}
catch(Exception exp){
	bname = request.getParameter("hiddenbname");
	fname = request.getParameter("hiddenfname");
	fac_type = request.getParameter("hiddenfactype");
}
%>

<div>
<table class="table table-striped table-condensed">
	<tr>
	<th>Appointment  Name</th>
		<td><%=fname%></td>
		<th>Category Name</th>
		<td><%=categoryName%></td>
	</tr>
</table>


<!-- END of show business and facility details on this page -->

<%String facFromDt="", facToDate="";
facFromDt=facilityList.get(4);
facToDate=facilityList.get(5);

String fromTime=facilityList.get(6);
String toTime=facilityList.get(7);

String curDT=newYear + "-" + (newMon + 1) + "-" +newDay;
Date fDT = app.getDateFromDateTime(facFromDt+" "+fromTime);
Date facilityToDT = app.getDateFromDateTime(facToDate+" "+toTime);
Date cDT=app.getDate(curDT);
System.out.println("cDT "+cDT);
System.out.println("fDT "+fDT);
System.out.println("facilityToDT "+facilityToDT);

if(cDT.before(fDT))
{ %>
	<p><b><center>Appointment is Not Available</center></b></p>
	<p><center><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=category_Id%>&category_name=<%=categoryName%>" title="">
	<input name="cancel" value="Cancel" type="button" class="btn-danger btn"/></a></center></p>
<% 
}
else if(cDT.after(facilityToDT))
{ %>
	<p><b><center>Appointment is Not Available</center></b></p>
	<p><center><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=category_Id%>&category_name=<%=categoryName%>" title="">
	<input name="cancel" value="Cancel" type="button" class="btn-danger btn"/></a></center></p>
<%}
else
{
%>
<div style="width:1000px; margin:auto;">


<form name="calender" action="">
<input type="hidden" name="mon"  id="mon" value="<%=newMon%>"/>
	<input type="hidden" name="year" id="year" value="<%=newYear%>"/>
	<table width="100%" border="0"">
		<tr>
			<td colspan="2" align="left"><input type="button" value="Previous Month" class="flatbox_btn" onclick="preMonth();" /></td>
			<td colspan="3" align="center"><b><%=monthName[newMon]%> - <%=newYear%></b></td>
			<td colspan="2" align="right"><input type="button" value="Next Month" class="flatbox_btn" onclick="return nextMonth();"/></td>
		</tr>
	</table>
	<div class="table-responsive">
	<table class="table">
		<tbody>
			<tr class="trbg_color">
				<th><b> <%
		for (int i = 1; i <= daysInMonths[newMon]; i++) {
	 %>
				
				<th>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=i%></div>
				</th>
				<%
					}
				%></b>
				<br/>
				</tr>
			<tr style="background:#8fbc8f;color:#fff;">
				<th></th>
				<%
					for (int i = 1; i <= daysInMonths[newMon]; i++) {
						c1.set(newYear, newMon, i);
				%>
				<th>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=days[c1.get(Calendar.DAY_OF_WEEK)]%></div>
				</th>
				<%
					}
				%>
				</th>
				
			<tr class="trgreen_color">
				<%
				timeDateList.clear();
				timeDateList = app.cBgetAppointDetails(facility_id,newMon,newYear,daysInMonths[newMon]);
				for (int z = 0;z < timeslots.size()-1; z++) {
				%>

				<td style="width:85px;height:25px;background:#8fbc8f;";valign="middle">
				<div style="font-weight:bold;"><%=timeslots.get(z)%></div>
				</td>
				<%
					String aa = "", mon = "";
						if (newMon >= 0 && newMon < 10) {
							mon = "0" + (newMon+1);
						} else {
							mon = "" + (newMon+1);
						}
						for (int a = 1; a <=daysInMonths[newMon]; a++) {
							if (a > 0 && a < 10) {
								aa = "0" + a;
							} else {
								aa = "" + a;
							}
							String appDate = newYear + "-" + mon + "-" + aa;
							String slotTime = (String)timeslots.get(z);
							String DTApp = newYear + "-" + mon + "-" + aa +" "+slotTime;							
							Calendar currentDate=app.getCalenderDateTime(DTApp);
							System.out.println("currentDate.getTime()  "+currentDate.getTime());
							System.out.println("c2.getTime()  "+c2.getTime());
							System.out.println("timeDateList  "+timeDateList);
							System.out.println("appDate  "+appDate);
							
							if((currentDate.getTime()).after(c2.getTime()) || currentDate.getTime().equals(c2.getTime()))
							{
								c1.set(newYear, (newMon+1), Integer.parseInt(aa));
								 
								if(day[c1.get(Calendar.DAY_OF_WEEK)].equals(weekholiday)){ %>
									<td class='trgreen_color'><font color='orange'><span class="aval">Holiday</span></font></td>
								<% } 
								else if(optholidays.containsValue(appDate)){ %>
									<td class='trgreen_color'><font color='orange'><span class="aval">Holiday</span></font></td>
							   <% } else if(currentDate.getTime().after(facilityToDT)){%>
								   <td class='trgreen_color'><font color='red'><span class="aval">NA</span></font></a>
							   <% } else if(timeDateList.containsKey(appDate))
								{
									ArrayList timeCheck=(ArrayList)timeDateList.get(appDate);
									if(timeCheck.contains(slotTime))
									{
										int userIdIndex = timeCheck.indexOf(slotTime);
										String bookUserId=timeCheck.get(userIdIndex+1).toString();
										if(userID.equalsIgnoreCase(bookUserId))
										{ %>
											<td class='trgreen_color'><a href='fixAppointment.jsp?facilityid=<%=facility_id%>&bname=<%=bname%>&fname=<%=fname%>&&fromdate=<%=appDate%>&&fromtm=<%=slotTime%>&&totm=<%=timeslots.get(z)%>&&flagg=0&&fac_type=<%=fac_type%>'><font color='maroon'>Booked</font></a>
										<% }
										else
										{ %>
											<td class='trgreen_color'><a ><font color='#908d6c'>Blocked</font></a></td>
										<% }
									} else{ %>
									<td class='trgreen_color'><a href='fixAppointment.jsp?facilityid=<%=facility_id%>&bname=<%=bname%>&fname=<%=fname%>&&fromdate=<%=appDate%>&&fromtm=<%=slotTime%>&&totm=<%=timeslots.get(z+1)%>&&flagg=<%=flg%>&&fac_type=<%=fac_type %>'>
									<font color='blue' class="available">Available</font></a></td>
								<%}
								}
								
								else{ %>
									<td class='trgreen_color'><a href='fixAppointment.jsp?facilityid=<%=facility_id%>&bname=<%=bname%>&fname=<%=fname%>&&fromdate=<%=appDate%>&&fromtm=<%=slotTime%>&&totm=<%=timeslots.get(z+1)%>&&flagg=<%=flg%>&&fac_type=<%=fac_type %>'>
									<font color='blue' class="available">Available</font></a></td>
								<%} 
							}
							else
							{
								%>
								<td class='trgreen_color'><font color='red'><span class="aval">Closed</span></font></a>
								<%
							} 
						}
				%>			
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<input type="hidden" name="user_id" id="user_id" value="<%=userID%>">
	<input type="hidden" name="facility_id" value="<%=facility_id%>"> 
</div>
<input type="hidden" name="hiddenbname" value="<%=bname%>">
<input type="hidden" name="hiddenfname" value="<%=fname%>">
<input type="hidden" name="hiddenfactype" value="<%=fac_type %>">
<input type="hidden" name="category_id" value="<%=category_Id%>">
<input type="hidden" name="category_name" value="<%=categoryName%>">
</form>
</div>
<div align="center">
<input name="cancel" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href='<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=category_Id%>&category_name=<%=categoryName%>'" />
</div>
<%} %>
</div>
</div>
</div>


</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>

