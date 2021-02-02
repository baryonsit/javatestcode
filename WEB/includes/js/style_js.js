$(document).ready(function(){
	
set_height();
collapse_menu();

$(window).resize(function(){
set_height();
});	
});


function set_height(){

var window_height = $(window).height();
var window_min = window_height - 81;
//alert(window_height);
var window_con = window_min - 120;
$(".menu_width").css("min-height", window_min);
//$(".main-content.well").css("min-height", window_con);

}

function collapse_menu(){
$(".fa-bars").click(function(){
        
        $(".menu_width").toggleClass('mini');
        $(".collapse").toggleClass("in");
        $(".caret").toggle();
    });
}
