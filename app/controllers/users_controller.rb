# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    redirect_to root_path unless current_user

    @stars = UserFacade.user_stars(current_user)
  end
end
