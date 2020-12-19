# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # redirect_to user_root_path(current_user.nickname) if current_user
    redirect_to welcome_index_path if current_user
  end
end
