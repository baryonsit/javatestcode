
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ page import="modFacility.facilityBo.cBFacilityManage,java.util.*"%>
<div class="page-title">
       <h3>Add Facility</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                   
	              </ol>
	         </div>
 </div>
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
<%String msg="";
ArrayList facility_id=new ArrayList();
%>
<%try{
	
	cBFacilityManage objBofacility_id=new cBFacilityManage();
	facility_id = objBofacility_id.getfacility_id();
	
  session.getAttribute("message");
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
 }
 catch(Exception e){}	
 %>	

<!-- ============ Content Panel ============== -->
<!-- <div class="Content"> -->
<div class="main-content well">
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script> 
 <!-- DatePicker  jquery library implementation -->
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB/includes/css/jquery-ui.css" /> 
 <script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-ui.js"></script> 
<script>
	$(function() {	
		$("#facoptionaldate").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange: "1917:2050",
			dateFormat : "yy-mm-dd"
		});
	});
</script>
<div class="user_form"> 
 <h3>Other Holidays For Your Facility</h3>
<div class="row">
 		<div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
  	                 <input type="hidden" id="aval" name="aval" value="0">
      	              <label>Date:</label>
      	         </div>
      	      </div>
      	     <div class="col-md-8">
 				<div class="form-group">
      	          <input type="text" Class="flat form-control" name="facoptionaldate" id="facoptionaldate" />
      	        </div>
      	     </div>
      	   </div>
      	 </div>
      	 <div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group"> 
      	              <label> Desc:</label>
      	           </div>
      	      </div>
      	    <div class="col-md-8">
 				<div class="form-group">
      	          <input type="text" Class="flat form-control" name="facoptionaldesc" id="facoptionaldesc" value=""/>
      	          
      	    </div>
           </div>
      			
      	   
     </div>
    </div>
 </div>
 </div>
 <div class="table_deg table-responsive main-content">
 <table class="table table-striped table-condensed" id="holiday_table">
      		<tbody></tbody>
 </table></div>
	<div class="btn_area text-center">
	        <input type="button" id="Add" value="Add" name="Add" class="btn-primary btn" onclick="addholid();" >
      	   <input name="delete" value="Delete" id="delete" type="button" class="btn-danger btn" onClick="removeholid();"/>
			<input type="submit" value="Save" id="save" name="save" class="btn-success btn" onClick="add('<%=request.getContextPath()%>');">
			<input name="close" id="close" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityList.jsp'" />
	</div>
<input type="hidden" id="SDate" name="SDate" value="<%=facility_id.get(1)%>">
<input type="hidden" id="TDate" name="TDate" value="<%=facility_id.get(2)%>">
<input type="hidden" id="function" name="function" value="insert">
<input type="hidden" id="facid_hidden" name="facid_hidden" value="<%=facility_id.get(0)%>">
</div>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 

</div>
</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>
