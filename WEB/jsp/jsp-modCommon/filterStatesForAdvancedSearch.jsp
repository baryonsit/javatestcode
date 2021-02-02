<%@  page import="java.util.*"%>
 <%@ page import="modCommon.commonBo.cBSearch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="<%=request.getContextPath() %>/WEB/includes/js/ajax.js"></script>
<select style="width: 180px;" class="flatbox"  name="stateid" id="stateid" >
<option value="select_state">Select State</option>

<%
String country_id="";
try{
	country_id=request.getParameter("state_id").toString();
	
}
catch(Exception e){
	country_id="";
}
cBSearch objcBStateListSearch = new cBSearch();

ArrayList statelistforsearcharr = objcBStateListSearch.getStateListForAdvanceSearch(country_id);
for(int i=0;i<statelistforsearcharr.size();i=i+3){
%>
<option value="<%=statelistforsearcharr.get(i).toString()%>"><%=statelistforsearcharr.get(i+2).toString()%></option>		
<%}%>
</select>






