//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap
//= require_tree .

/* 
	MODAL LOGIN / CADASTRO
*/
$(function(){
	$( "#create_using_email_button" ).click(function() {
  		$("#email_register_buttom").hide();
  		$("#email_register_form").show();
  		$("#signup_email").focus();
	});
});


/* 
	FIM MODAL LOGIN / CADASTRO
*/