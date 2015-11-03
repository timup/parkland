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

// $(function() {
//   var colors = ['88A825','35203B','911146','CF4A30','ED8C2B'];
//   $('.collection-panel').each(function() {
//     $(this).css('background-color', "#"+colors[Math.floor(Math.random() * colors.length)]);
//   });
// });