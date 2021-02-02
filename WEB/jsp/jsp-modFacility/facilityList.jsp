<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>

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
       <h3>Appointment  List</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                  <!--  <li><a href="#">Bussiness Owner</a></li> -->
	                   <li>Appointment list</li>
	                 
	              </ol>
	         </div>
</div>
<%String msg=""; int i=0,j=0;String errorMsg="";%>

<%@ page import="modFacility.facilityBo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.cBCommonFunctions,java.util.*"%>

<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.3.2.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>


<%
String timeforfacmang="";
cBCommonFunctions getCurrTimeee = new cBCommonFunctions();
timeforfacmang = getCurrTimeee.getCurrentTime();
//out.println("====="+timeforfacmang);
%>


<%try{
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
 
 }
 catch(Exception e){}	
 %>
 <%try{
  errorMsg=session.getAttribute("errorMessage").toString();
  session.removeAttribute("errorMessage");
 }
 catch(Exception e){}	
 %>		
 <% String permission="";
cBCommonFunctions objBoCheckPerm = new cBCommonFunctions();%>
<%
String facilitytype="";
String search_by_facname="";
try{
	if(request.getParameter("status").equals("public")){
		facilitytype = request.getParameter("status");
	}
	else if(request.getParameter("status").equals("private")){
		facilitytype = request.getParameter("status");
	}
	else if(request.getParameter("status").equals("All")){
		facilitytype = request.getParameter("status");
	}
}
catch (Exception e1){
	facilitytype = "All";
}


try{
	if(!request.getParameter("search_by_facname").equals("")){
		search_by_facname = request.getParameter("search_by_facname");
	}
}
catch (Exception e1){
	search_by_facname = "";
}
//String facilitytype = request.getParameter("facilitytype");
//String search_by_facname = request.getParameter("search_by_facname");

ArrayList values = new ArrayList();
		
cBFacilityManage objcBFacList = new cBFacilityManage();
		
	
cBCommonFunctions obj = new cBCommonFunctions();

%>
 
<!-- <div  class="Content"> -->

<div class="main-content well">
 <%if(errorMsg!="") {%>
		<div class="allErrormesg"><span><%=errorMsg %></span></div> 
	<%} %>
<% if(msg!="") {%>
<div class="allresultmesg"><span><%=msg %></span></div>
<% }%>
<div class="user_form">	
	
<form name="addfacilityform">
<%
try{
	String userid = session.getAttribute("logeduserid").toString();
	String businessId = objcBFacList.getBusinessId(userid);
	values.clear();
	//calling getuser method to get buyer information
	//and storing values in an array called values***********/
	int schoolId = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")) : 0;
	values=objcBFacList.getFacilityList(facilitytype,search_by_facname,userid,schoolId);
	
%>

<div class="seacrh_ar sr-ar">	
     <select style="text-align: left;" class="form-control" name="status" id="showFacilityByOption">
						<option value="All">All</option>
						<option value="public">Public</option>
						<option value="private">Private</option>
	                    </select>
	<input type="text" class="flatbox form-control" name="search_by_facname" value="<%=search_by_facname%>" id="searchFacilityByName"  placeholder="Appointment Name"/>
	
	<input name="search" class="btn-success btn" value="Search" type="submit"
				onClick="filterfacility('<%=request.getContextPath()%>');" />

<% permission="create_facility";
int x=objBoCheckPerm.hasPermission(permission,request);
if(x==1){%> 
 
 <!--  --><input name="add" class="btn-primary btn" value="Create New" type="button" onclick="window.location.href='<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityManage.jsp?facid=0'"/>
 
<%} %>
<% permission="delete_facility";
int y=objBoCheckPerm.hasPermission(permission,request);
if(y==1){ if(values.size()>0){	%> 
	<input name="delete" value="Delete" type="button" onclick="deleteRecord(<%=values.size()/6%>)" class="btn-danger btn" />
 <%} }%>  
</div>
      
<table class="table table-striped table-condensed">
	   
   <tr>
	<td rowspan="2"><input id="checkall" type="checkbox" /></td>
      <td rowspan="2" ><b>Appointment  Name</b></td>
      <td rowspan="2" ><b>Facility Type</b></td>
      <td rowspan="2" ><b>Status</b></td>
      <td colspan="2"><b>Appointment Date</b></td>
      <td colspan="2"><b>Appointment Time</b></td>
    </tr>

    <tr>
      <td>From</td>
      <td>To</td>
      <td>From</td>
      <td>To</td>

    </tr>
  <tr>
 <%if(values.size()>0){		
	%>
<%for(i=0,j=0;i<values.size();i=i+9,j++) {%>
<%int facid=0; %>
    
      <td ><input type="checkbox" class="innerchkbox" id="<%=j%>" value="<%=values.get(i+5)%>"></td>
   <% permission="update_facility";
int z=objBoCheckPerm.hasPermission(permission,request);
if(z==1 && values.get(i+8).equals("1")){%>  
      <td   >
      <label class="facility_name blue"  onclick="window.location.href='<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityManage.jsp?facid=<%=values.get(i+5)%>&fac_buis_id=<%=values.get(i+6)%>&currenttime=<%=timeforfacmang%>'"><%=values.get(i)%></label></td>
<%} else{ %>
       <td  style="width: 120px;">
       <label><%=values.get(i)%></label></td>
    <%} %>  
      <td><%=values.get(i+7)%></td>
      <td><%=values.get(i+8).equals("1")?"Active":"InActive"%></td>
      <td>  <%=obj.getDateFormatter(values.get(i+1).toString())%></td>
      <td> <%=obj.getDateFormatter(values.get(i+2).toString())%></td>
      <td><%=values.get(i+3)%></td>
      <td ><%=values.get(i+4)%></td>
    </tr>
     <%} %>  
<%
}
else{	%>
<tr><td colspan="7"><center><b>NO RECORDS FOUND</b></center></td>
</tr>
	
<%}
%>
</table></td></tr>

<tr>
<div class="btn_area text-center">
<input class="btn-danger btn" type="button" value="Cancel" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />
</div>
</td>
</tr>
</tbody>
</table>
<%
}
catch(Exception xxxx){ %>
	
<% }
%>
</form>
</div>
<br/>
<html:form action="deletefacility.do">
<html:hidden property="facid_hidden"></html:hidden>
<html:hidden property="selected_ids"></html:hidden>
<input type="hidden" name="facilitytype" id="facilitytype" value="<%=facilitytype%>" />
</html:form>

</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 

<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>


<% if(!facilitytype.equals(null)){ %>
<script>
    document.getElementById("showFacilityByOption").value = document.getElementById("facilitytype").value;
</script>
<%} %>
</div>
</div>
</div>



</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>