$(document).on('turbolinks:load', function() {
    function buildHTML(userData){
      var html =
      `<div class="chat-group-user clearfix">
         <p class="chat-group-user__name">${ userData.user_name }</p>
         <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ userData.id }" data-user-name="${ userData.user_name }">追加</a>
       </div>`
       return html
    }
    function buildChatUser(userId, userName){
      var html =
      `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${userId}'>
        <input name='group[user_ids][]' type='hidden' value='${userId}'>
        <p class='chat-group-user__name'>${userName}</p>
        <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
      </div>`
      return html
    };
    $('#user-search-field').on('keyup', function(e){
      e.preventDefault();
      var input = $('#user-search-field').val();
      if(input == ""){
        // 空で全一致してしまうのを防ぐ分岐
        $('#user-search-result').children().remove();
      }else{
      $.ajax({
        url:         '/users',
        type:        "GET",
        data:        {keyword: input},
        dataType:   'json',
      })
      // 通信処理ができた場合の処理
      .done(function(data){
        if($.isEmptyObject(data)){
        // 一致したものがない場合の分岐
        $('#user-search-result').children().remove();
        }else{
          // 一致したものを表示する分岐
        $('#user-search-result').children().remove();
        data.forEach( function( userData ) {
          var htmlSearch = buildHTML(userData)
          $('#user-search-result').append(htmlSearch);
        });
        }
      })
      // 通信処理ができなかった時の処理
      .fail(function(){
        alert('ユーザー検索に失敗しました');
      })
    }
    });
    $(document).on('click','.chat-group-user__btn--add',function(){
      var userId   = $(this).attr('data-user-id');
      var userName = $(this).attr('data-user-name')
      var htmlChatUser = buildChatUser(userId, userName);
      $(this).parent().remove();
      $('#user-membe-result').append(htmlChatUser);
    });
    $(document).on('click','.chat-group-user__btn--remove',function(){
      $(this).parent().remove();
    });
});
