$(document).ready(function(){

  $("#form-btn").on("click", function(){
    $("#new-resource").show();
  });

  // Hide Company and Collection Forms
  $("#company-form").hide();
  $("#collection-form").hide();

  // Person form show, others hide
  $("#person-btn").on("click", function(event){
    event.preventDefault();
    $("#person-form").show();
    $("#company-form, #collection-form").hide();
    // Change modal body class to person-body
    $("#new-modal").addClass("person-body");
    $("#new-modal").removeClass("company-body");
    $("#new-modal").removeClass("collection-body");
  });

  // Company form show, others hide
  $("#company-btn").on("click", function(event){
    event.preventDefault();
    $("#company-form").show();
    $("#person-form, #collection-form").hide();
    // Change modal body class to company-body
    $("#new-modal").addClass("company-body");
    $("#new-modal").removeClass("person-body");
    $("#new-modal").removeClass("collection-body");
  });
  // Collection form show, others hide
  $("#collection-btn").on("click", function(event){
    event.preventDefault();
    $("#collection-form").show();
    $("#person-form, #company-form").hide();
    // Change modal body class to collection-body
    $("#new-modal").addClass("collection-body");
    $("#new-modal").removeClass("company-body");
    $("#new-modal").removeClass("person-body");
  });

  // Change background color to match buttons

});