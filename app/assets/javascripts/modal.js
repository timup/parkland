$(function(){

  // Hide Company and Collection Forms
  $("#company-form").hide();
  $("#collection-form").hide();

  $("#person-btn-modal").on("click", function(event){
    event.preventDefault();
    // Make button large
    $(".form-select-btn.btn-lg").removeClass("btn-lg");
    $(this).addClass("btn-lg", 1000);
    // Person form show, others hide
    $("#person-form").show();
    $("#company-form, #collection-form").hide();
    // Change modal body class to person-modal-body
    $("#new-resource-modal").addClass("person-modal-body").removeClass("company-modal-body").removeClass("collection-modal-body");
    // Change input class to person-form-input
    $(".form-input").addClass("person-form-input").removeClass("company-form-input").removeClass("collection-form-input");
  });

  $("#company-btn-modal").on("click", function(event){
    event.preventDefault();
    // Make button large
    $(".form-select-btn.btn-lg").removeClass("btn-lg");
    $(this).addClass("btn-lg", 10000);
    // Company form show, others hide
    $("#company-form").show();
    $("#person-form, #collection-form").hide();
    // Change modal body class to company-modal-body
    $("#new-resource-modal").addClass("company-modal-body").removeClass("person-modal-body").removeClass("collection-modal-body");
    // Change input class to person-form-input
    $(".form-input").addClass("company-form-input").removeClass("person-form-input").removeClass("collection-form-input");
  });
  
  $("#collection-btn-modal").on("click", function(event){
    event.preventDefault();
    // Make button large
    $(".form-select-btn.btn-lg").removeClass("btn-lg");
    $(this).addClass("btn-lg", 1000);
    // Collection form show, others hide
    $("#collection-form").show();
    $("#person-form, #company-form").hide();
    // Change modal body class to collection-modal-body
    $("#new-resource-modal").addClass("collection-modal-body").removeClass("company-modal-body").removeClass("person-modal-body");
    // Change input class to person-form-input
    $(".form-input").addClass("collection-form-input").removeClass("company-form-input").removeClass("person-form-input");
  });

});