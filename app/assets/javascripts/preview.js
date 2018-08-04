$(function(){
  $(".col-md-12").on('change', function() {
    var file = $(this).prop('files')[0],
        filereader = new FileReader(),
        find_img = $(this).find("img"),
        view_box = $(this);

    if(find_img.length){
       find_img.nextAll().remove();
       find_img.remove();
    }

    // ファイル読み込みが完了した際のイベント登録
    filereader.onload = function() {

        $(".cover-image-upload").prepend($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "500px",
                  // class: "cover-image-upload",
                  title: file.name
              }));
        $(".image-upload").prepend($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  height: "100%",
                  // class: "cover-image-upload",
                  title: file.name
              }));
      }
    filereader.readAsDataURL(file);
  });
});
