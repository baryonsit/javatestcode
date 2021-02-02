<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>

<%
	String username = (String) session.getAttribute("logedusername");
	if (username == null) {
		response.sendRedirect(request.getContextPath() + "/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
	}
	int schoolId = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")) : 0;
%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<div class="page-title">
	<h3>Appointment  List</h3>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
			<!--  <li><a href="#">Admin</a></li> -->
			<li>Appointment  Activation</li>
		</ol>
	</div>
</div>
<%
	String msg = "";
%>
<%
	try {
		session.getAttribute("message");
		msg = session.getAttribute("message").toString();
		session.removeAttribute("message");
	} catch (Exception e) {
	}
%>

<%
	String searchKey = "";
	try {
		searchKey = request.getParameter("searchKey");
		if (searchKey == null) {
			searchKey = "";
		}
	} catch (Exception ee) {

	}
%>

<%
	String timeforfacmang = "";
	cBCommonFunctions getCurrTimeee = new cBCommonFunctions();
	timeforfacmang = getCurrTimeee.getCurrentTime();
	List<String> appointmentEventList = new ArrayList();

	cBBusinessList objcBBussList = new cBBusinessList();
	appointmentEventList = objcBBussList.getAppointmentsList(searchKey,schoolId);

	cBCommonFunctions objBoGet = new cBCommonFunctions();
	ArrayList statuslist = new ArrayList();
	statuslist = objBoGet.getstatusList();
	
	cBCommonFunctions obj = new cBCommonFunctions();
	
%>

<link rel="Stylesheet" media="screen"
	href="<%=request.getContextPath()%>/WEB/includes/css/pagination.css" />
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.3.2.js"></script>
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/virtualpaginate-table.js"></script>
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>

<!-- ============ Content Panel ============== -->

<div class="main-content well">

	<%
		if (msg != "") {
	%>
	<div class="allresultmesg">
		<span><%=msg%></span>
	</div>
	<%
		}
	%>
	<html:form action="businesslistopp.do">
		<!-- <div class="common_middle">
            <h2>Business List</h2> -->
		<div class="seacrh_ar user_form">
			<input id="search" class="flatbox form-control" type="text"
				name="search" placeholder="Appointment  Name"
				value="<%=searchKey%>"> <input type="button" name="dosearch"
				value="Search" class="btn-success btn"
				onclick="appointmnetEventSearch('<%=request.getContextPath()%>');">
		</div>
		<div class="table_deg table-responsive main-content">
			<table class="table table-striped table-condensed">
				<thead>
					<tr>
						<th>Appointment  Name</th>
						<th>Appointment  Start Date</th>
						<th>Appointment  End Date</th>
						<th>Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0, k = 1; i < appointmentEventList.size(); i = i + 7, k++) {
							String startDate = obj.getDateFormatter(appointmentEventList.get(i + 2).toString());
							String endDate = obj.getDateFormatter(appointmentEventList.get(i + 3).toString());
					%>
					<tr class="virtualpage">
						<td><%-- <a
							href="<%=request.getContextPath()%>/WEB/jsp/jsp-modFacility/facilityManage.jsp?facid=<%=appointmentEventList.get(i)%>"> --%>
								<%=appointmentEventList.get(i + 1)%>
						</a></td>
						<td><%=startDate%></td>
						<td><%=endDate%></td>
						<td><select name="status" Class="form-control"
							id="status<%=k%>">
								<%
									for (int j = 0; j < statuslist.size(); j = j + 2) {
												if (statuslist.get(j).toString().equals(appointmentEventList.get(i + 6))) {
								%>
								<option value="<%=statuslist.get(j)%>" selected="selected"><%=statuslist.get(j + 1)%></option>
								<%
									} else {
								%>
								<option value="<%=statuslist.get(j).toString()%>"><%=statuslist.get(j + 1)%></option>
								<%
									}
											}
								%>
						</select></td>
						<td><input class="btn-success btn" value="Update"
							onclick="return updateAppointmentEventStatus(<%=appointmentEventList.get(i)%>,<%=k%>)"
							type="submit" /></td>
					</tr>

					<%
						}
							if (appointmentEventList.size() == 0) {
					%>
					<tr>
						<td colspan="5">No Record Found</td>
					</tr>

					<%
						}
					%>
					<tr>
						<td colspan="5">
							<div id="paginatediv" class="paginationstyle">
								<a href="#" rel="previous">Prev</a> <span class="flatview"></span>
								<a href="#" rel="next">Next</a>
							</div>
						</td>
					</tr>
					  <input type="hidden" id="typeof_hidden" name="typeof_hidden" value="updateAppointmentStatus">

				</tbody>
			</table>
			<div class="btn_area text-center">
				<input class="btn-danger btn" type="button" value="Cancel"
					onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />

			</div>
		</div>


		<script type="text/javascript">
var pagecontent=new virtualpaginate({

 piececlass: "virtualpage", //class of container for each piece of content
 piececontainer: "tr", //container element type (ie: "div", "p" etc)
 pieces_per_page: 10, //Pieces of content to show per page (1=1 piece, 2=2 pieces etc)
 defaultpage: 0, //Default page selected (0=1st page, 1=2nd page etc). Persistence if enabled overrides this setting.
 wraparound: true,
 persist: true //Remember last viewed page and recall it when user returns within a browser session?
})

pagecontent.buildpagination(["paginatediv"]);

</script>



		<html:hidden property="businessid_hidden"></html:hidden>
		<html:hidden property="selected_ids"></html:hidden>
		<html:hidden property="statusname"></html:hidden>
		<html:hidden property="hidden_busname"></html:hidden>
	</html:form>





</div>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
</div>
</div>
</div>
</div>

