<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ page language="java" %>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.cBCommonFunctions,java.util.*"%>



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

 
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery.validate.js"></script>
<script>
	$(document).ready(function() {
		$("#signupForm").validate({
			rules: {
				subname: "required",
				subdesc: "required",
				subAmount: "required",
			},
			messages: {
				subname: "Please enter subscription name",
				subdesc: "Please enter description",
				subAmount: "Please enter your lastname",
				 
			}
		});

		 
	});
	</script>

<%
int i=1;
int subscription_id=0;

try{
	
	subscription_id=Integer.parseInt(request.getParameter("subid"));
	
}
catch(Exception ee){	
	subscription_id=Integer.parseInt(request.getParameter("subid_hidden"));
	}%>

<div class="page-title">
       <h3>Subscription List</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                   <li><a href="#">Admin</a></li>
	                   <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionList.jsp?currenttime=<%=currTime%>&option=businessowner">Subscription List</a></li>
	                   <li><%if(subscription_id==0){ %>
                       Add Subscription
                      <%}else{%>
                         Update Subscription
                         <%} %></li>
	                   </ol>
	                 </div>
 </div>

<%@page import="com.sun.corba.se.spi.orb.ParserData"%>
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script> 


<%String msg=""; %>
<%try{
  session.getAttribute("message");
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
 }
 catch(Exception e){}	
 %>	

<%
ArrayList currency = new ArrayList();

		cBSubscriptionManage objcBGlobalSetting = new cBSubscriptionManage();
		try{
			
			currency.clear();
			currency=objcBGlobalSetting.getSettedCurrency();	
		}
		catch(Exception xxxx){ 
			
		}
	
		
	%>


<%
		cBSubscriptionManage objcBSubUpdate = new cBSubscriptionManage();
		ArrayList values = new ArrayList();
		try{
			values.clear();
			values=objcBSubUpdate.getSubscriptionDetails(subscription_id);	
		}
		catch(Exception xxxx){ 
			
		}

		
	%>

<div class="main-content well">
<% if(msg!="") {%>
<div class="allresultmesg"><span><%=msg %></span></div>
<% }%>

<div class="user_form">

<html:form action="subscription.do" styleId="signupForm">

<font style="color:black;font-size:11px">
<logic:messagesPresent>
   <bean:message key="errors.header"/>
   <ul>
   <html:messages id="error">
      <li><bean:write name="error"/></li>
   </html:messages>
   </ul><hr>
</logic:messagesPresent></font>

<div>
<%if(subscription_id==0){ %>
<h3>Add Subscription</h3>
<%}else{%>
<h3>Update Subscription</h3>
<%} %>


<div class="row">
 	<div class="col-md-6">
 		<div class="row">
 				<div class="col-md-4">
 				<div class="form-group">
                     <label><span class="red_star red">*</span><bean:message key="subscriptionmangeform.subname.displayname"/><span style="color: rgb(204, 0, 0);"></span></label>
                 </div>
                 </div>
                 <div class="col-md-8">
 					  <div class="form-group">    
                           <html:text styleClass="form-control" size="26" styleId="subname" property="subname"></html:text>
                       </div>
                  </div>
           </div>
    </div>
         <div class="col-md-6">
 		    <div class="row">
 				<div class="col-md-4">
 				  <div class="form-group">
                        <label><span class="red_star red">*</span><bean:message key="subscriptionmangeform.subdesc.displayname"/></label>
                  </div>
                  </div>
                  <div class="col-md-8">
 					  <div class="form-group">
                          <html:textarea styleClass="form-control" cols="25" rows="2" styleId="subdesc" property="subdesc"></html:textarea>
                      </div>
                  </div>
                  </div>
                  </div>
  <div class="row">
 	<div class="col-md-6">
 		<div class="row">
 			<div class="col-md-4">
 				<div class="form-group">
                   <label><span class="red_star red">*</span><bean:message key="subscriptionmangeform.subamount.displayname"/><span style="color: rgb(204, 0, 0);"></span></label>
                 </div>
              </div>
               <div class="col-md-8">
 					  <div class="form-group">
                          <html:text styleClass="form-control" size="10" styleId="subAmount" property="subamount" ></html:text>
                           </label>
                       </div>
               </div>
            </div>
      </div>
     <div class="col-md-6">
 		<div class="row">
 			<div class="col-md-4">
 				<div class="form-group">
      	            <label><span class="red_star red">*</span>Subscription Duration</label>
                 </div>
            </div>
            <div class="col-md-8">
 					  <div class="form-group">
                          <html:select property="duration" style="width: 60px;" styleClass="form-control">
	      				  <html:option value="1">1</html:option>
	      					<html:option value="2">2</html:option>
	     					 <html:option value="3">3</html:option>
	      						<html:option value="4">4</html:option>
							      <html:option value="5">5</html:option>
							      <html:option value="6">6</html:option>
							      <html:option value="7">7</html:option>
							      <html:option value="8">8</html:option>
							      <html:option value="9">9</html:option>
							      <html:option value="10">10</html:option>
							      <html:option value="11">11</html:option>
							      <html:option value="12">12</html:option>               
                                  </html:select>
                                 
                           </div>
                       </div>
                 </div>
</div>
</div>
<div class="btn_area text-center">

     <%if(subscription_id!=0){ %>
      		
      		<input name="updatesub" value="Update Subscription" type="submit" class="btn-success btn" > &nbsp;
		
		<%} else { %>
		
		<input name="addsub" value="Add Subscription" type="submit" class="btn-primary btn" > &nbsp;
		<%} %>
		<input name="cancel" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionList.jsp'" />
		
</div>	
<input type="hidden" name="subid_hidden" value="<%=subscription_id%>"/>
</div>
</html:form>
</div>
<% 
try
{
	//if(subscription_id!=0)
	if( (!request.getParameter("subid").equals("0")) || (!request.getParameter("subid_hidden").equals("0")) )
	{
%>
		<script>
		document.subscriptionmangeform.subname.value="<%=StringUtils.escape(values.get(1).toString())%>";
		document.subscriptionmangeform.subdesc.value="<%=StringUtils.escape(values.get(2).toString())%>";
		document.subscriptionmangeform.subamount.value="<%=StringUtils.escape(values.get(3).toString())%>";
		document.subscriptionmangeform.duration.value="<%=StringUtils.escape(values.get(4).toString())%>";
		</script>
<%
	}
}
catch(Exception notrr){}
%>


</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>

</div>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 

</div>
</div>
</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>