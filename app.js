window.onscroll = function() {
  showNavLogo();
};

function showNavLogo() {
  var scrollHeight = $(this).scrollTop();
  if (scrollHeight > 400) {
    $('nav .logo').css('display', 'inline-block');
    $('nav').css('justify-content', 'space-between');
  } else {
    $('nav .logo').css('display', 'none');
    $('nav').css('justify-content', 'flex-end');
  }
};

$(function() {
  $('.meetup-details').hide();
  $('.meetup-toggle').on('click', function() {
    $(this).parent().siblings('.meetup-details').toggle();
    $(this).toggleClass('rotate');
  });

});