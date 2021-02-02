
<%
	String username = (String) session.getAttribute("logedusername");
	if (username == null) {
		out.println("Loged-out");
		response.sendRedirect(request.getContextPath() + "/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
	}
%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ page import=" common.EzAppointmentConstant"%>
<%
	int i = 1;
    boolean status=false;
	int facility_id = 0;

	try {

		facility_id = 2;

	} catch (Exception ee) {
		facility_id = Integer.parseInt(request.getParameter("facid_hidden"));
	}
	String roleid = session.getAttribute("logedroleid").toString();
%>

<div class="page-title">
	<h3>Update Appointment</h3>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
			<%
				if (roleid.equals(EzAppointmentConstant.TEACHER)) {
			%>
			<li><a
				href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business">View Appointments
					</a></li>
			<%
				} else if (roleid.equals(EzAppointmentConstant.STUDENT)) {
			%>
		<li><a
				href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business">My Appointments
					</a></li>
			<%}%>
					<li>Update Appointment</li>
		</ol>
	</div>
</div>
<%@ page language="java"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="modFacility.facilityBo.cBFacilityManage,java.util.*"%>
<%@ page import="modFacility.facilityVo.cVFacilityManage"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@ page import="modFacility.facilityBo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.validate.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery_validation.js"></script>
<%
 String msg="";
	try {
		session.getAttribute("message");
		msg = session.getAttribute("message").toString();
		session.removeAttribute("message");
	} catch (Exception e) {
	}
%>
<%
	String user_id = "";
	try {
		user_id = session.getAttribute("logeduserid").toString();
	} catch (Exception lout) {
	}
%>
<%
	
	  String fac_id = request.getParameter("facility_id");
      String appointmentId = request.getParameter("appointment_id");
	  String id = session.getAttribute("logeduserid").toString();

		cBViewAppointments objcBAppointList = new cBViewAppointments();
		ArrayList appointmentDetails = new ArrayList();
		appointmentDetails=objcBAppointList.fetchAppointmentDetailsByfacId(id,fac_id,appointmentId);
%>

<%
	String action = "";
	action = "addfacility";
%>
<script>

$(document).ready(function(){
	debugger;
	jQuery.ajax
    ({
        type: "POST",           
        url: "http://localhost:8485/centralschoolsms/updateschool.do",
    success:function(content)
    {
    	alert(data);
            $('#center').html(content);           
        }           
    });
	/* jQuery.ajax({
		type : 'GET',
		url : ""+path+"/Academicyearconfiguration.do",
		async : false,
		data : {
			"academic_term_id" : selectvalue,
		},
		success : function(data) {
		}
	}) */
		 
});

function checkStatusType(val){
	if(val=="Completed" ){
		document.getElementById('hd_sw').style.display="block";
	}
	else{
		document.getElementById('hd_sw').style.display="none";
	}
}
function cancelAppointment(){
	 if(document.getElementById('appointment_status').value=="Cancelled" ){
		if(confirm("Are you sure  want to Cancel  Appointment ?")==true)
		{
			document.addfacilityform.submit();
		}
		else
		{
			 return false;
		}
	}
}

</script>
<%cBCommonFunctions obj = new cBCommonFunctions();
String fromDate = obj.getDateFormatter(appointmentDetails.get(3).toString());
String toDate = obj.getDateFormatter(appointmentDetails.get(4).toString()); %>

<!-- ============ Content Panel ============== -->

<div class="main-content well">


	<logic:messagesPresent>
		<bean:message key="errors.header" />
		<ul>
			<html:messages id="error">
				<li><bean:write name="error" /></li>
			</html:messages>
		</ul>
		<hr>
	</logic:messagesPresent>


	<html:form action="<%=action%>" styleId="updateAppointmentStatus">
		<%
			if (msg != "") {
		%>
		<div class="allresultmesg">
			<span><%=msg%></span>
		</div>
		<%
			}
		%>
		<div class="user_form">
			<h3 class="home_tit">Account Information</h3>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.facilityname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=appointmentDetails.get(8)%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.userName.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=appointmentDetails.get(1)%>
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
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.facstartdate.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								 <%=fromDate%>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.facenddate.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=toDate%>

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
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.facopentime.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=appointmentDetails.get(5)%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.facclosetime.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=appointmentDetails.get(6)%>
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
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.appointment_status.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%if(appointmentDetails.get(2).equals("Completed")){ %>
							<%=appointmentDetails.get(2)%>
							<%}else{%>
								<select class="form-control" id="appointment_status" name="appointment_status" onchange="checkStatusType(this.value);">
											<%
											if(roleid.equals("2"))
											{
										%>
								            <option value="<%=appointmentDetails.get(2)%>"selected><%=appointmentDetails.get(2)%></option>
												<option value="Cancelled">Cancelled</option>
												<option value="Completed">Completed</option>
												
										<%
											}
											else if(roleid.equals("3"))
											{
										%>
												<option value="<%=appointmentDetails.get(2)%>"selected><%=appointmentDetails.get(2)%></option>
												<option value="Cancelled">Cancelled</option>
												
										<%
											}
										%>
										<%}%>
												
										</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%if(appointmentDetails.get(2).equals("Completed")){ %>
			<div class="row" >
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2 text-right">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.appointment_remark.displayname" /></label>
							</div>
						</div>
						<div class="col-md-10">
							<div class="form-group">
									<%=appointmentDetails.get(10)%>
							</div>
						</div>
					</div>
				</div>
			</div>
						
			<%}else{%>
			<div class="row" id="hd_sw" style="display: none">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2 text-right">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.appointment_remark.displayname" /></label>
							</div>
						</div>
						<div class="col-md-10">
							<div class="form-group">
								<html:textarea styleClass="form-control custom-textarea-height" cols="20" rows="2"
									property="appointment_remark"></html:textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
             <%}%>

			<input type="hidden" id="function" name="function" value="insert">
			

			<div class="btn_area text-center">
				&nbsp; <%if(appointmentDetails.get(2).equals("Booked")){ %>
				<input name="updatefacility" value="Update Appointment" onclick="return cancelAppointment();"
					type="submit" class="btn-success btn" /><%}%>
				
				&nbsp; <input name="faccancel" value="Cancel" type="button"
					class="btn-danger btn"
					onClick="window.location.href = '<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business'" />
			</div>
			
		</div>
				<input
				type="hidden" id="userid_hidden" name="userid_hidden"
				value="<%=appointmentDetails.get(0)%>" />
				<input
				type="hidden" id="appointment_status" name="appointment_status"
				value="<%=appointmentDetails.get(2)%>" />
				<input
				type="hidden" id="appointment_id" name="appointment_id"
				value="<%=appointmentDetails.get(9)%>" />
				<input
				type="hidden" id="facilityname" name="facilityname"
				value="<%=appointmentDetails.get(8)%>" />
				<input
				type="hidden" id="userName" name="userName"
				value="<%=appointmentDetails.get(1)%>" />
				<input
				type="hidden" id="facstartdate" name="facstartdate"
				value="<%=fromDate%>" />
				<input
				type="hidden" id="facenddate" name="facenddate"
				value="<%=toDate%>" />
				<input
				type="hidden" id="facopentime" name="facopentime"
				value="<%=appointmentDetails.get(5)%>" />
				<input
				type="hidden" id="facclosetime" name="facclosetime"
				value="<%=appointmentDetails.get(6)%>" />
				<input
				type="hidden" id="appointment_remark" name="appointment_remark"
				value="<%=appointmentDetails.get(10)%>" />
				<input
				type="hidden" id="checkvalue" name="checkvalue"
				value="1" />
	</html:form>
</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>

	
<script>
		document.addfacilityform.facilityname.value="<%=appointmentDetails.get(2)%>";
		document.addfacilityform.userName.value="<%=appointmentDetails.get(1)%>";
		document.addfacilityform.facstartdate.value="<%=fromDate%>";
		document.addfacilityform.facenddate.value="<%=toDate%>";
		document.addfacilityform.facopentime.value="<%=appointmentDetails.get(5)%>";
		document.addfacilityform.facclosetime.value="<%=appointmentDetails.get(6)%>";
		document.addfacilityform.appointment_status.value="<%=appointmentDetails.get(2)%>"; 
		if(appointmentDetails.get(10) !=null){
			document.addfacilityform.appointment_remark.value="<%=appointmentDetails.get(10)%>"; 
		}else{
			document.addfacilityform.appointment_remark.value=""; 
		}
		
</script>



