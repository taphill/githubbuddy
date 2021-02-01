class Release
  attr_reader :url, :tag_name, :created_at, :published_at, :body

  def initialize(attr)
    @url = attr[:html_url]
    @tag_name = attr[:tag_name]
    @created_at = Date.strptime(attr[:created_at]).strftime("%B %d, %Y")
    @published_at = Date.strptime(attr[:published_at]).strftime("%B %d, %Y")
    @body = attr[:body]
  end
end
