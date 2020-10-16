$(function() {
  var body = $('body');
  body.addClass('move');

  body.delay(1500).queue(function(next) {
    $(this).addClass('move2');
    next();
  });

  body.delay(800).queue(function(next) {
    $(this).addClass('move3');
    next();
  });

  $('.Welcome').delay(3300).fadeOut(1500);
})