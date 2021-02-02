<%@ page import="modUser.userBo.cBBusinessUser,java.util.*"%>
<%! String member_id="";%>
<% try
    {
	member_id=request.getParameter("Member_id").toString();
	}
catch(Exception e)
   {
	
   }
  cBBusinessUser objcBCheckmembership=new cBBusinessUser();
 
   member_id=objcBCheckmembership.getMembership_Id(member_id);

%>
<%=member_id %>
