$(document).ready(function () {
  statusChanger("complete");
  statusChanger("incomplete");
});

function statusChanger(type) {
  $('.' + type).on('click', function () {
    thisTask = ($(this).attr('data'));
    $.getJSON('/status/' + type + '/' + thisTask, function (task) {
      //here we just need to update the view. the change has already been made on the Rails side
      $('#status-' + thisTask).text(type);
    });
  });
}
