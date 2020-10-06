$(function(){
  $('.Header__right--menu').on('click',function() {
    $('body').addClass("open-menu");
  });

  $('.Bc-menu__close--btn, .Bc-menu').on('click', function(){
    $('body').removeClass("open-menu");
  });
    var pos = 0;
  $(window).on('scroll', function(){
    if($(this).scrollTop() <= pos){
      $('body').removeClass('Hide');
    }else{
      $('body').addClass('Hide');
      
    }

    pos = $(this).scrollTop();
  });
})