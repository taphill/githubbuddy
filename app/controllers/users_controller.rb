# frozen_string_literal: true

class UsersController < ApplicationController
  def index
require 'pry'; binding.pry
    @stars = current_user.repos
  end
end
