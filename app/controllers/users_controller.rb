# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @stars = user_stars
    @query = params[:query]
  end

  private

  def user_stars
    return Repo.search(query: params[:query], user_id: current_user.id) if params[:query]
    return current_user.repos_with_tag(params[:tag]) if params[:tag]
    return current_user.untagged_repos if params[:no_tags]

    current_user.repos
  end
end
