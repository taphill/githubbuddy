# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    cookies.permanent[:auth_token] = user.auth_token
    redirect_to welcome_index_path
  end
end
