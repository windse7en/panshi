class ApplicationController < ActionController::Base
  before_filter :miniprofiler
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def miniprofiler
    Rack::MiniProfiler.authorize_request # if user.admin?
  end
end
