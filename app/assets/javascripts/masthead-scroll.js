// (function($) {
//   $(window).on('load resize', function(){
//       // masthead scroll
//       var header   = $('#header-nav'); // fixed DOM
//       var addclass = 'scrolled'; // add css class
//       var offset   = header.offset();
//       var scrollY  = offset.top; // scroll

//       $(window).scroll(function() {
//       if ($(window).scrollTop() > scrollY) {
//           header.addClass(addclass);
//       } else {
//           header.removeClass(addclass);
//       }
//   });
// })

$(function () {

  // scrollイベントを取得した際の処理を定義
  $(window).on("scroll", function () {
    // scrollTop()が0より大きい場合
    if ($(this).scrollTop() > 0) {
      // ヘッダーバーをslideDownして表示
      $(".l-header").slideDown();
    // scrollTop()が0の場合
    } else {
      // ヘッダーバーをslideUpして非表示
      $(".l-header").slideUp();
    }
  });

});