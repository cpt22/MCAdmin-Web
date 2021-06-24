class ApplicationController < ActionController::Base
  include Pundit

  def default_layout
    return "application_layout"
  end
end
