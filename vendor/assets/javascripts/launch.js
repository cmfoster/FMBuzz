//   WARERMARKS
  $(document).ready(function() {
  $("#email").Watermark("Enter your email");
    $("#favstation").Watermark("Your Favorite Station 'ie. WLTL'");
    $('#new_subscriber').submit( function(){
      $('.signuploader').append($('.signupbar'));
      $('.signupbar').css({display:'block'});
    });
  // SIDELEFT BUTTON SLIDES
  $('#logo').click( function() {
    if($('#description').is(':hidden')) {
      $('#sideleft>h1:not(this)').removeClass("active");
      $('#content>div:visible').hide('fast', function() {
      $('#description').show('slide', {direction: "right"}, 700);
      });
    }
  });
  $('#listenbtn').click( function() {
    if($('#description2').is(':hidden')) {
      $('#sideleft>h1:not(this)').removeClass("active");
      $('#content>div:visible').hide('fast', function() {
	$('#description2').show('slide', {direction: "right"}, 700);
	$('#listenbtn').addClass("active");
      });
    }
  });
  $('#interactbtn').click( function() {
    if($('#description3').is(':hidden')) {
      $('#sideleft>h1:not(this)').removeClass("active");
      $('#content>div:visible').hide('fast', function() {
	$('#description3').show('slide', {direction: "right"}, 700);
	$('#interactbtn').addClass("active");
      });
    }
  });
  $('#winbtn').click( function() {
    if($('#description4').is(':hidden')) {
      $('#sideleft>h1:not(this)').removeClass("active");
      $('#content>div:visible').hide('fast', function() {
	$('#description4').show('slide', {direction: "right"}, 700);
	$('#winbtn').addClass("active");
      });
    }
  });

  // START BUTTON TRANSITION
  $('#startbtn').click( function() {
    $(this).hide('fast',function() {
      $('#sform').fadeIn(2000);
    });
  });
});

// FADE LOOP
$.fn.fadeLoop = function()
{
    $(this).delay(4000).animate({opacity: 0.1}, 1000, function() {
        $(this).animate({opacity: .8}, 2000,  $(this).fadeLoop);
    });
};

$(document).ready(function() {
  $('#radiowaves').fadeLoop();
    
    //CONTACT US FORM
   //submittimg contact us form
  $('.contactUsForm').submit( function(){

		//validating the form
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var email = document.getElementById('e-mail');
		if (!filter.test(email.value)) {
			$('.email-missing').show();
		} else {$('.email-missing').hide();}
		if (document.cform.name.value == "") {
			$('.name-missing').show();
		} else {$('.name-missing').hide();}	
		if (document.cform.message.value == "") {
			$('.message-missing').show();
		} else {$('.message-missing').hide();}		
		if ((document.cform.name.value == "") || (!filter.test(email.value)) || (document.cform.message.value == "")){
			return false;
		} 
		
		if ((document.cform.name.value != "") && (filter.test(email.value)) && (document.cform.message.value != "")) {

			//hide form fields
			$('.contactUsForm').hide();
		
			//show the loader
			$('.loader').append($('.bar'));
			$('.bar').css({display:'block'});
		
			//send ajax request
			$.post('contact',{name:$('#name').val(),
							  email:$('#e-mail').val(),
							  message:$('#message').val()},
		
			//return data
			function(data){
			  //hide the graphic
			  $('.bar').css({display:'none'});
			  $('.loader').append(data);
			//waits 2000, then closes the form and fades out
			});
			
			setTimeout('parent.$.fn.colorbox.close()', 3000);

			//stay on the page
			return false;
		} 
  });


});

