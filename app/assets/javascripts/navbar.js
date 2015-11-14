$(function () {
  $('#navbar-chat[data-toggle="popover"]').popover({
    html: true, 
    content: '<iframe frameborder="0" scrolling="no" height="435" width="404" src="http://parkland-slackin.herokuapp.com/"></iframe>', 
    container: "body",
    placement: "bottom"
  });
});
