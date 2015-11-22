$(function() {
  $(".collections-sortable").sortable({
    axis: 'y',
    handle: '.handle',
    update: function() {
      $.post($(this).data('update-url'), $(this).sortable('serialize'), function() {
        $(".collections-sortable-item").each(function() {
          $(this).children('.collections-sortable-position').html($(this).index()+1);
        });
      });
    }
  });
});

$(document).on('ajax:success', '.js-feature-collection', function(evt, data, status, xhr) {
  $form = $(evt.currentTarget);
  $form.find(".feature-star").toggleClass("featured");
})
