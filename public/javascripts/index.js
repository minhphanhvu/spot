$(document).ready(function() {
  // $(".day").html(getDayNumber($(".day").html()));
  $(".day").each(function() {
    $(this).html(getDayNumber($(this).html()));
  })
});

function getDayNumber(date) {
  return date.slice(date.length - 2, date.length);
}