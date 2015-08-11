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
        $taskArea.append('<li><p>' + task.title + '</p>');
        $taskArea.append('<p>' + task.notes + '</p>');
        $taskArea.append('<p>' + task.start_date + '</p>');
        $taskArea.append('<p>' + task.due_date + '</p>');
        $taskArea.append('<p>' + task.status + '</p>');
        $taskArea.append('<button id=complete-task-' + task.id + '>Complete Task</button');
        $taskArea.append('<button id=incomplete-task-' + task.id + '>Incomplete Task</button');
      });
    });
  });
};
