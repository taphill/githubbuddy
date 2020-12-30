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

    current_user.repos
  end
end
