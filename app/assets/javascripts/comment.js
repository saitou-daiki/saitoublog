$(function(){

  function buildComment(comment){
    
      var html = `<div class="comment">
                    <div class="comment-name clearfix">
                      <span>名前：</span>
                      ${comment.user_name}
                    </div>
                    <div class="comment-comment clearfix">
                      ${comment.comment}
                    </div>
                  </div>`

      return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
 
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(comment){
      var html = buildComment(comment);
      $('.comments').append(html);
      $('form')[0].reset();
      // $('.textbox').val('');
      $('.comments').animate({
        scrollTop: $('.comments')[0].scrollHeight});
     })

     .always(() => {
      $('.form__submit').removeAttr('disabled');
     })
    
    .fail(function(){
      alert('コメントの送信に失敗しました');

    })
  })



//自動更新はここから。
  $(function(){



  function buildHTML(comment){
  

    var html = `<div class="comment" data-comment-id="${comment.id}">
                  <div class="comment-name clearfix">
                    <span>名前：</span>
                    ${comment.user_name}
                  </div>
                  <div class="comment-comment clearfix">
                    ${comment.comment}
                  </div>
                </div>`
    return html;
  }




    var reloadComments = function(){
      if (window.location.href.match(/\/tweets\/\d+\/comments/)){

        var url = 'api/comments' 
        
        var last_comment_id = $('.comment:last').data('comment-id');
        
        
        $.ajax({

          url:  url,
          type: 'GET',

          data: {last_id: last_comment_id},
          dataType: 'json'
        })
      
        .done(function(comments){
   
          var insertHTML = '';
          comments.forEach(function(comment){
            insertHTML = buildHTML(comment);
            $('.comments').append(insertHTML);
          })
          $('.comments').animate({scrollTop: $('.comments')[0].scrollHeight}, 'fast');

        })
        .fail(function(){
          alert('自動更新に失敗しました');
        });
      };
  };
  setInterval(reloadComments, 7000);
  });  


});
