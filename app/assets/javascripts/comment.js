$(function(){
  function buildHTML(comment){
    var html = `<div class="comment" data-comment-id="${comment.id}">
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                  </strong>
                    <a rel="nofollow" data-method="delete" href="/prototypes/${comment.prototype_id}/comments/${comment.id}">
                      <div class="button btn-outline-primary">
                        <div class="glyphicon glyphicon-trash">
                        削除
                        </div>
                      </div>
                    </a>
                    <a data-method="get" href="/prototypes/${comment.prototype_id}/comments/${comment.id}/edit">
                      <div class="button btn-outline-primary">
                        <div class="glyphicon glyphicon-pencil">
                          編集
                        </div>
                      </div>
                    </a>
                    <p>${comment.content}</p>
                </div>
                `
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('')
    })
    .fail(function(){
      alert('error');
    })
  });
});
