<%@  page import="java.util.*"%>
<%@  page import="modCommon.commonBo.cBSearch"%>
<%@ page import="modCommon.commonDo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.cBCommonFunctions,java.util.*"%>
<%@ page import="modCommon.commonBo.cBProfileManagement" %>
<%@ page import="modCommon.commonBo.cBDisplayBusinessAndFacilities,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="<%=request.getContextPath() %>/WEB/includes/js/ajax.js"></script>
<option value="select_state">Select City</option>

<%
String state_id="";

try{
	state_id=request.getParameter("id").toString();
	cBProfileManagement objBoGetBuscity =new cBProfileManagement();
	ArrayList buscitylist=new ArrayList();
	buscitylist=objBoGetBuscity.getallBuscity(state_id);
	for(int i=0; i < buscitylist.size(); i++){
		%>
		<option value="<%=buscitylist.get(i).toString()%>"><%=buscitylist.get(i).toString()%></option>		
		<%}%>
<%	}
catch(Exception e){
	state_id="";
}
%>
</select>