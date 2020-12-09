class UsersController < ApplicationController
  def index
    redirect_to root_path unless current_user

    @repos = current_user.get_stars.map do |repo_data|
      Repo.new(repo_data)
    end
  end
end
