(function($) {


  // Gravatars
  $('img[data-gravatar-email]').each(function(){
    // get the email
    var email = $(this).attr('data-gravatar-email');

    // modify the source of the image
    if(email != '') {
      $(this).attr('src', 'http://www.gravatar.com/avatar/' + md5(email));
    }
  });

  $("a[data-toggle='tooltip']").tooltip();

  $("a[data-expand]").click(function() {
    var target = $(this).attr('data-expand')
    var $target = $(target);
    $target.toggleClass('hide');
  });


})(jQuery);
