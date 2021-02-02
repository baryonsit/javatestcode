<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.cBCommonFunctions,java.util.*"%>
<%@ page
	import="modCommon.commonBo.cBDisplayBusinessAndFacilities,java.util.*"%>


<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/virtualpaginate-table.js"></script>
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>

<%String categoryName = request.getParameter("category_name");
String category_Id = request.getParameter("category_id");
%>

<!-- ============ Content Panel ============== -->

<%@page import="modFacility.facilityBo.cBFacilityManage"%>
<div class="page-title">
	<h3>Appointment  Category:<%=categoryName%></h3>
	<div class="page-breadcrumb">
		<ol class="breadcrumb">
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
				<li>Available Appointments</li>

		</ol>
	</div>
</div>
<!-- <div  class="Content"> -->

<div class="main-content well">
	<%
		ArrayList listfacilities = new ArrayList();
		ArrayList details = new ArrayList();
		//	ArrayList flist = new ArrayList();

		cBCommonFunctions objBoGet = new cBCommonFunctions();
		ArrayList statuslist = new ArrayList();
		statuslist = objBoGet.getstatusList();

		String cat_id = "";
		String c_name = "";
		String searchkey = "";
		int business_id = 1;
		boolean flag = false;

		try {

			cat_id = session.getAttribute("c_id").toString();
			c_name = session.getAttribute("c_name").toString();
			searchkey = session.getAttribute("searchkey").toString();
		} catch (Exception ee) {

		}
		String loBusinessName = "";
	%>
	<%
		String passBname = "";
		String passFname = "";
		String passfac_type = "";

		String c_id = request.getParameter("category_id");

		cBDisplayBusinessAndFacilities objBoCList = new cBDisplayBusinessAndFacilities();
		int schoolId = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")) : 0;
		listfacilities = objBoCList.fetchFacilitiesByBusiness(c_id,schoolId);
	%>

	<html:form action="deletefacility.do">
		<div class="table_deg table-responsive main-content">
			<!-- <h3>Appointments</h3> -->

			<table class="table table-striped table-condensed">
				<tr>
					<th>Sl.No</th>
					<th>Appointment  Name</th>
					<th>Description</th>
					<th>Appointment Type</th>
					<th>Click Here</th>

				</tr>
				<%
					try {
							if (listfacilities.size() == 0) {
				%>
				<tr>
					<td colspan="5">
						<center>
							<b>No Appointments Present In This Category</b>
						</center>
					</td>
				</tr>
				<%
					} else if (listfacilities.size() > 0) {
								int ct = 1;
								for (int val = 0, k = 0; val < listfacilities.size(); val = val + 5, k++) {
				%>
				<tr>
					<td><%=ct++%></td>
					<td><label><a
							href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilityDetails.jsp?fac_id=<%=listfacilities.get(val)%>&business_id=<%=business_id%>&category_name=<%=categoryName%>&category_id=<%=category_Id%>"><%=listfacilities.get(val + 1)%></a></label>
					</td>
					<td><%=listfacilities.get(val + 2)%></td>
					<td><%=listfacilities.get(val + 3)%></td>

					<td><a
						href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAppointment/eventCalendar.jsp?user_id=<%=session.getAttribute("logeduserid")%>&facility_id=<%=listfacilities.get(val)%>&bname=<%=loBusinessName%>&fname=<%=listfacilities.get(val + 1)%>&fac_type=<%=listfacilities.get(val + 3)%>&category_name=<%=categoryName%>&category_id=<%=category_Id%>">Book
							Appointment </a></td>




				</tr>
				<%
					}
							}
						} catch (Exception ex) {

						}
				%>
				<tr class="user_page_next">
					<td colspan="7" align="center">

						<div id="scriptspaginate" class="paginationstyle">
							<a href="javascript:;" rel="previous">previous</a> <span
								class="flatview"></span> <a href="javascript:;" rel="next">Next</a>
						</div>
					</td>
				</tr>
			</table>
			<html:hidden property="facid_hidden"></html:hidden>
			<html:hidden property="selected_ids"></html:hidden>
			<html:hidden property="facility_status"></html:hidden>
		</div>
	</html:form>
	
	<div class="btn_area text-center">
		<input name="cancel" value="Cancel" type="button"
			class="btn-danger btn"
			onClick="window.location.href='<%=request.getContextPath()%>/index.jsp?option=home'" />
	</div>
	
</div>

<!-- Initialize Demo 2 -->
<script type="text/javascript">
	var newscripts = new virtualpaginate({

		piececlass : "tblrow",

		piececontainer : 'tr', //Let script know you're using "p" tags as separator (instead of default "div")
		pieces_per_page : 2,
		defaultpage : 0,
		wraparound : false,
	//persist: true //Remember last viewed page and recall it when user returns within a browser session?

	})

	newscripts.buildpagination([ "scriptspaginate" ])
</script>
<!-- ============ End Content ============== -->
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%> --%>
