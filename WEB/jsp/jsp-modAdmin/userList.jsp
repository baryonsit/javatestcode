<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modAdmin.adminBo.*,java.util.*"%>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>

<%
	String username = (String) session.getAttribute("logedusername");
	if (username == null) {
		out.println("Loged-out");
		response.sendRedirect(request.getContextPath() + "/WEB/jsp/jsp-modCommon/sessionExpired.jsp");
	}
	int schoolId = session.getAttribute("schoolId") != null ? Integer.valueOf((String) session.getAttribute("schoolId")) : 0;
%>

<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<div class="page-title">
       <h3>User Activation</h3>
             <div class="page-breadcrumb">
	              <ol class="breadcrumb">
	                   <li><a href="<%=request.getContextPath()%>/index.jsp?option=home">Home</a></li>
	                   <li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modAdmin/userList.jsp?currenttime=<%=currTime%>&option=businessowner">User List</a></li>
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
	ArrayList usersListarr = new ArrayList();

	cBBusinessList objcBBussList = new cBBusinessList();
	try {
		usersListarr.clear();

		usersListarr = objcBBussList.getUsersList(searchKey,schoolId);
	} catch (Exception xxxx) {
	}
%>

<link rel="Stylesheet" media="screen"
	href="<%=request.getContextPath()%>/WEB/includes/css/pagination.css" />
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/jquery-1.3.2.js"></script>
<script language="javascript"
	src="<%=request.getContextPath()%>/WEB/includes/js/virtualpaginate-table.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/WEB/includes/js/common.js"></script>

<!-- ============ Content Panel ============== -->

	<div class="main-content well">

		<%
			if (usersListarr.size() > 0) {
		%>

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
				name="search" placeholder="User Name"
				value="<%=searchKey%>"> <input type="button" name="dosearch"
				value="Search" class="btn-success btn"
				onclick="userSearch('<%=request.getContextPath()%>');">
		   </div>
			<%-- <div class="seacrh_ar user_form">
				<input id="search" class="flatbox form-control" type="text"
				name="search" placeholder="User  Name"
				value="<%=searchKey%>"> <input
					type="submit" name="dosearch" value="Search"
					class="btn-success btn"
					onclick="user_Search('<%=request.getContextPath()%>');">
				<input name="delete" value="Delete" class="btn-danger btn"
					onclick="deleteBusiness(<%=usersListarr.size() / 6%>)"
					type="submit">
			</div> --%>
			<div class="table_deg table-responsive main-content">
			<table class="table table-striped table-condensed table_active_control">
				<thead>
					<tr>
						<!-- <th><input name="all" id="checkall" type="checkbox" /></th> -->
						<th>User Name</th>
						<th>Name</th>
						<th>Email Id</th>
						<th>Mobile Number</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0, j = 0; i < usersListarr.size(); i = i + 6, j++) {
					%>
					<tr class="virtualpage">
						<%-- <td><input id="<%=j%>" value="<%=usersListarr.get(i + 4)%>"
							class="innerchkbox" type="checkbox"></td> --%>
						<td>						
						<a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/myProfile.jsp?qsuserid=<%=usersListarr.get(i)%>&qsroleid=<%=usersListarr.get(i + 5)%>&currenttime=<%=currTime%>&option=business">
								<%=usersListarr.get(i)%>
						</a></td>
						<td><%=usersListarr.get(i + 1)%></td>
						<td><%=usersListarr.get(i + 2)%></td>
						<td><%=usersListarr.get(i + 3)%></td>
						<td><%=usersListarr.get(i + 4)%></td>
						<%-- <td><%=usersListarr.get(i + 5)%></td> --%>
						<%-- <td><select   name="status" id="status<%=j%>">
								<%
									if (usersListarr.get(i + 4).equals("Active")) {
								%>
								<option value="<%=usersListarr.get(i + 4)%>" selected><%=usersListarr.get(i + 4)%></option>
								<option value="Inactive">Inactive</option>
								<%
									} else if (usersListarr.get(i + 4).equals("Inactive")) {
								%>
								<option value="<%=usersListarr.get(i + 4)%>" selected><%=usersListarr.get(i + 4)%></option>
								<option value="Active">Active</option>
								<%
									}
								%>
						</select>
						<input type="hidden" id="hidden_email<%=j%>"
							value="<%=usersListarr.get(i + 4)%>"> <input
							type="hidden" id="hidden_busname<%=j%>"
							value="<%=usersListarr.get(i + 1)%>"> <input
							class="btn-success btn" value="Update"
							onclick="return updateUserStatus(<%=usersListarr.get(i)%>,<%=j%>)"
							type="submit" /></td>  --%>
					</tr>

					<%
						}
					%>
               <input type="hidden" id="typeof_hidden" name="typeof_hidden" value="updateUserStatus">
				</tbody>
				
			</table>
			<div class="btn_area text-center">
				<input class="btn-danger btn" type="button" value="Cancel"
					onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />

			</div>
            </div>
			<div id="paginatediv" class="paginationstyle">
				<a href="#" rel="previous">Prev</a> <span class="flatview"></span> <a
					href="#" rel="next">Next</a>
			</div>

		<script type="text/javascript">
var pagecontent=new virtualpaginate({

 piececlass: "virtualpage", //class of container for each piece of content
 piececontainer: "tr", //container element type (ie: "div", "p" etc)
 pieces_per_page: 25, //Pieces of content to show per page (1=1 piece, 2=2 pieces etc)
 defaultpage: 0, //Default page selected (0=1st page, 1=2nd page etc). Persistence if enabled overrides this setting.
 wraparound: true,
 persist: true //Remember last viewed page and recall it when user returns within a browser session?
})

pagecontent.buildpagination(["paginatediv"]);

</script>



		<html:hidden property="businessid_hidden"></html:hidden>
			<html:hidden property="selected_ids"></html:hidden>
			<html:hidden property="statusname"></html:hidden>
			<html:hidden property="hidden_emailid"></html:hidden>
			<html:hidden property="hidden_busname"></html:hidden>
		</html:form>


		<%
			}

			else {
				out.print("NO RECORDS FOUND");
				out.print("<br/>");
				out.println("<a href='userList.jsp' class='a_button'>back to search page</a>");

			}
		%>


	</div>

<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>
</div>
</div>
</div>
</div>

