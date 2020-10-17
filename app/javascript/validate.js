$(function(){
  const errorClass = 'errors';

  const requiredMessage = '必須入力です。'
  const envMessage = '選択してください。'
  

  $('.event-form_with').submit(function(){
    $('.event-form').each(function(){
      if ($(this).val()) {
        $(this).next('span').removeClass(errorClass);
      } else {
        $(this).next('span').addClass(errorClass);
        $(this).next('span').html(requiredMessage);
      }
    });

    var envOption = $(".env-field option:selected").val();

    if(envOption == '1') {
      $('.env-field').next('span').addClass(errorClass);
      $('.env-field').next('span').html(envMessage);
    }

    if($('.errors').length > 0) {
      alert('必須項目を入力してください');
      return false;
    }
  });
})