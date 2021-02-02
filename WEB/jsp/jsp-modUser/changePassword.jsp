<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modAppointment.appointmentBo.*,java.util.*"%>

<%@ page import="org.apache.struts.action.Action" %> 
<%@ page import="org.apache.struts.action.ActionErrors" %>
<%@ page language="java" %>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic"%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<input type="hidden" id="refreshed" value="no">



<%
String username=(String) session.getAttribute("logedusername");
if(username==null)
{
	response.sendRedirect(request.getContextPath()+"/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
}
%>

<div class="page-title">
       <h3>Change Password</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                   <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/changePassword.jsp?currenttime=<%=currTime%>&option=businessowner">Change Password</a></li>
	              </ol>
	         </div>
 </div>

<%
String cptimefromqs = "";
String cptime = "";
try
{
	if(!request.getParameter("currenttime").equals(null));
	{
		cptimefromqs = request.getParameter("currenttime");
	}
}
catch(Exception exp)
{
	
	cptimefromqs = "";
	
}
%>




<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery.validate.js"></script>
<script>
 
$(document).ready(function() {
		$("#signupForm").validate({
			rules: {
				currpass: "required",
				newpass: "required",
				confpass: "required",
			},
			messages: {
				currpass: "Please enter current password",
				newpass: "Please enter new password",
				confpass: "Please enter confirm password",
				 
			}
		});

		 
	});
</script>


<!-- ============ Content Panel ============== -->

<div class="main-content well">
<%String msg=""; %>
<%try{

  session.getAttribute("message");
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
 }
 catch(Exception e){
	 
 }	
%>	
<%@page import="com.sun.mail.iap.Response"%>

<logic:messagesPresent>
   <bean:message key="errors.header"/>
   <ul>
   <html:messages id="error">
      <li><bean:write name="error"/></li>
   </html:messages>
   </ul><hr>
</logic:messagesPresent>

<% if(msg!="") {%>
<div class="allresultmesg"><span><%=msg %></span></div>
<% }%>

<html:form action="changepassword" styleId="signupForm">
<%
String sessionun = "";
try{
		sessionun = session.getAttribute("logedusername").toString();
}
catch(Exception zzz){}
	
%>
<div class="user_form">
<form  class="user_form" >

			<input type="hidden" size="20" name="uname" value="<%=sessionun%>" />
			<input type="hidden" name="hidden_cptime" id="hidden_cptime" value="<%=cptimefromqs %>" size="10" />
	
<div class="row">
	<div class="col-md-6">
		<div class="row">
				<div class="col-md-4">
				  <div class="form-group">
					 <label class="text-right"><span class="red">*</span><bean:message key="changepasswordForm.currpass.displayname"/></label>
				  </div>
				 </div>
				 <div class="col-md-8">
				  <div class="form-group">
					 <html:password styleClass="flatbox form-control" styleId="currpass" size="22" property="currpass" />
				  </div>
			    </div>	
			</div>
		</div>
		<div class="col-md-6">	
              <div class="row">
				<div class="col-md-4">
				  <div class="form-group">
					 <label class="text-right"><span class="red">*</span><bean:message key="changepasswordForm.newpass.displayname"/></label>
				  </div>
				 </div>
				<div class="col-md-8">
				  <div class="form-group">
					 <html:password styleClass="flatbox form-control" styleId="newpass" size="22" property="newpass" />
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
					 <label class="text-right"><span class="red">*</span><bean:message key="changepasswordForm.confpass.displayname"/></label>
				  </div>
				 </div>
				<div class="col-md-8">
				  <div class="form-group">
					 <html:password styleClass="flatbox form-control" styleId="confpass" size="22" property="confpass"  />
				  </div>
			    </div>		
         </div>
    </div>
</div>
<div class="btn_area text-center">
	<input name="save" value="Save" type="submit" class="btn-primary btn" />
	<input name="cancel" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />
</div>   
</form>
  </div>						
</html:form>
</div>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
</div>
</div>
</div>
</div>

<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>