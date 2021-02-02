<%@ page import=" org.json.*,common.EzAppointmentConstant"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/dashboard.css" />
<link href='<%=request.getContextPath()%>/WEB/includes/js/lib/fullcalendar.min.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/WEB/includes/js/lib/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='<%=request.getContextPath()%>/WEB/includes/js/lib/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/WEB/includes/js/lib/jquery.min.js'></script>
<link href='<%=request.getContextPath()%>/WEB/includes/js/lib/bootstrap.min.css' />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='<%=request.getContextPath()%>/WEB/includes/js/lib/fullcalendar.min.js'></script>
 
<% 
cBProfileManagement objBoGetSubs = new cBProfileManagement();
String userId = session.getAttribute("logeduserid").toString();
String roleid = session.getAttribute("logedroleid").toString();
JSONArray appointmentlist = new JSONArray();
appointmentlist =objBoGetSubs.getappointments(userId,roleid);
%>
<script>
var formattedEventData=[];
formattedEventData=<%= appointmentlist%>,
  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      timeFormat: 'hh:mm a',
      events: formattedEventData,
      eventRender: function(events, element) {
    	  element.click(function() {
              $("#start").html(moment(events.start).format('MMM Do h:mm A'));
              $("#end").html(moment(events.endtDate).format('MMM Do h:mm A'));
              $("#appointmentName").html(events.appointmentName);
              $("#appointmentstatus").html(events.appointmentstatus);
              $("#appointmentDesc").html(events.appointmentDescription);
              $("#className").html(events.clsName);
              $("#section").html(events.section);
              $("#stuName").html(events.stuName);
              $('#calendarModal').modal();
             // $("#eventContent").dialog();
          });
          if (events.title == 'Booked') {
              element.css({
                  'background-color': '#378006',
                  'border-color': '#378006'
              });
          }else if(events.title == 'Completed'){
        	  element.css({
                  'background-color': '#3a87ad',
                  'border-color': '#3a87ad'
              });
          }else{
        	  element.css({
                  'background-color': '#e41919',
                  'border-color': '#e41919'
              });  
          }
      }
    });

  });

</script>
<div id="calendarModal" class="modal fade app_popup">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span> <span class="sr-only">close</span>
				</button>
				<h4 id="modalTitle" class="modal-title">Appointment Details</h4>
			</div>
			<div id="modalBody" class="modal-body">
				<ul class="list-unstyled">
					<li><span class="app_span">Student Name</span><span class="app_col">:</span><span id="stuName"></span></li>
					<li><span class="app_span">Class Name</span><span class="app_col">:</span><span id="className"></span></li>
					<li><span class="app_span">Section Name</span><span class="app_col">:</span><span id="section"></span></li>
					<li><span class="app_span">Appointment Name</span><span class="app_col">:</span><span id="appointmentName"></span></li>
					<li><span class="app_span">Start Date&Time</span><span class="app_col">:</span><span id="start"></span></li>
					<li><span class="app_span">End Date&Time</span><span class="app_col">:</span><span id="end"></span></li>
					<li><span class="app_span">AppointmentStatus</span><span class="app_col">:</span><span id="appointmentstatus"></span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
 
<%String msg=""; 
String messg=""; 
String errorMsg="";%>
<%try{
		  errorMsg=session.getAttribute("errorMessage").toString();
		  session.removeAttribute("errorMessage");
		 }
		 catch(Exception e){}	
		 %>
<%
		try
		{
		  msg=session.getAttribute("message").toString();
		  session.removeAttribute("message");
		}
 		catch(Exception e){}	
 %>
 
<div class="main-content well home_intro">
 
	<%if(errorMsg!="") {%>
	<div class="allErrormesg">
		<span><%=errorMsg %></span>
	</div>
	<%} %>
	<%if(msg!="") {%>
	<div class="allresultmesg">
		<span><%=msg %></span>
	</div>
	<%}
    %>
	<div class="home_dashboard">
		<div class="dashboard_block">
			<div class="row">
				<% if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN)) { %>
				<div class="col-md-3 dash_board">
					<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/businessList.jsp"><div class="dash_inner bg-lblue">
							<i class="fa fa-briefcase" aria-hidden="true"></i> <span>Appointment Activation</span>
						</div></a>
				</div>
				<div class="col-md-3">
					<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/userList.jsp"><div class="dash_inner bg-blue">
							<i class="fa fa-user" aria-hidden="true"></i> <span>User Activation</span>
						</div></a>
				</div>
				<%}else if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.TEACHER)){%>
				<div class="col-md-3 ">
					<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp?option=business"><div class="dash_inner bg-lblue">
							<i class="fa fa-list-ul" aria-hidden="true"></i> <span>Appointment List</span>
						</div></a>
				</div>
				<div class="col-md-3">
					<a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business"><div
							class="dash_inner bg-green">
							<i class="fa fa-check-circle-o" aria-hidden="true"></i> <span>Schedule Appointments</span>
						</div></a>
				</div>
				<div class="col-md-3">
					<a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=session.getAttribute("logeduserid")%>&qsroleid=<%=session.getAttribute("logedroleid")%>&currenttime=<%=currTime%>&option=business"><div
							class="dash_inner bg-blue">
							<i class="fa fa-user" aria-hidden="true"></i> <span>My Profile</span>
						</div></a>
				</div>
				<%}else if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.STUDENT)){%>
				<div class="col-md-3">
					<a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=businessuser"><a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=businessuser"><div
								class="dash_inner bg-green">
								<i class="fa fa-list-ul" aria-hidden="true"></i> <span>My Appointments</span>
							</div></a>
				</div>
				<div class="col-md-3">
					<a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=session.getAttribute("logeduserid")%>&qsroleid=<%=session.getAttribute("logedroleid")%>&currenttime=<%=currTime%>&option=businessuser"><div
							class="dash_inner bg-blue">
							<i class="fa fa-user" aria-hidden="true"></i> <span>My Profile</span>
						</div></a>
				</div>
				<%}%>
			</div>
		</div>
		<div id='calendar'></div>
	</div>
</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>