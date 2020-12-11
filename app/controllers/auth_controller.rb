class AuthController < ApplicationController
  def failure
    flash[:error] = 'Sign In failed'
    redirect_to root_path
  end
end
