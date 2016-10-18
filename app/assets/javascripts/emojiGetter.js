$(document).ready(function() {
  var pickedImageUrl = '',
      pickedImageName = '';

  $('img').on('click', function(e) {
    pickedImageUrl = e.target.getAttribute('src');
    pickedImageName = e.target.getAttribute('alt');
  });

  var clipboard = new Clipboard('.emote img');
  clipboard.on('success', function(e) {
    swal({
      title: 'copied ' + e.text,
      imageUrl: e.trigger.getAttribute('src'),
      imageWidth: 105,
      confirmButtonText: 'Import',
      cancelButtonText: 'Close',
      showCancelButton: true
    }).then(function () {
      swal({
        text: 'input your slack password to import',
        input: 'password',
        imageUrl: e.trigger.getAttribute('src'),
        imageWidth: 105,
        confirmButtonText: 'Import',
        cancelButtonText: 'Cancel',
        showCancelButton: true
      }).then(function(password) {
        var emojiParam = {};
        emojiParam[pickedImageName] = pickedImageUrl;
        $.ajax({
          type: "POST",
          url: "/api/import",
          data: {
            password: password,
            emoji: emojiParam
          }
        });
      })
    });
  })
});