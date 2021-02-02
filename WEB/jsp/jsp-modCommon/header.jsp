<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

	<title>Appointment System</title>
	<script src='<%=request.getContextPath()%>/WEB/includes/js/lib/jquery.min.js'></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/calendar-blue.css" />
 
	 <script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/calendar.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/dropdowntabs.js"></script>

	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/loader.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/pace.min.js"></script>
	
	<!-- New theme Implementation -->
	
	 <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/WEB/includes/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/WEB/includes/css/style.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/WEB/includes/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link rel="icon" href="<%=request.getContextPath()%>/WEB/includes/images/favicon.ico" />
    <script>

	function activeclass(temp) {
		/* alert("Hello"); */
	    $('ul li').removeClass('active');
	   $(temp).addClass('active');
	};
</script>
</head>

<body>
<%@ page language="java" %>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ page import="modUser.userDo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>
<%@ page import="modAdmin.adminBo.*,java.util.*,common.EzAppointmentConstant "%>
<%
	String username1 = (String) session.getAttribute("logedusername");
	if (username1 == null) {
		response.sendRedirect(request.getContextPath() + "/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
		return;
	}
%>

<%
    //ArrayList global_Settings= new ArrayList();
    //cBSubscriptionManage objcBGlobalSettings = new cBSubscriptionManage();
	//global_Settings.clear();
    //global_Settings=objcBGlobalSettings.getGlobalSettings();
    //String default_country="";
    //for(int i=0;i<global_Settings.size();i=i+2)
    //{
    	//if(global_Settings.get(i).equals("default_country"))
    	//{
      		  //default_country=(String)global_Settings.get(i+1);
    	//}
    //}
    //objcBGlobalSettings=null;
    //String option="load_search";
    //ArrayList countryList = new ArrayList();
    //cDBusinessOwner cDCity=new cDBusinessOwner();
    //countryList =cDCity.getCountryDB();
    String currTime=" ";
    cBCommonFunctions getCurrTime = new cBCommonFunctions();
    currTime = getCurrTime.getCurrentTime();
    
    String role_name=getCurrTime.getRoleName(session.getAttribute("logedroleid").toString());
    cBProfileManagement objBoGetBuscity =new cBProfileManagement();
	int schoolIdHeader = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")): 0;
	ArrayList institutesData = new ArrayList();
	cBCommonFunctions objHeader =new cBCommonFunctions();
	if (session.getAttribute("instituteId") != null) {
		
		institutesData = objHeader.getInstituteDetails(session.getAttribute("instituteId").toString());
	}
%>
<script type="text/javascript">
	window.onload = function()
	 {
         var appname = document.getElementById("appname").value;
		 var url;
			try{
				XMLHttp=new XMLHttpRequest();
			}catch (e){
				try{
					XMLHttp=new ActiveXObject("Msxml2.XMLHTTP");
				}catch (ea){
					try{
						XMLHttp=new ActiveXObject("Microsoft.XMLHTTP");						
					}catch (eaa){
						alert("Your browser does not support AJAX!");
						return false;
					}
				}
			}
			XMLHttp.onreadystatechange=function()
			{
				if(XMLHttp.readyState==4)
				{
					var response= XMLHttp.responseText;
					var tr=response.split("#~#");
					jQuery("#header_menu").append(tr[0]);
					jQuery("#left_menu").append(tr[1]);
				}
			}
			url = "http://"+document.domain+":8080"+appname+"/WEB/jsp/jsp-modCommon/menulist.jsp";
			XMLHttp.open("get",url,true);
			XMLHttp.send(null);
	 }
</script>
<input type="hidden" id="appname" name="appname" value="<%=request.getContextPath()%>"/>
 			
			<!-- ============ End Project Name ============== -->
			
	<%--		<!-- ============ Start Menu section ============== -->
			<table class="NavBar table_font" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td valign="top">
						<div id="slidemenu1" class="slidetabsmenu1">
							<ul>
								<li>
									<a href="<%=request.getContextPath()%>/index.jsp?option=home" <% try{if((request.getParameter("option") == "home") || (request.getParameter("option").equals("home") || (request.getParameter("option").equals("")) || (request.getParameter("option").equals("null")))) { %> class="hilight" <% } }catch(Exception ex){%> class="hilight" <% }%>>
									<span>Home</span>
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/businessOwnerReg.jsp?role1=Administrator&option=register" <% try{if(request.getParameter("option").equals("register")){ %> class="hilight" <% } }catch(Exception ex){}%> >
    									<span>Register Business</span>
    								</a>
    							</li>
    							<!--<li>
									<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/businessUserReg.jsp?role1=BusinessUsers" >
    									<span>Fix Appointment</span>
    								</a>
    							</li>-->
    							<li>
    								<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/aboutus.jsp?option=aboutus"  <% try{if(request.getParameter("option").equals("aboutus")){ %> class="hilight" <% } }catch(Exception ex){}%>>
    									<span>About Us</span>
    								</a>
    							</li>
    							<!--<li>
    								<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/feedback.jsp" title="">
    									<span>Feedback</span>
    								</a>
    							</li>-->
    							<%
    								try
    								{
										if(session.getAttribute("logedroleid").equals(1))
										{
									%>
    							<li>
    								<a href="<%=request.getContextPath()%>/index.jsp?option=businessowner"  <% try{if(request.getParameter("option").equals("businessowner")){ %> class="hilight" <% } }catch(Exception ex){}%> rel="dropmenu1_c1">
    									<span>Admin</span>
    								</a>
    							</li>
    							<%
    									} 
									}
    								catch(Exception e){}
    							%>
    							
    							<%
    								try
    								{
										if(session.getAttribute("logedroleid").equals(2))
										{
								%>
      							<li>
      								<a href="<%=request.getContextPath()%>/index.jsp?option=business" <% try{if(request.getParameter("option").equals("business")){ %> class="hilight" <% } }catch(Exception ex){}%> rel="dropmenu2_c1">
      									<span>Business Owner</span>
      								</a>
      							</li>
   								<%
   										}
									}
    								catch(Exception e){}
    							%>
    							
    							<%
    								try
    								{
										if(session.getAttribute("logedroleid").equals(3))
										{
								%>
      							<li>
      								<a href="<%=request.getContextPath()%>/index.jsp?option=businessuser"  <% try{if(request.getParameter("option").equals("businessuser")){ %> class="hilight" <% } }catch(Exception ex){}%> title="Link 3" rel="dropmenu3_c1">
      									<span>Business User</span>
      								</a>
      							</li>
   								<%
   										}
									}
    								catch(Exception e){}
    							%>
    							
    							<%
    								try
    								{
    									if(session.getAttribute("logedroleid").equals(1) || session.getAttribute("logedroleid").equals(2) || session.getAttribute("logedroleid").equals(3))
    									{
    							%>
								<li>
									<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/logoutUsers.jsp" >
										<span>Logout</span>
									</a>
								</li> 
								<%
										}
    								}
    								catch(Exception e1){}
    							%>
							</ul>
						</div>
						<br style="clear: left;" />
						<br class="IEonlybr" />
						
						<!--1st drop down menu -->   
						<div id="dropmenu1_c1" class="dropmenudiv_c1">
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionList.jsp?currenttime=<%=currTime%>&option=businessowner">Subscription List</a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/globalSettings.jsp?currenttime=<%=currTime%>&option=businessowner">Global Settings</a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/businessList.jsp?currenttime=<%=currTime%>&option=businessowner">Business Activation </a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=businessowner">Change Password</a>
						</div>
						
						<!--2nd drop down menu -->  
                        <div id="dropmenu2_c1" class="dropmenudiv_c1" style="width: 150px">
						<!-- <a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/globalSettingByBusinessOwner.jsp?currenttime=<%=currTime%>&option=business">Global Settings</a> -->
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp?currenttime=<%=currTime%>&option=business">Facility List</a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business">View Appointments </a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=business">Change Password</a>
							<a href='<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=session.getAttribute("logeduserid")%>&qsroleid=<%=session.getAttribute("logedroleid")%>&currenttime=<%=currTime%>&option=business'>My Profile</a>
						</div>
						
						<!--3rd drop down menu -->  
						<div id="dropmenu3_c1" class="dropmenudiv_c1" style="width: 150px">
							<a href='<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=session.getAttribute("logeduserid")%>&qsroleid=<%=session.getAttribute("logedroleid")%>&currenttime=<%=currTime%>&option=businessuser'>My Profile</a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=businessuser">Change Password</a>
							<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=businessuser">View Appointments </a>
						</div>
							<script type="text/javascript">
								//SYNTAX: tabdropdown.init("menu_id", [integer OR "auto"])
								tabdropdown.init("slidemenu1")
							</script>
					</td>
				</tr>
			</table>
			</div>
			
			<div class="Global main_outer"></div>
			<div class="wrapper">
			<div class="menubanner"></div> --%>
			
			
			<!-- New theme Implement -->
			
	<div class="container-fluid ">
		
	<div class="main_area">
		<!-- Header Area  -->
		<div class="col-md-12 top-nav">
                <div>
                <div class="pull-left">
                <i class="fa fa-bars" aria-hidden="true"></i><a href="<%=initialConfig.SCHOOLINABOX%>"> 
                		<%if( institutesData.size()<=15){ %>
               					 <img alt="header"  border="0" class="sch_box" src="<%=request.getContextPath()%>/WEB/includes/images/centralschool_logo.png" /></a>
						<%} else{%>
				 			<img alt="header" border="0" class="sch_box institute_img" src="data:image/jpg;base64,<%=institutesData.get(15)%>" />
								<%}%>
               <a href="<%=request.getContextPath()%>/index.jsp">  <span class="lo">Appointment Management</span></a> 
                
                <!-- Dropdown Menu -->	
			<div class="dropdown home-dropdown">
			  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			   <i class="fa fa-caret-down" aria-hidden="true"></i>
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
				<li><a href="<%=initialConfig.CAS_EZSCHOOL%>">School Management</a></li>
				<%if(!session.getAttribute("logedroleid").equals(EzAppointmentConstant.STUDENT)){ %>
				<li><a href="<%=initialConfig.CAS_EZPERSONNEL%>">Human Resource Management</a></li>
				<%} %>
				<li><a href="<%=initialConfig.CAS_EZLIBRARY%>">Library Management</a></li>
				<li><a href="<%=initialConfig.CAS_CTMS%>">Transport Management</a></li>
				<li><a href="<%=initialConfig.CASBLOMS%>">Online Learning Management</a></li>
				<%--  <li><a href="<%=initialConfig.CAS_EZTICKET%>">Event Management</a></li> --%>
			  </ul>
			</div>
			<!-- End -->
                
                </div>
                <% 
                if (schoolIdHeader != 0) {             
									ArrayList schoolDetails = new ArrayList();
									schoolDetails = objHeader.getSchoolDetails(session.getAttribute("schoolId").toString());%>
                <h6 class="institute_name">
							School Name : <span class="inst_cls"><%=schoolDetails.get(3)%></span>
				</h6>
				<%}%>
                <%
    			try
    			{
    				if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN) || session.getAttribute("logedroleid").equals(EzAppointmentConstant.TEACHER) || session.getAttribute("logedroleid").equals(EzAppointmentConstant.STUDENT))
    				{
    			%>	<div class="pull-right welcome_padding">Welcome <%=session.getAttribute("logedusername")%>&nbsp;&nbsp;
					<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/logoutUsers.jsp">
					<i class="fa fa-power-off" aria-hidden="true"></i>&nbsp;<span class="">Logout</span></a>
					</div>
				<%
					}
    			}
    			catch(Exception e1){}
    			%>
                
                </div>
          </div> 
			<div class="row">
				<div class="col-md-3  padd-right menu_width">
                   <div class="menu_sec">
						<ul class="list-unstyled">
							<li onclick="activeclass(this)"> <a  href="<%=request.getContextPath()%>/index.jsp?option=home" <% try{if((request.getParameter("option") == "home") || (request.getParameter("option").equals("home") || (request.getParameter("option").equals("")) || (request.getParameter("option").equals("null")))) { %> class="hilight" <% } }catch(Exception ex){%> class="hilight" <% }%>>
							<i class="fa fa-tachometer" aria-hidden="true"></i><span class="navi"> Dashboard</span></a></li>
							 <%
					    	if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN))
						   { %>
							<%-- <li onclick="activeclass(this)"> <a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/businessOwnerReg.jsp?role1=SuperAdministrator&option=register" <% try{if(request.getParameter("option").equals("register")){ %> class="hilight" <% } }catch(Exception ex){}%> >
							<i class="fa fa-briefcase" aria-hidden="true"></i><span class="navi"> Register Business</span></a></li> --%>
							<%}%>
					<%-- 		<li onclick="activeclass(this)"> <a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/aboutus.jsp?option=aboutus"  <% try{if(request.getParameter("option").equals("aboutus")){ %> class="hilight" <% } }catch(Exception ex){}%>>
							<i class="fa fa-info-circle" aria-hidden="true"></i><span class="navi"> About us</span></a></li> --%>
              <%
    			 try
    			{
					if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.SCHOOLADMIN))
					{
			  %>
								<li data-toggle="collapse" data-target="#demo" >
								<a  href="#">
								<i class="fa fa-user" aria-hidden="true"></i><span class="navi"><%=role_name %></span>
								<span class="caret"></span></a>
								  <ul id="demo" class="collapse sub_menu  list-unstyled"> 
								  	<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/businessList.jsp">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Appointment  Activation</a></li>
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/userList.jsp">
									<i class="fa fa-caret-right" aria-hidden="true"></i>User Activation</a></li> 
									<%-- <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionList.jsp?currenttime=<%=currTime%>&option=businessowner">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Subscription List</a></li> --%>
									<%-- <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/globalSettings.jsp?currenttime=<%=currTime%>&option=businessowner">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Global Settings</a></li> --%>
								<%-- 	<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/businessList.jsp?currenttime=<%=currTime%>&option=businessowner">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Bussiness Activation</a></li> --%>
								<%-- 	<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=businessowner">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Change Password</a></li> --%>
									</ul>
									
									</li>
	 		    <%
    		         } 
				}
    				catch(Exception e){}
    				%>
    				
    				 <%
    			 try
    			{
					if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.TEACHER))
					{
			  %>
								<li data-toggle="collapse" data-target="#demo">
								<a href="#">
								<i class="fa fa-user" aria-hidden="true"></i></i><span class="navi"> <%=role_name %></span>
								<span class="caret"></span></a>
								  <ul id="demo" class="collapse sub_menu  list-unstyled"> 
									<%-- <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/globalSettingByBusinessOwner.jsp?currenttime=<%=currTime%>&option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Global Settings</a></li> 
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp?currenttime=<%=currTime%>&option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Facility List</a></li>
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>View Appointments</a></li>
								<%-- 	<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Change Password</a></li> --%>
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp?option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Appointment List</a></li>
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>View Appointments</a></li>
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=session.getAttribute("logeduserid")%>&qsroleid=<%=session.getAttribute("logedroleid")%>&currenttime=<%=currTime%>&option=business">
									<i class="fa fa-caret-right" aria-hidden="true"></i>My Profile</a></li>
									</ul>
									
									</li>
	 		    <%
    		         } 
				}
    				catch(Exception e){}
    				%>
    				
    				 <%
    			 try
    			{
					if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.STUDENT))
					{
			  %>
								<li data-toggle="collapse" data-target="#demo">
								<a href="#">
								<i class="fa fa-user" aria-hidden="true"></i><span class="navi"> <%=role_name %></span>
								<span class="caret"></span></a>
								  <ul id="demo" class="collapse sub_menu  list-unstyled">
								  <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key=loadall&currenttime=<%=currTime%>&option=businessuser">
									<i class="fa fa-caret-right" aria-hidden="true"></i>My Appointments</a></li> 
									<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=session.getAttribute("logeduserid")%>&qsroleid=<%=session.getAttribute("logedroleid")%>&currenttime=<%=currTime%>&option=businessuser">
									<i class="fa fa-caret-right" aria-hidden="true"></i>My Profile</a></li>
									<%-- <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=businessuser">
									<i class="fa fa-caret-right" aria-hidden="true"></i>Change Password</a></li> --%>
									
									</ul>
									
									</li>
	 		    <%
    		         } 
				}
    				catch(Exception e){}
    				%>

	<!--  Add Categories features in menu list -->
<%!
ArrayList countryList = new ArrayList();
ArrayList global_Settings = new ArrayList();
String default_country="";
String searchcountyid;
%>
<%
try
{
    cBSubscriptionManage objcBGlobalSettings = new cBSubscriptionManage();
    global_Settings=objcBGlobalSettings.getGlobalSettings();
    for(int i=0;i<global_Settings.size();i=i+2)
    {
    	if(global_Settings.get(i).equals("default_country"))
    	{
      		 default_country=(String)global_Settings.get(i+1);
    	}
    }
	cBCommonFunctions objcDCountry=new cBCommonFunctions();
    countryList =objcDCountry.getCountryDetails();
    objcBGlobalSettings =null;
    objcDCountry =null;
    String contry="";
    searchcountyid =session.getAttribute("CountryID").toString();
   contry = request.getParameter("countryid");
 String contryval="";
 contryval = objcDCountry.contryval(contry);
 %>
 <%
}
catch(Exception e)
{
	//flag=0;
}
%>
<%if(session.getAttribute("logedroleid").equals(EzAppointmentConstant.STUDENT)){ %>
    <li data-toggle="collapse" data-target="#demo1">
	<a href="#"><i class="fa fa-delicious" aria-hidden="true"></i><span class="navi"> Categories</span>
	<span class="caret"></span> </a>
	
	<ul id="demo1" class="collapse sub_menu	 list-unstyled">
			<% 
			cBProfileManagement objBoGetleftmenu=new cBProfileManagement();
			ArrayList leftmenucategories = new ArrayList();
		    leftmenucategories = objBoGetleftmenu.getCategories();
		    try{
		  	%>
						
				<% 
					for(int i=0;i<leftmenucategories.size();i=i+2)
					{
						String val=leftmenucategories.get(i).toString();
						//int business_id=objBoGetBuscity.getBusinessIdByUserId(session.getAttribute("logeduserid").toString(),val);
				%>
					<li>          
					<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?category_id=<%=leftmenucategories.get(i)%>&category_name=<%=leftmenucategories.get(i+1)%>" title=""><i class="fa fa-caret-right" aria-hidden="true"></i><%=leftmenucategories.get(i+1) %> </a>
					</li>
				<% 
				     }
				%>
				</ul>
			</li>
			<%
			} catch(Exception ee){
	
			}
			%>
		<%} %>		

      <%--  <%
    			try
    			{
    				if(session.getAttribute("logedroleid").equals(1) || session.getAttribute("logedroleid").equals(2) || session.getAttribute("logedroleid").equals(3))
    				{
    			%>
				    <li>
					<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/logoutUsers.jsp" >
					<i class="fa fa-home" aria-hidden="true"></i><span class="navi">Logout</span></a></li> 
				<%
					}
    			}
    			catch(Exception e1){}
    			%> --%>

			
			
		
   </ul>
</div>
</div>

  
	              <div class="col-md-9 main_con_width padd-right">
	                 	
	                 
			        <%--  <div class="menubanner">
			         <img src="<%=request.getContextPath()%>/WEB/includes/images/banner.jpg"></img>
			         </div> --%>
	                
	                 

    <script src="<%=request.getContextPath()%>/WEB/includes/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/WEB/includes/js/jquery.easing.min.js"></script>
	 <script src="<%=request.getContextPath()%>/WEB/includes/js/style_js.js"></script>
    

    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/WEB/includes/js/grayscale.js"></script>
    
	
</body>
</html>											 