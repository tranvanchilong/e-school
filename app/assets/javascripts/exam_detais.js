$(document).ready(function () {
  $(".rating-submit").click(function () {
    var value = $("input[type=radio][name=rating]:checked").val();
    if (value) {
      alert(value);
    } else {
      alert("Nothing is selected");
    }
  });
});
