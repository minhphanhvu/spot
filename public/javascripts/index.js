$(document).ready(function() {
  $(".day").each(function() {
    $(this).html(getDayNumber($(this).html()));
  })
});

function getDayNumber(date) {
  return date.slice(date.length - 2, date.length);
}