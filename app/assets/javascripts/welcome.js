$(document).ready(function() {
  $("#show-tutorial").on('click', function(e) {
    e.preventDefault();
    swal({
      title: 'How to import emoji',
      html: '<div><a href="/users/sign_up">Sign up</a></div><div>Click on the image you want to import</div><div>Click the Import button</div><div>Follow the prompts</div>',
      type: 'info'
    })
  })
});