class Repo
  attr_reader :name, :owner, :url, :description, :language, :star_count, :fork_count

  def initialize(data)
    @name = data[:name]
    @owner = data[:owner][:login]
    @url = data[:html_url]
    @description = data[:description]
    @language = data[:language]
    @star_count = data[:stargazers_count]
    @fork_count = data[:forks_count]
  end
end
