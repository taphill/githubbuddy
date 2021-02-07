# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @stars = user_stars
    @query = params[:query]
  end

  private

  # This needs refactoring
  # rubocop:disable Metrics/AbcSize
  def user_stars
    return Repo.search(query: params[:query], user_id: current_user.id) if params[:query]
    return current_user.untagged_repos if params[:no_tags]

    if current_user.repos_with_tag(params[:tag]).empty?
      current_user.repos
    else
      current_user.repos_with_tag(params[:tag])
    end
  end
  # rubocop:enable Metrics/AbcSize
end
