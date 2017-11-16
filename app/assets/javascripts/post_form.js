$(function () {
  var $title = $('#post_title');
  var $slug = $('#slug');
  $title.on('keydown', function () {
    setTimeout(function () {
      $slug.html($title.val().toLowerCase().replace(/[^a-z0-9]+/g,'-'));
    }, 0);
  });
})