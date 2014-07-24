$(function() {

  $(".title").click(function() {
    var text = $(this).text();
    var input = $("<input type='text'>");
    input.val(text);
    var form = $("<form id='edit_title' data-remote='true'>");
    form.append(input);
    $(this).replaceWith(form);
  });

  $(".task").on("submit", "#edit_title", function() {
    var getTaskId = $(this).parent().attr("id");
    var taskNumber = getTaskId.replace("task_", "");
    var text = $("#edit_title").children().val();
    $.ajax({
      url: "/tasks/" + taskNumber,
      type: "PATCH",
      data: { task: { title: text } },
      success: function() {
        $("#" + getTaskId).prepend("<h3 class='title'>" + text + "</h3>");
        $("#edit_title").remove();
      }
    });
    return false;
  });
});
