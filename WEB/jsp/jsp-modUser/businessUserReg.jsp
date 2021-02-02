<%@ page import="modCommon.commonDo.*,java.util.*"%>

<%@ page import="org.apache.struts.action.Action" %> 
<%@ page import="org.apache.struts.action.ActionErrors" %>
<%@ page language="java" %>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/businessUserReg.js"></script>

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

<%
	cBProfileManagement objBoGetCategories = new cBProfileManagement();
	ArrayList categoryList = new ArrayList();
	categoryList = objBoGetCategories.getCategories();
%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>



<!-- ============ Content Panel ============== -->
<div class="">
<div class="col-md-12 main-con-center">

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
<div  class="Content">
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

<table height="124px" width="420px" class="table_font" border="0" cellpadding="2" cellspacing="2">
	<tr>
		<td>Category</td>
		<td>
			<select style="flatbox"	style="width:165px;" id="fixCategory" >
				<%
					for (int cat = 0; cat < categoryList.size(); cat=cat+2)
					{
				%>
					<option value="<%=categoryList.get(cat + 1)%>"><%=categoryList.get(cat + 1)%></option>
				<%
					}
				%>
			</select>
		</td>
		
		<td>Business</td>
		<td>
			<select style="flatbox"	style="width:165px;" id="fixBusiness" >
				
			</select>
		</td>
	</tr>
</table>

</div>
</div>
</div>
</div>
</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>