require 'httparty'
class Slack
  include HTTParty
  def getLoginPage(options)

    # options.jar = options.jar || request.jar()

    request
                url: options.url,
                jar: options.jar,
                headers: {
                    'X-Slack-Porter': '💖'
      },
      method: 'GET'
    }, function(error, response, body) {
      if (error) {
        return deferred.reject(error);
      } else if (response.statusCode == 404) {
        var e = new Error('team page not found');
        e.url = options.url;
        e.statusCode = 404;
        return deferred.reject(e);
      }

      var $ = cheerio.load(body);

      options.formData = {
        signin: $('#signin_form input[name="signin"]').attr('value'),
    redir: $('#signin_form input[name="redir"]').attr('value'),
        crumb: $('#signin_form input[name="crumb"]').attr('value'),
        remember: 'on',
        email: options.email,
            password: options.password
    }

    deferred.resolve(options);
  end

end