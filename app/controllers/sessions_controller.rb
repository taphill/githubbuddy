# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    cookies.permanent[:auth_token] = user.auth_token
    flash[:notice] = "Hello #{user.nickname}!"
    redirect_to user_root_path(user.nickname)
  end
end
