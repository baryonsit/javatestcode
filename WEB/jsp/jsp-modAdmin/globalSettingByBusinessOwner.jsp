<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>

<%
String username=(String) session.getAttribute("logedusername");
if(username==null)
{
	response.sendRedirect(request.getContextPath()+"/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
}

%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>

<div class="page-title">
       <h3>Global Setting</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                   <li><a href="#">Bussiness Owner</a></li>
	                    <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/globalSettingByBusinessOwner.jsp?currenttime=<%=currTime%>&option=business">Global Setting</a></li>
	              </ol>
	         </div>
 </div>

<%@ page import="javax.servlet.http.*"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery.min.js"></script>

<!-- <div  class="Content"> -->

<div class="main-content well">

<%
ArrayList global_settings = new ArrayList();

		cBSubscriptionManage objcBGlobalSetting = new cBSubscriptionManage();
		try
		{
			global_settings.clear();
			global_settings=objcBGlobalSetting.getGlobalSettings();
		}
		catch(Exception xxxx){ 
			
		}
	
		
	%>
	<%
		cBCommonFunctions objBoGetCountries=new cBCommonFunctions();
		ArrayList countries = new ArrayList();
		countries = objBoGetCountries.getCountryDetails();
	%>

<html:form action="globalsettingbybusinessowner.do">

<div class="user_form">
<div class="row">
 		<div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
    	                <label><span class="red_star red">*</span>Default Country</label>
    	            </div>
    	        </div>
 		<div class="col-md-8">
 					  <div class="form-group">
 		                   <html:select property="default_country_by_bo" styleId="dcbybo" styleClass="form-control">
 		
 			<%
 				for(int k = 0; k < countries.size(); k=k+2)
 				{
 			%> 		
					<html:option  value="<%=countries.get(k).toString()%>"><%=countries.get(k+1)%></html:option>
			<%
				}
			%>
 		    </html:select>
		   </div>
		 </div>
	 </div>
</div>
</div>
<div class="btn_area text-center">
			<input type="submit" value="Save" name="save" class="btn-success btn">
			<input name="cancel" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'"/>
</div>		
</div>
</html:form>
</div>
 <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 


</div>
</div>
</div>

<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>

  