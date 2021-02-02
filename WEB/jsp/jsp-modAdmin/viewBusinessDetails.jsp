<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>

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
       <h3>Appointment Details </h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                <!--    <li><a href="#">Admin</a></li> -->
	                    <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/businessList.jsp?currenttime=<%=currTime%>&option=businessowner">Business Activation</a></li>
	                    <li>Appointment Details</li>
	              </ol>
	         </div>
 </div>
<%String msg=""; %>
<%try{
  session.getAttribute("message");
  msg=session.getAttribute("message").toString();
  session.removeAttribute("message");
  
 }
 catch(Exception e){}	
 %>	

<%
String business_id = request.getParameter("businessid");

ArrayList busiDetailsarr1 = new ArrayList();
cBBusinessList objcBBussList = new cBBusinessList();
try{
	busiDetailsarr1.clear();
	
	busiDetailsarr1 = objcBBussList.viewBusinessDetails1(business_id);
}
catch(Exception xxxx){ 
	
}

ArrayList busiDetailsarr2 = new ArrayList();
try{
	busiDetailsarr2.clear();
	
	busiDetailsarr2 = objcBBussList.viewBusinessDetails2(business_id);
}
catch(Exception xxxx){ 
	
}

%>

<!-- ============ Content Panel ============== -->
<!-- <div  class="Content"> -->

<div class="main-content well">
<div>
	
<form>

<div class="table_deg table-responsive main-content">
<h3>Appointment Details</h3>

	<table class="table table-striped table-condensed">
	<%for(int j=0;j<busiDetailsarr1.size();j=j+12) {%>
		<tr>
		    <th>Appointment Name</th>
		    <td width="180px"><%=busiDetailsarr1.get(j)%></td>
		    <th>Subscription Type</th>
		    <td width="180px"><%=busiDetailsarr1.get(j+10)%></td>
		</tr>
		<tr>
		    <th>Appointment Start Date</th>
		    <td><%=busiDetailsarr1.get(j+1)%></td>
		    <th>Appointment End Date</th>
		    <td><%=busiDetailsarr1.get(j+2)%></td>
		</tr>
		<tr>
		    <th>Category</th>
		    <td><%=busiDetailsarr1.get(j+3)%></td>
		    <th>Address</th>
		    <td>
			<%=busiDetailsarr1.get(j+4)%>
			<%=busiDetailsarr1.get(j+5)%>
		    </td>
		</tr>
		<tr>
		    <th>City</th>
		    <td><%=busiDetailsarr1.get(j+6)%></td>
		    <th>Zip Code</th>
		    <td><%=busiDetailsarr1.get(j+7)%></td>
		</tr>
		<tr>
		    <th>State</th>
		    <td><%=busiDetailsarr1.get(j+8)%></td>
		    <th>Country</th>
		    <td><%=busiDetailsarr1.get(j+9)%></td>
		</tr>
	<% } %>
</table>
</div>
<div class="table_deg table-responsive main-content">
<h3>Owner Personal Information</h3>
<table class="table table-striped table-condensed">
 <%for(int i=0;i<busiDetailsarr2.size();i=i+12) {%>
		<tr>
		    <th>Owner Name</th>
		    <td width="200px"><%=busiDetailsarr2.get(i)%></td>
		    <th>First Name</th>
		    <td width="200px"><%=busiDetailsarr2.get(i+1)%></td>
		</tr>
		<tr>
		    <th>Middle Name</th>
		    <td><%=busiDetailsarr2.get(i+2)%></td>
		    <th>Last Name</th>
		    <td><%=busiDetailsarr2.get(i+3)%></td>
		</tr>
		<tr>
		    <th>Email Id</th>
		    <td><%=busiDetailsarr2.get(i+4)%></td>
		    <th>Contact No.</th>
		    <td><%=busiDetailsarr2.get(i+5)%></td>
		</tr>
		<tr>
		    <th>Address</th>
		    <td>
			<%=busiDetailsarr2.get(i+6)%>
			<%=busiDetailsarr2.get(i+7)%>
		    </td>
		    <th>City<br>Zip Code</th>
		    <td><%=busiDetailsarr2.get(i+8)%><br><%=busiDetailsarr2.get(i+9)%></td>
		</tr>
		<tr>
		    <th>State</th>
		    <td><%=busiDetailsarr2.get(i+10)%></td>
		    <th>Country</th>
		    <td><%=busiDetailsarr2.get(i+11)%></td>
		</tr>
	<% } %>
	</table>
</div>
</div>
</form>
<div class="btn_area text-center">
<input  name="add" value="Cancel" type="submit" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/businessList.jsp'" />
</div>

</div>




<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> 

</div>
</div>
</div>
</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>
