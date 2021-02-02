<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import=" modCommon.commonBo.initialConfig" %>


<%
session.removeAttribute("logedusername");
session.removeAttribute("logeduserid");
session.removeAttribute("logedroleid");
session.removeAttribute("functionname");

session.invalidate();

/* response.sendRedirect("../../../"); */

// we are added cas logout, for terminating from the ezAppointment application page.

response.sendRedirect(initialConfig.CAS_LOG_OUT); 
%>