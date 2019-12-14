$(function(){


  var search_list = $(".m-article-lis.fadein");


  function buildHTML(tweet) {
    var htmls = `<h1>${tweet.keyword}の検索結果は${tweet.ids}件です</h1>`
    return htmls;
  }


  function appendTweet(tweet){

    var image =  tweet.image ? `<img src="${tweet.image}">` : image = " ";
    var current_user = tweet.user_sign_in && tweet.user_sign_in.id == tweet.user_id ?
                        `<a class="background-green" href="/tweets/${tweet.tweet_id}/edit">記事を編集する
                         </a>
                         <a class="background-red" rel="nofollow" data-method="delete" href="/tweets/${tweet.tweet_id}">記事を削除する
                         </a>` : "";
                       

    var html = `
                <div class="m-article">
                  <figure class="m-article_image">
                    <a href="/tweets/${tweet.tweet_id}/comments">

                      ${image}
                    </a>
                  </figure>
                  <div class="m-article_text-block">
                    <div class="m-article_text-block-top">
                      <a href="/tweets/${tweet.tweet_id}/comments">
                        <h2 class="m-article_title">
                          ${tweet.title}

                        </h2>
                        <p class="m-article_date">
                          ${tweet.created_at}
                        </p>
                        <p class="m-article_summary">
                          ${tweet.content}
                        </p>
                        <div class="pink">
                          ${tweet.tags_first_name}
                        </div>
                        <p></p>
                        ${current_user}
                      </a>
                    </div>
                  </div>
                </div> `

    search_list.append(html);
  }

  function appendErrMsgToHTML(msg){
    var html = `${ msg }`
    // search_list.append(html);
    $('.search-result').append(html);
  }

  $(".search_query").on("keyup", function(){
    var input = $(".search_query").val();

    $.ajax({
      type: 'GET',
      url: '/tweets/search',
      
      data: { keyword: input},
      dataType: 'json'
    })
  
    .done(function(tweets){

      search_list.empty();
      
      if (tweets.length !== 0){

        tweets.forEach(function(tweet){

          
          if (input.length !== 0){
          var insertHTML ='';
          insertHTML = buildHTML(tweet);
          $('.search-result').empty();
          $('.search-result').append(insertHTML);
          }else{
            $('.search-result').empty();
            $('.search-result').append('検索結果がこちらに表示されます');
          }
       

          appendTweet(tweet);
        });
      }
      else{

        $('.search-result').empty();
        appendErrMsgToHTML("一致するツイートはありません");
      }

    })

    .fail(function(){
      alert('検索に失敗しました');
    
    });
  });
});