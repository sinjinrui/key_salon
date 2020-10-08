$(function(){
  $('.Detail__option--delete').on('click', function (){
    if (!confirm('イベント情報を削除します。よろしいですか？')) {
      return false;
    } else {}
  });
})