<%@ page import="modCommon.commonBo.*,java.util.*"%>
<%@ page import="java.util.*"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<body >
<div  class="Content">
<%
Hashtable<String, ArrayList<String>> arr;
ArrayList<String> list1 = new ArrayList<String>();
int cnt=0;
int k=0;
list1=new ArrayList();
arr=(Hashtable)request.getAttribute("search");
list1.clear();
Enumeration en = arr.keys();
while(en.hasMoreElements()) {
	cnt++;
	try{
			list1 = (ArrayList)arr.get(String.valueOf(en.nextElement()));
	}
	catch(Exception e)
	{
		continue;
	}
	
}
try
{
	if(list1.size()!=0)
	{%>
		<table border="1">
		<tr><td><b>Appointment Name</b></td><td><b>Appoinment Description</b></td></tr>
		
	
		
		<%for(int i=0;i<list1.size();i=i+2)
		{%>
		<tr>
			<td><%=list1.get(i)%></td>	
			<td><%=list1.get(i+1)%></td>
		</tr> 
		<%}%>
		<tr>
		<td colspan="2"><a href="/WEB/jsp/jsp-modCommon/searchResult.jsp">back to search Page</a></td></tr>
		</table>
		
		
		
	<%}
	else{
			out.println("NO RECORDS");
			out.println("<a href='jsp-modCommon/searchResult.jsp'>back to search page</a>");
		} %>
	
	<%
	
	
}
catch(Exception e){
}

%></div>

<%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>