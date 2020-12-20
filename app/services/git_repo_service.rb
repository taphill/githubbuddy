# frozen_string_literal: true

class GitRepoService
  def self.conn
    Faraday.new(url: 'https://api.github.com')
  end

  def self.user_stars(user_nickname)
    stars = []
    page_number = 0

    loop do
      page_number += 1

      response = conn.get("/users/#{user_nickname}/starred") do |req|
        req.params['page'] = page_number
      end

      json = JSON.parse(response.body, symbolize_names: true)

      break if json.empty?

      stars << json
    end

    stars.flatten
  end
end
