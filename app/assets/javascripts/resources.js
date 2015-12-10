$(function(){
  $(".resource-collection-ids").change(function() {
    $(this).parent("form").submit();
  });

  // Submit RC Descriptions in textarea form
  $(".js-resource-collection-description").keypress(function (e) {
    if (e.which == 13) {
      $(this).closest('form').submit();
      e.preventDefault();
    }
  });
});
