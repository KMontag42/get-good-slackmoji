$(document).ready(function() {
  var pickedImageUrl = '';

  $('img').on('click', function(e) {
    pickedImageUrl = e.target.getAttribute('src');
  });

  var clipboard = new Clipboard('.emote img');
  clipboard.on('success', function(e) {
    swal({
      text: 'copied ' + e.text + ' to clipboard',
      imageUrl: e.trigger.getAttribute('src'),
      imageWidth: 105,
      confirmButtonText: 'Import',
      cancelButtonText: 'Okay',
      showCancelButton: true
    }).then(function () {
      $.ajax({
        type: "POST",
        url: "/api/import",
        data: {
          image_url: pickedImageUrl
        }
      });
    });
  })
});