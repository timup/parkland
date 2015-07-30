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

  // Collection form show, others hide

});