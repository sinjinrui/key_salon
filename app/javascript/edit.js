$(function(){
  $('.Detail__option--delete, .Detail__guide--delete').on('click', function (){
    if (!confirm('イベント情報を削除します。よろしいですか？')) {
      return false;
    } else {}
  });
})