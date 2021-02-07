# frozen_string_literal: true

class TagsController < ApplicationController
  def new
    @repo = Repo.find(params[:repo_id])
    @user_repo = UserRepo.find_by(user_id: current_user.id, repo_id: params[:repo_id])
  end

  def create
    tags = tag_params[:tags].split(/\s*,\s*/)

    tags.each do |tag|
      user_tag = Tag.find_or_create_by!(name: tag.downcase)

      tagging = Tagging.new(tag_id: user_tag.id, user_repo_id: tag_params[:user_repo_id])
      tagging.save
    end

    redirect_to user_root_path(current_user.nickname)
  end

  def edit
    @repo = Repo.find(params[:repo_id])
    @user_repo = UserRepo.find_by(user_id: current_user.id, repo_id: params[:repo_id])
  end

  # rubocop:disable Metrics/AbcSize
  def destroy
    tag = Tag.find(params[:id])
    user_repo = UserRepo.find_by(user_id: current_user.id, repo_id: params[:repo_id])
    tagging = Tagging.find_by(tag_id: tag.id, user_repo_id: user_repo.id)

    tagging.destroy

    respond_to do |format|
      format.html { redirect_to user_root_path(current_user.nickname) }
      format.js { render template: 'users/index.js.erb', layout: false }
    end
  end
  # rubocop:enable Metrics/AbcSize

  private

  def tag_params
    params.permit(:tags, :user_repo_id)
  end
end
