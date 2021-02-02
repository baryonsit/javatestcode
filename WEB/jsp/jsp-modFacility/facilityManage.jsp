
<%
	String username = (String) session.getAttribute("logedusername");
	if (username == null) {
		out.println("Loged-out");
		response.sendRedirect(request.getContextPath() + "/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
	}
%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%
	int i = 1;
	int facility_id = 0;

	try {

		facility_id = Integer.parseInt(request.getParameter("facid"));

	} catch (Exception ee) {
		facility_id = Integer.parseInt(request.getParameter("facid_hidden"));
	}
%>

<div class="page-title">
	<%
		if (facility_id == 0) {
	%>
	<h3>Create Appointment</h3>
	<%
		} else {
	%>
	<h3>Update Appointment</h3>
	<%
		}
	%>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
			<!--        <li><a href="#">Bussiness Owner</a></li> -->
			<li><a
				href="<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp?currenttime=<%=currTime%>&option=business">Appointment
					 List</a></li>
			<li>
				<%
					if (facility_id == 0) {
				%> Create Appointment <%
					} else {
				%> Update Appointment <%
					}
				%>
			</li>
		</ol>
	</div>
</div>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.validate.js"></script>
<script>
	var jxq = $.noConflict(true);
	jxq(document).ready(function() {
		jxq("#signupForm").validate({
			rules : {
				facilityname :{required:true},
				facilitytype : {required:true},
			    facstartdate : {required:true},
				facenddate : {required:true},
				facopentime : {required:true},
				facclosetime : {required:true},
				timeslot : {required:true},
				membersslot: {
					required:true,
					number: true,
				},
				faccontactno: {
					number: true,
				},
				facilitycategory : {required:true},
				description: {
					maxlength:1000,
				},
			},
			messages : {
				facilityname :  {
					required: "Enter Appointment Name",
				},
				facilitytype : "Please Select FacilityType",
				facstartdate : "Please Select Start Date",
				facenddate : "Please Select End Date",
				facopentime : "Please Select Open Time",
				facclosetime : "Please Select Close Time",
				timeslot : "Please Select Time Slot",
				facilitycategory : "Please Select Category",
				membersslot: {
					required: "Please Enter Member Slot",
					number: "Invalid Data.Enter Only Digit",
				},
				faccontactno: {
					number: "Invalid Data.Enter Only Digit",
				},
				description: {
					maxlength: jQuery.format("Maxium  1000 characters is allowed"),
				},

			}
		});

	});
	function myFunction(){
		//if($("#signupForm").valid()){
		 startDate=document.getElementById('facstartdate').value;
		 endDate=document.getElementById('facenddate').value;
		if( startDate>endDate ){
			  alert("Start Date sholud be less than end Date");
			  return false;
		  }
		/* } else{
			return false;
		} */
	}
	function endDateFunction(endDate){
	  startDate=document.getElementById('facstartdate').value;
	  if( startDate>endDate || startDate==endDate){
		  alert("Start Date sholud be less than end Date");
		  return false;
	  }else{
		  return true;
	  }
	}
	/* function startDateFunction(startDate){
		endDate=document.getElementById('facenddate').value;
		  if( endDate>startDate || startDate==endDate){
			  alert("end Date sholud be greater than Start Date");
			  return false;
		  }else{
			  return true;
		  }
	} */
</script>
<!-- DatePicker  jquery library implementation -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/WEB/includes/css/jquery-ui.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-ui.js"></script>
<link rel="Stylesheet" media="screen"
	href="<%=request.getContextPath()%>/WEB/includes/css/ui.timepickr.css" />
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>
<script>
var jq = $.noConflict(true);
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.anchorHandler.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.ui.all.js"></script>
	
<link rel="Stylesheet" media="screen"
	href="<%=request.getContextPath()%>/WEB/includes/css/clockpick.1.2.5.css" />	
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.clockpick.1.2.5.js"></script>
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.timepickr.js"></script>
<script>
jq(function() {	
	jq(".date1").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange: "1917:2050",
            dateFormat: "<%=EzAppointmentConstant.STRINGDATEFORMAT%>"
		});
	});
</script>
<script type="text/javascript">
            $(document).ready(function(){
		$(".jquery-custom-timepiker").clockpick({
			starthour : 0,
			endhour : 23,
			military: true,
			minutedivisions:1
			});
		});
	</script>

<%@ page language="java"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="modFacility.facilityBo.cBFacilityManage,java.util.*"%>
<%@ page import="modFacility.facilityVo.cVFacilityManage"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@ page import="modFacility.facilityBo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>

<%
	String msg = "";
	String errorMsg = "";
	String p_country = "";
	String p_state = "";
	String p_city = "";
%>
<%
	try {
		session.getAttribute("message");
		msg = session.getAttribute("message").toString();
		session.removeAttribute("message");
	} catch (Exception e) {
	}
%>

<%try{
		  errorMsg=session.getAttribute("errorMessage").toString();
		  session.removeAttribute("errorMessage");
		 }
		 catch(Exception e){}	
		 %>	

<%
	String user_id = "";
	try {
		user_id = session.getAttribute("logeduserid").toString();
	} catch (Exception lout) {
	}
%>

<%
	cBFacilityManage objcBFacUpdate = new cBFacilityManage();
	ArrayList values = new ArrayList();
	try {
		values.clear();
		values = objcBFacUpdate.getFacilityDetails(facility_id);
	} catch (Exception xxxx) {

	}
%>

<%
	ArrayList listOfStates = new ArrayList();
	ArrayList listOfCities = new ArrayList();

	cBCommonFunctions objBoGetCountries = new cBCommonFunctions();
	ArrayList countries = new ArrayList();
	countries = objBoGetCountries.getCountryCommon();

	cBCommonFunctions objBoGetStates = new cBCommonFunctions();
	ArrayList states = new ArrayList();
	states = objBoGetStates.getStateDetails();
	
	
	/* if(values.size()<=0){
		p_country = objcBCommon.getdefault_locations("default_country");
		p_state = objcBCommon.getdefault_locations("default_state");
		p_city = objcBCommon.getdefault_locations("default_city");
	} else{
		p_country = values.get(16).toString();
		p_state = values.get(15).toString();
		p_city = values.get(13).toString();
	} */
cBCommonFunctions objcBCommon = new cBCommonFunctions();
	ArrayList categorylist = new ArrayList();
	categorylist = objcBCommon.getCategoryDetails();

	cBCommonFunctions objBoGetCountryList = new cBCommonFunctions();
	ArrayList listOfCountries = new ArrayList();
	listOfCountries = objBoGetCountryList.getCountries();

	cBCommonFunctions objBoGetDays = new cBCommonFunctions();
	ArrayList Days = new ArrayList();
	Days = objBoGetStates.getDays();
%>


<%
	cBFacilityManage objBoGetBusinessAddr = new cBFacilityManage();
	ArrayList businessaddr = new ArrayList();
	businessaddr = objBoGetBusinessAddr.getBusinessAddress(user_id);

	cBFacilityManage objBoGetholiday = new cBFacilityManage();
	ArrayList holidaydtl = new ArrayList();
	holidaydtl = objBoGetholiday.getholidaydetail(facility_id);
	
	cBCommonFunctions obj = new cBCommonFunctions();

%>

<%
	String action = "";
	action = "addfacility";
%>


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


	<html:form action="<%=action%>" styleId="signupForm">
		<%if(errorMsg!="") {%>
		<div class="allErrormesg"><span><%=errorMsg %></span></div> 
	<%} %>
		<%
			if (msg != "") {
		%>
		<div class="alt_scss">
			<%=msg%>
		</div>
		<%
			}
		%>
		<%-- <%try{
      			if(facility_id==0){%>
		<b> <input type="checkbox" id="reg_checked"
			onclick="selectRegAddress('<%=request.getContextPath()%>','<%=businessaddr.get(0)%>','<%=businessaddr.get(1)%>','<%=businessaddr.get(2)%>','<%=businessaddr.get(3)%>','<%=businessaddr.get(4)%>')" />Use
			Registration Address<br /></b>
		<%}else{ %>

		<b> <input type="checkbox" id="upt_checked"
			onclick="selectUptAddress('<%=request.getContextPath()%>','<%=values.get(2)%>','<%=values.get(3)%>','<%=values.get(4)%>','<%=values.get(5)%>','<%=values.get(6)%>','<%=values.get(7)%>','<%=values.get(8)%>','<%=values.get(9)%>','<%=values.get(10)%>','<%=values.get(11)%>','<%=values.get(12)%>','<%=values.get(13)%>','<%=values.get(14)%>','<%=values.get(15)%>','<%=values.get(17)%>')" /><b>
				Use Facility Address<br />
		</b> <%}}catch(Exception ww){}%> --%>
		<div class="user_form">
			<h3 class="home_tit">Appointment Information</h3>
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
								<html:text styleClass="form-control" size="19"
									property="facilityname" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.facilitytype.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select property="facilitytype" styleClass="form-control">
									<html:option value="public">Public</html:option>
									<html:option value="private">Private</html:option>
								</html:select>
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
								<html:text styleClass="date1 form-control" size="40" 
									property="facstartdate" styleId="facstartdate"  readonly="true" />

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
								<html:text styleClass="date1 form-control" size="40" onchange="endDateFunction(this.value)"
									property="facenddate" styleId="facenddate" readonly="true" />

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
								<html:text size="10" property="facopentime"
									styleClass="form-control jquery-custom-timepiker" readonly="true" />
								<span style="font-size: 10px;">(HH:MM)</span>
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
								<html:text size="10" property="facclosetime" styleId="demo-2"
									styleClass="form-control jquery-custom-timepiker" readonly="true" />
								<span style="font-size: 10px;"> (HH:MM)</span>
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
										key="addfacilityform.timeslot.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control jquery-custom-timepiker" size="10"
									property="timeslot" styleId="demo-3" readonly="true" />
								<span style="font-size: 10px;">(HH:MM)</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="addfacilityform.membersslot.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20"
									property="membersslot"></html:text>
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
										key="addfacilityform.facilitycategory.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select property="facilitycategory"
									styleClass="form-control">
									<option value="">Select Category</option>
									<%
										for (int k = 0; k < categorylist.size(); k = k + 2) {
									%>
									<html:option value="<%=categorylist.get(k).toString()%>"><%=categorylist.get(k + 1)%></html:option>
									<%
										}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div>
				<%-- <div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.facholiday.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select property="facholiday" styleClass="form-control">
									<html:option value="0">None</html:option>
									<%
										for (int k = 0; k < Days.size(); k = k + 2) {
									%>
									<html:option value="<%=Days.get(k).toString()%>"><%=Days.get(k + 1)%></html:option>
									<%
										}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div> --%>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.faccontactno.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20"
									property="faccontactno"></html:text>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%-- 	<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.facadd1.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20"
									property="facadd1" styleId="facadd1"></html:text>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> Address Line2</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="facadd2" styleId="facadd2"></html:text>
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
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.country.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<select name="country" class="form-control" id="country"
									onchange="filterForState('<%=request.getContextPath()%>');">
									<option value="0">Select Country</option>
									<%
										for (int j = 0; j < listOfCountries.size(); j = j + 2) {
									%>
									<option value="<%=listOfCountries.get(j)%>"><%=listOfCountries.get(j + 1)%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.state.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="filterStatesForPer">
									<select name="state" Class="form-control" id="state"
										onchange="filterforCity('<%=request.getContextPath()%>');">
										<option value="0">Select State</option>
										<%
											listOfStates = objcBCommon.getStates(p_country);

												for (int k = 0; k < listOfStates.size(); k = k + 2) {

													if (listOfStates.get(k).toString().equals(p_state)) {
										%>
										<option value="<%=listOfStates.get(k)%>" selected="selected"><%=listOfStates.get(k + 1)%></option>
										<%
											} else {
										%>
										<option value="<%=listOfStates.get(k).toString()%>"><%=listOfStates.get(k + 1)%></option>
										<%
											}
												}
										%>
									</select>
								</div>

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
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.city.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="filterCitiesForPer">
									<select name="city" Class="form-control" id="city">
										<option value="">Select City</option>
										<%
											listOfCities = objcBCommon.getCities(p_state);

												for (int j = 0; j < listOfCities.size(); j = j + 2) {

													if (listOfCities.get(j).toString().equals(p_city)) {
										%>
										<option value="<%=listOfCities.get(j)%>" selected="selected"><%=listOfCities.get(j + 1)%></option>
										<%
											} else {
										%>
										<option value="<%=listOfCities.get(j).toString()%>"><%=listOfCities.get(j + 1)%></option>
										<%
											}
												}
										%>
									</select>
								</div>
								<div id="filterCitiesForPer">
										<select name="faccity" Class="form-control"
										id="faccity"	>
											<option value="">Select City</option>
											<%
											listOfCities = objcBCommon.getCities(p_state);

													for (int k = 0; k < listOfCities.size(); k = k + 2) {

														if (listOfCities.get(k).toString().equals(p_city)) {
											%>
											<option value="<%=listOfCities.get(k)%>" selected="selected"><%=listOfCities.get(k + 1)%></option>
											<%
												} else {
											%>
											<option value="<%=listOfCities.get(k).toString()%>"><%=listOfCities.get(k + 1)%></option>
											<%
												}
													}
											%>
										</select>
									</div>		
								<html:text styleClass="form-control" size="20"
										property="faccity" styleId="faccity"></html:text>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.faczip.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19" property="faczip"
									styleId="faczip"></html:text>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-2">
							<div class="form-group">
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.description.displayname" /></label>
							</div>
						</div>
						<div class="col-md-10">
							<div class="form-group">
								<html:textarea styleClass="form-control custom-textarea-height"
									property="description"></html:textarea>
							</div>
						</div>
					</div>
				</div>
			</div>

			<input type="hidden" id="function" name="function" value="insert">

			<div class="btn_area text-center">
				<%
					if (facility_id != 0) {
				%>
				<!-- <input name="addholiday" id="addholiday" value="View Holiday"
						type="button" class="btn-primary btn" />  -->
				&nbsp; <input name="updatefacility" value="Update Appointment" onclick="return myFunction();"
					type="submit" class="btn-success btn" />
				<%
					} else {
				%>
				<input name="addfacility" value="Add Appointment" type="submit" onclick="return myFunction();"
					class="btn-primary btn" /> &nbsp;
				<%
					}
				%>
				&nbsp; <input name="faccancel" value="Cancel" type="button"
					class="btn-danger btn"
					onClick="window.location.href = '<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp'" />
			</div>
			<input type="hidden" id="facccdate" name="facccdate" value="" /> <input
				type="hidden" id="facccdesc" name="facccdesc" value="" /> <input
				type="hidden" id="facid_hidden" name="facid_hidden"
				value="<%=facility_id%>" /> <input type="hidden"
				name="userid_hidden"
				value="<%=session.getAttribute("logeduserid")%>" />
					<input
				type="hidden" id="checkvalue" name="checkvalue"
				value="0" />
		</div>
	</html:form>
</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
<%
	try {
		//if(facility_id!=0)
		if ((!request.getParameter("facid").equals("0"))
				|| (!request.getParameter("facid_hidden").equals("0"))) {
%>
<script>
		document.addfacilityform.facilityname.value="<%=values.get(2)%>";
		document.addfacilityform.facilitytype.value="<%=values.get(3)%>";
		document.addfacilityform.facstartdate.value="<%=values.get(4)%>";
		document.addfacilityform.facenddate.value="<%=values.get(5)%>";
		
		<%
		 String startDate = objcBCommon.getDateFormatter(values.get(4).toString());
		 String endDate = objcBCommon.getDateFormatter(values.get(5).toString());
		%> 
		 document.addfacilityform.facstartdate.value="<%=startDate%>"; 
		 document.addfacilityform.facenddate.value="<%=endDate%>"; 
		/* String startDate = obj.getDateFormatter(values.get(4).toString());
		String endDate = obj.getDateFormatter(values.get(5).toString());
		
		document.addfacilityform.facstartdate.value=startDate;
		document.addfacilityform.facenddate.value=endDate; */
		
		document.addfacilityform.description.value="<%=StringUtils.escape(values.get(10).toString())%>";
		document.addfacilityform.facopentime.value="<%=values.get(6)%>";
		document.addfacilityform.facclosetime.value="<%=values.get(7)%>";
		document.addfacilityform.timeslot.value="<%=values.get(8)%>";
		document.addfacilityform.membersslot.value="<%=values.get(9)%>";
		<%-- document.addfacilityform.facadd1.value="<%=StringUtils.escape(values.get(11).toString())%>";
		document.addfacilityform.facadd2.value="<%=StringUtils.escape(values.get(12).toString())%>";
		 
		document.addfacilityform.faczip.value="<%=values.get(14)%>";
		 
	    document.addfacilityform.country.value="<%=values.get(16)%>";  --%>
		document.addfacilityform.faccontactno.value="<%=values.get(17)%>";
		document.addfacilityform.facilitycategory.value="<%=values.get(19)%>";
</script>

<input type="hidden" id="SDate" name="SDate" value="<%=values.get(4)%>">
<input type="hidden" id="TDate" name="TDate" value="<%=values.get(5)%>">
<%
	}
	} catch (Exception xxx) {
	}
%>
