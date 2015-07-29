$(".resource-collection-ids").change(function() {
  $(this).parent("form").submit();
});

// $(".org-info").hide();

$("#resource_type_person").on("click", function(){
  $(".org-info").show();
});

$("#resource_type_company").on("click", function(){
  $(".org-info").hide();
});