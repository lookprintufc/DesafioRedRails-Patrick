//= require jquery
//= require jquery_ujs
//= require toast/toastr.min.js
//= require bootstrap/bootstrap
//= require maps/place
//= require select/jquery.multi-select
//= require dropify/dropify.min

//= require_tree .

/* 
	MODAL LOGIN / CADASTRO
*/
$('#pre-selected-options').multiSelect();
$(function(){

  $('.dropify').dropify();
	$( "#create_using_email_button" ).click(function() {
  		$("#email_register_buttom").hide();
  		$("#email_register_form").show();
  		$("#signup_email").focus();
	});

	$('#signup-face').click(function() {
        centerPopup($(this).attr('action'), 510, 660);
        return false;
    });
    
    if(window.opener) {
    window.opener.location.reload(true);
    window.close()
  }
});

function centerPopup(linkUrl, width, height) {
    var sep = (linkUrl.indexOf('?') !== -1) ? '&' : '?',
        url = linkUrl + sep + 'popup=true',
        left = (screen.width - width) / 2 - 16,
        top = (screen.height - height) / 2 - 50,
        windowFeatures = 'menubar=no,toolbar=no,status=no,width=' + width +
            ',height=' + height + ',left=' + left + ',top=' + top;
    return window.open(url, 'authPopup', windowFeatures);
}

/* 
	FIM MODAL LOGIN / CADASTRO
*/

function scroll_home(type,class_div){
  if(type>0) {
    $("."+class_div).animate( { scrollLeft: '+=300' }, 500 );
  } else {
    $("."+class_div).animate( { scrollLeft: '-=300' }, 500 );
  }
}

