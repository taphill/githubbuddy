class Release
  attr_reader :url, :tag_name, :created_at, :published_at, :body

  def initialize(attr)
    @url = attr[:html_url]
    @tag_name = attr[:tag_name]
    @created_at = attr[:created_at]
    @published_at = attr[:published_at]
    @body = attr[:body]
  end
end
