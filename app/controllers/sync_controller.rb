class SyncController < ApplicationController
  def index
    SyncFacade.create_repo_records_for(current_user)

    redirect_to user_root_path(current_user.nickname)
  end
end
