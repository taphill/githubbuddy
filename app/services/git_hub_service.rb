# frozen_string_literal: true

class GitHubService
  def self.conn
    Faraday.new(url: 'https://api.github.com')
  end

  def self.user_stars(user_nickname)
    response = conn.get("/users/#{user_nickname}/starred")

    JSON.parse(response.body, symbolize_names: true)
  end
end
