$(document).on('turbolinks:load', function() {
    function buildHTML(message){
      var html =
      `<div class="container__main__contents__message">
        <div class="container__main__contents__message__dammyheader"></div>
        <div class="container__main__contents__message__header">
          <h2>
            ${ message.name }
          </h2>
          <span>
            ${ message.time }
          </span>
        </div>
        <div class="container__main__contents__message__text">
          <p>
            ${ $.isEmptyObject(message.message) ? "" : message.message }
            <img src= "${ $.isEmptyObject(message.image) ? "" : message.image}"/>
         </p>
        </div>
       </div>`
      return html;
    }
    $('#new_message').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData($(this).get(0));
      var href     = window.location.href;
      var messageConfirm  = $.isEmptyObject(formData.get("message[message]"));
      var imageConfirm    = $.isEmptyObject(formData.get("message[image]").name);
      // image,messageどちらも空の場合はこの時点で弾く。
      if( messageConfirm == true && imageConfirm == true){
        alert('メッセージを入力してください。');
      }else{
        $.ajax({
          url:         href,
          type:        "POST",
          data:        formData,
          contentType: false,
          processData: false,
          dataType:   'json',
          // 送る前に、disabledを追加する
          beforeSend: function(xhr, setting) {
            $(".container__main__footer__right__submit").prop('disabled', true);
          },
        })
        .done(function(data){
          // 正しく、遷移した場合の処理
          var html = buildHTML(data);
          $('.container__main__contents').append(html);
          $('.container__main__footer__left__send').val('');
          $('#uploader-icon').val('');
          // animateによって、スクロールさせる処理
          $('.container__main__contents').animate({scrollTop: $('.container__main__contents')[0].scrollHeight}, 500, 'swing')
          // 処理が終わったら、data-disable-withを取り除いて、連続送信できるようにする。
          $(".container__main__footer__right__submit").prop('disabled', false);
        })
        // failは通信処理ができなかった時の処理
        .fail(function(XMLHttpRequest, textStatus, errorThrown){
          alert('通信に失敗しました。再度投稿してください。');
          // 処理が終わったら、data-disable-withを取り除いて、連続送信できるようにする。
          $(".container__main__footer__right__submit").prop('disabled', false);
        })
      }
    });
});
