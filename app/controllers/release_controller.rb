# frozen_string_literal: true

require 'redcarpet'

class ReleaseController < ApplicationController
  def index
    @release = ReleaseFacade.fetch_latest_release(
      owner: params[:owner],
      repo: params[:repo],
      token: current_user.github_token
    )

    @owner = params[:owner]
    @repo = params[:repo]
  end
end
