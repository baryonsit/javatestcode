<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ page import="modCommon.commonBo.cBCommonFunctions,java.util.*"%>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>

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
 <div class="page-title">
       <h3>Subscription List</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	      <!--              <li><a href="#">Admin</a></li> -->
	                   <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionList.jsp?currenttime=<%=currTime%>&option=businessowner">Subscription List</a></li>
	              </ol>
	         </div>
 </div>

<%
String passcurrTime="";
cBCommonFunctions getCurrTimee = new cBCommonFunctions();
passcurrTime = getCurrTimee.getCurrentTime();
//out.println("====="+passcurrTime);
%>

<%String permission="";String msg="";
cBCommonFunctions objBoCheckPerm = new cBCommonFunctions();%>
<%try{
  session.getAttribute("message");
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
 }
 catch(Exception e){}	
 %>	
<!-- <div  class="Content"> -->

<div class="main-content well">
<%
	String sub_name="";
	try{
	if(!request.getParameter("sub_name").equals("")){
		sub_name = request.getParameter("sub_name");
	}
}
catch (Exception e1){
	sub_name = "";
}%>
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

<%ArrayList values = new ArrayList();
		cBSubscriptionManage objcBSubscriptionList = new cBSubscriptionManage();
		try{
			values.clear();
			values=objcBSubscriptionList.getSubscriptionList(sub_name);	
		}
		catch(Exception xxxx){ 
			
		}	
	%>
	
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.3.2.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script> 

<% if(msg!="") {%>
<div class="allresultmesg"><span><%=msg %></span></div>
<% }%>



 <div class="seacrh_ar user_form">
<% permission="create_subscription";
try{
int y=objBoCheckPerm.hasPermission(permission,request);
if(y==1){%> 

	<input id="SearchBySubcription" class="flatbox form-control" type="text" placeholder="Subscription List"/>
	<input type="submit" name="search" class="btn-success btn" onclick="searchSubscription('<%=request.getContextPath()%>');" value="Search">
	<input  class="btn-primary btn"  name="add" value="Add" type="submit" onclick="window.location.href='<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionManage.jsp?subid=0'">
	 
	 <%}}catch(Exception cantadd){} %>
	 	 <% permission="delete_subscription";
	 	try{
int z=objBoCheckPerm.hasPermission(permission,request);
if(z==1){%> 
	<input class="btn-danger btn" onclick="deleteSubscription(<%=values.size()/5%>)" name="delete" value="Delete" type="submit">
 <%}}catch(Exception cantdel){} %>
</div>
  <div class="table_deg table-responsive main-content"> 
 <table class="table table-striped table-condensed">
  <thead>   	
    
    <tr>
      <th width="40"><input  id="checkall" name="all" type="checkbox" /></th>
      <th width="140">Subscription&nbsp;Name</th>
      <th width="140">Duration(in mnts)</th>
      <th width="140">Amount In 
              <%=currency.get(0) %></th>
      <th width="140">Description</th>
    </tr>
    <tbody>
    <% if(values.size()>0){	%>
    <%for(int i=0,j=0;i<values.size();i=i+5,j++) {%>
    <%int subid=0; %>
    
    <tr>
    
      <td><input class="innerchkbox"  id="<%=j%>" value="<%=values.get(i)%>" type="checkbox"></td>
      
      <% permission="update_subscription";
try{
int x=objBoCheckPerm.hasPermission(permission,request);
if(x==1){%> 
      <td style="width: 200px;"><a  onclick="window.location.href='<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/subscriptionManage.jsp?subid=<%=values.get(i)%>&currenttime=<%=passcurrTime%>'"><%=values.get(i+1)%></a></td>
      <%} else{ %>
      <td style="width: 200px;"><%=values.get(i+1)%></td>
      <%}}catch(Exception cantupdate){} %>
      <td style="width: 80px;"><%=values.get(i+4)%></td>
      <td style="width: 80px;"><%=values.get(i+3)%></td>
      <td style="width: 350px;"><%=values.get(i+2)%></td>
    </tr>  
         <%} %>

<%} else {%>
	<tr><td colspan="5"><center><b>NO RECORDS FOUND</b></center></td></tr>
	<%}%>
	
	
		
</tbody>
</div>
</table>
<div class="btn_area text-center">

	<input name="cancel" value="Cancel" type="button" class="btn-success btn" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />

</div>
	
<html:form action="deletesubscription.do">
<html:hidden property="subid_hidden" ></html:hidden>
<html:hidden property="selected_ids"></html:hidden>
</html:form>
</div>
</div>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>

</div>
</div>
</div>
</div>
  