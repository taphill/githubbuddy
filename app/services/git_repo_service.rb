# frozen_string_literal: true

class GitRepoService
  def self.user_stars(user_nickname)
    stars = []
    page_number = 0

    loop do
      page_number += 1
      json = stars_response(user_nickname: user_nickname, page_number: page_number)
      break if json.empty?

      stars << json
    end

    stars.flatten
  end

  def self.conn
    Faraday.new(url: 'https://api.github.com')
  end

  def self.stars_response(user_nickname:, page_number:)
    response = conn.get("/users/#{user_nickname}/starred") do |req|
      req.params['page'] = page_number
      req.params['per_page'] = 100
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :stars_response
end
