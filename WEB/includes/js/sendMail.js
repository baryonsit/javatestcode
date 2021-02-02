$(document).ready(function()
{
	$("#send_invites_addmore").click(function(){
		value = $("#send_invites_count").val();
		invitiesShowHidden(value)
	});
	
	$("#send_invites_remove").click(function(){
		value = $("#send_invites_count").val();
		invitiesShowHidden(value)
	});
	
	
	function invitiesShowHidden(value)
	{
		if(value == 0) {
			$(".one").hide();
		}
		else {
			$(".one").show();
		}
	}
	
	invitiesShowHidden($("#send_invites_count").val())
	
		
});

function  insertRow()
{
	alert("ppp");
	var total_rows=document.getElementById('total_rows').value;
	total_rows++;

	var tblobj=document.getElementById('sample_tbody');
	var trobj=document.createElement('tr');
	trobj.setAttribute('class','taskcolor');
	trobj.setAttribute('class','trgreen_color');
	var tdobj=document.createElement('td');
	

	/*var tdobj=document.createElement('td');
	var txtbx=document.createElement('input');
	txtbx.setAttribute('type','checkbox');
	txtbx.setAttribute('name','chkseries');
	txtbx.setAttribute('id','chkseries');
	tdobj.appendChild(txtbx);
	trobj.appendChild(tdobj);*/


	var tdobj=document.createElement('td');
	var txtbx=document.createElement('input');
	txtbx.setAttribute('type','text');
	txtbx.setAttribute('name','username'+total_rows);
	
	txtbx.setAttribute('id','username'+total_rows);
	txtbx.setAttribute('value','');
	txtbx.setAttribute('size',12);
	tdobj.appendChild(txtbx);
	trobj.appendChild(tdobj);

	var tdobj=document.createElement('td');
	var txtbx=document.createElement('input');
	txtbx.setAttribute('type','text');
	txtbx.setAttribute('name','useremailid'+total_rows);
	txtbx.setAttribute('id','useremailid'+total_rows);
	txtbx.setAttribute('value','');
	txtbx.setAttribute('size',12);
	tdobj.appendChild(txtbx);
	trobj.appendChild(tdobj);

	tblobj.appendChild(trobj);
	document.getElementById('total_rows').value=total_rows
}

function  deleteRow()
{
	var cont=parseInt(document.getElementsByName("chkseries").length);
	var table=document.getElementById("sample_tbody");
	if(cont==0)
	{
		alert("Row Was Not Added YET");
		return false;
	}
	for(var i=0;i<cont;i++)
	{
		try
		{
		//	alert(i+" : "+document.getElementsByName("chkseries")[i].checked);
			if(document.getElementsByName("chkseries")[i].checked==true)
			{
			    
			    table.deleteRow(i+1);
			    deleteRow();
			}
		
		}
		catch(err)
		{
			continue;
		}
	}
}

function addUserMailIds()
{
	var alldetails="";
	alert("Rows : "+document.getElementById('total_rows').value);
	for(var l=1;l<=(document.getElementById('total_rows').value);l++)
		{
			try
			{
				alldetails=alldetails+"%"+document.getElementsByName('useremailid'+l)[0].value;
			}
			catch(err)
			{
				continue;
			}
			
		}
		alert("All Details : "+alldetails);
		document.getElementsByName('details')[0].value=alldetails;
}


function validate_rec(){
if(document.getElementById("rec_name").value==""){
		alert("Please enter Name.");
		document.getElementById("rec_name").focus();
		return false;
	}
	else if(document.getElementById("rec_mailid").value==""){
		alert("Please enter Mail ID.");
		document.getElementById("rec_mailid").focus();
		return false;
	}
	
	addRecipients();
}
var number=1;
var send_invites_count=0;

function addRecipients(){
	
if(number >1){
		for(var i=1;i<number;i++){
		alert(document.sendMailForm.username.value);
			if(document.getElementById("rec_name_"+i)){
				if((document.getElementById("rec_name_"+(i)).innerHTML == (document.getElementById("rec_name").value)) &&
					(document.getElementById("rec_mailid_"+(i)).innerHTML==document.getElementById("rec_mailid").value)) {
					alert("same recipients cannot be added.");
					return false;
				}
				
			}
		}

}

var tbody = document.getElementById("rec_list_mail").getElementsByTagName("tbody")[0];

	var row = document.createElement("TR");
	row.setAttribute("id","row_"+number);
	row.setAttribute('class','trgreen_color');
	var cell1 = document.createElement("TD");
	cell1.setAttribute("id","rec_name_"+number);
	cell1.innerHTML = document.getElementById("rec_name").value;

	var cell2 = document.createElement("TD");
	cell2.setAttribute("id","rec_mailid_"+number);
	cell2.innerHTML = document.getElementById("rec_mailid").value;

	var chkbx = document.createElement("input");
	chkbx.setAttribute('type',"checkbox");
	chkbx.setAttribute('id',"chk_"+number);
	chkbx.setAttribute('name','chkbox');
	number++;
	send_invites_count++;
	
	var cell3 = document.createElement("TD");

	cell3.appendChild(chkbx);
	row.appendChild(cell3);
	row.appendChild(cell1);
	row.appendChild(cell2);	
	tbody.appendChild(row);
	
	document.getElementById("send_invites_count").value = send_invites_count;
	
}

function removeRecipient(){
	
	var send_invites_count = document.getElementById("send_invites_count").value;
	var tbody = document.getElementById("rec_list_mail").getElementsByTagName("tbody")[0];
	if(tbody.rows.length <=1){
		number = 1;
		alert("Recipients list empty");
	}
	else{
		var chks = document.getElementsByName("chkbox");
		for(var i = 0; i < chks.length; i++){
			if(chks[i].checked){
				tbody.deleteRow(i+1);
				removeRecipient();
				send_invites_count--;
			}
		}
	}
	
	document.getElementById("send_invites_count").value = send_invites_count;
}

function saveNexit(){

	if(document.getElementById("rec_name").value==""){
		alert("Please enter Name.");
		document.getElementById("rec_name").focus();
		return false;
	}
	else if(document.getElementById("rec_mailid").value==""){
		alert("Please enter Mail ID.");
		document.getElementById("rec_mailid").focus();
		return false;
	}
	saveInformation();
}

function saveInformation(){
//alert("in mail");
	var tbody = document.getElementById("rec_list_mail").getElementsByTagName("tbody")[0];
	if(tbody.rows.length <=1){
		alert("Please enter atleast one  Field.");
		//document.getElementById("op").value="";
		return false;
	}
	
	sendRecToBusiness(tbody);
	document.getElementById("count11").value = tbody.rows.length -1;
	//document.getElementById("op").value="saveSchedules";
	//document.cookie = "PROGRAMS="+document.getElementById("programs").innerHTML;
	//document.frmSchedule.target = "";
	//document.sendMailForm.action = "fixApointment.jsp";
	//document.sendMailForm.action = "http://localhost:8080/appoint/jsp-modAppointment/fixAppointment.jsp";	
	document.sendMailForm.submit();
}

function sendRecToBusiness(tbody){
	var vals = tbody.rows.length - 1;
	var details = "";
	var recmailids = "";

	for(var i = 1; i <= number; i++){
		if(document.getElementById("rec_name_"+i) && document.getElementById("rec_mailid_"+i)){
			details = details+"%"+"_"+document.getElementById("rec_name_"+i).innerHTML+"_"+document.getElementById("rec_mailid_"+i).innerHTML;
			//recmailids += "_"+document.getElementById("rec_mailid_"+i).innerHTML+"__";
			
		}
	}
	document.getElementById("details").value = details;
	//alert(details);
	//document.getElementById("rec_mailid").value = recmailids;
	
	

}
