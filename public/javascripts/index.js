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
});

function getDayNumber(date) {
  return date.slice(date.length - 2, date.length);
}

function getHour(hour) {
  return hour < 10 ? '0' + String(hour) : String(hour);
}