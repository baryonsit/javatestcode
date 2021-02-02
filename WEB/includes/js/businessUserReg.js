
$(document).ready(function()
{
	$('.dropdown-toggle').dropdown();
	$("#fixCategory").change(function(){
		var categoryName = $("#fixCategory").val(); 
		getBusinessList(categoryName);
	});
	
	
	function getBusinessList(categoryName)
	{
		var setBusiness = function(businessList){
			businessList = $.trim(businessList);
			var bisAr = businessList.split("^^");
			$("#fixBusiness").empty();
			for(var i=0;i<bisAr.length;i++){
				if($.trim(bisAr[i]) != ""){
					$("#fixBusiness").append("<option>"+bisAr[i]+"</option>");
				}
			}
		}
		var url = "../WEB/jsp/jsp-modUser/userAjax.jsp?option=getbusinessofcategory&categoryName="+categoryName;
		$.get(url,null,setBusiness);
	}
	
	getBusinessList($("#fixCategory").val());
	
});
	
	
	
	
	