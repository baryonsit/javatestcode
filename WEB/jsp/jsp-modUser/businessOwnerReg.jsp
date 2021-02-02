<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modUser.userBo.*"%>

<%@ page import="org.apache.struts.action.Action"%>
<%@ page import="org.apache.struts.action.ActionErrors"%>

<%@ page language="java"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/ajax.js"></script>
<!-- DatePicker  jquery library implementation -->
 <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/WEB/includes/css/jquery-ui.css" /> 
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.validate.js"></script>
<script>
	$(function() {
		//  alert("hh"); 	
		$(".date1").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange: "1917:2050",
			dateFormat : "yy-mm-dd"
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("#signupForm").validate({
			rules : {
				username :{required:true},
				pass1 : {required:true},
				pass2 : {required:true},
				fname : {required:true},
				lname : {required:true},
				email :{required:true},
				add1 : {required:true},
				add2 : {required:true},
				city : {required:true},
				zipcode : {required:true},
				contact : {required:true,number:true,},
				memberid :{required:true},
				bissname : {required:true},
				bissowner :{required:true},
				bissstart : {required:true},
				bissend : {required:true},
				bissadd1 : {required:true},
				bisscity :{required:true},
				bisszipcode : {required:true},
				bissdesc : {required:true},

			},
			messages : {
				username :  {
					required: "Enter First  Name",
				},
				pass1 : "Please enter password",
				pass2 : "Please enter confirm password",
				fname : "Please enter first name",
				lname : "Please enter last name",
				email : "Please enter email_id",
				add1 : "Please enter address",
				add2 : "Please enter address",
				city : "Please enter city",
				zipcode : "Please enter zipcode",
				contact : {
					required: "Enter Contact Number",
					number:"Enter Valid Mobile Number"
				},
				memberid : "Please enter membership id",
				bissname : "Please enter bussiness name",
				bissowner : "Please enter owner name",
				bissstart : "Please enter start date",
				bissend : "Please enter end date",
				bissadd1 : "Please enter address",
				bisscity : "Please enter city",
				bisszipcode : "Please enter zipcode",
				bissdesc : "Please enter description",

			}
		});

	});
</script>
<div class="page-title">
	<h3>Business Registration</h3>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
			<li><a
				href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/businessOwnerReg.jsp?role1=SuperAdministrator&option=register">Register
					Business</a></li>

		</ol>
	</div>
</div>

<%
	cBCommonFunctions objBoGetCountriesforBo = new cBCommonFunctions();
	ArrayList countriesforBo = new ArrayList();
	countriesforBo = objBoGetCountriesforBo.getCountryCommon();

	cBCommonFunctions objBoGetStatesforBo = new cBCommonFunctions();
	ArrayList statesforBo = new ArrayList();
	statesforBo = objBoGetStatesforBo.getStateDetails();
%>
<%
	cBCommonFunctions objBoGetCountriesForBu = new cBCommonFunctions();
	ArrayList countriesforbu = new ArrayList();
	countriesforbu = objBoGetCountriesForBu.getCountryForBu();
%>

<%
	cBCommonFunctions objBoGetStatesForBu = new cBCommonFunctions();
	ArrayList statesforbu = new ArrayList();
	statesforbu = objBoGetStatesForBu.getStatesForBu();

	cBCommonFunctions objBoGetBusinessForBu = new cBCommonFunctions();
	ArrayList businessforbu = new ArrayList();
	businessforbu = objBoGetStatesForBu.getBusinessForBu();
%>

<%
	String msg = "";
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
	String rolename = "null";
	try {
		rolename = request.getParameter("role1");
		if (!rolename.equals(null)) {
			rolename = request.getParameter("role1");
		}

	} catch (Exception role) {
		rolename = request.getParameter("urole");

	}

	String business_id = "null";
	try {
		business_id = request.getParameter("businessid");
		if (!business_id.equals(null)) {
			business_id = request.getParameter("businessid");
		}

	} catch (Exception idd) {
		business_id = request.getParameter("busid");

	}

	int value = 10;
	String ava_name = "null";
	cBBusinessOwner objBoGetAvailable = new cBBusinessOwner();
	try {
		ava_name = request.getParameter("ava_name");
		if (!ava_name.equals(null)) {
			value = objBoGetAvailable.checkAvailability(ava_name);
		}

	} catch (Exception nul) {

	}
%>


<%
	cBProfileManagement objBoGetSubs = new cBProfileManagement();
	ArrayList subslist = new ArrayList();
	subslist = objBoGetSubs.getSubscription();

	cBProfileManagement objBoGetCategories = new cBProfileManagement();
	ArrayList categorylist = new ArrayList();
	categorylist = objBoGetCategories.getCategories();
%>


<%
	String action = "";

	if (rolename.equals("SuperAdministrator")) {
		action = "register";
	} else {

		action = "businessuserreg";
	}
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
			<h3 class="home_tit">Account Information</h3>

			<input type="hidden" size="20" name="urole" value="<%=rolename%>" />
			<input type="hidden" size="20" id="busid" name="busid"
				value="<%=business_id%>" />

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span> <bean:message
										key="registrationForm.username.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="check_ava_div">
									<html:text styleClass="form-control" size="30"
										property="username" styleId="username"></html:text>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<input name="Check Availability" value="Check Availability"
									type="button" class="btn-primary btn" id="chk_avl"
									onclick="check_availability('<%=request.getContextPath()%>','<%=action%>');">
								<div id="check_avdiv"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class=" pass">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span> <bean:message
										key="registrationForm.pass1.displayname" /> </label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:password styleClass="form-control" size="30"
									property="pass1"></html:password>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span> <bean:message
										key="registrationForm.pass2.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:password size="30" styleClass="form-control"
									property="pass2"></html:password>
							</div>
						</div>
					</div>
				</div>
			</div>

			<h3>Personal Information</h3>
			<div class="row">

				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label> <bean:message
										key="registrationForm.fname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="fname"></html:text>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> <bean:message
										key="registrationForm.mname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="mname"></html:text>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.lname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="lname"></html:text>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label> <bean:message
										key="registrationForm.email.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="email"></html:text>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> <span class="red_star red">*</span>Address Line1
								</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="add1"></html:text>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> <span class="red_star red">*</span>Address Line2
								</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="add2" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.city.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20" property="city" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.zipcode.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20"
									property="zipcode" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				try {
						if (rolename.equals("BusinessUsers")) {
			%>
			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*&nbsp;</span> <label><bean:message
										key="businessuserregistrationForm.State.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="state">
									<%
										for (int k = 0; k < statesforbu.size(); k = k + 2) {
									%>


									<html:option value="<%=statesforbu.get(k).toString()%>"><%=statesforbu.get(k + 1)%></html:option>

									<%
										}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span>country</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="country">
									<option value="<%=countriesforbu.get(1)%>"><%=countriesforbu.get(0)%></option>
								</html:select>
								</td>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
					} catch (Exception e) {
					}
			%>


			<%
				try {
						if (rolename.equals("SuperAdministrator")) {
			%>

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.state.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="state">
									<%
										for (int k = 0; k < statesforBo.size(); k++) {
									%>
									<html:option value="<%=statesforBo.get(k).toString()%>"><%=statesforBo.get(k + 1)%></html:option>
									<%
										k++;
														}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label>Country</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="country">
									<option value="<%=countriesforBo.get(1)%>"><%=countriesforBo.get(0)%></option>
								</html:select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
				}
					} catch (Exception e) {
					}
			%>

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.contact.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20"
									property="contact"></html:text>
							</div>
						</div>
					</div>
				</div>
				<%
					if (!rolename.equals("BusinessUsers")) {
				%>

				<%
					}
				%>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="businessuserregistrationForm.memberid.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="20"
									property="memberid" />
							</div>
						</div>
					</div>
				</div>
				<%
					try {
							if (rolename.equals("BusinessUsers")) {
				%>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> <span class="red_star red">*</span>Business
								</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<select class="flatbox" name="businessid" id="businessid">
									<option value="SELECT">Select Business</option>
									<%
										for (int c = 0; c < businessforbu.size(); c = c + 2) {
									%>
									<option value="<%=businessforbu.get(c)%>"><%=businessforbu.get(c + 1)%></option>

									<%
										}
									%>
								</select>
							</div>
						</div>
					</div>
				</div>
				<%
					}
						} catch (Exception e) {
						}
				%>

			</div>



			<%
				if (rolename.equals("SuperAdministrator")) {
			%>
			<h3>Business Information</h3>
			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bissname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="bissname" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bissowner.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="bissowner" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bissstart.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="date1 form-control" size="40" property="bissstart" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bissend.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="date1 form-control" size="40" property="bissend" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bisssubscription.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control"
									property="bisssubscription" styleId="bisssubscription">
									<%--  <html:option value="Select Subscription">Select Subscription</html:option> --%>
									<%
										for (int s = 0; s < subslist.size(); s++) {
									%>
									<html:option value="<%=subslist.get(s).toString()%>"><%=subslist.get(s + 1)%></html:option>
									<%
										s++;
													}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bisscategory.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="bisscategory"
									styleId="bisscategory">
									<%--   <html:option value="Select Category">Select Category</html:option> --%>
									<%
										for (int cat = 0; cat < categorylist.size(); cat++) {
									%>
									<html:option value="<%=categorylist.get(cat + 1).toString()%>"><%=categorylist.get(cat + 1)%></html:option>
									<%
										cat++;
													}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label>Address Line1</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="bissadd1" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Address Line2</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="bissadd2" />
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bisscity.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="bisscity" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bisszipcode.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="bisszipcode" />
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bissstate.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="bissstate">
									<%
										for (int k = 0; k < statesforBo.size(); k++) {
									%>
									<html:option value="<%=statesforBo.get(k).toString()%>"><%=statesforBo.get(k + 1)%></html:option>
									<%
										k++;
													}
									%>
								</html:select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label>Country</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:select styleClass="form-control" property="bisscountry">
									<option value="<%=countriesforBo.get(1)%>"><%=countriesforBo.get(0)%></option>
								</html:select>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="registrationForm.bissdesc.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:textarea styleClass="form-control" cols="70" rows="5"
									property="bissdesc"></html:textarea>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
				}
			%>
			<div class="btn_area text-center">
				<input id="reg" name="register" value="Register" type="submit"
					class="btn-primary btn"> <input name="cancel"
					value="Cancel" type="button" class="btn-danger btn"
					onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />

			</div>
	</html:form>
</div>

<script type="text/javascript">
	document.registrationForm.bissstart.readOnly = "true";
	document.registrationForm.bissend.readOnly = "true";
</script>

</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
</div>
</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>
