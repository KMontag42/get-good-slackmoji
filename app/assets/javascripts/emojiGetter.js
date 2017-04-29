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
            cancelButtonText: 'Close',
            showCancelButton: true,
            showConfirmButton: false,
            timer: 1000
        });
    });
});
