class ReleaseController < ApplicationController
  def index
    @release = ReleaseFacade.fetch_latest_release(owner: params[:owner], repo: params[:repo])  
  end
end
