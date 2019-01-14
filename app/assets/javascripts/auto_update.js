$(document).on('turbolinks:load', function() {
    function buildHTML(message){
      var html =
        `<div class="container__main__contents__message">
          <div class="container__main__contents__message__dammyheader"></div>
          <div class="container__main__contents__message__header">
            <h2>
               ${message.name}
            </h2>
            <span>
               ${message.time}
            </span>
          </div>
          <div class="container__main__contents__message__text">
            <p>
              ${ $.isEmptyObject(message.message) ? "" : message.message }
            </p>
          </div>
          <div class="container__main__contents__message__image">
            <img src= "${ $.isEmptyObject(message.image) ? "" : message.image}"/>
          </div>
        </div>`
      return html;
    }
    var updateTimer  = ""
    var update       = "定期アップデートだよ！";

    updateTimer = setInterval(function(e){
    var href         = window.location.href;
    // messagesとgroupsが含まれるURLの場合を判断する。
    var messeWin     = /(?=.*messages)(?=.*groups)/.test(href);
    if(messeWin == false ){ //message.indexではない条件分岐
      clearInterval(updateTimer);
    }else{ //message.indexに入った条件分岐
        $.ajax({
          url:         href,
          type:        "GET",
          data:        update,
          contentType: false,
          processData: false,
          dataType:   'json',
        })
        // 正しく、遷移した場合の処理
        .done(function(data){
          $('.container__main__contents').children().remove();
          data.forEach( function( messageData ) {
            var html = buildHTML(messageData)
            $('.container__main__contents').append(html);
          });
        })
        // failは通信処理ができなかった時の処理
        .fail(function(){
          // 通信失敗すると自動更新が起こらないようにする。
          clearInterval(updateTimer);
        })
      }    // 5000m秒ごとに、イベントを行うことを定義する。
    }, 5000 );
});
