$(document).ready(function () {
  sortListener('title');
  sortListener('status');
  sortListener('due-date');
});

function sortListener(type) {
  $('.' + type + '-sort').on('click', function () {
    listId = $(this).attr('data');
    $taskArea = $('#tasks-' + listId);
    $.getJSON( "/filter/" + type + "/" + listId, function (tasks) {
      $taskArea.empty();
      tasks.forEach(function (task) {
        console.log(task);
        $taskArea.append('<p>' + task.title + '</p>');
        $taskArea.append('<p>' + task.notes + '</p>');
        $taskArea.append('<p>' + task.start_date + '</p>');
        $taskArea.append('<p>' + task.due_date + '</p>');
        $taskArea.append('<p>' + task.status + '</p>');
        $taskArea.append("<a rel='nofollow' data-method='delete' href='/lists/" + listId + "/tasks/" + task.id + "'>Delete Task</a>");
      });
    });
  });
};
