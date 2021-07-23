class ServersController < ApplicationController
  layout :default_layout

  before_action :authenticate_user!
  before_action :authorize_server

  def index
    @servers = current_user.servers
    respond_to do |format|
      format.html
    end
  end

  def show
    @all_attributes = @server.player_servers.collect{|ps| [ps.player_id, {status: ps.status, banned: ps.banned, last_seen: ps.updated_at}]}.to_h
    @players = @server.players
  end

private
  def authorize_server
    case params[:action].to_sym
    when :new
      @server = Server.new
    when :create
      @server = Server.new(permitted_attributes(Server.new))
    when :show, :update
      @server = Server.find(params[:id])
    end
    authorize (@server || Server)
  end
end
