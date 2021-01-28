require 'redcarpet'

class ReleaseController < ApplicationController
  def index
    @release = ReleaseFacade.fetch_latest_release(owner: params[:owner], repo: params[:repo])  
    @owner = params[:owner]
    @repo = params[:repo]
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  end
end
