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


})(jQuery);
