# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  github_id = Rails.application.credentials.github[:client_id]
  github_secret = Rails.application.credentials.github[:client_secret]

  provider :github, github_id, github_secret
end

OmniAuth.config.logger = Rails.logger

OmniAuth.config.on_failure = Proc.new do |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end

