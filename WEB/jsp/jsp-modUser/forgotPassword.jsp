<%@ page import="modCommon.commonDo.*,java.util.*"%>

<%@ page language="java" %>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic" %>

<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>

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

<html:form action="forgotpassword.do">
<div class="forgotpassword common_middle">
<h2>Forgot Password</h2>

<table  border="0" cellpadding="5" cellspacing="5">

  <tbody>
    <tr>
      <td align="right">
      		<font color="red">*</font><bean:message key="forgotpasswordForm.passemail.displayname"/>
      </td>
      <td>:</td>
      <td>
      		<html:text style="border: 1px solid green;" size="25" property="passemail" />
      </td>
    </tr>

    <tr align="center">
      <td colspan="3">
      		<input name="send" value="Send Password" type="submit" class="flatbox_btn" >
      		<input name="cancel" value="Cancel" type="button" class="flatbox_btn" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />
            
      </td>
    </tr>

  </tbody>
</table>

</div>

</html:form>


</div>
<%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
