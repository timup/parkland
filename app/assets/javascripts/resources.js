$(".resource-collection-ids").change(function() {
  $(this).parent("form").submit();
});

// Hide organization form
$(".org-info").hide();

// Add organization button
$("#organization-btn").on("click", function(){
  $(".org-info").toggle();
  // Clear forms
  $(".org-info > input[type=text], textarea").val("");
  $(".org-info input").val("");
  $(".org-info textarea").text("");
});
