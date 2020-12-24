# frozen_string_literal: true

class TagsController < ApplicationController
  def new
    @repo = Repo.find(params[:repo_id])
    @user_repo = UserRepo.find_by(user_id: current_user.id, repo_id: params[:repo_id])
  end

  def create
    tags = tag_params[:tags].split(/\s*,\s*/)

    tags.each do |tag|
      x = Tag.find_or_create_by!(name: tag.downcase)

      user_tag = Tagging.new(tag_id: x.id, user_repo_id: tag_params[:user_repo_id])
      user_tag.save
    end

    redirect_to user_root_path(current_user.nickname)
  end

  def edit
    @repo = Repo.find(params[:repo_id])
    @user_repo = UserRepo.find_by(user_id: current_user.id, repo_id: params[:repo_id])
  end

  def destroy; end

  private

  def tag_params
    params.permit(:tags, :user_repo_id)
  end
end
