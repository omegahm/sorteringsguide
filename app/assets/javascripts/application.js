//= require jquery
//= require jquery_ujs
//= require knockout
//= require bootstrap
//= require_tree .

var collapsed = true;
$("#missing").click(function() {
  $("#send-suggestion-mail-collapse").collapse("toggle");
});

$('#send-suggestion-mail-collapse').on("shown.bs.collapse", function() {
  $(window).scrollTop($('#send-suggestion-mail-collapse').offset().top);
});
