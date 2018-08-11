$(document).on('turbolinks:load', function() {
  $(".image_file").on('change', function() {
    var file = $(this).prop('files')[0],
        find_img = $(this).parent().find("img"),
        filereader = new FileReader();
        view_box = $(this).parent();

    if(find_img.length){
       find_img.remove();
    }

    filereader.onload = function() {
        $(view_box).prepend($('<img>').attr({
                  src: filereader.result,
                  width: "100%",
                  height: "100%",
                  title: file.name
              }));
      }
    filereader.readAsDataURL(file);
  });
});

