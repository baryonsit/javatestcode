var setRoomType = function(roomtype){
	roomtype = roomtype.replace(",]}", "]}");
	roomtype = eval(roomtype);
	
	$("#hotelRoomId").empty();
	for(i=0;i<roomtype.length;i++){
	
	$("#hotelRoomId").append("<option value='"+roomtype[i].id+"'>"+roomtype[i].name+"</option>");
	}
}

function getRoomType(){
	propertyId = $("#propertyId").val();
	stateId =0;
	//$.get("http://localhost:8080/gdsHAMARA/ajax.htm",{"countryId":propertyId,"stateId":stateId,"operation":"ROOMTYPE","operationAjax":"AJAX"},setRoomType);
	$.get("http://localhost:8080/gdsHAMARA/ajax.htm",{"countryId":propertyId,"stateId":stateId,"operationAjax":"AJAX"},setRoomType);
}

$(document).ready(function(){

	// Function to get statelist base on the country id
	$("#countryId").change(function(){
		
		countryId = $("#countryId").val();
	
		//stateId = $("#stateId").val(); -- why ???		
		$("#cityId").empty(); //what this check does???
		
		var setStates = function(states){
			
			states = states.replace(",]}", "]}"); //unrelated to logic - some garbage correction
			
			states = eval(states);
			
			$("#stateId").empty();
			
			for(i=0;i<states.length;i++){
				$("#stateId").append("<option value='"+states[i].id+"'>"+states[i].name+"</option>");
			}
		
		}
		
		//$.get("http://localhost:8080/gdsHAMARA/ajax.htm",{"countryId":countryId,"stateId":stateId,"operation":"STATE"},setStates);
		
		$.get("http://localhost:8080/gdsHAMARA/ajax.htm",{"countryId":countryId,"operation":"STATE"},setStates);
	
	
	});
	
	// Function to get City list  base on the country id and state Id
	$("#stateId").change(function(){
		
		countryId = $("#countryId").val();
		stateId = $("#stateId").val();		
		
		var setCity = function(city){
			city = city.replace(",]}", "]}");
			city = eval(city);
			
			$("#cityId").empty();
			
			for(i=0;i<city.length;i++){
			
			$("#cityId").append("<option value='"+city[i].id+"'>"+city[i].name+"</option>");
			}
		
		}
		
		$.get("http://localhost:8080/gdsHAMARA/ajax.htm",{"countryId":countryId,"stateId":stateId,"operation":"CITY"},setCity);
	
	
	});
	
	
	$("#checkavailbility").click(function(){		
		if($("#emailId").val()=="")
		{
			$("#chkavailemail").html("Please enter your email id");
			return false;
			
		}else{
			
			emailId=$("#emailId").val();	
			
			var checkEmailId = function(value){				
				if(value==1) {
					$("#chkavailemail").html("Email Id is available");
				}
				else {
					$("#chkavailemail").html("Email Id already exists");
				}
			}
			
			$.get("http://localhost:8080/gdsHAMARA/ajax.htm",{"emailId":emailId,"operation":"DUPLICATELOGINCHECK"},checkEmailId);
		}
		
		
	});
	
	$("#propertyId").change(function(){
		getRoomType();
	});
	getRoomType();
});




