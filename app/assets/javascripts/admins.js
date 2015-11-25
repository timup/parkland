$(document).on('ajax:success', '.js-feature-item', function(evt, data, status, xhr) {
  $form = $(evt.currentTarget);
  $form.find(".feature-star").toggleClass("featured");
})