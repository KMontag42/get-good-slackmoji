module Slack
  module Token
    def current_token
      session[:slack_token] || ENV.fetch('SLACK_TOKEN', '')
    end

    def set_session_token(val)
      session[:slack_token] = val
    end
  end
end
