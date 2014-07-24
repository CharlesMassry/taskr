$(function() {

  $("#tasks").on("click", ".title", function() {
    var text = $(this).text();
    var input = $("<input type='text'>");
    input.val(text);
    var form = $("<form id='edit_title' data-remote='true'>");
    form.append(input);
    $(this).replaceWith(form);
  });

  $("#tasks").on("submit", "#edit_title", function() {
    var getTaskId = $("#edit_title").parent().attr("id");
    var taskNumber = getTaskId.replace("task_", "");
    var text = $("#edit_title").children("input").val();
    $.ajax({
      url: "/tasks/" + taskNumber,
      type: "PATCH",
      data: { task: { title: text } },
      success: function() {
        $("#" + getTaskId).prepend("<h3>" + text + "</h3>");
        $("#" + getTaskId).children("h3").addClass("title");
        $("#edit_title").remove();
      }
    });
    return false;
  });
});
