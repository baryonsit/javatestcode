<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ include file="/WEB/jsp/jsp-modCommon/header.jsp"%>
<%@ include file="/WEB/jsp/jsp-modCommon/left_home.jsp"%>
<%@ page import="modCommon.commonBo.*,java.util.*"%>
<%@ page import="modUser.userDo.*,modCommon.commonDo.*"%>
<script type="text/javascript" src="<%=request.getContextPath() %>/WEB/includes/js/ajax.js"></script>
<% 
int kk=4;
ArrayList<String> list1 = new ArrayList<String>();
list1=new ArrayList();

String searchWord=request.getParameter("mainsearch");
String countryid=request.getParameter("countryid");
String status =(String)request.getAttribute("searchkey");
String stateid1=request.getParameter("stateid");
session.setAttribute("CountryID",countryid);
String country_id =(String)request.getAttribute("countryid");
//String countyid3=session.getAttribute("CountryID").toString();
//String stateid = (String)request.getAttribute("stateid");
//session.setAttribute("countyid3",countyid3);

String searchoption = "";
try{
searchoption = request.getParameter("searchoption");
}catch(Exception ex){}



ArrayList listCountry = new ArrayList();
ArrayList listState = new ArrayList();
ArrayList listCategory = new ArrayList();
ArrayList searchresult=new ArrayList();
cDBusinessOwner cityCD=new cDBusinessOwner();
cDBusinessOwner stateCD=new cDBusinessOwner();
/* cBProfileManagement objBoGetleftmenu=new cBProfileManagement(); */
cDCommon categoryCD=new cDCommon();
ArrayList liststates = new ArrayList();
liststates = objBoGetleftmenu.getStatesforSearch(countryid);

cBCommonFunctions objBCommonFunctions = new cBCommonFunctions();
listCountry=cityCD.getCountryDB();
listState=stateCD.getStateDB();
String user_id ="";
String role_id="";
try{
   role_id = session.getAttribute("logedroleid").toString();
   user_id=session.getAttribute("logeduserid").toString();
   //if(role_id.equals("2")){
    // listCategory=objBoGetleftmenu.getCategoryonid(user_id,role_id);
   //}
   //else{
	
	  
	   listCategory=categoryCD.getCategoryFromDB();
   //}
}catch(Exception e){
	  listCategory=categoryCD.getCategoryFromDB(); 
}

searchresult=objBCommonFunctions.searchFromDB(searchWord,countryid,role_id,user_id);

String contryval="";
contryval = objBCommonFunctions.contryval(countryid);

%>
<%int sl=0; int c=0;%>
<%
try{
		Hashtable<String, ArrayList<String>> arr;
		int cnt=0;
		int k=0;
		arr=(Hashtable)request.getAttribute("search");
		list1.clear();
		Enumeration en = arr.keys();
		while(en.hasMoreElements()) {
			cnt++;
			try{
					list1 = (ArrayList)arr.get(String.valueOf(en.nextElement()));
			}
			catch(Exception e){
				continue;
			}
		}
		
}//close try

catch(Exception e){

}
%>	
<!-- ============ Content Panel ============== -->
<div class="">
<div class="col-md-12 main-con-center">
	
	<html:form action="generalsearch.do">
         <h3>Search Business</h3>
         <input type="hidden" name="countryid" value="<%=countryid%>"></input>
<div class="row">
	<div class="col-md-6">
		<div class="row">
				<div class="col-md-4">
				  <div class="form-group">        
                    <label>Search Keyword </label>
                  </div>
				</div>
			<div class="col-md-8">
				<div class="form-group">
                    <html:text property="searchkey" styleClass="form-control"></html:text>
               </div>
           </div>
         </div>
     </div>
     <div class="col-md-6">
		<div class="row">
				<div class="col-md-4">
				  <div class="form-group">
                   <label>State</label>
                  </div>
				</div>
			<div class="col-md-8">
				<div class="form-group">           
                 <select name="stateid" id="stateid" Class="flat form-control">
                 <option value="select">Select State</option>
                <% 
                		for(int i=0;i<liststates.size();i=i+2)
                		{
                			
                			if(liststates.size()>0 || countryid.equals(null)){%>
                			<option value="<%=liststates.get(i)%>"><%=liststates.get(i+1)%></option>
                           <% }
                			else{ %>
                				<option value="<%=liststates.get(i)%>"><%=liststates.get(i+1)%></option>
                		<%	} }
                
                %>
                </select>
                </div>
               </div>
             </div>
           </div>
      </div>
   <div class="row">
	<div class="col-md-6">
		<div class="row">
				<div class="col-md-4">
				  <div class="form-group">
				   <label>Category</label>
				   </div>
				</div>
			<div class="col-md-8">
				<div class="form-group">
				 <html:select property="categoryname" styleClass="form-control">
				<option value="select_category">Select Category</option>
				<%for (c = 0; c < listCategory.size(); c=c+2)
				{%>
					  <%try { if(list1.get(sl+5).toString().equals(listCategory.get(c+1).toString())){ %>
					  <option value="<%=listCategory.get(c+1)%>" selected><%= listCategory.get(c+1)%></option>
					  <%}else{ %>
					   <option value="<%=listCategory.get(c+1)%>" ><%= listCategory.get(c+1)%></option>
					  <%} }catch(Exception e){%>
					   <option value="<%=listCategory.get(c+1)%>" ><%= listCategory.get(c+1)%></option>
			  <%}}%>
				</html:select>
				 </div>
			</div>
		</div>
	 </div>
	</div>
	<div class="btn_area text-center">
					<input name="search" value="Search Business" type="submit" class="btn-success btn">
					<input name="cancel" value="Cancel" type="button" class="btn-danger btn" onClick="window.location.href = '<%=request.getContextPath()%>/index.jsp'" />
			
	  </div>
	</html:form>
		
        
     <h3> Search Results</h3>
       
        <%
        if(searchresult.size()>0)
        {
        for(int s=0;s<searchresult.size();s=s+4)
            { %>
        <div>
           <b><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?business_id=<%=searchresult.get(s+2) %>"><%=searchresult.get(s) %></b>
            </a>
           </div>
       <div>
               <%=searchresult.get(s+1)%>
       </div>
        
        <%}    }%>
        
    
    <%

    try
    {
        if(list1.size()!=0 || status.equals("success") )
        { %>
            
             <h3>Search Results</h3>
            <%for( sl=0;sl<list1.size();sl=sl+6)
            {%>
            <div>
                    <b><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/facilitiesOfBusiness.jsp?business_id=<%=list1.get(sl+2)%>"/><%=list1.get(sl)%></a></b><br/>
                <%=list1.get(sl+1)%>
           </div>
            <%}%>
            
        <%}
        //if(searchresult.size()<=0 && list1.size()<=0 )
       if(status.equals("failure")){ %>
        <p>No Search Result Is Found </p>
<%}%> 
    <%} 
    catch(Exception e)
    {
        
    }
    %>
</div>
<input type="hidden" name ="countryid1" id="countryid1" value="<%=contryval%>"></input>
<input type="hidden" name="stateid1" id="stateid1" value="<%=stateid1 %> "></input>
</div>
</div>
</div>
</div>
<%-- <%@ include file="/WEB/jsp/jsp-modCommon/right_home.jsp"%> --%>
<%@ include file="/WEB/jsp/jsp-modCommon/footer.jsp"%>