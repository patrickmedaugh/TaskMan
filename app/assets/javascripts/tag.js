$(document).ready(function() {
  addTag();
});

function addTag () {
  $('.add-tag').on('click', function () {
    taskId = $(this).attr('data');
    tagName = $('#tagname-' + taskId).val();
    if (tagName !== "") {
      $.getJSON('/add-tag/' + taskId + '/' + tagName, function (tag) {
        console.log(tag);
        $('.tags').append("   " + tag.name);
      })
    }
  });
}
