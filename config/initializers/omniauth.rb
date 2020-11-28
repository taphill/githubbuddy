# frozen_string_literal: true

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  github_id = Rails.application.credentials.github[:client_id]
  github_secret = Rails.application.credentials.github[:client_secret]

  provider :github, github_id, github_secret
end
