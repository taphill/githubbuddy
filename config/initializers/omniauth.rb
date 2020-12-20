# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    github_id = Rails.application.credentials.production[:client_id]
    github_secret = Rails.application.credentials.production[:client_secret]
  else
    github_id = Rails.application.credentials.development[:client_id]
    github_secret = Rails.application.credentials.development[:client_secret]
  end

  provider :github, github_id, github_secret
end

OmniAuth.config.logger = Rails.logger

OmniAuth.config.on_failure = Proc.new do |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
end

