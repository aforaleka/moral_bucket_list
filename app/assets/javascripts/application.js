// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require modernizr.custom.js
//= require twitter/bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require_tree .


$(function() {
	$total = $('.act').length;
	$('.hide-div').hide();

	for(var i = 0; i < $total; i++) {
		$(".act"+i).mouseenter(function(){
			$(this).find(".hide-div").fadeIn('0.4s');
		}).mouseleave(function() {
			$(this).find(".hide-div").hide();			
		});
	}
});
