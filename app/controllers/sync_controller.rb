# frozen_string_literal: true

class SyncController < ApplicationController
  def index
    SyncFacade.fetch_user_stars(current_user)

    redirect_to user_root_path(current_user.nickname)
  end
end
