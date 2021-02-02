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
	                   <li><a href="#">Admin</a></li>
	                   <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/globalSettings.jsp?currenttime=<%=currTime%>&option=businessowner">Global Setting</a></li>
	              </ol>
	         </div>
 </div>

<div class="main-content well">


<%
ArrayList global_settings = new ArrayList();

		cBSubscriptionManage objcBGlobalSetting = new cBSubscriptionManage();
		try{
			
			global_settings.clear();
			//calling getuser method to get buyer information
			//and storing values in an array called values***********/
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
	<% 
	cBCommonFunctions objBoGetCurrencies=new cBCommonFunctions();
	ArrayList currencies = new ArrayList();
	currencies = objBoGetCurrencies.getCurrencies();
	%>
	
<div class="user_form">
<html:form action="globalsetting">
<!-- <div class="common_middle">
	<h2>Global Setting </h2> -->
<form name="" method="post" class="user_form">


      	<!-- <td style="text-align: center;">Default Country</td>
 		<td style="text-align: left;"> -->
 	<!--  Form  -->
 	<div class="row">
 		<div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
					 <label class="text-right"><span class="red_star red">*</span>Default Country</label>
				  </div>
 				</div>
 				<div class="col-md-8">
 					  <div class="form-group">
						  <html:select property="defaultcountry" styleClass="form-control">
							<%
		 		         for (int k = 0; k < countries.size(); k=k+2) {
		 		
				          if ((Integer.parseInt(global_settings.get(1).toString())==Integer.parseInt(countries.get(k).toString()))) {
				            %>
				                 <option value="<%=countries.get(k)%>" selected><%=countries.get(k+1)%></option>
				            <%
				            } else {
				            %>
				                 <option  value="<%=countries.get(k)%>"><%=countries.get(k+1)%></option>
				            <%
					             }
				                 }
				            %>
		 		
						</html:select>
			    	</div>
 				</div>
 			</div>
 		</div><!-- End Of Col-6 -->
 		<div class="col-md-6">
 			<div class="row">
 				<div class="col-md-4">
 					<div class="form-group">
					 <label class="text-right"><span class="red_star red">*</span>Default Currency</label>
				  </div>
 				</div>
 				<div class="col-md-8">
				  <div class="form-group">
				  <html:select property="defaultcurrency" styleClass="form-control">
				<%
 		                for (int k = 0; k < currencies.size(); k=k+2) {
 			
 			
		                  if (Integer.parseInt(global_settings.get(3).toString())== Integer.parseInt(currencies.get(k).toString())) {
		         %>
		
		                <option value="<%=currencies.get(k)%>" selected><%=currencies.get(k+1)%></option>
		         <%
		                 } else {
		          %>
		               <option value="<%=currencies.get(k)%>"><%=currencies.get(k+1)%></option>
		         <%
			             }
		                  }
		          %>
 		
		</html:select>
	          </div>
              </div>
 			</div>
 		</div><!-- End Of Col-6 -->
 	</div>
 		<div class="btn_area text-center">
			<input type="submit" value="Save" name="save" class="btn-primary btn">
			<input name="cancel" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'"/>
	

    </div>
    </div>

</form>
</html:form>
</div>


<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
</div>
</div>
</div>
</div>
</div>	
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>
  