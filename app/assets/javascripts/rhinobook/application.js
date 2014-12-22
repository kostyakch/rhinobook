// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// require_tree .

$(function(){
    
	$(document).on("click", "[data-behavior*=add_new_image]",  function(e) {
		e.preventDefault();
		ids = [-1];

		$(".image-list input[type=file]").each( function( index, element ) {			
			ids.push(parseInt(element.name.match(/\[(\d+)\]/)[1], 10));
		});				
		newId = Math.max.apply(Math, ids) + 1;
		$(".image-list").append($("[data-behavior*=add_new_image]").data("new").replace(/\[(\d+)\]/g, "[" + newId + "]"));
	});

	$(document).on("click", "[data-behavior*=add_new_video]",  function(e) {
		e.preventDefault();
		ids = [-1];

		$(".video-list input[type=file]").each( function( index, element ) {			
			ids.push(parseInt(element.name.match(/\[(\d+)\]/)[1], 10));
		});				
		newId = Math.max.apply(Math, ids) + 1;
		$(".video-list").append($("[data-behavior*=add_new_video]").data("new").replace(/\[(\d+)\]/g, "[" + newId + "]"));
	});
})