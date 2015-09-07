$(function(){

  $(".resource-collection-ids").change(function() {
    $(this).parent("form").submit();
  });

  // Hide organization form
  $(".org-info").hide();

  // Add organization button
  $("#organization-btn").on("click", function(){
    $(".org-info").toggle();
    // Clear forms
    $(".org-info input").val("");
    $(".org-info textarea").val("");
    // Rotate arrow 180deg
    $(".org-arrow").toggleClass("down");
  });

});