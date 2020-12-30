# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @stars = user_stars
  end

  private

  def user_stars
    if params[:tag]
      current_user.repos_with_tag(params[:tag])
    else
      current_user.repos
    end
  end
end
