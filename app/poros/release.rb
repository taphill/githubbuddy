# frozen_string_literal: true

class Release
  attr_reader :url, :tag_name, :created_at, :published_at, :body

  def initialize(attr)
    @url = attr[:html_url]
    @tag_name = attr[:tag_name]
    @created_at = release_created_at(attr[:created_at])
    @published_at = release_published_at(attr[:published_at])
    @body = attr[:body]
  end

  private
  
  def release_created_at(data)
    return nil unless data

    Date.strptime(data).strftime('%B %d, %Y')
  end

  def release_published_at(data)
    return nil unless data

    Date.strptime(data).strftime('%B %d, %Y')
  end
end
