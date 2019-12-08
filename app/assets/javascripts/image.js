// $(function(){
//   $fileField = $('#file')
 
//   // 選択された画像を取得し表示
//   $($fileField).on('change', $fileField, function(e) {
//     file = e.target.files[0]
//     reader = new FileReader(),
//     $preview = $("#img_field");
 
//     reader.onload = (function(file) {
//       return function(e) {
//         $preview.empty();
//         $preview.append($('<img>').attr({
//           src: e.target.result,
//           width: "100%",
//           class: "preview",
//           title: file.name
//         }));
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// });
// $('#myImage').on('change', function (e) {
//   var reader = new FileReader();
//   reader.onload = function (e) {
//       $("#preview").attr('src', e.target.result);
//   }
//   reader.readAsDataURL(e.target.files[0]);
// });

// $('#myImage').on('change', function (e) {
//   var reader = new FileReader();
//   reader.onload = function (e) {
//       $("#preview").attr('src', e.target.result);
//   }
//   reader.readAsDataURL(e.target.files[0]);
// });

$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        
        //既存のプレビューを削除
        $preview.empty();
        debugger
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "300px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
