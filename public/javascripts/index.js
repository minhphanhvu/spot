$(document).ready(function() {
  $(".day").each(function() {
    $(this).html(getDayNumber($(this).html()));
  })

  let select = '';
  for (let i = 0; i < 24; i++) {
    select += '<option value=' + getHour(i) + ':00' + '>' + getHour(i) + ':00' + '</option>';
    select += '<option value=' + getHour(i) + ':30' + '>' + getHour(i) + ':30' + '</option>';
  }
  $('#time').html(select);

  $(".day").click(function() {
    $(".day").removeClass("chosenDay");
    $(this).addClass("chosenDay");
    let session_date = $(this).data("date");
    $("#session_date").val(session_date);
  })
});

function getDayNumber(date) {
  return date.slice(date.length - 2, date.length);
}

function getHour(hour) {
  return hour < 10 ? '0' + String(hour) : String(hour);
}