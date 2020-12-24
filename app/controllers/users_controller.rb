# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @stars = current_user.repos
  end
end
