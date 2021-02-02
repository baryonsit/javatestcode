
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%
	int i = 1;
	int facility_id = 0;

	try {

		facility_id = Integer.parseInt(request.getParameter("fac_id"));

	} catch (Exception ee) {
		facility_id = Integer.parseInt(request.getParameter("facid_hidden"));
	}
%>
	<%String categoryName = request.getParameter("category_name");
	String category_Id = request.getParameter("category_id");%>

<div class="page-title">
<%
					if (facility_id == 0) {
				%> <h3>Create Appointment</h3> <%
					} else {
				%> <h3>Update Appointment</h3> <%
					}
				%>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
           <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=category_Id%>&category_name=<%=categoryName%>">Available Appointments</a></li>

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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.timepickr.js"></script>


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
	List<String> listofNames = new ArrayList<String>();
	try {
		values.clear();
		//calling getuser method to get buyer information
		//and storing values in an array called values***********/
		values = objcBFacUpdate.getFacilityDetails(facility_id);
	} catch (Exception xxxx) {

	}
/* 	try{
		listofNames = objcBFacUpdate.getCountryNameById(values.get(16).toString(),values.get(15).toString(),values.get(13).toString(),values.get(18).toString());

	}catch (Exception xxxx){
		System.out.println(""+xxxx);
	} */
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

	cBCommonFunctions objcBCommon = new cBCommonFunctions();
	p_country = objcBCommon.getdefault_locations("default_country");
	p_state = objcBCommon.getdefault_locations("default_state");
	p_city = objcBCommon.getdefault_locations("default_city");

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
	String startDate = objBoGetDays.getDateFormatter(values.get(4).toString());
	String endDate = objBoGetDays.getDateFormatter(values.get(5).toString());
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
								<%=values.get(2)%>
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
								<%=values.get(3)%>
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
								<%=startDate%>

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
								<%=endDate%>

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
								<%=values.get(6)%>
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
								<%=values.get(7)%>
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
								<%=values.get(8)%>
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
								<%=values.get(9)%>
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
								<%=categoryName%>
							</div>
						</div>
					</div>
				</div>
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
								<%=values.get(17)%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- <div class="row">
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
								<%=StringUtils.escape(values.get(11).toString())%>
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
								<%=StringUtils.escape(values.get(12).toString())%>
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
								<%=listofNames.get(0)%>

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
									<%=listofNames.get(1)%>
								</div>
								<html:select property="facstate" styleClass="form-control">

										<%
											for (int k = 0; k < states.size(); k = k + 2) {
										%>
										<html:option value="<%=states.get(k).toString()%>"><%=states.get(k + 1)%></html:option>
										<%
											}
										%>
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
								<span class="red_star red"></span> <label><bean:message
										key="addfacilityform.city.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="filterCitiesForPer">
									<%=listofNames.get(2)%>
								</div>

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
								<%=values.get(14)%>
							</div>
						</div>
					</div>
				</div>
			</div>
		 --%>
			<div class="row">
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
										key="addfacilityform.description.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=StringUtils.escape(values.get(10).toString())%>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="btn_area text-center">
			<input name="cancel" value="Cancel" type="button"
				class="btn-danger btn"
				onClick="window.location.href='<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=category_Id%>&category_name=<%=categoryName%>'" />
		</div>
	</html:form>
</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>


