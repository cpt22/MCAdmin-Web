class ServersController < ApplicationController
  layout :default_layout
  before_action :authorize_server

  def index
    respond_to do |format|
      format.html
    end
  end

  def show
  end

private
  def authorize_server
  end
end
