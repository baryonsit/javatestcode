

/*
  TODO: Add more thorough documentation / comments
*/


(function ($) {
// ***********************************************
  //The main fixedTable function
  $.fn.fixedTable = function (opts) {
    //default options defined in $.fn.fixedTable.defaults - at the bottom of this file.
    var options = $.extend( {}, $.fn.fixedTable.defaults, opts );
    var tbl = this;
    var layout = buildLayout(tbl, opts);
    //see the buildLayout() function below
    
    $(".fixedHead", layout).addClass( options.classHeader );
    $(".fixedFoot", layout).addClass( options.classFooter );
    $("#fixedColumn .fixedTable").addClass( options.classColumn );
    $("#fixedColumn .fixedTable td").addClass( options.classColumn );
    
    //we need to set the width (in pixels) for each of the tables in the fixedContainer area 
    //but, we need to subtract the width of the fixedColumn area.
    var w = parseInt(options.width) - parseInt($("#fixedColumn").width());
    //sanity check
    if (w <= 0) { w = parseInt(options.width); }
    $("#fixedContainer", layout).width( w );
    
    $("#fixedContainer .fixedHead").css({
      width: w + "px", 
      "overflow": "hidden"
    });

    $("#fixedContainer .fixedTable").css({
      width: (w + 16) + "px", 
      "overflow": "auto"
    });
    $("#fixedContainer").css ({ width : w + 16 + 1 });    //adjust the main container to be just larger than the fixedTable
    
    $("#fixedContainer .fixedFoot").css({
      width: w + "px", 
      "overflow": "hidden"
    });
    $("#fixedColumn > .fixedTable").css({
      "overflow" : "hidden",
      "border-collapse" : $(tbl).css("border-collapse"),
      "padding" : "0"
    });
    
    $("#fixedColumn").width($("#fixedColumn > .fixedTable").width() + 1);
    
    //adjust the table widths in the fixedContainer area
    var fh = $("#fixedContainer > .fixedHead > table");
    var ft = $("#fixedContainer > .fixedTable > table");
    var ff = $("#fixedContainer > .fixedFoot > table");
    
    var maxWidth = fh.width();
    if (ft.length > 0 && ft.width() > maxWidth) { maxWidth = ft.width(); }
    if (ff.length > 0 && ff.width() > maxWidth) { maxWidth = ff.width(); }

    
    if (fh.length) { fh.width(maxWidth); }
    if (ft.length) { ft.width(maxWidth); }
    if (ff.length) { ff.width(maxWidth); }
    
    //adjust the cell widths so the header/footer and table cells line up
    $("#fixedContainer > .fixedHead > table > tbody > tr:first > td").each( function ( pos ) {
      var tblCell = $("#fixedContainer > .fixedTable > table > tbody > tr:first > td:eq(" + pos + ")");
      
      if ($(this).width() >  $(tblCell).width() ) {
        $(tblCell).width($(this).width());
      }
      else {
        $(this).width($(tblCell).width());
      }
    });
    
    //adjust the hieght of the fixed column rows
    //$.fn.fixedTable.adjustSizes();
    
    // TODO:  This is suitable for a function call - create a function for setting heights.
//     $("#fixedColumn > .fixedHead > table > tbody > tr").each ( function ( pos ) {
//       var fhr = $("#fixedContainer > .fixedHead > table > tbody > tr:eq(" + pos + ")");
//       matchSize(this, fhr);
//       if ($(this).height() > $(fhr).height() ) { fhr.height($(this).height()); } else { $(this).height(fhr.height()) };
//     });
//     $("#fixedColumn > .fixedFoot > table > tbody > tr").each ( function ( pos ) {
//       var ffr = $("#fixedContainer > .fixedFoot > table > tbody > tr:eq(" + pos + ")");
//       matchSize(this, ffr);
//       //if ($(this).height() > $(ffr).height() ) { ffr.height($(this).height()); } else { $(this).height(ffr.height()) };
//     });
//     $("#fixedColumn > .fixedTable > table > tbody > tr").each ( function ( pos ) {
//       var ftr = $("#fixedContainer > .fixedTable > table > tbody > tr:eq(" + pos + ")");
//       matchSize(this, ftr);
//       //if ($(this).height() > $(ftr).height() ) { ftr.height($(this).height()); } else { $(this).height(ftr.height()) };
//     });
//     
    //adjust the widths of the fixedColumn header/footer to match the fixed columns themselves
    $("#fixedColumn > .fixedHead > table > tbody > tr:first > td").each( function ( pos ) {
      var tblCell = $("#fixedColumn > .fixedTable > table > tbody > tr:first > td:eq(" + pos + ")");
      var tblFoot = $("#fixedColumn > .fixedFoot > table > tbody > tr:first > td:eq(" + pos + ")");
      var maxWidth = $(this).width();
      if (tblCell.width() > maxWidth) { maxWidth = tblCell.width(); }
      if (tblFoot.length && tblFoot.width() > maxWidth) { maxWidth = tblFoot.width(); }
      $(this).width(maxWidth);
      $(tblCell).width(maxWidth);
      if (tblFoot.length) { $(tblFoot).width(maxWidth); }
    });
    
    
    //set the height of the table area, minus the heights of the header/footer.
    // note: we need to do this after the other adjustments, otherwise these changes would be overwrote
    var h = parseInt(options.height) - parseInt($("#fixedContainer > .fixedHead").height()) - parseInt($("#fixedContainer > .fixedFoot").height());
    //sanity check
    if (h < 0) { h = parseInt(options.height); }
    $("#fixedContainer > .fixedTable").height(h);
    $("#fixedColumn > .fixedTable").height(h);
    
    //Adjust the fixed column area if we have a horizontal scrollbar on the main table
    // - specifically, make sure our fixedTable area matches the main table area minus the scrollbar height,
    //   and the fixed column footer area lines up with the main footer area (shift down by the scrollbar height)
    if ($("#fixedContainer > .fixedTable").width() < $("#fixedContainer > .fixedTable > table").width() ) {
      var h = $("#fixedContainer > .fixedTable")[0].offsetHeight - 16;
      $("#fixedColumn > .fixedTable").height(h);  //make sure the row area of the fixed column matches the height of the main table, with the scrollbar
      $("#fixedColumn > .fixedFoot").css({        //offset the footer by the height of the scrollbar so that it lines up right.
        "position" : "relative",
        "top" : 16
      });
    }
        
    // Apply the scroll handlers
    $("#fixedContainer > .fixedTable").scroll( handleScroll );
    //the handleScroll() method is defined near the bottom of this file.
    
    //Phew! I think we're done.  Now onto testing.
    return tbl;
  }
  
  function buildLayout( src, options ) {
    //create a working area and add it just after our table.
    //The table will be moved into this working area
    var area = $("<div id=\"fixedArea\"></div>").appendTo($(src).parent());
    
    //fixed column items
    var fc = $("<div id=\"fixedColumn\" style=\"float: left;\"></div>").appendTo(area);
    var fch = $("<div class=\"fixedHead\"></div>").appendTo(fc);
    var fct = $("<div class=\"fixedTable\"></div>").appendTo(fc);
    var fcf = $("<div class=\"fixedFoot\"></div>").appendTo(fc);
    
    //fixed container items
    var fcn = $("<div id=\"fixedContainer\"></div>").appendTo(area);
    var fcnh = $("<div class=\"fixedHead\"></div>").appendTo(fcn);
    var fcnt = $("<div class=\"fixedTable\"></div>").appendTo(fcn);
    var fcnf = $("<div class=\"fixedFoot\"></div>").appendTo(fcn);
    
    //create the fixed column area
    if (options.fixedColumns > 0 && !isNaN(options.fixedColumns)) {
      buildFixedColumns( src, "thead", options.fixedColumns, fch );
      buildFixedColumns( src, "tbody", options.fixedColumns, fct );
      buildFixedColumns( src, "tfoot", options.fixedColumns, fcf );
      //see the buildFixedColumns() function below
    }
      
    //Build header / footer areas
    buildFixedTable( src, "thead", fcnh );
    buildFixedTable( src, "tfoot", fcnf );
    //see the buildFixedTable() function below
    
    //Build the main table
    //we'll cheat here - the src table should only be a tbody section, with the remaining columns, 
    //so we'll just add it to the fixedContainer table area.
    fcnt.append(src); 
    return area;  
  }
  
  /* ******************************************************************** */
  // duplicate a table section (thead, tfoot, tbody), but only for the desired number of columns
  function buildFixedColumns( src, section, cols, target ) {
    //TFOOT - get the needed columns from the table footer
    if ($(section, src).length) {   
      var colHead = $("<table></table>").appendTo(target);
      
      //If we have a thead or tfoot, we're looking for "TH" elements, otherwise we're looking for "TD" elements
      var cellType = "td";  //deafault cell type
      if (section.toLowerCase() == "thead" || section.toLowerCase() == "tfoot") { cellType = "th"; }
      
      //check each of the rows in the thead
      $(section + " tr", src).each( function () {
        var tr = $("<tr></tr>").appendTo(colHead);
        $(cellType + ":lt(" + cols + ")", this).each( function () {
          $("<td>" + $(this).html() + "</td>").addClass(this.className).attr("id", this.id).appendTo(tr);
          //Note, we copy the class names and ID from the original table cells in case there is any processing on them.
          //However, if the class does anything with regards to the cell size or position, it could mess up the layout.
          
          //Remove the item from our src table.
          $(this).remove();
        });
      });
    }
  }
  
  /* ******************************************************************** */
  // duplicate a table section (thead, tfoot, tbody)
  function buildFixedTable( src, section, target ) {
    if ($(section, src).length) {
      var th = $("<table></table>").appendTo(target);
      var tr = null;
      
      //If we have a thead or tfoot, we're looking for "TH" elements, otherwise we're looking for "TD" elements
      var cellType = "td";  //deafault cell type
      if (section.toLowerCase() == "thead" || section.toLowerCase() == "tfoot") { cellType = "th"; }
      
      $(section + " tr", src).each( function () {
        var tr = $("<tr></tr>").appendTo(th);
        $(cellType, this).each( function () {
          $("<td>" + $(this).html() + "</td>").appendTo(tr);
        });
        
      });
      //The header *should* be added to our head area now, so we can remove the table header
      $(section, src).remove();
    }
  }
  
  
  // ***********************************************
  // sycnchronize the heights of our rows
//   function matchRowHeights(area, section) {
//     $("#fixedColumn > " + area + " > table > " + section  + " > tr").each( function (pos) {
//       var targ = $("#fixedContainer > " + area + " > table > " + section + " > tr:eq(" + pos + ")");
//       if (targ.length) {
//         var srcHeight  = $(this).height();
//         var targHeight = $(targ).height();
//         if (srcHeight > targHeight) {
//           //set the target's height 
//           $(targ).height(srcHeight);
//         }
//         else {
//           //match the target's height
//           $(this).height(targHeight - 2);
//         }
//       }
//     });
//   }
  
  // ***********************************************
  // Handle the scroll events
  function handleScroll ( evt ) {
    //Find the scrolling offsets
    var tblarea = $("#fixedContainer > .fixedTable");
    var x = tblarea[0].scrollLeft;
    var y = tblarea[0].scrollTop;

    $("#fixedColumn > .fixedTable")[0].scrollTop = y;
    $("#fixedContainer > .fixedHead")[0].scrollLeft = x;
    $("#fixedContainer > .fixedFoot")[0].scrollLeft = x;
  }
  
  // ***********************************************
  //  Make two table cells equal size in terms of height / width
  //  We need to sync the sizes, rather than just applying the size of the src to the target.
  //  This will handle when the data inserted into the fixed areas is larger than the data in the src table.
  function syncCellSize(data) {
    var defs = { src: null, target: null, setWidth: true, setHeight: true };
    var data = $.extend( {}, defs, data );
    
    //exit if we don't have enough data
    if (!data) { return; }                              //nothing to operate on
    if (!data.src || !data.target) { return; }          //required element is missing, just exit
    
    //extract the height/width and border/padding settings for each element
    psrc = getSizeParams(data.src);
    ptarg = getSizeParams(data.target);
    
    
// console.log("*** src: " + $(data.src).text() + ", target: " + $(data.target).text());
// console.log("s: " + psrc.toString());
// console.log("t: " + ptarg.toString());
    
    //NOTE: THis is a horrible hack to make the code work with IE in the very specific case of JobTrax Crew Tracking.
//     if ($.browser.msie) { 
//       ptarg.borderTop = 1;
//       ptarg.borderBottom = 1;
//       ptarg.borderLeft = 1;
//       ptarg.borderRight = 1;
//       
//       psrc.borderTop = 1;
//       psrc.borderBottom = 1;
//       psrc.borderLeft = 1;
//       psrc.borderRight = 1;
//     }
    
    if (data.setWidth) {
      //determine which element is wider and set the other accordingly
      if (psrc.width > ptarg.width) {
        $(data.target)
        //.width( psrc.width )
        .css({
          "width"               : psrc.baseWidth,
          "padding-left"        : psrc.paddingLeft,
          "padding-right"       : psrc.paddingRight,
          "border-left-width"   : psrc.borderLeft,
          "border-right-width"  : psrc.borderRight
        });
      }
      else {
        $(data.src)
        //.width( ptarg.width )
        .css({
          "width"               : ptarg.baseWidth,
          "padding-left"        : ptarg.paddingLeft,
          "padding-right"       : ptarg.paddingRight,
          "border-left-width"   : ptarg.borderLeft,
          "border-right-width"  : ptarg.borderRight
        });
      }
    }
    
    
    if (data.setHeight) {
      //determine which element is taller and set the other accordingly
      if (psrc.height > ptarg.height) {
        if ($.browser.msie) { $(data.target).height(parseInt($(data.src).outerHeight()) - 4); } else { $(data.target).height($(data.src).outerHeight()); }
/*        $(data.target).css({
          "height"              : psrc.height + psrc.paddingTop + psrc.paddingBottom + psrc.borderTop + psrc.borderBottom,
//          "padding-top"         : psrc.paddingTop,
           "padding-bottom"      : psrc.paddingBottom
//          "border-top-width"    : psrc.borderTop,
//          "border-bottom-width" : psrc.borderBottom
        });*/
      }
      else {
        if ($.browser.msie) { $(data.src).height(parseInt($(data.target).outerHeight()) - 4); } else { $(data.src).height($(data.target).outerHeight()); }
/*       $(data.src).css({
         "height"              : ptarg.height + ptarg.paddingTop + ptarg.paddingBottom + ptarg.borderTop + ptarg.borderBottom,
         "padding-top"         : ptarg.paddingTop,
         "padding-bottom"      : ptarg.paddingBottom
//         "border-top-width"    : ptarg.borderTop,
//         "border-bottom-width" : ptarg.borderBottom
       });*/
      }
    }
  }
  
  // ***********************************************
  //  get size parameters for each element
  function getSizeParams(obj) {
    var params = {};
    params.border = parseInt($(obj).css("border"));
    params.borderLeft = parseInt($(obj).css("border-left-width")) || 0;
    params.borderRight = parseInt($(obj).css("border-right-width")) || 0;
    params.borderTop = parseInt($(obj).css("border-top-width")) || 0;
    params.borderBottom = parseInt($(obj).css("border-bottom-width")) || 0;
    params.padding = parseInt($(obj).css("padding"));
    params.paddingLeft = parseInt($(obj).css("padding-left"));
    params.paddingRight = parseInt($(obj).css("padding-right"));
    params.paddingTop = parseInt($(obj).css("padding-top"));
    params.paddingBottom = parseInt($(obj).css("padding-bottom"));
    
    //base height/width
//    params.baseWidth = $(obj)[0].offsetWidth;
//    params.baseHeight = $(obj)[0].offsetHeight;
    params.baseWidth = $(obj).outerWidth();
    params.baseHeight = $(obj).outerHeight();

/*console.log($(obj).text() + "w: " + params.baseWidth + ", h: " + params.baseHeight);
console.log("border: " + $(obj).css("border") + ", blw: " + $(obj).css("border-left"));*/
    
    //without padding
    if (params.padding) {
      params.widthWithoutPadding = params.baseWidth - (params.padding * 2);
      params.heightWithoutPadding = params.baseHeight - (params.padding * 2);
    }
    else {
      params.widthWithoutPadding = params.baseWidth - params.paddingLeft - params.paddingRight;
      params.heightWithoutPadding = params.baseHeight - params.paddingTop - params.paddingBottom;
    }
    
    //without borders
    if (params.border) {
      params.widthWithoutBorders = params.baseWidth - (params.border * 2);
      params.heightWithoutBorders = params.baseHeight - (params.border * 2);
      params.width = params.widthWithoutPadding - (params.border * 2);
      params.height = params.heightWithoutPadding - (params.border * 2);
    }
    else {
      params.widthWithoutBorders = params.baseWidth - params.borderLeft - params.borderRight;
      params.heightWithoutBorders = params.baseHeight - params.borderTop - params.borderBottom; 
      params.width = params.widthWithoutPadding - params.borderLeft - params.borderRight;
      params.height = params.heightWithoutPadding - params.borderTop - params.borderBottom; 
    }
    
    params.toString = function () {
      var out = "{"
      for (p in params) {
        if (p != "toString") {
          out += p + " : " + params[p] + ", ";
        }
      }
      out += "}";
      return out;
    }
    return params;
  }
  
  
  // ***********************************************
  //Defaults
  $.fn.fixedTable.defaults = {
    width : 500,
    height: 500,
    fixedColumns : 0,
    classHeader : "fixedHead",
    classFooter : "fixedFoot",
    classColumn : "fixedColumn"
  };

  // ***********************************************
  //  Reset the heights of the rows in our fixedColumn area
  $.fn.fixedTable.adjustSizes = function () {
    //headers
    if ($("#fixedContainer .fixedHead > table").length > 0) {
      $("#fixedColumn .fixedHead > table > tr:first td").each( function (pos) {
        var base = $("#fixedColumn .fixedTable > table tr:first td:eq(" + pos + ")");
        syncCellSize({src: base, target: this, setHeight: false });
      });
      $("#fixedContainer .fixedHead > table > tr:first td").each( function (pos) {
        var base = $("#fixedContainer .fixedTable > table > tr:first td:eq(" + pos + ")");
        syncCellSize({src: base, target: this, setHeight: false });
      });
    }
    
    //footers
    if ($("#fixedContainer .fixedFoot > table").length > 0) {
      $("#fixedColumn .fixedFoot > table > tbody > tr:first td").each( function (pos) {
        var base = $("#fixedColumn .fixedTable > table > tbody > tr:first td:eq(" + pos + ")");
        syncCellSize({src: base, target: this, setHeight: false });
      });
      $("#fixedContainer .fixedFoot > table > tbody > tr:first td").each( function (pos) {
        var base = $("#fixedContainer .fixedTable > table > tbody > tr:first td:eq(" + pos + ")");
        syncCellSize({src: base, target: this, setHeight: false });
      });
    }
    
    //columns
    if ($("#fixedColumn .fixedTable td").length > 0) {
      $("#fixedColumn .fixedTable > table > tbody > tr").each( function (pos) {
        //we need to find the td's of each row, and there may be more than one.
        $(this).children("td").each( function () {
          var base = $("#fixedContainer .fixedTable > table > tbody > tr:eq(" + pos + ") > td:first");
          syncCellSize({ src: base, target : this, setWidth: false });
        });
      });
    }
    
//     matchRowHeights(".fixedHead", "tbody");
//     matchRowHeights(".fixedFoot", "tbody");
//     matchRowHeights(".fixedTable", "tbody");
  };
  
})(jQuery);


