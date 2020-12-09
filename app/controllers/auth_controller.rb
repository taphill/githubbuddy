class AuthController < ApplicationController
  def failure
    flash[:error] = 'Failed login'
    redirect_to root_path
  end
end
