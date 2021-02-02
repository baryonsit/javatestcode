<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modUser.userBo.*"%>
<%@ page import="modCommon.commonBo.*"%>

<%@ page import="org.apache.struts.action.Action"%>
<%@ page import="org.apache.struts.action.ActionErrors"%>

<%@ page language="java"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<%
String username=(String) session.getAttribute("logedusername");
if(username==null)
{
	out.println("Loged-out");
	response.sendRedirect(request.getContextPath()+"/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
}
%>

<div class="page-title">
	<h3>Profile</h3>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
			<!--  <li><a href="#">Bussiness Owner</a></li> -->
			<li>My Profile</li>
		</ol>
	</div>
</div>
<%
String p_country = "";
String p_state = "";
String p_city = "";%>
<%
	ArrayList listOfStates = new ArrayList();
	ArrayList listOfCities = new ArrayList();
	cBCommonFunctions objBoGetCountriesforBo=new cBCommonFunctions();
	ArrayList countriesforBo = new ArrayList();
	countriesforBo = objBoGetCountriesforBo.getCountryCommon();

	cBCommonFunctions objBoGetStatesforBo=new cBCommonFunctions();
	ArrayList statesforBo = new ArrayList();
	statesforBo = objBoGetStatesforBo.getStateDetails();
	
	 cBCommonFunctions objBoGetCountryList=new cBCommonFunctions();
		ArrayList listOfCountries = new ArrayList();
		listOfCountries = objBoGetCountryList.getCountries();
%>


<%
	cBCommonFunctions objBoGetCountriesForBu=new cBCommonFunctions();
	ArrayList countriesforbu = new ArrayList();
	countriesforbu = objBoGetCountriesForBu.getCountryForBu();
%>

<%
	cBCommonFunctions objBoGetStatesForBu=new cBCommonFunctions();
	ArrayList statesforbu = new ArrayList();
	statesforbu = objBoGetStatesForBu.getStatesForBu();
%>

<%
String qsuserid = request.getParameter("qsuserid");
String qsroleid = request.getParameter("qsroleid");
int bussarrsize=0;

try
{
	
	if( (!qsuserid.equals(null)) && (!qsroleid.equals(null)) )
	{
		qsuserid = request.getParameter("qsuserid");
		qsroleid = request.getParameter("qsroleid");
	}
}
catch(Exception excep)
{
	qsuserid = request.getParameter("hiddenuserid");
	qsroleid = request.getParameter("hiddenroleid");
}

cBProfileManagement objBoUpdateList=new cBProfileManagement();
ArrayList updatearr = new ArrayList();
updatearr = objBoUpdateList.userProfileDetails(qsuserid,qsroleid);

cBCommonFunctions objcBCommon=new cBCommonFunctions();
if(updatearr.size()<=0){
	p_country = objcBCommon.getdefault_locations("default_country");
	p_state = objcBCommon.getdefault_locations("default_state");
	p_city = objcBCommon.getdefault_locations("default_city");
} else{
	p_country = updatearr.get(12).toString();
	p_state = updatearr.get(10).toString();
	p_city = updatearr.get(7).toString();
}
 
/* if(qsroleid.equals("2")){
	cBProfileManagement objBoBusList=new cBProfileManagement();
	busarr = objBoBusList.userBusinessDetails(qsuserid,qsroleid);
	bussarrsize = busarr.size();
		
} */
%>

<%
cBProfileManagement objBoGetSubs=new cBProfileManagement();
ArrayList subslist = new ArrayList();
subslist = objBoGetSubs.getSubscription();

cBProfileManagement objBoGetCategories=new cBProfileManagement();
ArrayList categorylist = new ArrayList();
categorylist = objBoGetCategories.getCategories();


%>

<%String rolename = request.getParameter("role1");%>

<!-- ============ Content Panel ============== -->
<%String msg=""; %>
<%try{
  session.getAttribute("message");
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
 }
 catch(Exception e){
 }	
%>


<%
 	String profileaction = "";
     profileaction = "myprofile";
 	/* if (qsroleid.equals("2")) {
 		profileaction = "myprofile";
 	}
 	if (qsroleid.equals("3")) {
 		profileaction = "myprofileuser";
 	} */
 	
 %>



<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>
<!-- DatePicker  jquery library implementation -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/WEB/includes/css/jquery-ui.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery_validation.js"></script>
<script>
	$(function() {
		$(".date1").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange: "1917:2050",
			dateFormat : "yy-mm-dd"
		});
	});
</script>
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


	<html:form action="<%=profileaction%>" styleId="updateUserProfile">

		<input type="hidden" size="20" id="hiddenroleid" name="hiddenroleid"
			value="<%=qsroleid %>" />
		<input type="hidden" size="20" id="hiddenuserid" name="hiddenuserid"
			value="<%=qsuserid %>" />
		<div class="user_form">
			<h3 class="home_tit">Personal Information</h3>
				<%if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN)){ %>
			
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> <span class="red_star red">*</span>
								<bean:message key="profileForm.fname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19" property="fname"></html:text>
                           </div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><bean:message key="profileForm.mname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19" property="mname"></html:text> 
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
										key="profileForm.lname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								 <html:text styleClass="form-control" size="19" property="lname"></html:text>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span>
								<bean:message key="profileForm.email.displayname" /> </label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19" property="email"></html:text> 
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- <%if(qsroleid.equals(EzAppointmentConstant.StudentRoleId)){ %>
				<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="profileForm.className.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<html:text styleClass="form-control" size="19" property="className"></html:text>
							</div>
						</div> 
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="profileForm.section.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
                             <html:text styleClass="form-control" size="19" property="section" readonly="readonly"></html:text>				
							</div>
						</div>
					</div>
				</div>
				</div>
				<%} %> --%>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span>
								<bean:message key="profileForm.add1.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								 <html:text styleClass="form-control" size="19" property="add1"></html:text> 
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><bean:message key="profileForm.add2.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								 <html:text styleClass="form-control" size="19" property="add2" /> 
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
								<label><span class="red_star red">*</span>Country</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<select name="country" class="form-control" id="country"
									onchange="filterForState('<%=request.getContextPath()%>');">
									<option value="">Select Country</option>
									<%
										for (int j = 0; j < listOfCountries.size(); j = j + 2) {

														if (listOfCountries.get(j).toString().equals(p_country)) {
									%>
									<option value="<%=listOfCountries.get(j)%>" selected="selected"><%=listOfCountries.get(j + 1)%></option>
									<%
										} else {
									%>
									<option value="<%=listOfCountries.get(j)%>"><%=listOfCountries.get(j + 1)%></option>
									<%
										}
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
								<label><span class="red_star red">*</span>State</label>
							</div>
						</div>
						<div class="col-md-8">
						<div class="form-group">
							<div id="filterStatesForPer">
										<select name="state" Class="form-control"
										id="state" onchange="filterforCity('<%=request.getContextPath()%>');"
											>
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
								<label><span class="red_star red">*</span>City</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<div id="filterCitiesForPer">
									<select name="city" Class="form-control" id="city">
										<option value="0">Select City</option>
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
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="profileForm.zipcode.displayname" /></label>
							</div>
						</div>
						
						<div class="col-md-8">
							<div class="form-group">
								 <html:text styleClass="form-control" size="19"
									property="zipcode" /> 
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
										key="profileForm.contact.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<html:text styleClass="form-control" size="19"
									property="contact" /> 
							</div>
						</div>
					</div>
				</div>
			</div>
			<%}else{%>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label> <span class="red_star red">*</span>
								<bean:message key="profileForm.fname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(0).toString())%>
                           </div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><bean:message key="profileForm.mname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(1).toString())%>
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
										key="profileForm.lname.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(2).toString())%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span>
								<bean:message key="profileForm.email.displayname" /> </label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(3).toString())%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%if(qsroleid==EzAppointmentConstant.STUDENT){ %>
				<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="profileForm.class.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(14).toString())%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="profileForm.section.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(15).toString())%>
							</div>
						</div>
					</div>
				</div>
				</div>
				<%} %>
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span>
								<bean:message key="profileForm.add1.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(5).toString())%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><bean:message key="profileForm.add2.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(6).toString())%>
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
								<label><span class="red_star red">*</span>Country</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(12).toString())%>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span>State</label>
							</div>
						</div>
						<div class="col-md-8">
						<div class="form-group">
						<%=StringUtils.escape(updatearr.get(11).toString())%>
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
								<label><span class="red_star red">*</span>City</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<%=StringUtils.escape(updatearr.get(8).toString())%>
							</div>
						</div>
						
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span class="red_star red">*</span> <label><bean:message
										key="profileForm.zipcode.displayname" /></label>
							</div>
						</div>
						
						<div class="col-md-8">
							<div class="form-group">
								<%=StringUtils.escape(updatearr.get(9).toString())%>
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
										key="profileForm.contact.displayname" /></label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
							<%=StringUtils.escape(updatearr.get(4).toString())%>
							</div>
						</div>
					</div>
				</div>
				</div>
				<%}%>
				
		<%-- 		<%
     		if(qsroleid.equals("3"))
     		{
     	%>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label><span class="red_star red">*</span> Membership Id</label>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-group">
								<html:text styleClass="form-control" size="19"
									property="memberid" />
							</div>
						</div>
					</div>
				</div>
				<%
			}
		%> --%>


			<%-- <%
if(!qsroleid.equals("3")){
%>
<h3>Business Information</h3>
  <div class="row">
 	<div class="col-md-6">
 		<div class="row">
 				<div class="col-md-4">
 				  <div class="form-group">
    		          <span class="red_star red">*</span>
    		               <label><bean:message key="profileForm.bissname.displayname"/></label>
    	            </div>
    	          </div>
    	          <div class="col-md-8">
 		           <div class="form-group">
    		             <html:text styleClass="form-control" size="18" property="bissname"/>
   		            </div> 
   		           </div> 
   		          </div> 
   		      </div>
   	<div class="col-md-6">
 		<div class="row">
 				<div class="col-md-4">
 				  <div class="form-group">   
    		         <span class="red_star red">*</span>
    		          <label><bean:message key="profileForm.bissowner.displayname"/></label>
    	           </div> 
   		          </div> 
      	      <div class="col-md-8">
 		           <div class="form-group">
      		         <html:text styleClass="form-control" size="18" property="bissowner"/>
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
    		        <span class="red_star red">*</span>
    		          <label><bean:message key="profileForm.bissstart.displayname"/></label>
    	            </div> 
   		          </div>
   		          <div class="col-md-8">
 		           <div class="form-group">
			        <input type="text" Class="date1 flat form-control" size="18" name="bissstart" id="date"  readonly="true"  />
		          </div> 
   		          </div>
   		       </div> 
    </div>
    <div class="col-md-6">
 		<div class="row">
 				<div class="col-md-4">
 				  <div class="form-group">
      		          <span class="red_star red">*</span>
			              <label><bean:message key="profileForm.bissend.displayname"/></label>
		           </div> 
   		         </div>
   		         <div class="col-md-8">
 		           <div class="form-group">
			        <input type="text" Class="date1 flat form-control" size="18" name="bissend" id="date"  readonly="true"/>
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
                     <label><span class="red_star red">*</span>Subscription</label>
                  </div> 
   		         </div>
     <div class="col-md-8">
 		  <div class="form-group">
    		<html:select styleClass="form-control" property="bisssubscription" disabled="true" >
      	<% 
			for (int s = 0; s < subslist.size(); s++)
			{
		%>
      		<html:option value="<%=subslist.get(s+1).toString()%>"><%=subslist.get(s+1)%></html:option>
      	<%
			s++;}
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
                     <label><span class="red_star red">*</span>Category</label>
                 </div> 
               </div>
      <div class="col-md-8">
 		  <div class="form-group">
            <html:select styleClass="form-control" property="bisscategory" disabled="true">
	    <% 
			for (int cat = 0; cat < categorylist.size(); cat++)
			{
		%>
      		<html:option value="<%=categorylist.get(cat+1).toString()%>"><%=categorylist.get(cat+1)%></html:option>
      	<%
			cat++;}
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
    		           <label><span class="red_star red">*</span>Address Line1</label>
    	         </div> 
               </div>
                <div class="col-md-8">
 		          <div class="form-group">
     		          <html:text styleClass="form-control" size="18" property="bissadd1"/>
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
     		        <html:text styleClass="form-control" size="18" property="bissadd2"/>
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
      		          <label><span class="red_star red">*</span>City</label>
      	           </div>
                </div>
                <div class="col-md-8">
 		          <div class="form-group">
      		           <html:text styleClass="form-control" size="18" property="bisscity"/>
                  </div>
                </div>
           </div> 
         </div>
          <div class="col-md-6">
 		<div class="row">
 				<div class="col-md-4">
 				  <div class="form-group">  
      		          <label> <span class="red_star red">*</span>Zip Code</label>
		           </div> 
                 </div>
               <div class="col-md-8">
 		          <div class="form-group">
      		         <html:text styleClass="form-control" size="18" property="bisszipcode"/>
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
                       <label><span class="red_star red">*</span>State</label>
                   </div>
              </div> 
          <div class="col-md-8">
 		          <div class="form-group">
                   <html:select styleClass="form-control" property="bissstate">
      	<%
						for (int k = 0; k < statesforBo.size(); k++) {
					%>
					<option value="<%=statesforBo.get(k)%>"><%=statesforBo.get(k + 1)%></option>
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
 	                   <label><span class="red_star red">*</span>Country</label>
                    </div>
                </div>
             <div class="col-md-8">
 		          <div class="form-group">
                    <html:select styleClass="form-control" property="bisscountry">
                    <option value='<%=countriesforBo.get(1)%>'><%=countriesforBo.get(0)%></option>	
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
  			          <span class="red_star red">*</span>
  			            <label><bean:message key="profileForm.bissdesc.displayname"/></label>
  			        </div>
                 </div> 
  		   <div class="col-md-8">
 		          <div class="form-group">
     		         <html:textarea  styleClass="form-control" cols="62" rows="2" property="bissdesc"></html:textarea>
     	       </div>
           </div>
       </div> 
    </div> 
   </div> 

<% } %> --%>
			<!-- ************************* -->
			<div class="btn_area text-center">
			<%if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN))
			{ %>
			<input name="updateprofile" value="Update Profile" type="submit" class="btn-success btn"> <%}%>
					<input name="cancel"
					value="Cancel" type="button" class="btn-danger btn"
					onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />
			</div>
		</div>

		<input type="hidden" name="uroleid" value="<%=qsroleid%>" />
		<input type="hidden" name="arrsize" value="<%=bussarrsize%>" />
	</html:form>


	<%
try
{
	//if(request.getParameter("qsroleid").equals("2"))
	if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN))
	{
%>
	<script type="text/javascript">
		document.profileForm.fname.value="<%=StringUtils.escape(updatearr.get(0).toString())%>";
		document.profileForm.mname.value="<%=StringUtils.escape(updatearr.get(1).toString())%>";
		document.profileForm.lname.value="<%=StringUtils.escape(updatearr.get(2).toString())%>";
	    document.profileForm.email.value="<%=StringUtils.escape(updatearr.get(3).toString())%>";
		document.profileForm.contact.value="<%=StringUtils.escape(updatearr.get(4).toString())%>";
		document.profileForm.add1.value="<%=StringUtils.escape(updatearr.get(5).toString())%>";
		document.profileForm.add2.value="<%=StringUtils.escape(updatearr.get(6).toString())%>";
<%-- 		document.profileForm.city.value="<%=StringUtils.escape(updatearr.get(7).toString())%>";
 --%>		document.profileForm.zipcode.value="<%=StringUtils.escape(updatearr.get(9).toString())%>";
<%-- 		document.profileForm.state.value="<%=StringUtils.escape(updatearr.get(9).toString())%>";
 --%>		document.profileForm.country.value="<%=StringUtils.escape(updatearr.get(12).toString())%>";
		</script>
	<%
}
}
catch(Exception notrr){
}
%>

<%-- 
	<%
try
{
	/* if(request.getParameter("qsroleid").equals("3")) */
	 if(request.getParameter("qsroleid").equals("3") || request.getParameter("hiddenroleid").equals("3")) 
	{
		 System.out.println(StringUtils.escape(updatearr.get(2).toString()));
%>
	<script type="text/javascript">
		document.userprofileForm.fname.value="<%=StringUtils.escape(updatearr.get(0).toString())%>";
		document.userprofileForm.mname.value="<%=StringUtils.escape(updatearr.get(1).toString())%>";
		document.userprofileForm.lname.value="<%=StringUtils.escape(updatearr.get(2).toString())%>";
		document.userprofileForm.email.value="<%=StringUtils.escape(updatearr.get(3).toString())%>";
		document.userprofileForm.contact.value="<%=StringUtils.escape(updatearr.get(4).toString())%>";
		document.userprofileForm.add1.value="<%=StringUtils.escape(updatearr.get(5).toString())%>";
		document.userprofileForm.add2.value="<%=StringUtils.escape(updatearr.get(6).toString())%>";
		document.userprofileForm.city.value="<%=StringUtils.escape(updatearr.get(7).toString())%>";
		document.userprofileForm.zipcode.value="<%=StringUtils.escape(updatearr.get(9).toString())%>";
		document.userprofileForm.state.value="<%=StringUtils.escape(updatearr.get(9).toString())%>";
		document.userprofileForm.country.value="<%=StringUtils.escape(updatearr.get(12).toString())%>";
		document.userprofileForm.memberid.value="<%=StringUtils.escape(updatearr.get(13).toString())%>";
		</script>
	<%
	}
}
catch(Exception notrr){
}
%>
 --%>

	<%-- <%
try
{	
	//if(request.getParameter("qsroleid").equals("2"))
	if(request.getParameter("qsroleid").equals("2") || request.getParameter("hiddenroleid").equals("2"))
	{
%>
		<script type="text/javascript">
			document.profileForm.bissname.value="<%=StringUtils.escape(busarr.get(0).toString())%>";
			document.profileForm.bissowner.value="<%=StringUtils.escape(busarr.get(1).toString())%>";
			document.profileForm.bissstart.value="<%=StringUtils.escape(busarr.get(2).toString())%>";
			document.profileForm.bissend.value="<%=StringUtils.escape(busarr.get(3).toString())%>";
			document.profileForm.bisssubscription.value="<%=StringUtils.escape(busarr.get(5).toString())%>";
			//alert("fgjfgh---- : " +<%=StringUtils.escape(busarr.get(5).toString())%>);
		    document.profileForm.bisscategory.value="<%=StringUtils.escape(busarr.get(7).toString())%>";
			//alert("fgjfgh---- : " +<%=StringUtils.escape(busarr.get(7).toString())%>);
			document.profileForm.bissadd1.value="<%=StringUtils.escape(busarr.get(8).toString())%>";
			document.profileForm.bissadd2.value="<%=StringUtils.escape(busarr.get(9).toString())%>";
			document.profileForm.bisscity.value="<%=StringUtils.escape(busarr.get(10).toString())%>";
			document.profileForm.bisszipcode.value="<%=StringUtils.escape(busarr.get(11).toString())%>";
			document.profileForm.bissstate.value="<%=StringUtils.escape(busarr.get(12).toString())%>";
			document.profileForm.bisscountry.value="<%=StringUtils.escape(busarr.get(14).toString())%>";
			document.profileForm.bissdesc.value="<%=StringUtils.escape(busarr.get(16).toString())%>";
			
			document.profileForm.bisssubscription.enabled=true;
			document.profileForm.bissstart.readOnly=true;
			document.profileForm.bissend.readOnly=true;
		</script>
<%
	}
}
catch(Exception notrr1)
{
%>
	<script type="text/javascript">
		document.profileForm.bisssubscription.enabled=true;
		document.profileForm.bissstart.readOnly=true;
		document.profileForm.bissend.readOnly=true;
	</script>
<%	
}
%> --%>


</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
