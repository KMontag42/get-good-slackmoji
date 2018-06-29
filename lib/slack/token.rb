module Slack
  module Token
    def current_token
      session.fetch(:slack_token, '')
    end

    def set_session_token(val)
      session[:slack_token] = val
    end
  end
end
