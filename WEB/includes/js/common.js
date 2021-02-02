/*var chkFlag=0;
function selectAll(){
	var i=0;
	if(chkFlag==0){
		while(document.getElementById(i)){
			document.getElementById(i).checked = true;
			i++;
		}
		chkFlag=1;
	}
	else 
	if(chkFlag==1){
		while(document.getElementById(i)){
			document.getElementById(i).checked = false;
			i++;
		}
		chkFlag=0;
	}
	return false;
}*/
jQuery(document).ready(function() { 
	var url = window.location.href;
var url = url.split("#")[0];
var d_url = url.replace(window.location.origin,'');
console.log(d_url);
jQuery('.main_menu1 ul li a' ).each(function() {
  var href= jQuery(this).attr('href');
console.log(href);
if (d_url== href){
jQuery(this).parent().addClass('school-active');
jQuery(this).parent().parent('ul').addClass('inn');
}
  });					
	jQuery("body").show();						
	jQuery("#com_id>.in_div").append(jQuery(".Left")); //appending left div to com_div
	jQuery("#com_id>.in_div").append(jQuery(".Content")); //appending Content div to com_div  
	
	//login
	jQuery("#com_id").after("<div class='c_lod'><strong>Login</strong></div>"); //adding log in name
	jQuery("#com_id").after("<div class='mask' style='display:none'></div><div class='login' style='display:none'></div>");// adding mask div and login form div
	jQuery(".login").append(jQuery(".Right>form")); // append right form to login div
	jQuery(".login").append("<a class='clo_se'>X</a>"); // adding close button
	jQuery(".logo_area").append(jQuery(".c_lod"));
	jQuery(".upcomming_eventout").hide();
	jQuery("#featured").css("background-color","#0f949c");

	jQuery("table").css("background-color","#fff");
	
	jQuery(".mask").css({"background":"#000","opacity":"0.6","position":"fixed","top":"0","left":"0","width":"100%","height":"100%","z-index":"98"}); // mask css
	jQuery(".login").css({"background":"#fff","position":"absolute","top":"25%","left":"35%","width":"400px","z-index":"99"}); // login css
	jQuery(".clo_se").css({"color":"#fff","position":"absolute","top":"16px","right":"10px"}); // close button css
	jQuery(".c_lod").css({"text-align":"right","position":"relative","cursor":"pointer"}); // close button css
	jQuery(".c_lod>strong").css({"position":"absolute","top":"-28px","font-weight":"bold"}); // close button css
	jQuery(".left_ses").css({"position":"absolute","top":"-50px","right":"0"});
	jQuery(".left_ses a").css({"color":"#000","border":"0","padding":"0 10px"});
	jQuery(".left_ses a span").css({"color":"#000","border":"0","font-family":"'Open Sans', sans-serif"});
	jQuery("#slidemenu1").css("position","relative");
	jQuery("#loginusername").attr("placeholder","Username *")
	jQuery("#loginpassword").attr("placeholder","Password *")
	jQuery(".list_user_table tr:odd").addClass("odd");
	jQuery(".login form >div").prepend(jQuery(".Content>.allresultmesg"));
	jQuery(".login form >div .allresultmesg").insertAfter(".login form h2.user_login");
	
	//Menu Click Function
	jQuery(".icon_img").click(function(){

        jQuery(".menu_area").slideToggle("slow");
	});
	
	//jQuery("table tr:even").addClass("even");

   //log in click function
	jQuery(".c_lod").click(function(){
	  jQuery(".mask").show();
	  jQuery(".login").show("slide", "slow" ,"easeInElastic");
	  // jQuery( ".login").effect(  );
	  
	
	});
	
	 if(jQuery.trim(jQuery(".login .allresultmesg").html())=='Username and Password Doesnot Match.') {
	   jQuery(".mask").show();
	  jQuery(".login").show();
	 }	
	jQuery(".login .allresultmesg").css({"position":"relative","top":"10px"});
   //log in click function end 
   
   //Sub menu 
   jQuery(".dropmenudiv_c1 a").css({"padding":"5px 7px"});
   //Sub menu end
   
   //close button  click function
	jQuery(".clo_se").click(function(){
	  jQuery(".mask").fadeOut();	
	  jQuery(".login").hide("slide");	
	  
				   
	});
    //close button  click function end	
	
	//hide login button after login
	var cur_url = ""+window.location;	

	
	// if(jQuery.trim(jQuery("li.after_log").hasClass("after_log") ) {
	  if(jQuery("li").hasClass("after_log")) {
		 jQuery(".c_lod").hide();
	 }		 
	//hide login button after login end	
  //login end 
	 
	 jQuery(".bf_af_att>tbody>tr>td").addClass("std_bf_af");
	 jQuery(".std_bf_af select").parent("td").addClass("rmcla");
	 jQuery(".bf_af_att").parent("div").parent("td").addClass("ver_t");
	 jQuery(".std_bf_af").css("min-width","111px");
	 jQuery(".std_mnth").css("min-width","111px");
	 jQuery("#schooldomain").closest("td").addClass("text_c");
	  jQuery(".std_dt_nm").css("min-width","85px");
	  jQuery(".st_i").css("min-width","85px");
  
	 
//	
//	jQuery(document).ready( function(){
//	//	att_load();					 
//	});
//	
//	jQuery('body').ajaxComplete( function(){
//		//att_load();					 
//	});
//	
//	jQuery('body').hover( function(){
////		att_load();					 
//	});
	
	jQuery('.allresultmesg').attr( 'id', 'login_erro' );
	 
/*	  if ( $.browser.mozilla ) {
    alert( $.browser.version );
  }*/
	var currentURL =  window.location.href;
	var n = currentURL.lastIndexOf(".do");
	if(n>-1){
		var index = currentURL.lastIndexOf("/");
		var res = currentURL.substring(0, index);
		res = res + '/index.jsp?option1=home';
		//window.location.replace(res);
		//jQuery(location).attr('href',res);
		history.pushState(null, '', res);
	}

});
var xmlHttp = null;
var xmlHttp1 = null;
var xmlHttp2 = null;
var xmlHttp4 = null;
var xmlHttp3 =null;

function getHttpObj()
{

	try
	{
		xmlHttp=new XMLHttpRequest();
		xmlHttp1=new XMLHttpRequest();
		xmlHttp2=new XMLHttpRequest();
		xmlHttp4=new XMLHttpRequest();
		xmlHttp3=new XMLHttpRequest();
		
		
	}
	catch (e)
	{
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			xmlHttp1=new ActiveXObject("Msxml2.XMLHTTP");
			xmlHttp2=new ActiveXObject("Msxml2.XMLHTTP");
			xmlHttp3=new ActiveXObject("Msxml2.XMLHTTP");
			xmlHttp4=new ActiveXObject("Msxml2.XMLHTTP");
			
		}
		catch (ea)
		{
			try
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				xmlHttp1=new ActiveXObject("Microsoft.XMLHTTP");
				xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");
				xmlHttp3=new ActiveXObject("Microsoft.XMLHTTP");
				xmlHttp4=new ActiveXObject("Microsoft.XMLHTTP");
				
			}
			catch (eaa)
			{
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}
}

$(document).ready(function()
{
	$("#checkall").click(function(){
		if($(this).attr('checked')) {
			$(".innerchkbox").each(function(){
				$(this).attr('checked',true);
			});
		}
		else {
			$(".innerchkbox").each(function(){
				$(this).attr('checked',false);
			});
		}
	});
	
	$(".innerchkbox").click(function(){
		$("#checkall").attr('checked',false);
	});
	
	$("#addholiday").click(function(){
		$("#viewholiday").show();
	});
	
	$("#close").click(function(){
		$("#viewholiday").hide();
	});
	
});
var number=1;

function addholid(){
	
	var date = document.getElementById("facoptionaldate").value;
	var desc = document.getElementById("facoptionaldesc").value;
	if(date==""){
		alert("Please Select Date");
		document.getElementsByName("facoptionaldate")[0].focus();
		return false;
	}
	
    var Stdate= document.getElementById("SDate").value;
	var Endate= document.getElementById("TDate").value;
	
	var GDate=new Date(date);
	var SDate=new Date(Stdate);
    var TDate=new Date(Endate);
    if(desc==""){
		alert("Please Enter Desc");
		document.getElementsByName("facoptionaldesc")[0].focus();
		return false;
	}
	
	if((SDate>GDate) || (TDate<GDate)){
	      alert("Invalid Date");
	      return false;
	}
	
var tbody = document.getElementById("holiday_table").getElementsByTagName("tbody")[0];
 
// var number=document.getElementById('aval').value;

var row = document.createElement("TR");
row.setAttribute("id","row_"+number);
var chkbx = document.createElement("input");
chkbx.setAttribute('type',"checkbox");
chkbx.setAttribute('id',"chk_");
chkbx.setAttribute('name',"chk_");
chkbx.setAttribute('class','chkcls');

var cell1 = document.createElement("TD");
cell1.setAttribute("id","date_"+number);
cell1.innerHTML = date;

var cell2 = document.createElement("TD");
cell2.setAttribute("id","desc_"+number);
cell2.innerHTML = desc;
number++;

var cell3 = document.createElement("TD");

cell3.appendChild(chkbx);
row.appendChild(cell3);
row.appendChild(cell1);
row.appendChild(cell2);
tbody.appendChild(row);
document.getElementById("facoptionaldate").value ="";
document.getElementById("facoptionaldesc").value ="";

}

function add(appname){
	var table=document.getElementById("holiday_table").getElementsByTagName("tbody")[0];
	var facilityid=document.getElementById("facid_hidden").value;
	var func = document.getElementById("function").value;
	var url;
	var date = "";
	var desc ="";
	for(var i=1;i<=table.rows.length;i++){
		try{
		   date += document.getElementById("date_"+i).innerHTML + "/";
		   desc += document.getElementById("desc_"+i).innerHTML + "/";
		}
		catch(e){
			continue;
		}
	}
	getHttpObj();
	xmlHttp1.onreadystatechange=function()
	{
		if(xmlHttp1.readyState==4)
		{
			window.location = ".."+appname+"/index.jsp?message=success";

		}else{
			window.location = ".."+appname+"/index.jsp?message=failure";
		}
	}
	url="http://"+document.domain+":8080"+appname+"/WEB/jsp/jsp-modFacility/holidaymaster.jsp?date="+date+"&desc="+desc+"&facilityid="+facilityid+"&function="+func;
	xmlHttp1.open("get",url,true);
	xmlHttp1.send(null);
}

// function removes an added program
function removeholid(){
	var table=document.getElementById("holiday_table").getElementsByTagName("tbody")[0];
	var length = $('.chkcls:checked').length;      
	// alert(length);
    if(length==0){
    	// alert("enter");
        alert("There are no rows to delete");
        return false;
    }
	
	for(var i=0;i<parseInt(document.getElementsByName("chk_").length);i++)
	{
		var length1 = $('.chkcls:checked').length;      
		if(document.getElementsByName("chk_")[i].checked==true)
		{
			// var length1 = $('.chkcls:checked').length;
			// alert(length1);
			table.deleteRow(i);
			if(length1>=2){
			removeholid();
			}
			else{
				alert("rows are successfully deleted");
			}
		}
	}
}


function update(){
	/*
	 * var
	 * table=document.getElementById("holiday_table").getElementsByTagName("tbody")[0];
	 * var func = document.getElementById("function").value; var
	 * facilityid=document.getElementById("facid_hidden").value; var url; var
	 * date = ""; var desc ="";
	 * 
	 * for(var i=1;i<=table.rows.length;i++){ try{ date +=
	 * document.getElementById("date_"+i).innerHTML + "/"; desc +=
	 * document.getElementById("desc_"+i).innerHTML + "/"; } catch(e){ continue; } }
	 * if (func == "update"){ var table1 =
	 * document.getElementById("holid_table").getElementsByTagName("tbody")[0];
	 * for(var j=1;j<=table1.rows.length;j++){ try{ date +=
	 * document.getElementById("date"+j).value + "/"; desc
	 * +=document.getElementById("desc"+j).value + "/"; } catch(e){ continue; } } }
	 * 
	 * document.getElementById("facccdate").value = date;
	 * document.getElementById("facccdesc").value = desc;
	 */
	
	document.addfacilityform.submit();
}

function updateremoveholid(){
	var table=document.getElementById("holiday_table").getElementsByTagName("tbody")[0];
	var table1=document.getElementById("holid_table").getElementsByTagName("tbody")[0];
	var length = $('.chkcls:checked').length;
	
	if(length == 0){
	alert("There are no rows to delete");
	return false;
	}
	if(document.getElementsByName("chk_").length==0 && document.getElementsByName("chk").length==0)
	{
		// alert("Row Was Not Added Yet");
		return false;
	}
	for(var i=0;i<parseInt(document.getElementsByName("chk_").length);i++)
	{
		var length1 = $('.chkcls:checked').length;
		if(document.getElementsByName("chk_")[i].checked==true)
		{
			table.deleteRow(i);
			if(lenght1>=2){
			updateremoveholid();
			}else{
				alert("rows are deleted successfully");
			}
		}
	}
	
	for(var k=0;k<parseInt(document.getElementsByName("chk").length);k++)
	{
		var length1 = $('.chkcls:checked').length;
		if(document.getElementsByName("chk")[k].checked==true)
		{
			table1.deleteRow(k);
			if(length1>=2){
			updateremoveholid();
			}
			else{
				alert("rows are deleted successfully");
			}
		}
	}
	
}

function add_BO_or_BU(base_url,action)
{
	var username = document.getElementById("username").value;
	var email = document.getElementsByName("email")[0].value;
	var pass1 = document.getElementsByName("pass1")[0].value;
	var pass2 = document.getElementsByName("pass2")[0].value;
	var fname = document.getElementsByName("fname")[0].value;
	var lname = document.getElementsByName("lname")[0].value;
	var add1 = document.getElementsByName("add1")[0].value;
	var city = document.getElementsByName("city")[0].value;
	var zipcode = document.getElementsByName("zipcode")[0].value;
	var contact = document.getElementsByName("contact")[0].value;
	// alert(add1);
	// alert(pass1);
	// alert(email);
// alert(username);
	/*
	 * if(username==""){ alert("please enter username"); return false; }
	 * if(pass1==""){ alert("please enter password"); return false; }
	 * if(pass2==""){ alert("please enter Confirm password"); return false; }
	 * if(pass1 != pass2){ alert("Your password and confirmation password do not
	 * match."); pass2.focus(); return false; } if(fname==""){ alert("please
	 * enter first name"); fname.focus(); return false; } if(lname==""){
	 * alert("please enter last name"); fname.focus(); return false; }
	 * if(email==""){ alert("please enter email"); return false; } if(add1==""){
	 * alert("please enter address"); return false; } if(city==""){
	 * alert("please enter city"); return false; } if(zipcode==""){
	 * alert("please enter zipcode"); return false; } if(contact==""){
	 * alert("please enter contact number"); return false; }
	 */
	
	if(action=="register")
	{
		if(document.getElementById("bisssubscription").value == "Select Subscription")
		{
			alert("Please Select The Subscription");
			return false;
		}
		if(document.getElementById("bisscategory").value == "Select Category")
		{
			alert("Please Select The Category");
			return false;
		}
		document.registrationForm.submit();
	}
	if(action=="businessuserreg")
	{
		if(document.getElementById("businessid").value == "SELECT"){
			alert("Please Select The Business");
			return false;
		}
		document.businessuserregistrationForm.submit();
	}
}
function selectCity()
     {
     if(document.getElementById("busCityList").value=="SELECT")
		{
		alert("Please Select State & City");
		return false;

   		}
     }

function selectRegAddress(base_url,add1,add2,city,zip,state)
{
	
	if($("#reg_checked").attr("checked"))
	{
		document.addfacilityform.facadd1.value=add1;
		document.addfacilityform.facadd2.value=add2;
		document.addfacilityform.faccity.value=city;
		document.addfacilityform.faczip.value=zip;
		document.addfacilityform.facstate.value=state;
	}
	else
	{
		document.addfacilityform.facadd1.value="";
		document.addfacilityform.facadd2.value="";
		document.addfacilityform.faccity.value="";
		document.addfacilityform.faczip.value="";
		document.addfacilityform.facstate.value="";
	}
	
}


function selectUptAddress(base_url,facname,factype,startdate,enddate,opentime,closetime,tslot,mslot,desc,add1,add2,city,zip,state,contactno)
{
	
	if($("#upt_checked").attr("checked"))
	{
		document.addfacilityform.facilityname.value=facname;
		document.addfacilityform.facilitytype.value=factype;
		document.addfacilityform.facstartdate.value=startdate;
		document.addfacilityform.facenddate.value=enddate;
		document.addfacilityform.facopentime.value=opentime;

		document.addfacilityform.facclosetime.value=closetime;
		document.addfacilityform.timeslot.value=tslot;
		document.addfacilityform.membersslot.value=mslot;
		document.addfacilityform.description.value=desc;
		
		document.addfacilityform.facadd1.value=add1;
		document.addfacilityform.facadd2.value=add2;
		document.addfacilityform.faccity.value=city;
		document.addfacilityform.faczip.value=zip;
		document.addfacilityform.facstate.value=state;
		document.addfacilityform.faccontactno.value=contactno;
	}
	else
	{
		document.addfacilityform.facilityname.value="";
		document.addfacilityform.facilitytype.value="";
		document.addfacilityform.facstartdate.value="";
		document.addfacilityform.facenddate.value="";
		document.addfacilityform.facopentime.value="";

		document.addfacilityform.facclosetime.value="";
		document.addfacilityform.timeslot.value="";
		document.addfacilityform.membersslot.value="";
		document.addfacilityform.description.value="";
		
		document.addfacilityform.facadd1.value="";
		document.addfacilityform.facadd2.value="";
		document.addfacilityform.faccity.value="";
		document.addfacilityform.faczip.value="";
		document.addfacilityform.facstate.value="";
		document.addfacilityform.faccontactno.value="";
	}
	
}




function deleteRecord(countCheck){
	var records = "";
	var cnt = 0;
	for(var i=0;i<=countCheck;i++){
		if(document.getElementById(i) && document.getElementById(i).checked){
			cnt++;
			records+="_"+document.getElementById(i).value;
			// alert(records);
		}
	}
	if(!cnt){
		alert('No records selected to delete.');
	}
	if(records!=""){
		if(confirm("Are you sure you want to delete the selected records?")){
			document.deletefacilityform.facid_hidden.value = 99999999;
			document.deletefacilityform.selected_ids.value = records;
			// alert(records);
			// alert(document.deletefacilityform.facid_hidden.value+document.deletefacilityform.selected_ids.value);
			document.deletefacilityform.submit();
		}
	}
	
	// return false;
}

function deleteSubscription(countCheck){
// alert(countCheck);
	var records = "";
	var cnt = 0;
	for(var i=0;i<=countCheck;i++){
		if(document.getElementById(i) && document.getElementById(i).checked){
			cnt++;
			records+="_"+document.getElementById(i).value;
			// alert(cnt);
		}
	}
	if(!cnt){
		alert('No records selected to delete.');
	}
	if(records!=""){
		if(confirm("Are you sure you want to delete the selected records?")){
			document.subscriptiondeleteform.subid_hidden.value = 666666;
			document.subscriptiondeleteform.selected_ids.value = records;
			// alert(document.subscriptiondeleteform.subid_hidden.value+document.subscriptiondeleteform.selected_ids.value);
			document.subscriptiondeleteform.submit();
		}
	}
	return false;
}

function filterfacility(base_url)
	{
    var	status=document.getElementById("showFacilityByOption").value;
	// alert(status);
	var	search_by_facname=document.getElementById("searchFacilityByName").value;
	document.addfacilityform.action = base_url+"/WEB/jsp/jsp-modFacility/facilityList.jsp?status="+status+"&search_by_facname="+search_by_facname;
	document.addfacilityform.submit();

	}
	
	
	function searchSubscription(base_url)
	{	
	alert(base_url);
	sub_name=document.getElementById("SearchBySubcription").value;	
	document.subscriptiondeleteform.action = base_url+"/WEB/jsp/jsp-modAdmin/subscriptionList.jsp?sub_name="+sub_name;
	document.subscriptiondeleteform.submit();
	}	
	
/*
 * --------------------------------- Nandini
 * ------------------------------------------
 */

function deleteBusiness(countCheck){
	var records = "";
	var cnt = 0;
	for(var i=0;i<=countCheck;i++){
		if(document.getElementById(i) && document.getElementById(i).checked){
			cnt++;
			records+="_"+document.getElementById(i).value;
			// alert(records);
		}
	}
	if(!cnt){
		alert('No records selected to delete.');
	}
	if(records!=""){
		if(confirm("Are you sure you want to delete the selected records?")){
			document.businesslistoppForm.businessid_hidden.value = "delete";
			document.businesslistoppForm.selected_ids.value = records;
			document.businesslistoppForm.submit();
		}
	}
	return false;
}


/*function updateUserStatus(count,userid,val)
{
	debugger;
	alert("test");
	for(var i=0;i<count;i++)
	{
		if(val==i)
		{		
			if(document.getElementById('status'+i).value=='Active')
			{
				if(confirm("Are you sure you want to Activate this User?"))
				{
					document.businesslistoppForm.selected_ids.value = userid;
					document.businesslistoppForm.statusname.value = document.getElementById('status'+i).value;
					document.businesslistoppForm.hidden_emailid.value = document.getElementById('hidden_email'+i).value;
					document.businesslistoppForm.hidden_busname.value = document.getElementById('hidden_busname'+i).value;
					document.businesslistoppForm.submit();
				}
			}
			else if(document.getElementById('status'+i).value=='Inactive')
			{
				if(confirm("Are you sure you want to Deactivate this User?"))
				{
					document.businesslistoppForm.selected_ids.value = userid;
					document.businesslistoppForm.statusname.value = document.getElementById('status'+i).value;
					document.businesslistoppForm.hidden_emailid.value = document.getElementById('hidden_email'+i).value;
					document.businesslistoppForm.hidden_busname.value = document.getElementById('hidden_busname'+i).value;
					document.businesslistoppForm.submit();
				}
			}
			
		}
	}
}*/

function userSearch(baseurl)
{
	debugger;
	var searchKey = document.getElementById("search").value;
	var openURL = baseurl+"/WEB/jsp/jsp-modAdmin/userList.jsp?searchKey="+searchKey;
	window.open(openURL,"_self");
}


function appointmnetEventSearch(url)
{
	var searchKey = document.getElementById("search").value;
	var openURL = url+"/WEB/jsp/jsp-modAdmin/businessList.jsp?searchKey="+searchKey;
	window.open(openURL,"_self");
}


function change_businessuser_status(count,rowno,userid,url,search_key,appoint_id)
{
	for(var i=0;i<count;i++)
	{
		if(rowno==i)
		{
			if(confirm("Are you sure you want to Update the Appointment Status")==true)
			{
				status_val = document.getElementById(i).value;
				user_id = userid;
				update = "yes";
				document.viewappoperationsForm.action = url+"/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?status_val="+status_val+"&userid="+userid+"&search_key="+search_key+"&update="+update+"&appoint_id="+appoint_id+"&rowno="+rowno;
				document.getElementById(i).selectedindex=status_val;
				document.viewappoperationsForm.submit();
				// alert(status_val);
				// document.viewappoperationsForm.statusval.value=document.getElementById(i).selectedindex;
			}
			else
			{
				update = "no";
				document.viewappoperationsForm.action = url+"/WEB/jsp/jsp-modAdmin/viewAppointments.jsp?search_key="+search_key+"&update="+update;
				document.viewappoperationsForm.submit();
				// return false;
			}
		}
		// return false;
	}
	
}


function aaa(url,userid,roleid)
{
// alert(url+"----"+userid+"----"+roleid);
// history.go(0);


// alert(url+"/WEB-INF/jsp/jsp-modCommon/myProfile.jsp?qsuserid="+userid+"&qsroleid="+roleid);
// document.profileForm.action =
// url+"/WEB-INF/jsp/jsp-modCommon/myProfile.jsp?qsuserid="+userid+"&qsroleid="+roleid;
// document.testit.submit();
}



/*
 * --------------------------------- Nandini
 * ------------------------------------------
 */
function numeric_validate(num){
	var usrid=num; // txtUserid-->ID of Num
	var alphanum=/^[0-9.]+$/; // This contains 0 to 9
		if(usrid.match(alphanum)){
			return true;
		}else{
			return false;
		}
	}

function validateSubAmount()
{
	var sname=document.getElementById("subname").value;
	if(sname==""){
		alert("Enter Subscription Name");
		document.getElementById("subname").focus();
		return false;
	}
	var subdescription=document.getElementById("subdesc").value;
	if(subdescription==""){
		alert("Enter Description");
		document.getElementById("subdesc").focus();
		return false;
	}
	var subamnt=document.getElementById("subAmount").value;
	if(subamnt=="")
	{
		alert("Enter Fee Amount");
		document.getElementById("subAmount").focus();
		return false;
	}
	else
	{
		if(!numeric_validate(subamnt)){
			alert("Invalid Amount.Only Numbers are allowed");
			return false;
		}
		
		/*
		 * for (var subAmt = 0; subAmt < subamnt.length; subAmt++) { if
		 * (!((subamnt[subAmt] >= 0 && subamnt[subAmt] <= 9))) { if
		 * (!(subamnt[subAmt] == '.')) { alert("Invalid Subscription Fee
		 * Amount."); return false; } } }
		 */
	}
	if(document.getElementById("subAmount").value<0){
		alert("Amount should not be less than 0");
		document.getElementById("subAmount").focus();
		return false;
	}
	document.subscriptionmangeform.submit();
}

function regconfirm(){
	var confirmation=confirm("Do you really want to Register this business ??");
	   if(confirmation == true){
		   document.facilityregistration.submit(); 
	   }
	   else{
		   
	   }
}
function search(){
	var id=document.getElementById("countryid").value;
	alert(id);
}

function categoryChange(base_url,id){
	var url;
	getHttpObj();
	
	xmlHttp2.onreadystatechange=function()
	{
		if(xmlHttp2.readyState==4)
		{
			document.getElementById("busCityList").innerHTML = xmlHttp2.responseText;
			
			
		}
	}
	
	url = base_url+"/WEB/jsp/jsp-modCommon/filterStatesForSearch.jsp?id="+id;
	xmlHttp2.open("get",url,true);
	xmlHttp2.send(null);	
}
function filterForState(base_url) {
	getHttpObj();
	var per_add_country = document.getElementById("country").value;
	var url;
	xmlHttp2.onreadystatechange=function()
	{
		if(xmlHttp2.readyState==4)
		{
			document.getElementById("filterStatesForPer").innerHTML = xmlHttp2.responseText;
		}
	}
	url = base_url+"/WEB/jsp/jsp-modCommon/filteredStatesForPer.jsp?option=fetchstates&per_add_country="+ per_add_country;
	xmlHttp2.open("get", url, true);
	xmlHttp2.send(null);
}
function filterforCity(base_url) {
	var fac_state = document.getElementById("state").value;
	var url;
	getHttpObj();
	xmlHttp3.onreadystatechange=function()
	{
		if(xmlHttp3.readyState==4)
		{
			document.getElementById("filterCitiesForPer").innerHTML = xmlHttp3.responseText;
		}
	}
	url = base_url+"/WEB/jsp/jsp-modCommon/filteredStatesForPer.jsp?option=fetchcities&fac_state="
			+ fac_state;
	xmlHttp3.open("get", url, true);
	xmlHttp3.send(null);
}
function updateStatus(count,facilityid,val)
{
	for(var i=0;i<count;i++)
	{
		if(val==i)
		{
			if(document.getElementById('status'+i).value=='1')
			{
				if(confirm("Are you sure you want to Activate this Appointment?"))
				{
					document.deletefacilityform.facid_hidden.value = "update";
					document.deletefacilityform.selected_ids.value = facilityid;
					document.deletefacilityform.facility_status.value = document.getElementById('status'+i).value;
					document.deletefacilityform.submit();
				}
			}
			else if(document.getElementById('status'+i).value=='2')
			{
				if(confirm("Are you sure you want to Deactivate this Appointment?"))
				{
					// alert(document.getElementById('status'+i).value);
					document.deletefacilityform.facid_hidden.value = "update";
					document.deletefacilityform.selected_ids.value = facilityid;
					document.deletefacilityform.facility_status.value = document.getElementById('status'+i).value;					
					document.deletefacilityform.submit();
				}
			}
			
		}
	}
			
	
}

function updateAppointmentEventStatus(FacilityId, k)
{
debugger;
	var statusId = document.getElementById('status' + k).value;
	if (statusId == 1) {
		if (confirm("Are you sure you want to Activate this Appointment Event ?")) {

			document.businesslistoppForm.businessid_hidden.value = FacilityId;
			document.businesslistoppForm.statusname.value = document
					.getElementById('status' + k).value;
			document.businesslistoppForm.submit();
		}else{
			return false;
		}

	} else {
		if (confirm("Are you sure you want to Deactivate this Appointment Event ?")) {

			document.businesslistoppForm.businessid_hidden.value = FacilityId;
			document.businesslistoppForm.statusname.value = document
					.getElementById('status' + k).value;
			document.businesslistoppForm.submit();

		} else{
			return false;
		}
	}

}
function updateUserStatus(UserId, j)
{
debugger;
alert("test");
	var statusId = document.getElementById('status' + j).value;
	if (statusId == 1) {
		if (confirm("Are you sure you want to Activate this User ?")) {

			document.businesslistoppForm.userid_hidden.value = UserId;
			document.businesslistoppForm.statusname.value = document.getElementById('status' + j).value;
			document.businesslistoppForm.submit();
		}else{
			return false;
		}

	} else {
		if (confirm("Are you sure you want to Deactivate this User ?")) {

			document.businesslistoppForm.userid_hidden.value = UserId;
			document.businesslistoppForm.statusname.value = document
					.getElementById('status' + j).value;
			document.businesslistoppForm.submit();

		} else{
			return false;
		}
	}

}
function business_Search()
{
	key = document.getElementById("search").value;
	document.businesslistoppForm.action = baseurl+"/WEB/jsp/jsp-modAdmin/businessList.jsp?keyval="+key;
	document.businesslistoppForm.submit();
}
/*function checkStatusType(){
	debugger;
	if(document.getElementById("appointment_status").value=="Completed"){
		status=true;
		location.reload();
	}
}*/