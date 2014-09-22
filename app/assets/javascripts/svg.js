if (!Modernizr.svg) {
  $('img[src$=".svg"]').each(function() {
    $(this).attr('src', $(this).data('fallbackImage'));
  });
}
