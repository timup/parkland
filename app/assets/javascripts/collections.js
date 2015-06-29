$(function() {
  $(".collections-sortable").sortable({
    axis: 'y',
    handle: '.handle',
    update: function() {
      $.post($(this).data('update-url'), $(this).sortable('serialize'), function() {
        $(".collections-sortable tr").each(function() {
          $(this).children('td.collections-sortable-position').html($(this).index()+1);
        });
      });
    }
  });
});