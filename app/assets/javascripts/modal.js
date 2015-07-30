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
  });

  // Company form show, others hide
  $("#company-btn").on("click", function(event){
    event.preventDefault();
    $("#company-form").show();
    $("#person-form, #collection-form").hide();
  });
  // Collection form show, others hide
  $("#collection-btn").on("click", function(event){
    event.preventDefault();
    $("#collection-form").show();
    $("#person-form, #company-form").hide();
  });

  // Top buttons clear forms
  // $(".form-select-btn").on("click", function(){
    // $(".modal-body input").val("");
    // $(".modal-body textarea").val("");
  // });
});