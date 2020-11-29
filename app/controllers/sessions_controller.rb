# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:notice] = "Hello #{user.nickname}!"
    redirect_to root_path

    # auth_hash = request.env['omniauth.auth']
    # res = Faraday.get("https://api.github.com/users/#{auth_hash['info']['nickname']}/starred")
    # starred_repos = JSON.parse(res.body, symbolize_names: true)
  end
end
