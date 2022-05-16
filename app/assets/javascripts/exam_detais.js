$(document).ready(function () {
  $('input[type="radio"][data-behavior="toggle-products"]').click(function (
    evt
  ) {
    if ($(this).val() == "true") {
      $(".products").show();
    } else {
      $(".products").hide();
    }
  });
});
