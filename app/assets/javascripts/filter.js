$(document).ready(function () {
  sortListener('title');
  sortListener('status');
  sortListener('due-date');
  searchFilter();
  tagSort();
});

function sortListener (type) {
  $('.' + type + '-sort').on('click', function () {
    listId = $(this).attr('data');
    $taskArea = $('#tasks-' + listId);
    $.getJSON( "/sort/" + type + "/" + listId, function (tasks) {
      $taskArea.empty();
      addTaskToArea($taskArea, tasks, listId);
    });
  });
};

function addTaskToArea (area, tasks, listId) {
  tasks.forEach(function (task) {
    area.append('<li><p>' + task.title + '</p>');
    area.append('<p>' + task.notes + '</p>');
    if (task.start_date !== null) {
      area.append('<p>' + task.start_date + '</p>');
    };
    if (task.due_date !== null) {
      area.append('<p>' + task.due_date + '</p>');
    };
    area.append('<p id="status-' + task.id + '">' + task.status + '</p>');
    area.append('<button class="complete" data="' + task.id + '">Complete Task</button> ');
    area.append('<button class="incomplete" data="' + task.id + '">Incomplete Task</button> ');
    area.append('<h6><a href="/lists/' + listId + '/tasks/' + task.id + '/edit">Edit Task</a></h6>');
    $.getJSON('/filter/search-tags/' + task.id, function (tags) {
      tags.forEach(function (tag) {
        area.append(tag.name + "  ");
      });
    });
    area.append('</h5>');
  });
};

function searchFilter () {
  $('.search').on('click', function () {
    $(this).val('');
  });

  $('.search').keyup(function () {
    search = $(this).val();
    listId = $(this).attr('data');
    $taskArea = $('#tasks-' + listId);
    if (search !== "") {
      $.getJSON('/filter/search/'+ listId + '/' + search, function (tasks) {
        $taskArea.empty();
        addTaskToArea($taskArea, tasks, listId);
      });
    }
  });

  $('.search').focusout(function () {
    listId = $(this).attr('data');
    $taskArea = $('#tasks-' + listId);
    $.getJSON('/filter/search-reset/'+ listId + '/' , function (tasks) {
      console.log(tasks);
      $taskArea.empty();
      addTaskToArea($taskArea, tasks, listId);
    });
  })
}

function tagSort () {
  $('.tag-sort').on('click', function () {
    tagName = $(this).attr('data');
    $taskArea = $('.tasks')
    listId = $taskArea.attr('data');
    $.getJSON('/filter/tags/' + tagName, function (tasks) {
      $taskArea.empty();
      addTaskToArea($taskArea, tasks, listId );
    })
  });
}
