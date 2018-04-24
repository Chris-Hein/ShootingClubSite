/*jslint browser: true*/
/*global $, jQuery*/

jQuery(document).ready(function () {

	
	//create scroll to top button effects
	jQuery(window).scroll(function() {
		if(jQuery(this).scrollTop() > 200) {
			jQuery(".scrollUp a").fadeIn();
		} else {
			jQuery(".scrollUp a").fadeOut();
		}
	} );
	
	//animate the scroll to top
	jQuery(".scrollUp a").click(function(event){
		event.preventDefault();
		jQuery("html, body").animate({scrollTop: 0}, "slow");
	});
	
	
	   jQuery('.single_toggle').on('click', function(event){
    	event.preventDefault();
    	// create accordion variables
    	var accordion = $(this);
    	var accordionToggleIcon = $(this).children('.toggle-icon');
           
    	// toggle accordion link open class
    	accordion.toggleClass("open");
    	// toggle accordion content
    	accordionContent.slideToggle(250);
    	
    	// change plus/minus icon
    	if (accordion.hasClass("open")) {
    		accordionToggleIcon.html("<i class='fa fa-minus-circle'></i>");
    	} else {
    		accordionToggleIcon.html("<i class='fa fa-plus-circle'></i>");
   }
    });
	
	
	jQuery('.single_toggle').on('show hide', function (n) {
		jQuery(n.target).siblings('.toggle_heading').find('.toggle_title a i').toggleClass('glyphicon-plus glyphicon-minus');
	});
	

//remove then default action of anchor tag (a .mobile device menu)
	jQuery("a.small_device_menu").click(function(event) {
		event.preventDefault();
		jQuery("div.small_menu_area").slideToggle(); //styling with a slide of an element when click this
	} );
	
	// clone a area/div and append it to another area/div
	jQuery(".mainmenu ul:first-child").clone().appendTo(".small_menu_area");
	
	jQuery("a.log").click(function (event) {
        event.preventDefault();
    });
    
    
    //jQuery load more
    jQuery(function($){

	$('.post-listing').append( '<span class="load-more">Click here to load earlier stories</span>' );
	var button = $('.post-listing .load-more');
	var page = 2;
	var loading = false;

	$('body').on('click', '.load-more', function(){
		if( ! loading ) {
			loading = true;
			var data = {
				action: 'be_ajax_load_more',
				page: page,
				query: beloadmore.query,
			};
			$.post(beloadmore.url, data, function(res) {
				if( res.success) {
					$('.post-listing').append( res.data );
					$('.post-listing').append( button );
					page = page + 1;
					loading = false;
				} else {
					// console.log(res);
				}
			}).fail(function(xhr, textStatus, e) {
				// console.log(xhr.responseText);
			});
		}
	});
		
});
    

});
