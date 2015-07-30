$(document).ready(function(){

  $("#form-btn").on("click", function(){
    $("#new-resource").show();
  });

  // Hide Company and Collection Forms
  $("#company-form").hide();
  $("#collection-form").hide();

  $("#person-btn").on("click", function(event){
    event.preventDefault();
    // Make button large
    $(".form-select-btn.btn-lg").removeClass("btn-lg");
    $(this).addClass("btn-lg", 1000);
    // Person form show, others hide
    $("#person-form").show();
    $("#company-form, #collection-form").hide();
    // Change modal body class to person-body
    $("#new-modal").addClass("person-body");
    $("#new-modal").removeClass("company-body");
    $("#new-modal").removeClass("collection-body");
    // Change input class to person-form-input
    $(".form-input").addClass("person-form-input");
    $(".form-input").removeClass("company-form-input");
    $(".form-input").removeClass("collection-form-input");
  });

  $("#company-btn").on("click", function(event){
    event.preventDefault();
    // Make button large
    $(".form-select-btn.btn-lg").removeClass("btn-lg");
    $(this).addClass("btn-lg", 10000);
    // Company form show, others hide
    $("#company-form").show();
    $("#person-form, #collection-form").hide();
    // Change modal body class to company-body
    $("#new-modal").addClass("company-body");
    $("#new-modal").removeClass("person-body");
    $("#new-modal").removeClass("collection-body");
    // Change input class to person-form-input
    $(".form-input").addClass("company-form-input");
    $(".form-input").removeClass("person-form-input");
    $(".form-input").removeClass("collection-form-input");
  });
  
  $("#collection-btn").on("click", function(event){
    event.preventDefault();
    // Make button large
    $(".form-select-btn.btn-lg").removeClass("btn-lg");
    $(this).addClass("btn-lg", 1000);
    // Collection form show, others hide
    $("#collection-form").show();
    $("#person-form, #company-form").hide();
    // Change modal body class to collection-body
    $("#new-modal").addClass("collection-body");
    $("#new-modal").removeClass("company-body");
    $("#new-modal").removeClass("person-body");
    // Change input class to person-form-input
    $(".form-input").addClass("collection-form-input");
    $(".form-input").removeClass("company-form-input");
    $(".form-input").removeClass("person-form-input");
  });

  // Change background color to match buttons

});