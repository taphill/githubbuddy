# frozen_string_literal: true

class TagsController < ApplicationController
  def edit
    @user_star = UserRepo.find_by(user_id: current_user.id, repo_id: params[:repo_id])
  end
end
